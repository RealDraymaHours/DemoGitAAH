function add_textbox_text(Text)
{
	text[page_number] = Text;
	
	if argument_count > 1
	{
		
	}
	else
	{
		speaker_side[page_number] = 0;
		speaker_sprite[page_number] = sPointer;
	}
	page_number++;
	
}



function add_textbox_option(Option, Link_Id)
{
	option[option_number] = Option;
	option_link_id[option_number] = Link_Id;
	
	option_number ++;
}