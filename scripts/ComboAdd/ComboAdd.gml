// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ComboAdd(MaxWeaponCombo, itemType) {
	var _slot = ComboSearch(MaxWeaponCombo, -1);
	if (_slot != -1)
	{
		//audio_play_sound(mGetItem,10,false);
		with (oPlayer) ComboArray[_slot] = itemType;
		return true;
		
	}
	else
	{
		
		return false;
	}
}


