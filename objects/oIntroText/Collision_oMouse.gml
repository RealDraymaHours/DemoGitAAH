kClick = mouse_check_button_released(mb_left);		

if kClick
{
	if !instance_exists(oTextbox)
	{
		txt = instance_create_layer(x,y,"textlayer",oTextbox);
		with(txt)
		{
			create_textbox("Text1");
			
		}
	}	
}