
ACTION Mode:
	
	//Calling PackMLMode FB
	iFb_MpPackMLModeAuto(MpLink := ADR(gMl_PrintPackML) , Enable := TRUE ,  ModeID := 1 , Activate := TRUE);
	iFb_MpPackMLModeManual(MpLink := ADR(gMl_PrintPackML) , Enable := TRUE ,  ModeID := 2 , Activate := TRUE);
	

END_ACTION
