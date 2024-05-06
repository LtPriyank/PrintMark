
PROGRAM _INIT	
	gPrintMarkHMI.Para.beltJogSpeed := K_BELT_JOG_INIT;
	gPrintMarkHMI.Para.cutterJogSpeed := K_CUTTER_JOG_INIT;
END_PROGRAM

PROGRAM _CYCLIC

	//Manual commands mapping for Belt conveyor axis
	IF(gPrintMark.Cmd.manualMode = TRUE)THEN
		gAx_BeltConveyor.In.Power := gPrintMarkHMI.Cmd.bBeltPowerOn;
	END_IF
	gAx_BeltConveyor.In.ErrorReset := gPrintMarkHMI.Cmd.bBeltErrorReset;
	gPrintMark.Cmd.ErrorAck := gPrintMarkHMI.Cmd.bBeltErrorReset;
	IF(gAx_BeltConveyor.Out.IsHomed = TRUE)THEN
		gPrintMarkHMI.Cmd.bBeltHome := FALSE;
	END_IF;
	
	//Manual commands mapping for Cutter conveyor axis
	IF(gPrintMark.Cmd.manualMode = TRUE)THEN
		gAx_Cutter.In.Power := gPrintMarkHMI.Cmd.bCutterPowerOn;
	END_IF;
	gAx_Cutter.In.ErrorReset := gPrintMarkHMI.Cmd.bCutterErrorReset;
	IF((gAx_Cutter.Out.IsHomed = TRUE) AND (gAx_Cutter.Out.Position = K_ZERO))THEN
		gPrintMarkHMI.Cmd.bCutterHome := FALSE;
	END_IF;
	
	//Animation;
	

	
	

	
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

