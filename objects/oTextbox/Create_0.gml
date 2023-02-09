#region Textbox parameters

depth = -9998;

Caster_id = 0;
/*
vw = oCamera.view_width;
vh = oCamera.view_height;

txWdiff = 69.1;
txHdiff = 34.7; 

textbox_width = (vw / 100) * txWdiff;//220; //288
textbox_height = (vh / 100) * txHdiff; //52; //150
*/


textbox_width = 220; 
textbox_height = 52; 

down = pointer_null;

txtb_spr = sMenu;
txtp_spr = sCharacterPortrait;
txtb_img = 0;
txtb_img_spd = 5/60; //fps of sprite / fps of game

border = 6;
line_sep = 12;
line_width = textbox_width - border*2;

#endregion


#region Text

page = 0;
page_number = 0;
text[0] = "";

text_length[0] = string_length(text[0]);
draw_char = 0;
text_spd = 1;

#endregion



#region options

option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

#endregion


#region portrait

speaker_sprite[page_number] = sPointer;
speaker_side[page_number] = 1;

#endregion
setup = false;
drawIt = false;

alarm[0] = 5;