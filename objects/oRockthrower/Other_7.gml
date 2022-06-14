switch(state)
{
	case("IDLE"):
		if distance_to_object(p) > 100{state = "IDLE";}else{state = "THROWSTART";}	
	break;
	case("THROWSTART"):
		state = "THROWEND"
		if image_xscale == -1
		{
			instance_create(x-50,y-28,oRockthrowerRock);
		}
		else
		{
			instance_create(x+50,y-28,oRockthrowerRock);
		}
		
	break;
	case("THROWEND"):
	case("PARRIED"):
		state = "IDLE";
	break;
}
