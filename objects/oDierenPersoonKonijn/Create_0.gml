/// @description 
answer = "Konijn";

result = function()
{
	instance_destroy(oTextbox);
	if !instance_exists(oTextbox)
	{
		txt = instance_create_layer(x,y,"textlayer",oTextbox);
		with(txt)
		{
			create_textbox("ShieldTimeWrong");
			
		}
	}	
}

image_xscale = 1 + ((string_length(answer))/4);
