
PROGRAM _INIT
	beltCtrl.Para.homeVelocity := 100;
END_PROGRAM

PROGRAM _CYCLIC
	
	//Calling Belt Axis IO mapping file
	AxisIOMap;
	
	//Calling Belt Axis Homing file
	Homing;
	
	//Calling Belt Axis manual operation
	Manual;
	

	 
END_PROGRAM

PROGRAM _EXIT
	iFb_MpAxisBasic.Enable := FALSE;
	iFb_MpAxisBasic();	 
END_PROGRAM

