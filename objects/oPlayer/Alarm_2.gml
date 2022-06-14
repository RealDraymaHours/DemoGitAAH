/// @description Reset Combo
if ((!IsAttacking) && (onGround))
{
	ComboReset();
	ComboFinisher = false;
	charge = 0;
}
else
{
	alarm[2] = 30;
}
