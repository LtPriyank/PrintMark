
ACTION Manual: 
	
	//Update logic for speed
	gAx_Cutter.In.Parameters.Jog.Velocity := cutCtrl.Para.jogSpeed;
	gAx_Cutter.In.Parameters.Jog.Acceleration := cutCtrl.Para.jogSpeed * K_CUT_ACC_FACTOR;
	gAx_Cutter.In.Parameters.Jog.Deceleration := cutCtrl.Para.jogSpeed * K_CUT_DEC_FACTOR;
	IF(gAx_Cutter.In.Parameters.Jog.Velocity <> cutCtrl.Para.jogSpeed)THEN
		gAx_Cutter.In.Update := TRUE;
		IF(gAx_Cutter.Out.UpdateDone = TRUE)THEN
			gAx_Cutter.In.Update := FALSE;	
		END_IF;
	END_IF;
	
	//Update logic for limits
	gAx_Cutter.In.Parameters.Jog.LowerLimit := cutCtrl.Para.jogLowerLimit;
	gAx_Cutter.In.Parameters.Jog.UpperLimit := 	cutCtrl.Para.jogUpperLimit;
	IF((gAx_Cutter.In.Parameters.Jog.LowerLimit <> cutCtrl.Para.jogLowerLimit) OR 
		(gAx_Cutter.In.Parameters.Jog.UpperLimit <> cutCtrl.Para.jogUpperLimit))THEN	
		gAx_Cutter.In.Update := TRUE;
		IF(gAx_Cutter.Out.UpdateDone = TRUE)THEN
			gAx_Cutter.In.Update := FALSE;	
		END_IF;
	END_IF;
	
	
	//Case for manual operation of belt axis
	CASE enCutterManualSteps OF
		IDLE: //Idle state for the state machine
			IF((gAx_Cutter.Out.PowerOn = TRUE) AND (gAx_Cutter.Out.Error = FALSE))THEN
				enCutterManualSteps := STARTING;
			END_IF;
		
		STARTING: //Starting parametrs for the state machine;
			gAx_Cutter.In.Parameters.Jog.LowerLimit := K_ZERO;
			gAx_Cutter.In.Parameters.Jog.UpperLimit := K_ZERO;
			IF((gAx_Cutter.In.Parameters.Jog.LowerLimit <> K_ZERO) OR 
				(gAx_Cutter.In.Parameters.Jog.UpperLimit <> K_ZERO))THEN	
				gAx_Cutter.In.Update := TRUE;
				IF(gAx_Cutter.Out.UpdateDone = TRUE)THEN
					gAx_Cutter.In.Update := FALSE;	
				END_IF;
			END_IF;
			enCutterManualSteps := EXECUTE;
			
		EXECUTE: //Executing jog positive and negative
			IF((cutCtrl.Cmd.bJogPositive = TRUE) AND (gAx_Cutter.Out.Position >= K_ZERO) 
				AND (gAx_Cutter.Out.Position <= cutCtrl.Para.homePositiveTol))THEN
				cutCtrl.Para.jogLowerLimit := K_ZERO;
				cutCtrl.Para.jogUpperLimit := cutCtrl.Para.homePositiveTol;
				gAx_Cutter.In.JogPositive := TRUE;
			ELSIF((cutCtrl.Cmd.bJogPositive = TRUE) AND (gAx_Cutter.Out.Position >= cutCtrl.Para.homeNegativeTol) 
				AND (gAx_Cutter.Out.Position <= K_UNIT_PER_REV))THEN
				cutCtrl.Para.jogUpperLimit := K_UNIT_PER_REV;
				cutCtrl.Para.jogLowerLimit := cutCtrl.Para.homeNegativeTol;
				gAx_Cutter.In.JogPositive := TRUE;
			ELSIF(cutCtrl.Cmd.bJogPositive = FALSE)THEN
				gAx_Cutter.In.JogPositive := FALSE;
			END_IF;
			IF((cutCtrl.Cmd.bJogNegative = TRUE) AND (gAx_Cutter.Out.Position <= cutCtrl.Para.homePositiveTol) 
				AND (gAx_Cutter.Out.Position >= K_ZERO))THEN
				cutCtrl.Para.jogLowerLimit := -(K_ONE) ;
				cutCtrl.Para.jogUpperLimit := K_UNIT_PER_REV;
				gAx_Cutter.In.JogNegative := TRUE;	
			ELSIF((cutCtrl.Cmd.bJogNegative = TRUE) AND (gAx_Cutter.Out.Position < K_UNIT_PER_REV) 
				AND (gAx_Cutter.Out.Position > cutCtrl.Para.homeNegativeTol))THEN
				cutCtrl.Para.jogLowerLimit := cutCtrl.Para.homeNegativeTol ;
				cutCtrl.Para.jogUpperLimit := K_UNIT_PER_REV;
				gAx_Cutter.In.JogNegative := TRUE;	
			ELSIF(cutCtrl.Cmd.bJogNegative = FALSE)THEN
				gAx_Cutter.In.JogNegative := FALSE;
			END_IF;	
			IF((gAx_Cutter.Out.PowerOn = FALSE) OR (gAx_Cutter.Out.Error = TRUE))THEN
				enCutterManualSteps := IDLE;
			END_IF;

	END_CASE;

END_ACTION
