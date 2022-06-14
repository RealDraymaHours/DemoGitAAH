// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_damage(enemy, dmg)
{
		if ((enemy.Parry) && (!other.charge))
		{
			oPlayer.alarm[9] = 2;
			instance_destroy(other);
			
			enemy.state = "RIPOST";
			enemy.image_index = 0;
		}
		else
		{
			if other.Break > enemy.Poise
			{
				enemy.Knockback = true;	
				enemy.KnockbackDirection = other.KnockbackDirection;
				enemy.KnockbackStrenght = other.KnockbackStrenght;
			}

			enemy.flashAlpha = 1;
			enemy.Invunerable = true;
			enemy.Health -= dmg;
	
			alarm[0] = other.KnockbackTime;
			CameraShake(2,4);
	
			repeat(5)
			{
				instance_create(x,y,oStrikeEffect);	
			}
	
			play_enemy_damage();
		}
}