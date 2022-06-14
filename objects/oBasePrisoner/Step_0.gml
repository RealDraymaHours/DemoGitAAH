/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if Invunerable
{
	state = "STAGGERED";	
	sprite_index = sBasePrisonerParried;
}

if ((state == "STAGGERED") && (Invunerable) && (state != "DEATH"))
{
	state = "IDLE";
	Parried = false;
}

if Parried
{
	state = "PARRIED";	
}

if ((Health <= 0) && (state != "DEATH"))
{
	state = "DEATH";
	image_index = 0;
}

switch(state)
{
	case("IDLE"):
	sprite_index = sBasePrisonerIdle;
		if distance_to_object(p) < 40{state = "RUN"}
	break;
	case("RUN"):
		move_towards_point(p.x,y,1);
		sprite_index = sBasePrisonerRun;
		if distance_to_object(p) < 5{state = "ATTACK" image_index = 0; hspeed = 0; vspeed = 0;}
	break;
	case("ATTACK"):
		sprite_index = sBasePrisonerSlash;
	break;
	case("PARRIED"):
		sprite_index = sBasePrisonerParried;
		hspeed = 0;
		vspeed = 0;
	break;
	case("STAGGERED"):
		sprite_index = sBasePrisonerParried;
	break;
	case("DEATH"):
		sprite_index = sBasePrisonerDeath;
		hspeed = 0;
		vspeed = 0;
	break;
}