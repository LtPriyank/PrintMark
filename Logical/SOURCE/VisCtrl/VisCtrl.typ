(*HMI Structure for machine control*)

TYPE
	PrintCmdHMI_Typ : 	STRUCT 
		Start : USINT; (*Start command via HMI*)
		Stop : USINT; (*Start command via HMI*)
		JogPositive : USINT; (*Jog Positive command via HMI*)
		JogNegative : USINT; (*Jog Negative command via HMI*)
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
		IO : PrintIOHMI_Typ; (*Machine IO type variable*)
	END_STRUCT;
END_TYPE
