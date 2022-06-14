// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function play_parry()
{
			rnd = irandom(6);
	
		switch(rnd)
		{
			case(0):
				audio_play_sound(Parry1, 1000, false);
			break;
			case(1):
				audio_play_sound(Parry2, 1000, false);
			break;
			case(2):
				audio_play_sound(Parry3, 1000, false);
			break;
			case(3):
				audio_play_sound(Parry4, 1000, false);
			break;
			case(4):
				audio_play_sound(Parry5, 1000, false);
			break;
			case(5):
				audio_play_sound(Parry6, 1000, false);
			break;
			case(6):
				audio_play_sound(Parry7, 1000, false);
			break;
		}
}