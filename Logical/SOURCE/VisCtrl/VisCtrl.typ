(*HMI Structure for machine control*)

TYPE
	PrintCmdHMI_Typ : 	STRUCT 
		bStart : BOOL; (*Start command via HMI*)
		bStop : BOOL; (*Start command via HMI*)
		bBeltJogPositive : BOOL; (*Belt Jog Positive command via HMI*)
		bBeltJogNegative : BOOL; (*Belt Jog Negative command via HMI*)
		bCutterJogPositive : BOOL; (*Cutter Jog Positive command via HMI*)
		bCutterJogNegative : BOOL; (*Cutter Jog Negative command via HMI*)
		bBeltPowerOn : BOOL; (*Belt conveyor axis power on*)
		bCutterPowerOn : BOOL; (*Cutter axis power on*)
		bBeltHome : BOOL; (*Belt axis home command*)
		bCutterHome : BOOL; (*Cutter axis home command*)
		bBeltErrorReset : BOOL; (*Belt conveyor axis error reset command*)
		bCutterErrorReset : BOOL; (*Cutter axis error reset command*)
	END_STRUCT;
	PrintParaHMI_Typ : 	STRUCT 
		beltJogSpeed : REAL; (*Jog velocity for belt conveyor*)
		beltJogAcc : REAL; (*Jog acceleration for belt conveyor*)
		beltJogDecel : REAL; (*Jog deceleration for belt conveyor*)
		cutterJogSpeed : REAL; (*Jog velocity for cutter axis*)
		cutterJogAcc : REAL; (*Jog acceleration for cutter axis*)
		cutterJogDecel : REAL; (*Jog deceleration for cutter axis*)
	END_STRUCT;
	PrintStatusHMI_Typ : 	STRUCT  (*Structure for showing the status of the machine*)
		New_Member : USINT;
	END_STRUCT;
	PrintInHMI_Typ : 	STRUCT  (*Structure for Inputs of the machine*)
		New_Member : USINT;
	END_STRUCT;
	PrintOutHMI_Typ : 	STRUCT  (*Structure for outputs of the machine*)
		New_Member : USINT;
	END_STRUCT;
	PrintIOHMI_Typ : 	STRUCT  (*Structure for IO's of the machine*)
		Input : PrintInHMI_Typ;
		Output : PrintOutHMI_Typ;
	END_STRUCT;
	PrintCtrHMIl_Typ : 	STRUCT  (*Structure of controlling the machine operation*)
		Cmd : PrintCmdHMI_Typ; (*Machine command type variable*)
		Status : PrintStatusHMI_Typ; (*Machine status type variable*)
		Para : PrintParaHMI_Typ; (*Machine parameter type variable*)
		IO : PrintIOHMI_Typ; (*Machine IO type variable*)
	END_STRUCT;
END_TYPE
