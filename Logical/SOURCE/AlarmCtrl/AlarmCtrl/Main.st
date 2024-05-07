
PROGRAM _INIT

END_PROGRAM

PROGRAM _CYCLIC
//Declaring MpAlarmXCore FB
	MpAlarmXCore_Print(MpLink := ADR(gMl_PrintAlarm) , Enable := TRUE , ErrorReset := bAlarmXCoreReset);
END_PROGRAM

PROGRAM _EXIT
//Exit Code
	MpAlarmXCore_Print(Enable := FALSE);
END_PROGRAM

