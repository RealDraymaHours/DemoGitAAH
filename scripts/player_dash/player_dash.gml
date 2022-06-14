// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_dash()
{
	if ((CanDash) && (onGround))
	{
		dodge = instance_create(x,y,oPlayerDodge);
		if facing == RIGHT{dodge.facing = 1;} else{dodge.facing = -1;}
		instance_destroy();
	}
}
