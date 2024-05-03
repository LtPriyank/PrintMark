
ACTION Manual:
	
	//Case for manual operation of belt axis
	CASE enBeltManualSteps OF
		
		IDLE:
			IF((gAx_BeltConveyor.Out.PowerOn = TRUE) AND (gAx_BeltConveyor.Out.Error = FALSE))THEN
				enBeltManualSteps := STARTING;
			END_IF;
		
		STARTING:
			gAx_BeltConveyor.In.Parameters.Jog.Velocity := beltCtrl.Para.jogSpeed;
			gAx_BeltConveyor.In.Parameters.Jog.Acceleration := beltCtrl.Para.jogSpeed * K_BELT_ACC_FACTOR;
			gAx_BeltConveyor.In.Parameters.Jog.Deceleration := beltCtrl.Para.jogSpeed * K_BELT_DEC_FACTOR;
			enBeltManualSteps := EXECUTE;
			
		EXECUTE:
			IF(beltCtrl.Cmd.bJogPositive = TRUE)THEN
				gAx_BeltConveyor.In.JogPositive := TRUE;
			ELSE
				gAx_BeltConveyor.In.JogPositive := FALSE;
			END_IF;
			IF(beltCtrl.Cmd.bJogNegative = TRUE)THEN
				IF(gAx_Cutter.Out.Info.DigitalInputsStatus.Trigger1 = FALSE)THEN
					gAx_BeltConveyor.In.JogNegative := TRUE;
					negAbort := FALSE;
				ELSE
					negAbort := TRUE;
					enBeltManualSteps := ABORTING;
				END_IF;	
			ELSE
					gAx_BeltConveyor.In.JogNegative := FALSE;
			END_IF;	
		
		STOPPING:
		
		STOPPED:
		
		ABORTED:
		
		ABORTING:
			R_TRIG_0(CLK := negAbort);
			IF(R_TRIG_0.Q)THEN
				gAx_BeltConveyor.In.Parameters.Jog.LowerLimit := gAx_BeltConveyor.Out.Position - 300;
				gAx_BeltConveyor.In.Parameters.Jog.UpperLimit := 3600-(gAx_BeltConveyor.Out.Position - 300);
			END_IF;		
			gAx_BeltConveyor.In.Update := TRUE;
			IF(gAx_BeltConveyor.Out.UpdateDone = TRUE)THEN
				gAx_BeltConveyor.In.Update := FALSE;	
			END_IF;
			IF(gAx_BeltConveyor.Out.Velocity = 0)THEN
				gAx_BeltConveyor.In.JogNegative := FALSE;
				enBeltManualSteps := EXECUTE;
			END_IF;
		
		
				
	END_CASE;
	

END_ACTION
