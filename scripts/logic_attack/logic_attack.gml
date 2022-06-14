// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function logic_attack()
{
	if ComboCounter != -1
		{
			switch(ComboArray[ComboCounter])
			{
				case(1):
					switch(ComboCounter)
					{
						case(0):
							hitbox = instance_create(x,y,oPDZ);	
							
								if facing == RIGHT
								{
									if onGround
									{
									    h = Approach(h, 5, groundFric);   
										h = Approach(h, 5, groundAccel);
									}
									hitbox.KnockbackDirection = 0;
								}
								else
								{
									if onGround
									{
									    h = Approach(h, -5, groundFric);   
										h = Approach(h, 5, groundAccel);
									}
									hitbox.KnockbackDirection = 180;
								}							
							hitbox.sprite_index = sPlayerBaseCombo1Hitbox;
							hitbox.image_xscale = 1 * facing;
							hitbox.Break = 1;
							hitbox.Damage = 1;
							hitbox.alarm[0] = 10;		
						break;
						case(1):
							hitbox = instance_create(x,y,oPDZ);	

								if facing == RIGHT
								{
									if onGround
									{
									    h = Approach(h, 5, groundFric);   
										h = Approach(h, 5, groundAccel);
									}
									hitbox.KnockbackDirection = 0;
								}
								else
								{
									if onGround
									{
									    h = Approach(h, -5, groundFric);   
										h = Approach(h, 5, groundAccel);
									}
									hitbox.KnockbackDirection = 180;
								}

							hitbox.sprite_index = sPlayerBaseCombo2Hitbox;
							hitbox.image_xscale = 1 * facing;
							hitbox.alarm[0] = 10;
							hitbox.Break = 1;
							hitbox.Damage = 1;
						break;
					}
				break;
			}
		}
}


function logic_attack_charge()
{
	if ComboCounter != -1
	{
		hitbox = instance_create(x,y,oPDZ);	
		hitbox.charge = true;
		
			if facing == RIGHT
			{
				if onGround
				{
					h = Approach(h, 20, groundFric);   
					h = Approach(h, 20, groundAccel);
				}
				hitbox.KnockbackDirection = 0;
			}
			else
			{
				if onGround
				{
				    h = Approach(h, -20, groundFric);   
					h = Approach(h, 20, groundAccel);
				}
				hitbox.KnockbackDirection = 180;
			}
			
		
		hitbox.sprite_index = sPlayerBaseChargedAttackHitbox;
		hitbox.image_xscale = 1 * facing;
		hitbox.KnockbackStrenght = 5;
		hitbox.Break = 3;
		hitbox.Damage = 3;
		hitbox.alarm[0] = 10;
		
	}
}