
PROGRAM _INIT
	//Local pointer method to access other modules
	beltConvStatus := PV_xgetadr(ADR('BeltCtrl:beltCtrl'),ADR(beltConvAddress),ADR(beltConvSize));
	cutterStatus := PV_xgetadr(ADR('CutterCtrl:cutCtrl'),ADR(cutterAddress),ADR(cutterSize));
	//Init Machine Speed
	gPrintMarkHMI.Para.machineSpeed := K_INIT_MACHINE_SPEED;
END_PROGRAM

PROGRAM _CYCLIC
	//For Accessing Variables of Other Modules
	pBeltConveyorCtrl ACCESS beltConvAddress;
	pCutterCtrl ACCESS cutterAddress;
	
	//Mode Selection for the machine
	IF(gPrintMarkHMI.Cmd.modeSelect = K_MANUAL)THEN
		gPrintMark.Cmd.AutoMode := FALSE;
		gPrintMark.Cmd.ManualMode := TRUE;
	ELSIF(gPrintMarkHMI.Cmd.modeSelect = K_AUTO)THEN
		gPrintMark.Cmd.AutoMode := TRUE;
		gPrintMark.Cmd.ManualMode := FALSE;
	END_IF;
	
	//Calling Auto mode action file
	IF(gPrintMark.Cmd.AutoMode = TRUE)THEN
		Automatic;
	END_IF;
	
	//Caps per minute calculation
	IF(gAx_CutterCam.Out.InSync = TRUE)THEN
		IF(cutPerMinTimer <= K_MINUTE_TIMER)THEN
			cutPerMinTimer := cutPerMinTimer + 1;
		ELSE
			gPrintMark.Para.CutsPerMinute := cutPerMinCount;
			cutPerMinTimer := 0;
		END_IF;

		R_TRIG_CPM(CLK := gAx_BeltConveyor.Out.Info.DigitalInputsStatus.Trigger2 );
	IF(R_TRIG_CPM.Q = TRUE)THEN
		cutPerMinCount := cutPerMinCount + 1;
		END_IF;
	ELSE
		gPrintMark.Para.CutsPerMinute := 0;
		cutPerMinCount := 0;
	END_IF;
	
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

