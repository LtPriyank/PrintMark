
ACTION Homing:
	
	
	CASE enBeltHomeSteps OF
		HOME_IDLE: //Idle state for homing
			IF((gAx_BeltConveyor.Out.PowerOn = TRUE) AND (gAx_BeltConveyor.Out.Error = FALSE))THEN
				enBeltHomeSteps := HOME_STARTING;
			END_IF;
		
		HOME_STARTING: //Starting command for the homing
			gAx_BeltConveyor.In.Parameters.Home.Mode := mpAXIS_HOME_MODE_ABS_SWITCH;
			gAx_BeltConveyor.In.Parameters.Home.HomingVelocity := beltCtrl.Para.homeVelocity;
			gAx_BeltConveyor.In.Parameters.Home.Acceleration := beltCtrl.Para.homeVelocity * K_BELT_ACC_FACTOR;
			enBeltHomeSteps := HOME_EXECUTE;
			
		HOME_EXECUTE: //Executing homing for the axis
			IF(beltCtrl.Cmd.bHome = TRUE)THEN
				gAx_BeltConveyor.In.Home := TRUE;
				enBeltHomeSteps := HOME_STOPPING;
			END_IF;

		HOME_STOPPING: //Homing is being stopped
			IF(gAx_BeltConveyor.Out.IsHomed = TRUE)THEN
				enBeltHomeSteps := HOME_STOPPED;
			END_IF;
		
		HOME_STOPPED: //Homing is stopped
			gAx_BeltConveyor.In.Home := FALSE;
			IF(gAx_BeltConveyor.Out.Velocity = K_ZERO)THEN
				enBeltHomeSteps := HOME_IDLE;
			END_IF;
	END_CASE;
	
END_ACTION
