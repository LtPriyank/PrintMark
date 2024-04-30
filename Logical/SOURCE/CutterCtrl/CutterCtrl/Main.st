
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	//Calling Cutter Axis IO mapping file
	AxisIOMap;
	 
	 
END_PROGRAM

PROGRAM _EXIT
	iFb_MpAxisBasic.Enable := FALSE;
	iFb_MpAxisBasic();	 
	 
END_PROGRAM

