// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_damage_special(enemy, dmg)
{
			if Break > enemy.Poise
			{
				enemy.Knockback = true;	
				enemy.KnockbackDirection = KnockbackDirection;
				enemy.KnockbackStrenght = KnockbackStrenght;
			}

			enemy.flashAlpha = 1;
			enemy.Invunerable = true;
			enemy.Health -= dmg;
	
			alarm[0] = KnockbackTime;
			CameraShake(2,4);
	
			repeat(5)
			{
				instance_create(x,y,oStrikeEffect);	
			}
	
			play_enemy_damage();
}