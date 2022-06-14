switch(state)
{
	case("ATTACK"):
		if distance_to_object(p) > 5{state = "RUN"}	
	break;
	case("DEATH"):
		instance_destroy();
	break;
	case("PARRIED"):
		state = "IDLE";
		Parried = false;
	break;
}
