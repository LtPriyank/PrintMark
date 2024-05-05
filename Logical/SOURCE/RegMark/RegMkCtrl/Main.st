
PROGRAM _INIT
//	Init values of the Reg mark capture
	regMarkCtrl.Para.productLength := K_INIT_PROD_LENGTH;
	regMarkCtrl.Para.regMarkPosition := K_INIT_REGMRK_POS;
	regMarkCtrl.Para.regMarkOffset := K_INIT_REGMRK_OFF;
	regMarkCtrl.Para.distanceToSensor := K_INIT_SENS_DIST;
	regMarkCtrl.Para.minWidth := K_INIT_MIN_WIDTH;
	regMarkCtrl.Para.maxWidth := K_INIT_MAX_WIDTH;
	regMarkCtrl.Para.negWindow := K_INIT_WINDOW_NEG;
	regMarkCtrl.Para.posWindow := K_INIT_WINDOW_POS;
	regMarkCtrl.Para.sensorDelay := K_INIT_SENS_DEL;
	regMarkCtrl.Para.correctionValueLimitNeg := K_INIT_CORR_NEG;
	regMarkCtrl.Para.correctionValueLimitPos := K_INIT_CORR_POS;
	regMarkCtrl.Cmd.bStartTrigger := TRUE;
	gRegAdvancePara.CorrectCurrentCycle := TRUE;
END_PROGRAM

PROGRAM _CYCLIC
	
	//	MC_BR_RegMark Config parameters
	gRegConfigPara.ProductLength := regMarkCtrl.Para.productLength;     
	gRegConfigPara.RegMarkPosition := regMarkCtrl.Para.regMarkPosition;
	gRegConfigPara.RegMarkOffset := regMarkCtrl.Para.regMarkOffset; 
	gRegConfigPara.DistanceToSensor := regMarkCtrl.Para.distanceToSensor;
	//	MC_BR_RegMark Advance parameters
	gRegAdvancePara.Mode := mcFIRST_RM;
	gRegAdvancePara.EventSourceParID := 0;
	gRegAdvancePara.Edge := ncP_EDGE;//Positive Edge
	gRegAdvancePara.MinWidth := regMarkCtrl.Para.minWidth;//Minimum Width of Hole 
	gRegAdvancePara.MaxWidth := regMarkCtrl.Para.maxWidth;//Maximum Width of Hole
	gRegAdvancePara.WindowNeg := regMarkCtrl.Para.negWindow;
	gRegAdvancePara.WindowPos := regMarkCtrl.Para.posWindow;
	gRegAdvancePara.SensorDelay := regMarkCtrl.Para.sensorDelay;
	gRegAdvancePara.CorrectionValueLimitNeg := regMarkCtrl.Para.correctionValueLimitNeg;
	gRegAdvancePara.CorrectionValueLimitPos := regMarkCtrl.Para.correctionValueLimitPos;
	//MC_BR_RegMarkCapture002 Type FB
	MC_BR_RegMarkCapture002_Print.Master := ADR(gAx_BeltConveyor);
	MC_BR_RegMarkCapture002_Print.Axis := ADR(gAx_Cutter);
	MC_BR_RegMarkCapture002_Print.Enable := regMarkCtrl.Cmd.bEnableRegMark;
	MC_BR_RegMarkCapture002_Print.SearchRM := regMarkCtrl.Cmd.bStartTrigger;
	MC_BR_RegMarkCapture002_Print.InitData := regMarkCtrl.Cmd.bStartTrigger;
	MC_BR_RegMarkCapture002_Print.CutPosition := REAL_TO_DINT(gRegConfigPara.ProductLength);
	MC_BR_RegMarkCapture002_Print.Configuration := gRegConfigPara;
	MC_BR_RegMarkCapture002_Print.AdvancedParameters := gRegAdvancePara;
	MC_BR_RegMarkCapture002_Print();
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

