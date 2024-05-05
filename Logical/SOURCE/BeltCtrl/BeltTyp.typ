(*Belt conveyor section controlling structure*)

TYPE
	BeltCmd_Typ : 	STRUCT  (*Structure for giving command to belt conveyor section*)
		bStart : BOOL; (*Start command*)
		bStop : BOOL; (*Stop command*)
		bHome : BOOL; (*Home command*)
		bJogPositive : BOOL; (*Positive jog command*)
		bJogNegative : BOOL; (*Negative jog command*)
	END_STRUCT;
	BeltPara_Typ : 	STRUCT  (*Structure for giving the parameters to belt conveyor section*)
		jogSpeed : REAL; (*For giving jog speed to the belt unit*)
		jogUpperLimit : REAL; (*For giving jog upper limit to the belt unit*)
		jogLowerLimit : REAL; (*For giving jog lower limit to the belt unit*)
		homeVelocity : REAL; (*Homing velocity*)
		homeAccel : REAL; (*Homing acceleration*)
		homeDecel : REAL; (*Homing deceleration*)
	END_STRUCT;
	BeltStatus_Typ : 	STRUCT  (*Strcuture for showing the status of the belt conveyor section*)
		New_Member : USINT;
	END_STRUCT;
	BeltCtrl_Typ : 	STRUCT  (*Structure for controlling the belt conveyor section*)
		Cmd : BeltCmd_Typ; (*Giving command to the belt conveyor section*)
		Para : BeltPara_Typ; (*Giving parameters to the belt conveyor section*)
		Status : BeltStatus_Typ; (*Getting status of the belt conveyor section*)
	END_STRUCT;
END_TYPE
