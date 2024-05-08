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
		modeSelect : USINT; (*Mode selection for the machine*)
		bCutterSelect : BOOL; (*Command for disabling the cutter axis*)
		bSimSensor : BOOL; (*Command for enabling the simualed sensor*)
		bErrorReset : BOOL; (*Commad for reseting the machine*)
		bEnableBeltSimu : BOOL; (*Commad for enabling belt animation*)
		bEnableCutterSimu : BOOL; (*Command for enabling cutter animation*)
		bDualCutter : BOOL; (*Command for dual cutter*)
	END_STRUCT;
	PrintParaHMI_Typ : 	STRUCT 
		beltJogSpeed : REAL; (*Jog velocity for belt conveyor*)
		beltJogAcc : REAL; (*Jog acceleration for belt conveyor*)
		beltJogDecel : REAL; (*Jog deceleration for belt conveyor*)
		cutterJogSpeed : REAL; (*Jog velocity for cutter axis*)
		cutterJogAcc : REAL; (*Jog acceleration for cutter axis*)
		cutterJogDecel : REAL; (*Jog deceleration for cutter axis*)
		beltAnimationString : STRING[80]; (*Animation for belt conveyor*)
		machineSpeed : REAL; (*Machine speed*)
		productLength : REAL; (*Product lngth of the regmark*)
		minWidth : REAL; (*Minimum width for the regmark*)
		maxWidth : REAL; (*Maximum width for the regmark*)
		windowNeg : REAL; (*Negative window for the regmark*)
		windowPos : REAL; (*Positive window for the regmark*)
		simMinWidth : REAL; (*Minimum width for the simulated printmark*)
		simMaxWidth : REAL; (*Maximum width for the simulated printmark*)
		avgPmDistance : REAL; (*Average distance between consecutive print marks*)
		lastProdLength : REAL; (*Last Product length*)
		validPrintMarks : UDINT; (*Valid Print Marks*)
		missedPrintMarks : UINT; (*Missed Print Marks*)
		cutsPerMinute : UINT; (*Cuts per minute*)
		bCutterHomeOffset : UINT; (*Cutter homing offset*)
	END_STRUCT;
	PrintStatusHMI_Typ : 	STRUCT  (*Structure for showing the status of the machine*)
		machineStatus : STRING[80]; (*For displaying status of the machine*)
		regMarkSensorActive : UINT; (*Variable for regmarksensor active*)
		cutSensorActive : UINT; (*Variable for cut sensor active*)
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
