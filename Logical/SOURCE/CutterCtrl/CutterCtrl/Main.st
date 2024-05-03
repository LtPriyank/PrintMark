
PROGRAM _INIT
	cutCtrl.Para.homeVelocity := 100;
	cutCtrl.Para.homePositiveTol := ((K_UNIT_PER_REV)/K_HALF)-(K_HOME_POS_TOL);
	cutCtrl.Para.homeNegativeTol := ((K_UNIT_PER_REV)/K_HALF)+(K_HOME_NEG_TOL);
END_PROGRAM

PROGRAM _CYCLIC
	
	//Calling Cutter Axis IO mapping file
	AxisIOMap;
	
	//Calling Cutter Axis Homing Command
	HomePos;
	//Homing Operatoin after finding homing position
	IF(cutCtrl.Status.bHomePosFound = TRUE)THEN
		Homing;
	END_IF;
	
	 
END_PROGRAM

PROGRAM _EXIT
	iFb_MpAxisBasic.Enable := FALSE;
	iFb_MpAxisBasic();	 
	 
END_PROGRAM

