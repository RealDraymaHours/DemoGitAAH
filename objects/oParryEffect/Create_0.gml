depth = -90;

image_xscale = 0.5;
image_yscale = 0.5;

MoveToPlayer = false;
Gain = 0.05;

EffectColor = make_color_rgb(255,0,255);

if instance_exists(oPlayer)
{
	if oPlayer.onGround
	{
		direction = random_range(0, 180);
	}
	else
	{
		direction = random(360);
	}
}
else
{
	direction = random(360);
}

image_angle = direction;
speed = random_range(2, 4);

NewSpeed = speed;
alarm[0] = random_range(4,8);
