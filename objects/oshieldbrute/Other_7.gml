if sprite_index = sShieldBruteBlock
{
	
}
else
{
	
}

switch(sprite_index)
{
	case(sShieldBruteBlock):
	case(sShieldBruteAttack):
		sprite_index = sShieldBruteIdle;
		Parry = false;
	break;
	case(sShieldBruteIdle):
		sprite_index = sShieldBruteBlock;
		Parry = true;
	break;
	case(sShieldBruteRipost):
		sprite_index = sShieldBruteAttack;
		Parry = false;
		state = "IDLE";
	break;
}