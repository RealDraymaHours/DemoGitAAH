// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function play_player_damage(){
		rnd = irandom(1);
		switch(rnd)
		{
			case(0):
				audio_play_sound(OKA_Slash1, 1000, false);
			break;
			case(1):
				audio_play_sound(OKA_Slash3, 1000, false);
			break;
		}	
}