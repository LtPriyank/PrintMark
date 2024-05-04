
ACTION Manual:
	
	//Case for manual operation of belt axis
	CASE enBeltManualSteps OF
		IDLE: //Idle state for the state machine
			IF((gAx_BeltConveyor.Out.PowerOn = TRUE) AND (gAx_BeltConveyor.Out.Error = FALSE))THEN
				enBeltManualSteps := STARTING;
			END_IF;
		
		STARTING: //Starting parametrs for the state machine;
			gAx_BeltConveyor.In.Parameters.Jog.Velocity := beltCtrl.Para.jogSpeed;
			gAx_BeltConveyor.In.Parameters.Jog.Acceleration := beltCtrl.Para.jogSpeed * K_BELT_ACC_FACTOR;
			gAx_BeltConveyor.In.Parameters.Jog.Deceleration := beltCtrl.Para.jogSpeed * K_BELT_DEC_FACTOR;
			IF(gAx_BeltConveyor.In.Parameters.Jog.Velocity <> beltCtrl.Para.jogSpeed)THEN
				gAx_BeltConveyor.In.Update := TRUE;
				IF(gAx_BeltConveyor.Out.UpdateDone = TRUE)THEN
					gAx_BeltConveyor.In.Update := FALSE;	
				END_IF;
			END_IF;
			enBeltManualSteps := EXECUTE;
			
		EXECUTE: //Executing jog positive and negative
			gAx_BeltConveyor.In.Parameters.Jog.LowerLimit := K_ZERO;
			gAx_BeltConveyor.In.Parameters.Jog.UpperLimit := K_ZERO;
			gAx_BeltConveyor.In.Update := TRUE;
			IF(gAx_BeltConveyor.Out.UpdateDone = TRUE)THEN
				gAx_BeltConveyor.In.Update := FALSE;	
			END_IF;
			IF(beltCtrl.Cmd.bJogPositive = TRUE)THEN
				gAx_BeltConveyor.In.JogPositive := TRUE;
			ELSE
				gAx_BeltConveyor.In.JogPositive := FALSE;
			END_IF;
			IF(beltCtrl.Cmd.bJogNegative = TRUE)THEN
				IF(gAx_Cutter.Out.Info.DigitalInputsStatus.Trigger1 = FALSE)THEN
					gAx_BeltConveyor.In.JogNegative := TRUE;
					negLimitAbort := FALSE;
				ELSE
					negLimitAbort := TRUE;
					enBeltManualSteps := ABORTING;
				END_IF;	
			ELSE
				gAx_BeltConveyor.In.JogNegative := FALSE;
			END_IF;	
			IF((gAx_BeltConveyor.Out.PowerOn = FALSE) OR (gAx_BeltConveyor.Out.Error = FALSE))THEN
				enBeltManualSteps := IDLE;
			END_IF;
		
		ABORTING: //Aborting the jogging in case of negative limit reached
			iFb_RtrigBeltJog(CLK := negLimitAbort);
			IF(iFb_RtrigBeltJog.Q)THEN
				gAx_BeltConveyor.In.Parameters.Jog.LowerLimit := gAx_BeltConveyor.Out.Position - K_JOG_NEG_LIMIT;
				gAx_BeltConveyor.In.Parameters.Jog.UpperLimit := ((K_PERIOD)-(gAx_BeltConveyor.Out.Position - K_JOG_NEG_LIMIT));
			END_IF;		
			gAx_BeltConveyor.In.Update := TRUE;
			IF(gAx_BeltConveyor.Out.UpdateDone = TRUE)THEN
				gAx_BeltConveyor.In.Update := FALSE;	
			END_IF;
			IF(gAx_BeltConveyor.Out.Velocity = K_ZERO)THEN
				gAx_BeltConveyor.In.JogNegative := FALSE;
				enBeltManualSteps := EXECUTE;
			END_IF;		
			IF((gAx_BeltConveyor.Out.PowerOn = FALSE) OR (gAx_BeltConveyor.Out.Error = FALSE))THEN
				enBeltManualSteps := IDLE;
			END_IF;
	END_CASE;
	

END_ACTION
