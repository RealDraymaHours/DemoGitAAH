direction = random(360); //this points the particle in a random direction.
speed = random_range(2,4); //this is how fast the particles will move
alarm[0] = random_range(10,20); //this will determine how long a particle exists before destroying it
motion_set(direction,speed); //this tells the particle to start moving

