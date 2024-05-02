
PROGRAM _INIT
	cutCtrl.Para.homeVelocity := 100;
END_PROGRAM

PROGRAM _CYCLIC
	
	//Calling Cutter Axis IO mapping file
	AxisIOMap;
	
	//Calling Cutter Axis Homing Command
	Home;
	 
	 
END_PROGRAM

PROGRAM _EXIT
	iFb_MpAxisBasic.Enable := FALSE;
	iFb_MpAxisBasic();	 
	 
END_PROGRAM

