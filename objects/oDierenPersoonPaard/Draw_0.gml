/// @description 
draw_self();

if position_meeting(mouse_x,mouse_y,self)
{
	draw_text_color(x+4,y+4,answer,c_red,c_red,c_red,c_red,1);
}
else
{
	draw_text(x+4,y+4,answer);
}