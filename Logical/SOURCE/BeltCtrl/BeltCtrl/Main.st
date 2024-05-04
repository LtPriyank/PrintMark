
PROGRAM _INIT
	beltCtrl.Para.homeVelocity := K_HOME_VEL_INIT;
END_PROGRAM

PROGRAM _CYCLIC
	
	//Calling Belt Axis IO mapping file
	AxisIOMap;
	
	//Calling Belt Axis Homing file
	beltCtrl.Cmd.bHome := gPrintMarkHMI.Cmd.bBeltHome;
	Homing;
	
	//Calling Belt Axis manual operation
	beltCtrl.Para.jogSpeed := gPrintMarkHMI.Para.beltJogSpeed;
	beltCtrl.Cmd.bJogPositive := gPrintMarkHMI.Cmd.bBeltJogPositive;
	beltCtrl.Cmd.bJogNegative := gPrintMarkHMI.Cmd.bBeltJogNegative;
	Manual;
	

	 
END_PROGRAM

PROGRAM _EXIT
	iFb_MpAxisBasic.Enable := FALSE;
	iFb_MpAxisBasic();	 
END_PROGRAM

