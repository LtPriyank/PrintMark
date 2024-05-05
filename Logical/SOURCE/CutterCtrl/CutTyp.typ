(*Cutter section controlling structure*)

TYPE
	CutterCmd_Typ : 	STRUCT  (*Structure for giving command to cutter section*)
		bStart : BOOL; (*Start command*)
		bStop : BOOL; (*Stop command*)
		bHomePos : BOOL; (*Command for finding home position*)
		bHome : BOOL; (*Command for homing of cutter axis*)
		bJogPositive : BOOL; (*Command for cutter jog positive*)
		bJogNegative : BOOL; (*Command for cutter jog negative*)
	END_STRUCT;
	CutterPara_Typ : 	STRUCT  (*Structure for giving the parameters to cutter section*)
		homeVelocity : REAL; (*Homing velocity*)
		homeAccel : REAL; (*Homing acceleration*)
		homeDecel : REAL; (*Homing deceleration*)
		homePositiveTol : UINT; (*Tolerance for homing in positive direction*)
		homeNegativeTol : UINT; (*Tolerance for homing in negative direction*)
		homeOffset : UINT; (*Offset for homing*)
		jogSpeed : REAL; (*Cutter axis jog velocity*)
		jogUpperLimit : REAL; (*Cutter axis jog upper limit*)
		jogLowerLimit : REAL; (*Cutter axis jog lower limit*)
	END_STRUCT;
	CutterStatus_Typ : 	STRUCT  (*Strcuture for showing the status of the cutter section*)
		bHomePosFound : BOOL; (*Status for home position found*)
		bHomingDone : BOOL; (*Status for homing done*)
	END_STRUCT;
	CutterCtrl_Typ : 	STRUCT  (*Structure for controlling the cutter section*)
		Cmd : CutterCmd_Typ; (*Giving command to the cutter section*)
		Para : CutterPara_Typ; (*Giving parameters to the cutter section*)
		Status : CutterStatus_Typ; (*Getting status of the belt cutter section*)
	END_STRUCT;
END_TYPE
