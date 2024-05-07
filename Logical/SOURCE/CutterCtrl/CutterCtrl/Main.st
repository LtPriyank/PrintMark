
PROGRAM _INIT
	cutCtrl.Para.homeVelocity := K_HOME_VEL_INIT;
	cutCtrl.Para.homePositiveTol := ((K_UNIT_PER_REV)/K_HALF)-(K_HOME_POS_TOL);
	cutCtrl.Para.homeNegativeTol := ((K_UNIT_PER_REV)/K_HALF)+(K_HOME_NEG_TOL);
END_PROGRAM

PROGRAM _CYCLIC
	
	//Calling Cutter Axis IO mapping file
	AxisIOMap;
	
	//Calling Cutter Axis Homing Command
	HomePos;
	
	//Homing Operation after finding homing position
	IF(gPrintMark.Cmd.ManualMode = TRUE)THEN
		cutCtrl.Cmd.bHome := gPrintMarkHMI.Cmd.bCutterHome;
	END_IF;
	
	IF(cutCtrl.Status.bHomePosFound = TRUE)THEN
		Homing;
	END_IF;
	
	//Manual command for Cutter axis
	IF(gPrintMark.Cmd.ManualMode = TRUE)THEN
		cutCtrl.Para.jogSpeed := gPrintMarkHMI.Para.cutterJogSpeed;
		cutCtrl.Cmd.bJogPositive := gPrintMarkHMI.Cmd.bCutterJogPositive;
		cutCtrl.Cmd.bJogNegative := gPrintMarkHMI.Cmd.bCutterJogNegative;
		Manual;
	END_IF;
	
	//Cam Automat
	Printcam;
	
	 
END_PROGRAM

PROGRAM _EXIT
	iFb_MpAxisBasic.Enable := FALSE;
	iFb_MpAxisBasic();	 
	 
END_PROGRAM

