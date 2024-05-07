
ACTION BeltAnime:

	//Logic for belt animation
	IF(beltAnimation <= K_ANIMATION_LIMIT)THEN
		beltAnimation := beltAnimation + 1;
	ELSE
		beltAnimation := K_ZERO;
	END_IF;

	
	
	

END_ACTION
