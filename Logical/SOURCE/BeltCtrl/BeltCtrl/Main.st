(*|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|*)
(*| Copyright      :- B&R Industrial Automation GmbH                         |*)
(*| Contact Person :-   kuma1p                                      		 |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| System       :-  Machine Name                                            |*)
(*| Task Name    :-  BeltCtrl.st                                             |*)
(*| Auther Name  :-   kuma1p                                       			 |*)
(*| Created Date :-May 8, 2024/1:04 AM                                       |*)
(*| AS Version   :-  AS 4.12.2.93                                            |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| Description  :-  This task is for Belt conveyor control                  |*)
(*|                                                                          |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
(*| Version :-         V 0.0                      kuma1p                     |*)
(*|Changes Made :-  Axio IO Action file and Homing                           |*)
(*| Version :-         V 0.1                      kuma1p                     |*)
(*|Changes Made :-  Manual operation action file                             |*)
(*|——————————————————————————————————————————————————————————————————————————|*)
PROGRAM _INIT
	beltCtrl.Para.homeVelocity := K_HOME_VEL_INIT;
END_PROGRAM

PROGRAM _CYCLIC
	
	//Calling Belt Axis IO mapping file
	AxisIOMap;
	
	//Calling Belt Axis Homing file
	IF(gPrintMark.Cmd.ManualMode = TRUE)THEN
		beltCtrl.Cmd.bHome := gPrintMarkHMI.Cmd.bBeltHome;
	END_IF;
	Homing;
	
	//Calling Belt Axis manual operation
	IF(gPrintMark.Cmd.ManualMode = TRUE)THEN
		beltCtrl.Para.jogSpeed := gPrintMarkHMI.Para.beltJogSpeed;
		beltCtrl.Cmd.bJogPositive := gPrintMarkHMI.Cmd.bBeltJogPositive;
		beltCtrl.Cmd.bJogNegative := gPrintMarkHMI.Cmd.bBeltJogNegative;
		Manual;
	END_IF;
	 
END_PROGRAM

PROGRAM _EXIT
	iFb_MpAxisBasic.Enable := FALSE;
	iFb_MpAxisBasic();	 
END_PROGRAM

