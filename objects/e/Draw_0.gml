draw_self();

if p.x > x
{
	image_xscale = 1;
}
else
{
	image_xscale = -1;
}

if(flashAlpha > 0)
{
	shader_set(shFlash);
	draw_sprite_ext(sprite_index, image_index,x,y,image_xscale,image_yscale,image_angle,c_red,flashAlpha);
	shader_reset();
}


