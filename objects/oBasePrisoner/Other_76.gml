if event_data[?"event_type"] == "sprite event"
{
	switch(event_data[? "message"])
	{
		case("create_BasePrisoner_Slam_Hitbox"):
			create_enemy_hitbox_noknockback(1,sBasePrisonerSlashHitbox);
			audio_play_sound(PlayerSoulWeapon1, 1000, false);
		break;			
	}
}
