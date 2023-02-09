var kLeft = keyboard_check(vk_shift);
var kRight = keyboard_check(vk_shift);

var accept_key     = mouse_check_button_released(mb_left);



textbox_x = camera_get_view_x(view_camera[0]);

if down
{
	textbox_y = camera_get_view_y(view_camera[0]) + 95;
}
else
{
	textbox_y = camera_get_view_y(view_camera[0]) + 4;
}

if !setup
{
	setup = true;
	
	
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop through pages
	page_number = array_length(text);
	for (var i = 0; i < page_number; i += 1)
	{
		//find how many characters
		text_length[i] = string_length(text[i]);
		
		//get offset 
		text_x_offset[i] = 68 //with portrait on right
		portrait_x_offset[i] = 4 //with portrait on right
				
		if speaker_side[i] == 1
		{
			text_x_offset[i] = 4 //with portrait on left
			portrait_x_offset[i] = 228 //with portrait on left
		}
		else if speaker_sprite[i] == sPointer
		{
			text_x_offset[i] = 30 //with portrait on left
			portrait_x_offset[i] = 0 //with portrait on left
		}
		
		//text_x_offset[i] = 16; //without portrait

		
	}
	
	
	
	
}


if drawIt
{

#region text typewriter effect

//typing
if draw_char < text_length[page]
{
	draw_char += text_spd;
	draw_char = clamp(draw_char,0,text_length[page]);
}

if ((accept_key) && (!instance_exists(antwoorden)))
{
	//check if typing is done
	if draw_char == text_length[page]
	{
		if page < page_number-1
		{
			page++;
			draw_char = 0;
		}
		else
		{
			//link text with options
			if option_number > 0
			{
				create_textbox(option_link_id[option_pos]);	
			}
			alarm[1] = 5;
		}
	}
	else
	{
		draw_char = text_length[page];
	}
}

#endregion




#region draw the textbox

//box variable
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);


#region options
if ((draw_char == text_length[page]) && (page == page_number - 1))
{
	
	if down
	{
		option_pos += kRight - kLeft;
	}
	else
	{
		option_pos += kLeft - kRight;
	}

	option_pos = clamp(option_pos,0, option_number-1);		
	var _op_space = 15;
	var _op_bord = 4;
	for(var op = 0; op < option_number; op++)
	{
		if down
		{
			var theY = _txtb_y - _op_space*option_number + _op_space*op;
		}
		else
		{
			var theY = (_txtb_y + txtb_spr_h*2) + _op_space*option_number - _op_space*op;
		}
		
		if option[op] != ""
		{
			//option box
			var _o_w = string_width(option[op]) + _op_bord*2;
			draw_sprite_ext(txtb_spr, txtb_img, _txtb_x + 10, theY, _o_w/txtb_spr_w,(_op_space-1)/txtb_spr_h,0,c_white,1);
		
			//arrow
			if option_pos == op
			{
				draw_sprite(sPointer,0,_txtb_x, theY);	
			}
		
			//option text
			if op != option_pos
			{
				draw_text_color(_txtb_x + 10 +_op_bord,theY + 2, option[op],c_white, c_white, c_white,c_white,1);
			}
			else
			{
				draw_text_color(_txtb_x + 10 +_op_bord,theY + 2, option[op],c_red, c_red, c_red,c_red,1);
			}
		}
	}
}
#endregion

#region Portrait

if speaker_sprite[page] != sPointer
{
	sprite_index = speaker_sprite[page];
	var _speaker_x = textbox_x + portrait_x_offset[page];
	if speaker_side[page] == -1{_speaker_x += sprite_width;}
	
	draw_sprite_ext(txtp_spr, txtb_img, textbox_x + portrait_x_offset[page], textbox_y, sprite_width/txtb_spr_w,sprite_height/txtb_spr_h,0,c_white,1);
	
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page],1,0,c_white,1);
	
}


#endregion

//the box
draw_sprite_ext(txtb_spr, txtb_img, _txtb_x, _txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0,c_white,1);

//text variables
var _drawtext = string_copy(text[page], 1, draw_char);
//the text
draw_text_ext_color( _txtb_x + border, _txtb_y + border, _drawtext, line_sep, line_width,c_white,c_white,c_white,c_white,1);

//draw_text_color(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, c_white,c_white,c_white,c_white,1);

#endregion

}