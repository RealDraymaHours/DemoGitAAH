if !start
{
	start = true	
	
	if !instance_exists(oTextbox)
	{
		txt = instance_create_layer(x,y,"textlayer",oTextbox);
		with(txt)
		{
			create_textbox("ShieldTime1");
			
		}
	}	
}