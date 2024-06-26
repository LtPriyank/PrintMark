(*|ｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯｯ|*)
(*| Copyright      :- B&R Industrial Automation GmbH                         |*)
(*| Contact Person :-   kuma1p                                      		 |*)
(*|覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧|*)
(*| System       :-  Machine Name                                            |*)
(*| Task Name    :-  AlarmCtrl.st                                            |*)
(*| Auther Name  :-   kuma1p                                       			 |*)
(*| Created Date :-May 8, 2024/1:04 AM                                       |*)
(*| AS Version   :-  AS 4.12.2.93                                            |*)
(*|覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧|*)
(*| Description  :-  This task is for Alarm control                          |*)
(*|                                                                          |*)
(*|覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧|*)
(*| Version :-         V 0.0                      kuma1p                     |*)
(*|Changes Made :- Alarm Fb Added                                            |*)
(*|覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧覧|*)
PROGRAM _INIT

END_PROGRAM

PROGRAM _CYCLIC
	//Declaring MpAlarmXCore FB
	iFb_PrintMpAlarmXCore(MpLink := ADR(gMl_PrintAlarm) , Enable := TRUE , ErrorReset := bAlarmXCoreReset);
	//Declaring MpAlarmUIconnect FB
	iFb_PrintMpAlarmXListUI(MpLink := ADR(gMl_PrintAlarm) , Enable := TRUE ,UIConnect := ADR(printUIConnect) );
	
END_PROGRAM

PROGRAM _EXIT
//Exit Code
	iFb_PrintMpAlarmXCore(Enable := FALSE);
END_PROGRAM

