// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ComboSearch(MaxWeaponCombo, itemType)
{
	for(var i = 0; i < MaxWeaponCombo; i += 1)
	{
		if (oPlayer.ComboArray[i] == itemType)
		{
			return(i);
		}
	}
	return(-1);
}
