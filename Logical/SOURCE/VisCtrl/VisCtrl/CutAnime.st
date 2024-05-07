
ACTION CutAnime: 
	
	//Logic for cutter animation
	IF(cutterAnimation >= (-(K_ANIMATION_LIMIT)))THEN
		cutterAnimation := cutterAnimation - 1;
	ELSE
		cutterAnimation := K_ZERO;
	END_IF;
	
END_ACTION
