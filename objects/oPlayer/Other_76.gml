

if event_data[?"event_type"] == "sprite event"
{
	switch(event_data[? "message"])
	{
		case("player_disable_parry"):
			Parry = false;
		break;			
	}
}
/*
if (event_data[? "message"] == "Player_Forward_Medium")
{
	if onGround		
	if facing == RIGHT
	{
	    h = Approach(h, 10, groundFric);   
		h = Approach(h, 10, groundAccel);
	}
	else
	{
	    h = Approach(h, -10, groundFric);   
		h = Approach(h, 10, groundAccel);
	}

}

if (event_data[? "message"] == "Player_Forward_Small")
{
	if onGround
	if facing == RIGHT
	{
	    h = Approach(h, 5, groundFric);   
		h = Approach(h, 5, groundAccel);
	}
	else
	{
	    h = Approach(h, -5, groundFric);   
		h = Approach(h, 5, groundAccel);
	}
}


if (event_data[? "message"] == "Player_Forward_Massive")
{
	if onGround
	if facing == RIGHT
	{
	    h = Approach(h, 10, groundFric);   
		h = Approach(h, 10, groundAccel);
	}
	else
	{
	    h = Approach(h, -10, groundFric);   
		h = Approach(h, 10, groundAccel);
	}
}
