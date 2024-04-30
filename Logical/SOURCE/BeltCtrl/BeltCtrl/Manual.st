
ACTION Manual:
	
	CASE enBeltManualSteps OF
		
		IDLE:
			IF((gAx_BeltConveyor.Out.PowerOn = TRUE) AND (gAx_BeltConveyor.Out.Error = FALSE))THEN
				enBeltManualSteps := STARTING;
			END_IF;
		
		STARTING:
			gAx_BeltConveyor.In.Parameters.Jog.Velocity := 
			gAx_BeltConveyor.In.Parameters.Jog.Acceleration := 
			gAx_BeltConveyor.In.Parameters.Jog.Deceleration := 
			gAx_BeltConveyor.In.Parameters.Jog.UpperLimit := 
			gAx_BeltConveyor.In.Parameters.Jog.LowerLimit := 
			
		EXECUTE:
		
		STOPPING:
		
		STOPPED:
		
		ABORTED:
		
		ABORTING:
		
		
	
	END_CASE;
	

END_ACTION
