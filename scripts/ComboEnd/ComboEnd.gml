// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ComboEnd()
{
	if oPlayer.CanCombo
	{
		for(var i = 0; i < 2; i += 1)
		{
			if (oPlayer.ComboArray[i] == -1)
			{
				return false;
			}
		}
		return true;
	}
	else
	{
		return true;	
	}
}
