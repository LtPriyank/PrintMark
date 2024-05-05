
ACTION Animation: 
	CASE enAnimation OF
		ZERO:
			gPrintMarkHMI.Para.beltAnimationString := '[{"select":"#svg1","spin":[45,0,0]}]';
			enAnimation := FORTY_FIVE;
		
			
		FORTY_FIVE:
				gPrintMarkHMI.Para.beltAnimationString := '[{"select":"#svg1","spin":[45,0,0]}]';
			enAnimation := NINETY;
		NINETY:
			gPrintMarkHMI.Para.beltAnimationString := '[{"select":"#svg1","spin":[45,0,0]}]';
		
			enAnimation := ONE_THIRTY_FIVE;
		ONE_THIRTY_FIVE:
				gPrintMarkHMI.Para.beltAnimationString  := '[{"select":"#svg1","spin":[45,0,0]}]';
		enAnimation := THREE_SIXTY;
			
		THREE_SIXTY:
				gPrintMarkHMI.Para.beltAnimationString := '[{"select":"#svg1","spin":[45,0,0]}]';
			enAnimation := ZERO;
			
	
	END_CASE;
		
	
	

	
END_ACTION
