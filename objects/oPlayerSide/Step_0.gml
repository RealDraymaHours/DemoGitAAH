kClick = false;
global.NoGhost = false;

kClick = mouse_check_button(mb_left);		

var spd = 2;



if kClick
{
	
	
	
	
	if (oMouse.x < x)
	{
		sprite_index = sPlayerWalk;
		image_xscale = -1;
	}
	else
	{
		sprite_index = sPlayerWalk;	
		image_xscale = 1;
	}
	
	

	var dir=point_direction(x,y,mouse_x,mouse_y);
	if !place_meeting(x+lengthdir_x(spd,dir),y+lengthdir_y(spd,dir),oParSolid)
	{
	    x+=lengthdir_x(spd,dir)
	    y+=lengthdir_y(spd,dir)
	}
	else
	{
	    while(!place_meeting(x+lengthdir_x(1,dir),y+lengthdir_y(1,dir),oParSolid))
	    {
	        x+=lengthdir_x(1,dir)
	        y+=lengthdir_y(1,dir)
	    }
	}



	//move_towards_point(oMouse.x,oMouse.y,0.7);		
	//mp_potential_step_object(oMouse.x,oMouse.y,0.7,oParSolid);
	//mp_potential_step(oMouse.x,oMouse.y,spd,false);

}
else
{
	sprite_index = sPlayerIdle;
	image_speed = 1;
	speed = 0;
	vspeed = 0;
	hspeed = 0;
}