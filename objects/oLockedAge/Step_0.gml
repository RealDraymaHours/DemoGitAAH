if ((place_meeting(x,y,oPlayerTopDown)) && (!touched))
{
	touched = true;	
	if get_string("What is code?","") = "2001"
	{
		instance_destroy();	
		audio_play_sound(sndSolved,1000,false);
	}
}

if place_meeting(x,y,oPlayerTopDown)
{
	alarm[0] = 60	
}