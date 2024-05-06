
PROGRAM _INIT
	//Local pointer method to access other modules
	beltConvStatus := PV_xgetadr(ADR('BeltCtrl:beltCtrl'),ADR(beltConvAddress),ADR(beltConvSize));
	cutterStatus := PV_xgetadr(ADR('CutterCtrl:cutCtrl'),ADR(cutterAddress),ADR(cutterSize));
END_PROGRAM

PROGRAM _CYCLIC
	//For Accessing Variables of Other Modules
	pBeltConveyorCtrl ACCESS beltConvAddress;
	pCutterCtrl ACCESS cutterAddress;
	
	//Mode Selection for the machine
	IF(gPrintMarkHMI.Cmd.modeSelect = K_MANUAL)THEN
		gPrintMark.Cmd.autoMode := FALSE;
		gPrintMark.Cmd.manualMode := TRUE;
	ELSIF(gPrintMarkHMI.Cmd.modeSelect = K_AUTO)THEN
		gPrintMark.Cmd.autoMode := TRUE;
		gPrintMark.Cmd.manualMode := FALSE;
	END_IF;
	
	//Calling Auto mode action file
	IF(gPrintMark.Cmd.autoMode = TRUE)THEN
		Automatic;
	END_IF;
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

