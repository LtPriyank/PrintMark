(*Cutter section controlling structure*)

TYPE
	CutterCmd_Typ : 	STRUCT  (*Structure for giving command to cutter section*)
		bStart : BOOL; (*Start command*)
		bStop : BOOL; (*Stop command*)
	END_STRUCT;
	CutterPara_Typ : 	STRUCT  (*Structure for giving the parameters to cutter section*)
		New_Member : USINT;
	END_STRUCT;
	CutterStatus_Typ : 	STRUCT  (*Strcuture for showing the status of the cutter section*)
		New_Member : USINT;
	END_STRUCT;
	CutterCtrl_Typ : 	STRUCT  (*Structure for controlling the cutter section*)
		Cmd : BeltCmd_Typ; (*Giving command to the cutter section*)
		Para : BeltPara_Typ; (*Giving parameters to the cutter section*)
		Status : BeltStatus_Typ; (*Getting status of the belt cutter section*)
	END_STRUCT;
END_TYPE
