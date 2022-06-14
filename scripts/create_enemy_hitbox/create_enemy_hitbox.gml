// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_enemy_hitbox_noknockback(Dmg, Sprite)
{
	hitbox = instance_create(x,y,eHitbox);
	
	hitbox.Damage = Dmg;
	hitbox.Knockback = false;
	hitbox.sprite_index = Sprite;
	hitbox.image_xscale = image_xscale;
	hitbox.Caster = self;
}