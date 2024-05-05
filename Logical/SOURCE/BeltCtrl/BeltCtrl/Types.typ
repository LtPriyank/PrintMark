(*Enumerations*)

TYPE
	enBeltManualMode : 
		( (*Enumeration for manual mode movement of Belt axis*)
		IDLE, (*Idle state in manual mode*)
		STARTING, (*Starting state in manual mode*)
		EXECUTE, (*Execute state in manual mode*)
		ABORTING (*Aborting state in manual mode*)
		);
	enBeltHomeMode : 
		( (*Enumeration for homing of belt axis*)
		HOME_IDLE, (*Idle state in manual mode*)
		HOME_STARTING, (*Starting state in manual mode*)
		HOME_EXECUTE, (*Execute state in manual mode*)
		HOME_STOPPING, (*Stopping state in manual mode*)
		HOME_STOPPED (*Stopped state in manual mode*)
		);
END_TYPE
