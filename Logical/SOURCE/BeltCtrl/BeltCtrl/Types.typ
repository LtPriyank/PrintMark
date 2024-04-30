(*Belt conveyor section controlling structure*)

TYPE
	BeltCmd_Typ : 	STRUCT  (*Structure for giving command to belt conveyor section*)
		bStart : BOOL; (*Start command*)
		bStop : BOOL; (*Stop command*)
	END_STRUCT;
	BeltPara_Typ : 	STRUCT  (*Structure for giving the parameters to belt conveyor section*)
		New_Member : USINT;
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

(*Enumerations*)

TYPE
	enBeltManualMode : 
		( (*Enumeration for manual mode movement of Belt axis*)
		IDLE, (*Idle state in manual mode*)
		STARTING, (*Starting state in manual mode*)
		EXECUTE, (*Execute state in manual mode*)
		STOPPING, (*Stopping state in manual mode*)
		STOPPED, (*Stopped state in manual mode*)
		ABORTING, (*Aborting state in manual mode*)
		ABORTED (*Aborted state in manual mode*)
		);
END_TYPE
