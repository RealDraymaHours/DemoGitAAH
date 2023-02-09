#macro view view_camera[0]


/*
if oPlayer.DistanceToBoss >= (Bview_width/2.3)
{
	Multiplier -= 0.1;
}
else if ((oPlayer.DistanceToBoss <= (Bview_width/2)) && (oPlayer.DistanceToBoss >= 200))
{
	Multiplier += 0.1;
}
*/


camera_set_view_size(view, view_width, view_height);


	if instance_exists(oPlayerTopDown)
	{
		Follow = oPlayerTopDown	
	}
	else if instance_exists(oPlayerSide)
	{
		Follow = oPlayerSide	
	}
	else
	{
		Follow = oMouse;	
	}
	
	if instance_exists(Follow)
	{
		 var followX = Follow.x;
		 var followY = Follow.y;
			var _x = clamp(followX-view_width/2,0,room_width-view_width);
			var _y = clamp(followY-view_height/2,0,room_height-view_height);
			//camera_set_view_pos(view,floor(_x),floor(_y));
			camera_set_view_pos(view,_x,_y);
			camera_set_view_speed(view, -1, -1);
			camera_set_view_border(view, 32, 32);
			
			var _cur_x = camera_get_view_x(view);
			var _cur_y = camera_get_view_y(view);
			var _spd = .01;
	
			camera_set_view_pos(view,
									lerp(_cur_x,_x,_spd),
									lerp(_cur_y,_y,_spd)
									)
									
				
	}
