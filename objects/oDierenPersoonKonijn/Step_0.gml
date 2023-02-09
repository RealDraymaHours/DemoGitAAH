/// @description
var accept_key     = mouse_check_button_released(mb_left);

if ((position_meeting(mouse_x,mouse_y,self)) && (accept_key))
{
	
	result();
	instance_destroy(antwoorden);
}