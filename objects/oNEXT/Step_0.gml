if instance_exists(oPlayerTopDown)
{
	
	if place_meeting(x,y,oPlayerTopDown)
	{
		touched = true;
	}
	
	if (touched)
	{
		if (waitForTransition)
		{
			waitForTransition = false;
			fde = instance_create_layer(oPlayerTopDown.x,oPlayerTopDown.y,"Instances",sysTransistionFade);
			fde.infade = false;
		}
		else if ((!instance_exists(sysTransistionFade)) && (!waitForTransition))
		{
			if fade
			{
				instance_create_layer(xx,yy,"Instances",sysTransistionFade);
			}		
			else
			{
				instance_destroy(sysTransistionFade);	
			}
			room_goto(next_room);
			oPlayerTopDown.x = xx;
			oPlayerTopDown.y = yy;			
			
		}
	
	}

}

