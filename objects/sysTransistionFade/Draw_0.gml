if infade
{
	draw_sprite_ext(sScreenFade,0,oPlayerTopDown.x,oPlayerTopDown.y,1,1,0,c_white,(fade / 100));

	fade -= 4;

}
else
{
	draw_sprite_ext(sScreenFade,0,oPlayerTopDown.x,oPlayerTopDown.y,1,1,0,c_white,1-(fade / 100));
	
	fade -= 4;
}

if fade < 0
{
	instance_destroy();	
}