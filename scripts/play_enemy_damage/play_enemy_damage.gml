// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function play_enemy_damage(){
		rnd = irandom(2);
	
		switch(rnd)
		{
			case(0):
				audio_play_sound(PlayerWeaponHit1, 1000, false);
			break;
			case(1):
				audio_play_sound(PlayerWeaponHit2, 1000, false);
			break;
			case(2):
				audio_play_sound(PlayerWeaponHit3, 1000, false);
			break;
		}
}