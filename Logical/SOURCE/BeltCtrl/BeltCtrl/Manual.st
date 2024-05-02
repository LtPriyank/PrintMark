
ACTION Manual:
	
	//Case for manual operation of belt axis
	CASE enBeltManualSteps OF
		
		IDLE:
			IF((gAx_BeltConveyor.Out.PowerOn = TRUE) AND (gAx_BeltConveyor.Out.Error = FALSE))THEN
				enBeltManualSteps := STARTING;
			END_IF;
		
		STARTING:
			gAx_BeltConveyor.In.Parameters.Jog.Velocity := beltCtrl.Para.jogSpeed;
			gAx_BeltConveyor.In.Parameters.Jog.Acceleration := beltCtrl.Para.jogSpeed * K_JOG_ACC_FACTOR;
			gAx_BeltConveyor.In.Parameters.Jog.Deceleration := beltCtrl.Para.jogSpeed * K_JOG_DEC_FACTOR;
			gAx_BeltConveyor.In.Parameters.Jog.UpperLimit := beltCtrl.Para.jogUpperLimit;
			gAx_BeltConveyor.In.Parameters.Jog.LowerLimit := beltCtrl.Para.jogLowerLimit;
			
		EXECUTE:
		
		STOPPING:
		
		STOPPED:
		
		ABORTED:
		
		ABORTING:
		
		
	
	END_CASE;
	

END_ACTION
