
ACTION PrintAlarm: 
	
	//Alarms for temperature
	IF(gAx_BeltConveyor.Out.Info.CyclicRead.MotorTemperature.Value >= K_MAX_TEMP)THEN
		Alarm[1] := TRUE;
	ELSE
		Alarm[1] := FALSE;
	END_IF;
	IF(gAx_Cutter.Out.Info.CyclicRead.MotorTemperature.Value >= K_MAX_TEMP)THEN
		Alarm[2] := TRUE;
	ELSE
		Alarm[2] := FALSE;
	END_IF;
	
	//Alarm for homing in cutting zone
	IF(gPrintMark.Status.cuttingZone = TRUE)THEN
		Alarm[3] := TRUE;
	ELSE
		Alarm[3] := FALSE;
	END_IF;
	
	
	

END_ACTION
