(*|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|*)
(*| Copyright      :- B&R Industrial Automation GmbH                         |*)
(*| Contact Person :-   kuma1p                                      		 |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| System       :-  Machine Name                                            |*)
(*| Task Name    :-  MainCtrl.st                                             |*)
(*| Auther Name  :-   kuma1p                                       			 |*)
(*| Created Date :-May 8, 2024/1:04 AM                                       |*)
(*| AS Version   :-  AS 4.12.2.93                                            |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| Description  :-  Main control task for Auto mode                         |*)
(*|                                                                          |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| Version :-         V 0.0                      kuma1p                     |*)
(*|Changes Made :-    Mode selection                                         |*)
(*| Version :-         V 0.1                      kuma1p                     |*)
(*|Changes Made :-    Cuts per minute logic                                  |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
PROGRAM _INIT
	//Local pointer method to access other modules
	beltConvStatus := PV_xgetadr(ADR('BeltCtrl:beltCtrl'),ADR(beltConvAddress),ADR(beltConvSize));
	cutterStatus := PV_xgetadr(ADR('CutterCtrl:cutCtrl'),ADR(cutterAddress),ADR(cutterSize));
	//Init Machine Speed
	gPrintMarkHMI.Para.machineSpeed := K_INIT_MACHINE_SPEED;
	//AlarmX names
	iString[0] := 'Estop';
	iString[1] := 'BeltTempError';
	iString[2] := 'CutterTempError';
	iString[3] := 'CuttingZone';
END_PROGRAM

PROGRAM _CYCLIC
	//For Accessing Variables of Other Modules
	pBeltConveyorCtrl ACCESS beltConvAddress;
	pCutterCtrl ACCESS cutterAddress;
	
	//Mode Selection for the machine
	IF(gPrintMarkHMI.Cmd.modeSelect = K_MANUAL)THEN
		gPrintMark.Cmd.AutoMode := FALSE;
		gPrintMark.Cmd.ManualMode := TRUE;
	ELSIF((gPrintMarkHMI.Cmd.modeSelect = K_AUTO) AND 
		(gPrintMark.Status.cuttingZone = FALSE))THEN
		gPrintMark.Cmd.AutoMode := TRUE;
		gPrintMark.Cmd.ManualMode := FALSE;
	END_IF;
	
	//Calling Auto mode action file
	IF(gPrintMark.Cmd.AutoMode = TRUE)THEN
		Automatic;
	END_IF;
	
	//Caps per minute calculation
	IF(gAx_CutterCam.Out.InSync = TRUE)THEN
		IF(cutPerMinTimer <= K_MINUTE_TIMER)THEN
			cutPerMinTimer := cutPerMinTimer + 1;
		ELSE
			gPrintMark.Para.CutsPerMinute := cutPerMinCount;
			cutPerMinTimer := 0;
		END_IF;

		R_TRIG_CPM(CLK := gAx_BeltConveyor.Out.Info.DigitalInputsStatus.Trigger2 );
	IF(R_TRIG_CPM.Q = TRUE)THEN
		cutPerMinCount := cutPerMinCount + 1;
		END_IF;
	ELSE
		gPrintMark.Para.CutsPerMinute := 0;
		cutPerMinCount := 0;
	END_IF;
	
	//This alarm is written for pick arm section
	FOR alarmIndex:= 0 TO MAX_ALARMS DO
		IF(Alarm[alarmIndex])THEN
			MpAlarmXSet(gMl_PrintAlarm,iString[alarmIndex]);
		ELSE
			MpAlarmXReset(gMl_PrintAlarm,iString[alarmIndex]);
		END_IF;	
	END_FOR;
	
	//Calling alarm file
	PrintAlarm;
	
	//Writing camcon par ID 10752
	IF(gAx_CutterCam.Out.InSync = TRUE)THEN
		IFb_MC_BR_CyclicWrite(Axis := ADR(gCutAxis), Enable := TRUE, ParID := 10752, DataAddress := ADR(simSignalActive), DataType :=ncPAR_TYP_UINT);
	END_IF
	
	

END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

