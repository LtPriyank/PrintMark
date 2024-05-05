
PROGRAM _INIT
	//Local pointer method to access other modules
	beltConvStatus := PV_xgetadr(ADR('BeltCtrl:beltCtrl'),ADR(beltConvAddress),ADR(beltConvSize));
	cutterStatus := PV_xgetadr(ADR('CutterCtrl:cutCtrl'),ADR(cutterAddress),ADR(cutterSize));
END_PROGRAM

PROGRAM _CYCLIC
	//For Accessing Variables of Other Modules
	pBeltConveyorCtrl ACCESS beltConvAddress;
	pCutterCtrl ACCESS cutterAddress;
	
	//Calling Auto mode action file
	Automatic;
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

