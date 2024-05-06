
ACTION Homing: 
	IF(cutCtrl.Cmd.bHome = TRUE)THEN
		gAx_Cutter.In.Parameters.Velocity := cutCtrl.Para.homeVelocity;
		gAx_Cutter.In.Parameters.Acceleration := cutCtrl.Para.homeVelocity * K_CUT_ACC_FACTOR;
		gAx_Cutter.In.Parameters.Deceleration := cutCtrl.Para.homeVelocity;
		IF((gAx_Cutter.Out.Position < cutCtrl.Para.homePositiveTol)AND(gAx_Cutter.Out.Position > K_ZERO))THEN
			gAx_Cutter.In.Parameters.Direction := mpAXIS_DIR_NEGATIVE;
			gAx_Cutter.In.Parameters.Position := K_ZERO + cutCtrl.Para.homeOffset;
			gAx_Cutter.In.MoveAbsolute := TRUE;
		ELSIF((gAx_Cutter.Out.Position > cutCtrl.Para.homeNegativeTol)AND(gAx_Cutter.Out.Position < K_UNIT_PER_REV))THEN
			gAx_Cutter.In.Parameters.Direction := mpAXIS_DIR_POSITIVE;
			gAx_Cutter.In.Parameters.Position := K_ZERO + cutCtrl.Para.homeOffset;
			gAx_Cutter.In.MoveAbsolute := TRUE;
		ELSIF((gAx_Cutter.Out.Position>cutCtrl.Para.homePositiveTol)AND
			(gAx_Cutter.Out.Position<cutCtrl.Para.homeNegativeTol))THEN
			cutCtrl.Cmd.bHome := FALSE;
		END_IF;
	ELSIF((gAx_Cutter.Out.Position = K_ZERO))THEN
		gAx_Cutter.In.MoveAbsolute := FALSE;
	END_IF;
	
END_ACTION
