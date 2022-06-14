if Invunerable
{
	if alarm[0] == -1{alarm[0] = 10;}
}


if (flashAlpha > 0)
{
	flashAlpha -= 0.1;	
}

if Knockback
{
	move_contact_solid(KnockbackDirection, KnockbackStrenght);
}

