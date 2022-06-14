if((MoveToPlayer) && (instance_exists(p)))
{
	NewSpeed += 0.1;
	speed = random_range(1,3);
	move_towards_point(p.x, p.y, NewSpeed);
}

image_angle = direction;
