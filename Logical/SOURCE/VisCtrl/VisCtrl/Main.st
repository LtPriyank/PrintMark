(*|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|*)
(*| Copyright      :- B&R Industrial Automation GmbH                         |*)
(*| Contact Person :-   kuma1p                                      		 |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| System       :-  Machine Name                                            |*)
(*| Task Name    :-  VisCtrl.st                                              |*)
(*| Auther Name  :-   kuma1p                                       			 |*)
(*| Created Date :-May 8, 2024/1:04 AM                                       |*)
(*| AS Version   :-  AS 4.12.2.93                                            |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| Description  :-  This task is for visualization control                  |*)
(*|                                                                          |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| Version :-         V 0.0                      kuma1p                     |*)
(*|Changes Made :- Mapping for manual mode done                              |*)
(*| Version :-         V 0.0                      kuma1p                     |*)
(*|Changes Made :- Mapping for auto mode done                                |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
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
	IF(gPrintMarkHMI.Cmd.bEnableBeltSimu = TRUE)THEN
		BeltAnime;
	END_IF;
	IF(gPrintMarkHMI.Cmd.bEnableCutterSimu = TRUE)THEN
		CutAnime;
	END_IF;
	
	
	//Cuts per minute count
	gPrintMarkHMI.Para.cutsPerMinute := gPrintMark.Para.CutsPerMinute;
	
	//Animation for cutter
	IF((gAx_CutterCam.Out.InSync = TRUE))THEN
		gPrintMarkHMI.Cmd.bEnableCutterSimu := TRUE;
	ELSE
		gPrintMarkHMI.Cmd.bEnableCutterSimu := FALSE;
	END_IF;
	
	//Animation for Regmark sensors
	IF(gAx_Cutter.Out.Info.DigitalInputsStatus.Trigger1 = TRUE)THEN
		gPrintMarkHMI.Status.regMarkSensorActive := K_SLIDER_MAX;
	ELSE
		gPrintMarkHMI.Status.regMarkSensorActive := K_ZERO;
	END_IF;
	IF(gAx_BeltConveyor.Out.Info.DigitalInputsStatus.Trigger2 = TRUE)THEN
		gPrintMarkHMI.Status.cutSensorActive := K_SLIDER_MAX;
	ELSE
		gPrintMarkHMI.Status.cutSensorActive := K_ZERO;
	END_IF;
	
	//For enabling dual cutter
	gPrintMark.Cmd.DualCutterEnable := gPrintMarkHMI.Cmd.bDualCutter;
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

