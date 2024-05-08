(*|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|*)
(*| Copyright      :- B&R Industrial Automation GmbH                         |*)
(*| Contact Person :-   kuma1p                                      		 |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| System       :-  Machine Name                                            |*)
(*| Task Name    :-  DataCtrl.st                                             |*)
(*| Auther Name  :-   kuma1p                                       			 |*)
(*| Created Date :-May 8, 2024/1:04 AM                                       |*)
(*| AS Version   :-  AS 4.12.2.93                                            |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| Description  :-  This task is for Data control                           |*)
(*|                                                                          |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| Version :-         V 0.0                      kuma1p                     |*)
(*|Changes Made :-    Mp Data recorder fb added                              |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
PROGRAM _INIT

	 
END_PROGRAM

PROGRAM _CYCLIC
	//Calling MpData FB
	iFb_PrintMpDataRecorder(MpLink := ADR(gMl_PrintDataRecorder) , Enable := TRUE ,DeviceName := ADR('Print') , SamplingTime := T#1s, RecordMode := 2);
	//Caling MpDataRegPar for recording 
	//Recording Processing time
	iFb_AvgMpDataRegPar(MpLink := ADR(gMl_PrintDataRecorder), Enable := TRUE ,PVName := ADR('gPrintMarkHMI.Para.avgPmDistance'));
	IF(gAx_CutterCam.Out.InSync = TRUE)THEN
		iFb_PrintMpDataRecorder.Record := TRUE;
	ELSE
		iFb_PrintMpDataRecorder.Record := FALSE;
	END_IF;
	
END_PROGRAM

PROGRAM _EXIT
	//Exit code
	iFb_PrintMpDataRecorder(Enable := FALSE);
	iFb_AvgMpDataRegPar(Enable := FALSE);
END_PROGRAM

