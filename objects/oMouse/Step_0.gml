x = mouse_x;
y = mouse_y;

if instance_exists(txtman)
{
	depth = txtman.depth -1;	
}

if place_meeting(x,y,txtman)
{
	image_blend = c_red	;
}
else
{
	image_blend = c_white	;
}