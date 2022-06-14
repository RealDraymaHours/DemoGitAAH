/// @description Combo's
if ((IsActive) && (state != "CHARGE") && (state != "HOOK"))
{
	if ComboEnd()
	{
		if onGround
		{
			ComboReset();
		}		
		
		ComboFinisher = true;
		IsActive = false;
		state = "IDLE";
	}
	else
	{
		IsActive = false;
		state = "IDLE";
		alarm[2] = 30;
	}

}
else if state == "HOOK"
{
	ComboReset();	
}
else
{
	if state == "CHARGEATTACK"
	{
		ComboForceEnd();	
		state = "IDLE";
		IsActive = false;
		charge = 0;
		image_index = 0;
	}	
}

if ((state == "PARRY") || (state == "PARRIED") || (state == "RIPOST"))
{
	state = "IDLE";	
	active = false;
}
