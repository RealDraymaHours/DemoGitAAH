// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_textbox(Dialog_id)
{
	txtbox = instance_create_layer(x,y,"Instances",oTextbox);
	with (txtbox)
	{
			pick_dialog(Dialog_id);	
	}
}

function pick_dialog(Dialog_id)
{
	switch(Dialog_id)
	{
		case("Text1"):
			add_textbox_text("ONTHOU DIT!!!\nIn welk jaar ben je geboren?");
		break;
		case("Intro"):
			add_textbox_text("Oww mijn hoofd.");
			add_textbox_text("Ik kan niks herinneren.");
			add_textbox_text("Ik weet alleen dat ik de koning van leugens moet verslaan!!!");		
		break;
		#region Timing shield
		case("ShieldTime1"):
			add_textbox_text("Blijf staan!");
			add_textbox_text("Ik ben het schild van leugens. Zolang niemand de waarheid verteld ben ik ONVERSLAANBAAR!!!");
			add_textbox_text("Antwoord mijn vragen. Als je te lang wacht dan zal ik je naar de vorige kamer sturen!!!");	
			add_textbox_option("","ShieldTime2");
		break;
		case("ShieldTime2"):
			add_textbox_text("WAT VOOR DIER PERSOON BEN JE!?");
			instance_create_layer(oPlayerTopDown.x+60,oPlayerTopDown.y,"Instances",oDierenPersoonKat);
			instance_create_layer(oPlayerTopDown.x+60,oPlayerTopDown.y+22,"Instances",oDierenPersoonHond);
			instance_create_layer(oPlayerTopDown.x+60,oPlayerTopDown.y+44,"Instances",oDierenPersoonPaard);
			instance_create_layer(oPlayerTopDown.x+60,oPlayerTopDown.y+66,"Instances",oDierenPersoonKonijn);
		break;
		case("ShieldTimeWrong"):
			add_textbox_text("HAHAHHA");
			add_textbox_text("Liegen nu zal je niet helpen!");
			add_textbox_text("Je zou iets waars moeten zeggen!");
			add_textbox_text("Je zou kunnen zeggen dat je een honden persoon bent zoals ik!");
			add_textbox_text("Want ik ben een honden persoon!");
			add_textbox_text("...\nOh nee");
			add_textbox_option("","ShieldTimeDestroy");		
		break
		case("ShieldTimeDestroy"):
			instance_destroy(oTimingGuard);
			audio_play_sound(sndSolved,1000,false);
		break;
		#endregion
	}
	
}