function draw_UI_Player()
{


		staminabar_width = 50 * global.MaxHealth; //32
		healthbar_height = 12;

	
		staminabar_x = 1400;
		staminabar_y = 42;
	

		draw_text_ext_transformed(staminabar_x,staminabar_y-32,"HEALTH",12,302,3,3,0);
		//draw_text(staminabar_x,staminabar_y-32,"HEALTH");
		draw_sprite_stretched(sBarBorder,0,staminabar_x,staminabar_y,staminabar_width+8,healthbar_height+8);
		draw_sprite_stretched(sManaBar,0,staminabar_x + 4 ,staminabar_y+4,(global.Health/global.MaxHealth) * staminabar_width, healthbar_height);



}