
PROGRAM _INIT
	//Init values of the Reg mark capture
	gRegConfigPara.ProductLength := 700;
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
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

