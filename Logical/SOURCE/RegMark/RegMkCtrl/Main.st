(*|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|*)
(*| Copyright      :- B&R Industrial Automation GmbH                         |*)
(*| Contact Person :-   kuma1p                                      		 |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| System       :-  Machine Name                                            |*)
(*| Task Name    :-  RegMkCtrl.st                                            |*)
(*| Auther Name  :-   kuma1p                                       			 |*)
(*| Created Date :-May 8, 2024/1:04 AM                                       |*)
(*| AS Version   :-  AS 4.12.2.93                                            |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| Description  :-  This task is for Regmark control                        |*)
(*|                                                                          |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| Version :-         V 0.0                      kuma1p                     |*)
(*|Changes Made :-    Reg Mark FB added                                      |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
PROGRAM _INIT
	//Init values of the Reg mark capture
	gRegConfigPara.ProductLength := K_INIT_PROD_LENGTH;
	gRegConfigPara.RegMarkPosition := K_INIT_REGMRK_POS;
	gRegConfigPara.RegMarkOffset := K_INIT_REGMRK_OFF;
	gRegConfigPara.DistanceToSensor := K_INIT_SENS_DIST;
	gRegAdvancePara.MinWidth := K_INIT_MIN_WIDTH;
	gRegAdvancePara.MaxWidth := K_INIT_MAX_WIDTH;
	gRegAdvancePara.WindowNeg := K_INIT_WINDOW_NEG;
	gRegAdvancePara.WindowPos  := K_INIT_WINDOW_POS;
	gRegAdvancePara.SensorDelay := K_INIT_SENS_DEL;
	gRegAdvancePara.CorrectionValueLimitNeg := K_INIT_CORR_NEG;
	gRegAdvancePara.CorrectionValueLimitPos := K_INIT_CORR_POS;
	regMarkCtrl.Cmd.bStartTrigger := TRUE;
	gRegAdvancePara.CorrectCurrentCycle := TRUE;
	gRegAdvancePara.Mode := mcFIRST_RM;
	gRegAdvancePara.EventSourceParID := ACP10PAR_STAT_TRIGGER1 ;
	gRegAdvancePara.Edge := ncP_EDGE;//Positive Edge
	validRmNew := 0;
END_PROGRAM

PROGRAM _CYCLIC
	//Enabling RegMarkCapture
	regMarkCtrl.Cmd.bEnableRegMark := gAx_CutterCam.Out.InSync;

	//MC_BR_RegMarkCapture002 Type FB
	MC_BR_RegMarkCapture002_Print.Master := ADR(gBeltAxis);
	MC_BR_RegMarkCapture002_Print.Axis := ADR(gCutAxis);
	MC_BR_RegMarkCapture002_Print.Enable := regMarkCtrl.Cmd.bEnableRegMark;
	MC_BR_RegMarkCapture002_Print.SearchRM := regMarkCtrl.Cmd.bStartTrigger;
	MC_BR_RegMarkCapture002_Print.InitData := regMarkCtrl.Cmd.bStartTrigger;
	MC_BR_RegMarkCapture002_Print.CutPosition := REAL_TO_DINT(gRegConfigPara.ProductLength);
	MC_BR_RegMarkCapture002_Print.Configuration := gRegConfigPara;
	MC_BR_RegMarkCapture002_Print.AdvancedParameters := gRegAdvancePara;
	MC_BR_RegMarkCapture002_Print();
	
	//Process values for HMI
	gPrintMarkHMI.Para.avgPmDistance := MC_BR_RegMarkCapture002_Print.AdditionalInfo.AverageProductLength;
	gPrintMarkHMI.Para.lastProdLength := MC_BR_RegMarkCapture002_Print.AdditionalInfo.ActLength;
	gPrintMarkHMI.Para.validPrintMarks := MC_BR_RegMarkCapture002_Print.ValidRMs;
	gPrintMark.Para.ValidRm := MC_BR_RegMarkCapture002_Print.ValidRMs;
	//Condition for missed regmarks
	IF(MC_BR_RegMarkCapture002_Print.Enable = TRUE)THEN
		IF(validRmNew <> MC_BR_RegMarkCapture002_Print.ValidRMs)THEN
			validRmOld := validRmNew;
			validRmNew := MC_BR_RegMarkCapture002_Print.ValidRMs;
		END_IF;
		IF((gAx_Cutter.Out.Info.DigitalInputsStatus.Trigger1)AND(validRmOld=validRmNew)AND(validRmNew>=1))THEN
			gPrintMarkHMI.Para.missedPrintMarks :=  gPrintMarkHMI.Para.missedPrintMarks + 1;
		END_IF;
	ELSE
			gPrintMarkHMI.Para.missedPrintMarks := K_ZERO;
	END_IF;
	//Condition for Invalid Printmarks
	IF(MC_BR_RegMarkCapture002_Print.Enable = TRUE)THEN
		IF(MC_BR_RegMarkCapture002_Print.ProductsWithoutRM > K_MAX_INVALID)THEN
			gPrintMark.Cmd.Stop := TRUE;
		END_IF;
	END_IF;
	
	
	
	
	
	
	

	
	

	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

