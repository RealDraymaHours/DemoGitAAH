/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


switch(state)
{
	case("IDLE"):
		sprite_index = sRockthrowerIdle;
	break;
	case("THROWSTART"):
		sprite_index = sRockthrowerThrowStart;
	break;
	case("THROWEND"):
		sprite_index = sRockthrowerThrowReset;
	break;
}

if Health < 0
{
 instance_destroy();	
}