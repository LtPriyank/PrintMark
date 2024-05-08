
ACTION Automatic: 
	
	//Basic input parameters for the machine
	//Start command
	startRising := (gPrintMark.Cmd.Start = TRUE) AND (startFound = FALSE);
	startFound  := (gPrintMark.Cmd.Start = TRUE);
	//Error Reset
	errorAckRising := (gPrintMark.Cmd.ErrorAck = TRUE) AND (errorAckFound = FALSE);
	errorAckFound  := (gPrintMark.Cmd.ErrorAck = TRUE);
	gAx_BeltConveyor.In.ErrorReset := errorAckRising;
	gAx_Cutter.In.ErrorReset := errorAckRising;
	gAx_CutterCam.In.ErrorReset := errorAckRising;
	
	//Speed parameters
	gAx_BeltConveyor.In.Parameters.Velocity := gPrintMark.Para.MachineSpeed;
	gAx_BeltConveyor.In.Parameters.Acceleration := gPrintMark.Para.MachineSpeed * K_ACC_FACTOR ;
	gAx_BeltConveyor.In.Parameters.Deceleration := gPrintMark.Para.MachineSpeed * K_DEC_FACTOR;
	//Updating the Parameters
	IF(gAx_BeltConveyor.In.Parameters.Velocity <> gPrintMark.Para.MachineSpeed)THEN
		gAx_BeltConveyor.In.Update := TRUE;
		IF(gAx_BeltConveyor.Out.UpdateDone = TRUE)THEN
			gAx_BeltConveyor.In.Update := FALSE;
			gAx_Cutter.In.Update := FALSE;
			gAx_CutterCam.In.Update := FALSE;
		END_IF;
	END_IF;
	
	//Stop command for the machine
	IF (gAx_BeltConveyor.Out.MoveActive = TRUE) AND
		(gAx_BeltConveyor.Out.Info.PLCopenState = mpAXIS_CONTINUOUS_MOTION) AND
		(gPrintMark.Cmd.Stop = TRUE) THEN
		stopPressed := TRUE;
	END_IF
    
	//Estop and emergency conditions for the machine
	IF (gPrintMark.Cmd.Estop = TRUE) THEN
		eStopPressed := TRUE;
		Alarm[0] := TRUE;
	ELSIF (gPrintMark.Cmd.Estop = TRUE) AND (errorAckRising = TRUE) THEN
		eStopPressed := FALSE;
		Alarm[0] := FALSE;
	END_IF

	IF (gAx_BeltConveyor.Out.StatusID <> 0) OR (gAx_BeltConveyor.Out.Error = TRUE) OR
		(gAx_Cutter.Out.StatusID <> 0) OR (gAx_Cutter.Out.Error = TRUE) OR
		(gAx_CutterCam.Out.StatusID <> 0) OR (eStopPressed = TRUE) THEN
		emergencyFault := TRUE;
	ELSE
		emergencyFault := FALSE;
	END_IF
	
	//State machine for the Auto mode
	CASE enAutoStep OF
		CLEARING:	//For checking any error in the machine
			gPrintMark.Status.machineStatus := 'Machine is Healthy';
			machineReady := FALSE;
			IF (gAx_BeltConveyor.Out.Active = TRUE) AND 
				(gAx_Cutter.Out.Active = TRUE) AND
				(gAx_CutterCam.Out.Active = TRUE) AND
				(gAx_BeltConveyor.Out.Info.BootState = mpAXIS_BLP_DONE) AND
				(gAx_Cutter.Out.Info.BootState = mpAXIS_BLP_DONE) THEN
				gAx_BeltConveyor.In.Power := TRUE;
				gAx_Cutter.In.Power := TRUE;
				enAutoStep := HELD;
			END_IF
			
		HELD:	//Giving Power ON and Homing command for the axis
			gPrintMark.Status.machineStatus := 'Axis Power ON and Homing';
			IF (gAx_BeltConveyor.Out.PowerOn = TRUE) AND
				(gAx_Cutter.Out.PowerOn = TRUE) THEN
				IF (gPrintMark.Status.powerOnHome = FALSE) THEN
					pBeltConveyorCtrl.Cmd.bHome := TRUE;
					pCutterCtrl.Cmd.bHome := TRUE;
				END_IF
			END_IF
			IF ((gAx_BeltConveyor.Out.IsHomed = TRUE))AND
				((gAx_Cutter.Out.IsHomed = TRUE)OR(gAx_Cutter.Out.Position = 0)) THEN
				gPrintMark.Status.powerOnHome := TRUE;
				pBeltConveyorCtrl.Cmd.bHome := FALSE;
				pCutterCtrl.Cmd.bHome := FALSE;
				enAutoStep := IDLE;
			END_IF
			
		IDLE:	//Waiting for Start Command
			gPrintMark.Status.machineStatus := 'Machine Waiting for Start Command';
			machineReady := TRUE;
			IF (startRising = TRUE)AND
				(gPrintMark.Cmd.Stop = FALSE) AND
				(gPrintMark.Cmd.Estop = FALSE) THEN
				IF ((CAM_SEQUENCING = TRUE)) THEN
					gAx_CutterCam.In.StartSequence := TRUE;
					gAx_CutterCam.In.Continue := TRUE;
					gAx_CutterCam.In.EndSequence := FALSE;
				END_IF
				enAutoStep := STARTING;
			END_IF
            
		STARTING:	//Starting the CAM Sequence
			IF (gAx_CutterCam.Out.InCompensation = TRUE) OR
				(gAx_CutterCam.Out.InSync = TRUE) THEN
				IF (CAM_SEQUENCING <> TRUE) THEN
					gAx_CutterCam.In.StartSequence := FALSE;
					gAx_CutterCam.In.EndSequence := FALSE;
				END_IF
				gAx_BeltConveyor.In.MoveVelocity := TRUE;
				gPrintMarkHMI.Cmd.bEnableBeltSimu := TRUE;
				enAutoStep := EXECUTE;
			END_IF;
			
        
		EXECUTE: //Starting the Master Axis
			gPrintMark.Status.machineStatus := 'Machine is in Motion';
			IF (stopPressed = TRUE) THEN
				gAx_BeltConveyor.In.Stop := TRUE;
				gAx_BeltConveyor.In.Parameters.Stop.StopInPhase := TRUE;
				gAx_BeltConveyor.In.Parameters.Stop.Phase := K_ZERO;
				gAx_BeltConveyor.In.Parameters.Stop.Deceleration := gPrintMark.Para.MachineSpeed * K_DEC_FACTOR;
				gPrintMarkHMI.Cmd.bEnableBeltSimu := FALSE;
				enAutoStep := STOPPING;
			END_IF
			IF(gPrintMark.Cmd.CutterDisable = TRUE)THEN
				gAx_CutterCam.In.StartSequence := FALSE;
				gAx_CutterCam.In.EndSequence := TRUE;
				gAx_Cutter.In.Power := FALSE;
			END_IF;

		STOPPING:	//Stopping the master axis
			gPrintMark.Status.machineStatus := 'Machine Stopping in Phase';
			IF (gAx_BeltConveyor.Out.Stopped = TRUE) THEN
				gAx_BeltConveyor.In.MoveVelocity := FALSE;
				gAx_BeltConveyor.In.Stop := FALSE;
				stopPressed := FALSE;
				enAutoStep := ABORTED;
			END_IF
            
		ABORTED:	//Error Acknowledgement
			gPrintMark.Status.machineStatus := 'Machine is in Error';
			gPrintMarkHMI.Cmd.bEnableBeltSimu := FALSE;
			IF (gAx_BeltConveyor.Out.Stopped = TRUE) OR
				(gAx_BeltConveyor.Out.Info.PLCopenState = mpAXIS_ERRORSTOP) OR
				(gAx_BeltConveyor.Out.Info.PLCopenState = mpAXIS_DISABLED) OR 
				(gAx_BeltConveyor.Out.Info.PLCopenState = mpAXIS_STANDSTILL) THEN
				gAx_BeltConveyor.In.Stop := FALSE;
			END_IF

			IF (gAx_BeltConveyor.Out.PowerOn = FALSE) THEN
				gAx_BeltConveyor.In.Power := FALSE;
			END_IF

			IF (gAx_Cutter.Out.PowerOn = FALSE) THEN
				gAx_Cutter.In.Power := FALSE;
			END_IF

			IF (gAx_Cutter.Out.Stopped = TRUE) OR
				(gAx_Cutter.Out.Info.PLCopenState = mpAXIS_ERRORSTOP) OR
				(gAx_Cutter.Out.Info.PLCopenState = mpAXIS_DISABLED) OR 
				(gAx_Cutter.Out.Info.PLCopenState = mpAXIS_SYNCHRONIZED_MOTION)  THEN
				gAx_CutterCam.In.StartSequence := FALSE;
				gAx_CutterCam.In.Continue := FALSE;
				gAx_Cutter.In.Stop  := FALSE;
			END_IF

			IF (emergencyFault = FALSE) AND
				((gAx_BeltConveyor.Out.Info.PLCopenState = mpAXIS_DISABLED) OR (gAx_BeltConveyor.Out.Info.PLCopenState = mpAXIS_STANDSTILL)) AND
				((gAx_Cutter.Out.Info.PLCopenState = mpAXIS_DISABLED) OR (gAx_Cutter.Out.Info.PLCopenState = mpAXIS_STANDSTILL)) THEN
				enAutoStep := CLEARING;
			END_IF
	END_CASE;

	//Actions to be performed in case of emergency
	IF (emergencyFault = TRUE) AND (enAutoStep < ABORTED ) THEN
		enAutoStep := ABORTED;
		gAx_BeltConveyor.In.Stop := TRUE;
		gAx_BeltConveyor.In.Parameters.Stop.StopInPhase  := FALSE;
		gAx_BeltConveyor.In.Parameters.Stop.Deceleration := K_ZERO;
    
		gAx_Cutter.In.Stop := TRUE;
		gAx_Cutter.In.Parameters.Stop.StopInPhase  := FALSE;
		gAx_Cutter.In.Parameters.Stop.Deceleration := K_ZERO;
		
	END_IF
	IF (emergencyFault = TRUE) THEN
		machineReady := FALSE;
		gAx_BeltConveyor.In.MoveVelocity := FALSE;
		gAx_BeltConveyor.Out.IsHomed := FALSE;
		gAx_Cutter.Out.IsHomed := FALSE;
		gAx_BeltConveyor.In.Power := FALSE;
		gAx_Cutter.In.Power := FALSE;
		gPrintMark.Status.powerOnHome := FALSE;
		gAx_CutterCam.In.EndSequence := TRUE;
	END_IF

END_ACTION
