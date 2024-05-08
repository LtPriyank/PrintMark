(*|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|*)
(*| Copyright      :- B&R Industrial Automation GmbH                         |*)
(*| Contact Person :-   kuma1p                                      		 |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| System       :-  Machine Name                                            |*)
(*| Task Name    :-  CutterCtrl.st                                           |*)
(*| Auther Name  :-   kuma1p                                       			 |*)
(*| Created Date :-May 8, 2024/1:04 AM                                       |*)
(*| AS Version   :-  AS 4.12.2.93                                            |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| Description  :-  This task is for cutter control                         |*)
(*|                                                                          |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| Version :-         V 0.0                      kuma1p                     |*)
(*|Changes Made :-     Axis IO and Homing action file added                  |*)
(*| Version :-         V 0.1                      kuma1p                     |*)
(*|Changes Made :-     Manual operation                 					 |*)
(*| Version :-         V 0.2                      kuma1p                     |*)
(*|Changes Made :-     Cam Automate action file                 			 |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
PROGRAM _INIT
	cutCtrl.Para.homeVelocity := K_HOME_VEL_INIT;
	cutCtrl.Para.homePositiveTol := ((K_UNIT_PER_REV)/K_HALF)-(K_HOME_POS_TOL);
	cutCtrl.Para.homeNegativeTol := ((K_UNIT_PER_REV)/K_HALF)+(K_HOME_NEG_TOL);
END_PROGRAM

PROGRAM _CYCLIC
	
	//Calling Cutter Axis IO mapping file
	AxisIOMap;
	
	//Calling Cutter Axis Homing Command
	HomePos;
	
	//Homing Operation after finding homing position
	IF(gPrintMark.Cmd.ManualMode = TRUE)THEN
		cutCtrl.Cmd.bHome := gPrintMarkHMI.Cmd.bCutterHome;
	END_IF;
	
	IF(cutCtrl.Status.bHomePosFound = TRUE)THEN
		Homing;
	END_IF;
	
	//Manual command for Cutter axis
	IF(gPrintMark.Cmd.ManualMode = TRUE)THEN
		cutCtrl.Para.jogSpeed := gPrintMarkHMI.Para.cutterJogSpeed;
		cutCtrl.Cmd.bJogPositive := gPrintMarkHMI.Cmd.bCutterJogPositive;
		cutCtrl.Cmd.bJogNegative := gPrintMarkHMI.Cmd.bCutterJogNegative;
		Manual;
	END_IF;
	
	//Cam Automat
	Printcam;
	 
	//Cutter Homing offset mapping
	cutCtrl.Para.homeOffset := gPrintMarkHMI.Para.bCutterHomeOffset;
	
	//For Sensor simulation
//	IF(gAx_CutterCam.Out.InSync = TRUE)THEN
//		IFb_MC_BR_CyclicWrite(Axis := ADR(gCutAxis), Enable := TRUE, ParID := 10752, DataAddress := simSignalActive, DataType :=ncPAR_TYP_UINT);
//	END_IF;
	
	

		
	
END_PROGRAM

PROGRAM _EXIT
	iFb_MpAxisBasic.Enable := FALSE;
	iFb_MpAxisBasic();	 
	 
END_PROGRAM

