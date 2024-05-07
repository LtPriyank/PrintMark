
PROGRAM _INIT	
	gPrintMarkHMI.Para.beltJogSpeed := K_BELT_JOG_INIT;
	gPrintMarkHMI.Para.cutterJogSpeed := K_CUTTER_JOG_INIT;
	//Init values of the Reg mark capture
	gPrintMarkHMI.Para.productLength := K_INIT_PROD_LENGTH;
	gPrintMarkHMI.Para.minWidth := K_INIT_MIN_WIDTH;
	gPrintMarkHMI.Para.maxWidth := K_INIT_MAX_WIDTH;
	gPrintMarkHMI.Para.windowNeg:= K_INIT_WINDOW_NEG;
	gPrintMarkHMI.Para.windowPos  := K_INIT_WINDOW_POS;
	gPrintMarkHMI.Para.missedPrintMarks := K_ZERO;
END_PROGRAM

PROGRAM _CYCLIC

	//Manual commands mapping for Belt conveyor axis
	IF(gPrintMark.Cmd.ManualMode = TRUE)THEN
		gAx_BeltConveyor.In.Power := gPrintMarkHMI.Cmd.bBeltPowerOn;
	END_IF
	gAx_BeltConveyor.In.ErrorReset := gPrintMarkHMI.Cmd.bBeltErrorReset;
	IF(gAx_BeltConveyor.Out.IsHomed = TRUE)THEN
		gPrintMarkHMI.Cmd.bBeltHome := FALSE;
	END_IF;
	
	//Manual commands mapping for Cutter conveyor axis
	IF(gPrintMark.Cmd.ManualMode = TRUE)THEN
		gAx_Cutter.In.Power := gPrintMarkHMI.Cmd.bCutterPowerOn;
	END_IF;
	gAx_Cutter.In.ErrorReset := gPrintMarkHMI.Cmd.bCutterErrorReset;
	IF((gAx_Cutter.Out.IsHomed = TRUE) AND (gAx_Cutter.Out.Position = K_ZERO))THEN
		gPrintMarkHMI.Cmd.bCutterHome := FALSE;
	END_IF;
	
	//Automatic commands mapping
	gPrintMark.Cmd.Start := gPrintMarkHMI.Cmd.bStart;
	gPrintMark.Cmd.Stop := gPrintMarkHMI.Cmd.bStop;
	gPrintMark.Cmd.ErrorAck := gPrintMarkHMI.Cmd.bErrorReset;
	gPrintMark.Cmd.CutterDisable := gPrintMarkHMI.Cmd.bCutterSelect;
	gPrintMark.Cmd.SimSensor := gPrintMarkHMI.Cmd.bSimSensor;
	gPrintMark.Para.MachineSpeed := gPrintMarkHMI.Para.machineSpeed * K_CAP_PER_MINUTE;
	gPrintMarkHMI.Status.machineStatus := gPrintMark.Status.machineStatus;
	gRegConfigPara.ProductLength  := gPrintMarkHMI.Para.productLength;
	gRegAdvancePara.MinWidth := gPrintMarkHMI.Para.minWidth;
	gRegAdvancePara.MaxWidth := gPrintMarkHMI.Para.maxWidth;
	gRegAdvancePara.WindowNeg := gPrintMarkHMI.Para.windowNeg;
	gRegAdvancePara.WindowPos := gPrintMarkHMI.Para.windowPos;
	gPrintMark.Para.SimPrintMinWidth := gPrintMarkHMI.Para.simMinWidth;
	gPrintMark.Para.SimPrintMaxWidth := gPrintMarkHMI.Para.simMaxWidth;
	
	//Calling animation action file
	BeltAnime;
	CutAnime;
	
	//Cuts per minute count
	gPrintMarkHMI.Para.cutsPerMinute := gPrintMark.Para.CutsPerMinute;

	


	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

