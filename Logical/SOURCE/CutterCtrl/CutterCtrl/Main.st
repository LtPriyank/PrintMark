
PROGRAM _INIT
	cutCtrl.Para.homeVelocity := 100;
	cutCtrl.Para.homePositiveTol := ((K_UNIT_PER_REV)/K_HALF)-(K_HOME_POS_TOL);
	cutCtrl.Para.homeNegativeTol := ((K_UNIT_PER_REV)/K_HALF)+(K_HOME_NEG_TOL);
END_PROGRAM

PROGRAM _CYCLIC
	
	//Calling Cutter Axis IO mapping file
	AxisIOMap;
	
	//Calling Cutter Axis Homing Command
	Home;
	//Homing Operatoin after finding homing position
	IF(cutCtrl.Cmd.bHome = TRUE)THEN
		gAx_Cutter.In.Parameters.Velocity := cutCtrl.Para.homeVelocity;
		gAx_Cutter.In.Parameters.Acceleration := cutCtrl.Para.homeVelocity * K_CUT_ACC_FACTOR;
		gAx_Cutter.In.Parameters.Deceleration := cutCtrl.Para.homeVelocity;
		IF((gAx_Cutter.Out.Position < cutCtrl.Para.homePositiveTol)AND(gAx_Cutter.Out.Position > K_ZERO))THEN
			gAx_Cutter.In.Parameters.Home.HomingDirection := mpAXIS_HOME_DIR_NEGATIVE;
			gAx_Cutter.In.Parameters.Position := K_ZERO + cutCtrl.Para.homeOffset;
			gAx_Cutter.In.MoveAbsolute := TRUE;
		ELSIF((gAx_Cutter.Out.Position > cutCtrl.Para.homeNegativeTol)AND(gAx_Cutter.Out.Position < K_UNIT_PER_REV))THEN
			gAx_Cutter.In.Parameters.Home.HomingDirection := mpAXIS_HOME_DIR_POSITIVE;
			gAx_Cutter.In.Parameters.Home.HomingDirection := mpAXIS_HOME_DIR_NEGATIVE;
			gAx_Cutter.In.Parameters.Position := K_ZERO+ cutCtrl.Para.homeOffset;
			gAx_Cutter.In.MoveAbsolute := TRUE;
		ELSIF((gAx_Cutter.Out.Position>cutCtrl.Para.homePositiveTol)AND
			(gAx_Cutter.Out.Position<cutCtrl.Para.homeNegativeTol))THEN
			cutCtrl.Cmd.bHome := FALSE;
		END_IF;
	ELSIF(gAx_Cutter.Out.Position = K_ZERO)THEN
		gAx_Cutter.In.MoveAbsolute := FALSE;
	END_IF;
	
	 
END_PROGRAM

PROGRAM _EXIT
	iFb_MpAxisBasic.Enable := FALSE;
	iFb_MpAxisBasic();	 
	 
END_PROGRAM

