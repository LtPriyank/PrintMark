(*RegMark controlling*)

TYPE
	RegMarkCmd_Typ : 	STRUCT  (*Structure for giving command to print mark section*)
		bStartTrigger : BOOL; (*Start Trigger RegMark*)
		bEnableRegMark : BOOL; (*Enable bit for RegMark*)
	END_STRUCT;
	RegMarkPara_Typ : 	STRUCT  (*Structure for giving the parameters to print mark section*)
		productLength : REAL; (*Product length*)
		regMarkPosition : REAL; (*Registration mark position*)
		regMarkOffset : REAL; (*Registrattion mark offset*)
		distanceToSensor : REAL; (*Distance between two sensors*)
		minWidth : REAL; (*Minimun print mark width*)
		maxWidth : REAL; (*maximum print mark width*)
		negWindow : REAL; (*Print mark negative window*)
		posWindow : REAL; (*Print mark positive window*)
		sensorDelay : DINT; (*Print mark sensor delay*)
		correctionValueLimitNeg : REAL; (*Negative correction value*)
		correctionValueLimitPos : REAL; (*Positive correction value*)
	END_STRUCT;
	RegMarkStatus_Typ : 	STRUCT  (*Strcuture for showing the status of the print mark section*)
		New_Member : USINT;
	END_STRUCT;
	RegMarkCtrl_Typ : 	STRUCT  (*Structure for controlling the cutter section*)
		Cmd : RegMarkCmd_Typ; (*Giving command to the print mark section*)
		Para : RegMarkPara_Typ; (*Giving parameters to the cutter section*)
		Status : RegMarkStatus_Typ; (*Getting status of the print mark section*)
	END_STRUCT;
END_TYPE
