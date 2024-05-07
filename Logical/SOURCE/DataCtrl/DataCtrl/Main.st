
PROGRAM _INIT

	 
END_PROGRAM

PROGRAM _CYCLIC
	//Calling MpData FB
	MpDataRecorder_Print(MpLink := ADR(gMl_PrintDataRecorder) , Enable := TRUE ,DeviceName := ADR('Print') , SamplingTime := T#1s, RecordMode := 2);
	//Caling MpDataRegPar for recording 
	//Recording Processing time
	MpDataRegPar_Avg(MpLink := ADR(gMl_PrintDataRecorder), Enable := TRUE ,PVName := ADR('gPrintMarkHMI.Para.avgPmDistance'));
END_PROGRAM

PROGRAM _EXIT
	//Exit code
	MpDataRecorder_Print(Enable := FALSE);
	MpDataRegPar_Avg(Enable := FALSE);
END_PROGRAM

