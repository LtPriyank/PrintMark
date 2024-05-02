
ACTION Home:
	
	CASE enCutterHomeSteps OF
		HOME_IDLE:
			IF((gAx_Cutter.Out.PowerOn = TRUE) AND (gAx_Cutter.Out.Error = FALSE))THEN
				enCutterHomeSteps := HOME_STARTING;
			END_IF;
		
		HOME_STARTING:
			gAx_Cutter.In.Parameters.Home.Mode := mcHOME_DIRECT;
			gAx_Cutter.In.Parameters.Home.ReferencePulse := mpAXIS_HOME_OPTION_ON;
			gAx_Cutter.In.Parameters.Home.HomingVelocity := cutCtrl.Para.homeVelocity;
			gAx_Cutter.In.Parameters.Home.Acceleration := cutCtrl.Para.homeVelocity * K_CUT_ACC_FACTOR;
			IF((gAx_Cutter.Out.Position < 1600))THEN
				gAx_Cutter.In.Parameters.Home.HomingDirection := mpAXIS_HOME_DIR_NEGATIVE;
			ELSIF((gAx_Cutter.Out.Position > 2000))THEN
				gAx_Cutter.In.Parameters.Home.HomingDirection := mpAXIS_HOME_DIR_POSITIVE;
			ELSIF(((gAx_Cutter.Out.Position > 1600))AND((gAx_Cutter.Out.Position < 2000)))THEN
				cutCtrl.Cmd.bHome := FALSE;
			END_IF;
			IF(cutCtrl.Cmd.bHome = TRUE)THEN
				gAx_Cutter.In.Home := TRUE;
				IF(gAx_Cutter.Out.Position = K_ZERO)THEN
					enCutterHomeSteps := HOME_EXECUTE;
				END_IF;
			END_IF;
			
		HOME_EXECUTE:
			gAx_Cutter.In.Home := FALSE;
			gAx_Cutter.In.Parameters.Velocity := cutCtrl.Para.homeVelocity;
			gAx_Cutter.In.Parameters.Acceleration := cutCtrl.Para.homeVelocity * K_CUT_ACC_FACTOR;
			gAx_Cutter.In.Parameters.Deceleration := cutCtrl.Para.homeVelocity;
			gAx_Cutter.In.Parameters.Home.ReferencePulse := mpAXIS_HOME_OPTION_OFF;
			cutHomePostion := ((K_UNIT_PER_REV/K_QUARTER)-(K_CUTTER_ANGLE/K_HALF))+(K_UNIT_PER_REV/K_HALF)+K_CORRECTION;
			gAx_Cutter.In.Parameters.Position := (cutHomePostion);
			gAx_Cutter.In.Parameters.Direction := mpAXIS_DIR_NEGATIVE;
			gAx_Cutter.In.MoveAbsolute := TRUE;
			IF(gAx_Cutter.Out.Position = cutHomePostion)THEN
				gAx_Cutter.In.MoveAbsolute := FALSE;
				enCutterHomeSteps := HOME_STOPPING;
			END_IF;
			
		HOME_STOPPING:
			gAx_Cutter.In.Home := TRUE;
			IF(gAx_Cutter.Out.Position = K_ZERO)THEN
				enCutterHomeSteps := HOME_STOPPED;
			END_IF;
		
		HOME_STOPPED:
			gAx_Cutter.In.Home := FALSE;
			IF(gAx_Cutter.Out.Velocity = K_ZERO)THEN
				enCutterHomeSteps := HOME_IDLE;
			END_IF;
	END_CASE;
	
	

END_ACTION
