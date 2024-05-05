(*Structure for axis control*)

TYPE
	AxisBasicIn_type : 	STRUCT  (*Axis Basic inputs structure type*)
		ErrorReset : BOOL; (*Resets function block errors*) (* *) (*#PAR#;*)
		Parameters : MpAxisBasicParType; (*Function block parameters*) (* *) (*#PAR#;*)
		Update : BOOL; (*Updates the parameters*) (* *) (*#PAR#;*)
		Power : BOOL; (*Level-sensitive command for turning an axis on/off. In the event of an error, a new rising edge is required to restart the axis*) (* *) (*#CMD#;*)
		Home : BOOL; (*Command for homing the axis*) (* *) (*#CMD#;*)
		MoveVelocity : BOOL; (*Starts a constant movement with a defined velocity*) (* *) (*#CMD#;*)
		MoveAbsolute : BOOL; (*Starts an absolute movement*) (* *) (*#CMD#;*)
		MoveAdditive : BOOL; (*Starts a relative movement*) (* *) (*#CMD#;*)
		Stop : BOOL; (*Stops the axis*) (* *) (*#CMD#;*)
		JogPositive : BOOL; (*Movement in the positive direction. Stops automatically at the software limit position*) (* *) (*#CMD#OPT#;*)
		JogNegative : BOOL; (*Movement in the negative direction. Stops automatically at the software limit position*) (* *) (*#CMD#OPT#;*)
		Autotune : BOOL; (*Starts autotuning*) (* *) (*#CMD#OPT#;*)
		Simulate : BOOL; (*Enables motor simulation*) (* *) (*#CMD#OPT#;*)
		TorqueLimit : BOOL; (*Enables torque limiting*) (* *) (*#CMD#OPT#;*)
		ReleaseBrake : BOOL; (*Locks or unlocks the holding brake (only when the axis is switched off)*) (* *) (*#CMD#OPT#;*)
	END_STRUCT;
	AxisBasicOut_type : 	STRUCT  (*Axis Basic outputs structure type*)
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block*) (* *) (*#PAR#;*)
		UpdateDone : BOOL; (*Parameter update completed*) (* *) (*#PAR#;*)
		Position : LREAL; (*Current position of the axis [units]*) (* *) (*#CYC#;*)
		Velocity : REAL; (*Current position of the axis [units/s]*) (* *) (*#CYC#;*)
		CommandBusy : BOOL; (*Function block currently executing command*) (* *) (*#CMD#OPT#;*)
		CommandAborted : BOOL; (*Function block interrupted while executing a command*) (* *) (*#CMD#OPT#;*)
		PowerOn : BOOL; (*Switches on the axis*) (* *) (*#CMD#;*)
		IsHomed : BOOL; (*Homes the axis*) (* *) (*#CMD#;*)
		InVelocity : BOOL; (*Axis running with defined velocity*) (* *) (*#CMD#;*)
		InPosition : BOOL; (*Axis reached the desired position*) (* *) (*#CMD#;*)
		MoveActive : BOOL; (*Movement active*) (* *) (*#CMD#;*)
		Stopped : BOOL; (*Axis stopped*) (* *) (*#CMD#;*)
		TuningDone : BOOL; (*Autotuning completed successfully*) (* *) (*#CMD#OPT#;*)
		Simulation : BOOL; (*Motor simulation active*) (* *) (*#CMD#OPT#;*)
		TorqueLimited : BOOL; (*Torque limiting function active*) (* *) (*#CMD#OPT#;*)
		BrakeReleased : BOOL; (*Holding brake manually released*) (* *) (*#CMD#OPT#;*)
		Info : MpAxisBasicInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_STRUCT;
	AxisBasic_type : 	STRUCT  (*Axis Basic structure type*)
		In : AxisBasicIn_type;
		Out : AxisBasicOut_type;
	END_STRUCT;
	AxisCamSeqIn_type : 	STRUCT  (*Axis cam sequencing input structure type*)
		ErrorReset : BOOL; (*Resets function block errors*) (* *) (*#PAR#;*)
		Parameters : MpAxisCamSequencerParType; (*Function block parameters*) (* *) (*#PAR#;*)
		Update : BOOL; (*Update command for the parameters*) (* *) (*#PAR#;*)
		Signal1 : BOOL; (*Sets the signal for the sequencer on a rising edge and resets the signal on a falling edge*) (* *) (*#CMD#;*)
		Signal2 : BOOL; (*Sets the signal for the sequencer on a rising edge and resets the signal on a falling edge*) (* *) (*#CMD#;*)
		Signal3 : BOOL; (*Sets the signal for the sequencer on a rising edge and resets the signal on a falling edge*) (* *) (*#CMD#OPT#;*)
		Signal4 : BOOL; (*Sets the signal for the sequencer on a rising edge and resets the signal on a falling edge*) (* *) (*#CMD#OPT#;*)
		StartSequence : BOOL; (*Starts the cam sequencer*) (* *) (*#CMD#OPT#;*)
		Continue : BOOL; (*To continue the cam sequencer if standby was active*)
		EndSequence : BOOL; (*Stops the cam sequencer*)
	END_STRUCT;
	AxisCamSeqOut_type : 	STRUCT  (*Axis cam sequencing output structure type*)
		Active : BOOL; (*Indicates whether the function block is active*) (* *) (*#PAR#;*)
		Error : BOOL; (*Indicates that the function block is in an error state or a command was not executed correctly*) (* *) (*#PAR#;*)
		StatusID : DINT; (*Status information about the function block*) (* *) (*#PAR#;*)
		UpdateDone : BOOL; (*Parameter update completed*) (* *) (*#PAR#;*)
		ActualStateIndex : USINT; (*Index of the current state. *) (* *) (*#CMD#OPT#;*)
		ActualStateCamIndex : UINT; (*Index of curve being used in the current state*) (* *) (*#CMD#OPT#;*)
		StandBy : BOOL; (*The cam sequencer can be started using the continue command*) (* *) (*#CMD#;*)
		InCompensation : BOOL; (*Axis currently performing a compensating movement*) (* *) (*#CMD#;*)
		InSync : BOOL; (*Slave synchronous with the master*) (* *) (*#CMD#OPT#;*)
		Info : MpAxisCamSequencerInfoType; (*Additional information about the component*) (* *) (*#CMD#;*)
	END_STRUCT;
	AxisCamSeq_type : 	STRUCT  (*Axis cam sequencing type*)
		In : AxisCamSeqIn_type;
		Out : AxisCamSeqOut_type;
	END_STRUCT;
END_TYPE

(*Structure for machine control*)

TYPE
	PrintCmd_Typ : 	STRUCT 
		Start : BOOL; (*Start command for the machine*)
		Stop : BOOL; (*Stop command for the machine*)
		JogPositive : BOOL; (*Jog positive command for the machine*)
		JogNegative : BOOL; (*Jog Negative command for the machine*)
		ErrorAck : BOOL; (*Error acknowledge command for the machine*)
		Estop : BOOL; (*E-Stop for the machine*)
	END_STRUCT;
	PrintPara_Typ : 	STRUCT 
		MachineSpeed : REAL; (*Machine speed parameter*)
		New_Member : USINT;
	END_STRUCT;
	PrintStatus_Typ : 	STRUCT  (*Structure for showing the status of the machine*)
		machineStatus : STRING[80]; (*For displaying status of the machine*)
		powerOnHome : BOOL; (*For checking homing*)
	END_STRUCT;
	PrintIn_Typ : 	STRUCT  (*Structure for Inputs of the machine*)
		New_Member : USINT;
	END_STRUCT;
	PrintOut_Typ : 	STRUCT  (*Structure for outputs of the machine*)
		New_Member : USINT;
	END_STRUCT;
	PrintIO_Typ : 	STRUCT  (*Structure for IO's of the machine*)
		Input : PrintIn_Typ;
		Output : PrintOut_Typ;
	END_STRUCT;
	PrintCtrl_Typ : 	STRUCT  (*Structure of controlling the machine operation*)
		Cmd : PrintCmd_Typ; (*Machine command type variable*)
		Para : PrintPara_Typ; (*Machine parameters type variable*)
		Status : PrintStatus_Typ; (*Machine status type variable*)
		IO : PrintIO_Typ; (*Machine IO type variable*)
	END_STRUCT;
END_TYPE
