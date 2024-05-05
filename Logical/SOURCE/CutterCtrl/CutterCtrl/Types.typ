(*Enumerations*)

TYPE
	enCutterHomeMode : 
		( (*Enumeration for cutter homing state machine*)
		HOME_IDLE, (*Idle state in manual mode*)
		HOME_STARTING, (*Starting state in manual mode*)
		HOME_EXECUTE, (*Execute state in manual mode*)
		HOME_STOPPING, (*Stopping state in manual mode*)
		HOME_STOPPED (*Stopped state in manual mode*)
		);
	enCutterManualMode : 
		( (*Enumeration for cutter manual mode state machine*)
		IDLE, (*Idle state in manual mode*)
		STARTING, (*Starting state in manual mode*)
		EXECUTE (*Execute state in manual mode*)
		);
END_TYPE
