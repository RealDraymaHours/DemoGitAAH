#region CONTROLS
// Declare Temp Variables /////////////////////////////////////////////////////
//var kLeft, kRight, kUp, kDown, kJump, kJumpRelease, tempAccel, tempFric;
//var  kAttack, kDash, kRageArt, kParry, kGrab, kAttackHold;
///////////////////////////////////////////////////////////////////////////////
// Input //////////////////////////////////////////////////////////////////////
kLeft        = keyboard_check(kMyLeft);
kRight       = keyboard_check(kMyRight);
kUp          = keyboard_check(kMyUp);
kDown        = keyboard_check(kMyDown);
kJump        = keyboard_check_pressed(kMyJump);
kJumpRelease = keyboard_check_released(kMyJump);
kDash		 = keyboard_check(kMyDash);
//kParry		 = keyboard_check_pressed(kMyParry);

kAttackHold = keyboard_check_pressed(kMyAttackLight);
kAttack = keyboard_check_released(kMyAttackLight);

kGrab = keyboard_check_pressed(ord("D"));

//kRageArt     = keyboard_check(kMyRageArt);
#endregion

if ((!global.Staggered) && (!IsActive))
{
#region MOVEMENT
		///////////////////////////////////////////////////////////////////////////////
		// Which form of accel/fric to apply
		if (onGround) {	
		    tempAccel = groundAccel;
		    tempFric  = groundFric;
		} else {
		    tempAccel = airAccel;
		    tempFric  = airFric;
		}

		// Stick to wall //////////////////////////////////////////////////////////////
		if ((!cRight && !cLeft) || onGround) {
		    canStick = true;
		    sticking = false;
		}   

		// Cling to wall
		if (((kRight && cLeft) || (kLeft && cRight)) && canStick && !onGround) {
		    alarm[0] = clingTime;
			ComboReset();
		    sticking = true; 
		    canStick = false;       
		}
		///////////////////////////////////////////////////////////////////////////////

		// Gravity ////////////////////////////////////////////////////////////////////
		if (!onGround) {
		    state = "JUMP";
		    if ((cLeft || cRight) && v >= 0) {
		        // Wall slide
		        v = Approach(v, maxV, gravSlide);
		    } else {
        
		        // Fall normally
		        if (v < 0)
		            v = Approach(v, maxV, gravRise);
		        else
		            v = Approach(v, maxV, gravFall);
		    }
		}
		///////////////////////////////////////////////////////////////////////////////


		// Left 
		if (kLeft && !kRight && !sticking) {
		    facing = LEFT;

		    // Apply acceleration left
		    if (h > 0)
		        h = Approach(h, 0, tempFric);   
		    h = Approach(h, -maxH, tempAccel);
        
		    if (onGround /*&& !cLeft*/)
		        state = "RUN";
		    else {
		        if (onGround)
		            state = "IDLE";
		    }
		}

		// Right 
		if (kRight && !kLeft && !sticking) {
		    facing = RIGHT;

		    // Apply acceleration right
		    if (h < 0)
		        h = Approach(h, 0, tempFric);   
		    h = Approach(h, maxH, tempAccel);
        
		    if (onGround /*&& !cRight*/)
		        state = "RUN";
		    else {
		        if (onGround)
		            state = "IDLE";
		    }
		}

		// Friction
		if (!kRight && !kLeft)
		    h = Approach(h, 0, tempFric);

		if (onGround && h == 0)
		    state = "IDLE";    
       
		// Wall jump
		if (kJump && cLeft && !onGround) {
			play_player_jump();
		    // Stretch sprite
		    xscale = 0.66;
		    yscale = 1.33;     
      
		    ComboReset();
		    // Wall jump is different when pushing off/towards the wall        
		    if (kLeft) {
		        v = -jumpHeight * 1.1;
		        h = jumpHeight * .75  * 1.2;
		    } else {
		        v = -jumpHeight * 1.1;
		        h = maxH;
		    }  
		}

		if (kJump && cRight && !onGround) {
			play_player_jump();
		    // Stretch sprite
		    xscale = 0.66;
		    yscale = 1.33;    
	
		       ComboReset();
		    // Wall jump is different when pushing off/towards the wall  
		    if (kRight) {
		        v = -jumpHeight * 1.1;
		        h = -jumpHeight * .75 * 1.2;
		    } else {
		        v = -jumpHeight * 1.1;
		        h = -maxH;
		    }  
		}
  
		// Jump
		if (kJump && onGround) {
			play_player_jump();
			ComboReset();
		    if (onGround || (!cRight && !cLeft)) {
		        // Stretch sprite 
		
		        xscale = 0.66;
		        yscale = 1.33;
        
				ComboReset();
		
		        v = -jumpHeight;
 
		    }
		} else {
		    // Variable hop
		    if (kJumpRelease) {
		        if (v < 0 && v >= -jumpHeight)
		            v *= 0.25; 
		    }
		}


		// Swap facing on walls
		if (!onGround) {
	
		    if (cLeft)
		        facing = RIGHT;
		    if (cRight)
		        facing = LEFT;
		}



		// Adjust scaling after squash + stretch

		xscale = Approach(xscale, 1, 0.05);
		yscale = Approach(yscale, 1, 0.05);

#endregion
	
//Attacking

#region GRAB
	if((kGrab) && (!instance_exists(oHook)))
	{
		IsActive = true;
		if (kDown)
			{
				state = "HOOK";
				Parry = false;
				//IsAttacking = true;
				Hook = instance_create(x,y,oHook);
				Hook.vspeed = 20;
			}
			else if ((kLeft) || (kRight))
			{
				state = "HOOK";
				Parry = false;
				//IsAttacking = true;
				Hook = instance_create(x,y,oHook);
				if facing = RIGHT{Hook.hspeed = 20;}else{Hook.hspeed = -20;}
			}
			else if (kUp)
			{
				state = "HOOK";
				Parry = false;
				//IsAttacking = true;
				Hook = instance_create(x,y,oHook);
				Hook.vspeed = -20;
			}
			else
			{

				state = "PARRY";
				Parry = true;
				Parried = false;
				image_index = 0;
			}
		}
#endregion
#region ATTACK
	if (!ComboEnd())
	{
		if ((kAttackHold) && (state != "ATTACK"))
		{
			state = "CHARGE";
			IsActive = true;				
		}	
	}
#endregion
#region DASH
		//Dashing
	if(kDash) 
	{
		player_dash();
	}
#endregion
}
else if Knockback
{
	
}
else
{
	switch(state)
	{
		case("CHARGE"):
				h = 0;
				v = 0;
				state = "CHARGE";
				IsAttacking = true;
				charge += 1;
				if charge == 35{audio_play_sound(EquipSomething, 1000, false);}
				
				if ((kAttack) && (charge >= 40))
				{
					state = "CHARGEATTACK";
					ComboAdd(3,1);	
					image_index = 0;	
					charge = 0;
					ComboCounter++;
					IsActive = true;
					
					audio_play_sound(PlayerSoulWeapon1, 1000, false);
					
					logic_attack_charge()
				}
				else if ((kAttack) || (!onGround)) 
				{				
					state = "ATTACK";
					ComboAdd(3,1);		
					image_index = 0;	
					charge = 0;
					ComboCounter++;
					IsActive = true;
					
					audio_play_sound(PlayerSoulWeapon1, 1000, false);
					
					logic_attack();
				}			
				if(kDash) 
				{
					image_index = 0;	
					charge = 0;
					ComboCounter++;
					player_dash();
				}
		break;
		case("CHARGEATTACK"):
			h = 0;
			v = 0;
		break;
		case("ATTACK"):
			h = 0;
			v = 0;
		break;
		case("DASH"):
			if ((place_meeting(x + 5,y,oParSolid)) || (place_meeting(x - 5,y,oParSolid)))
			{
				state = "IDLE"; 
				if alarm[3] == -1{alarm[3] = 1;}
				hspeed = 0;
				vspeed = 0;
			}
			if (!isDashing)
			{
				DashX = mouse_x;
				DashY = mouse_y;
				solid = true;
				Duration = 4;

						if(kUp)
							{
								DashX = x;
								DashY = y - 200;
						
							}
						else if (kDown)
							{
								DashX = x;
								DashY = y + 200;
								Duration = 600;
							}
						else if (kLeft)
							{
								DashX = x - 200;
								DashY = y;
								Duration = 10;
							}
						else if (kRight)
							{
								DashX = x + 200;
								DashY = y;
								Duration = 10;
							}
						else
							{
								if facing == RIGHT
								{
									DashX = x + 200;
									DashY = y;
									Duration = 10;
								}
								else
								{
									DashX = x - 200;
									DashY = y;
									Duration = 10;
								}
							}

				CanDash = false;
				h = 0;
				v = 0;
				isDashing = true;
				move_towards_point(DashX,DashY,8);
				alarm[3] = Duration;
			}
		break;
		case("PARRY"):
			h = 0;
			v = 0;		
			if Parried{state = "IDLE";}
		break;
		case("PARRIED"):
			h = 0;
			v = 0;
		break;
	}
}
	
	//Tacking damage
	if global.Staggered
	{
		Parry = false;
		if alarm[1] == -1{alarm[1] = 20;}
	}

	//dying
	if global.Health < 0.01
	{
		state = "DEATH";
		instance_destroy();
		speed = 0;
		h = 0;
		v = 0;
		room_restart();
	}


	if ((state != "PARRY") && (sprite_index == sParry))
	{
		state = "IDLE";
		sprite_index = sIdle;
	}
	

if (flashAlpha > 0)
{
	flashAlpha -= 0.1;	
}
	

/*
function player_dash()
{
		if CanDash
		{
			IsActive = true;
			Parry = false;
			state = "DASH";
			mask_index = sprite_index;
			if(kUp)
			{
				dir = point_direction(x,y,x,y - 20);	
			
				repeat(10)
				{
					with (instance_create(x + random_range(-8, 8), bbox_bottom, oParticle))
			           direction = 90 + random_range(-45, 45); 
				}
			}
			else if (kDown)
			{
				dir = point_direction(x,y,x,y + 20);
	
				repeat(10)
				{
					with (instance_create(x + random_range(-8, 8), bbox_bottom, oParticle))
			           direction = 90 + random_range(-45, 45); 
				}
			}
			else if (kLeft)
			{
				dir = point_direction(x,y,x - 20,y);	
				repeat(10)
				{
					with (instance_create(x + random_range(-8, 8), bbox_bottom, oParticle))
			         direction = 180 + random_range(-45, 45); 
				}
			}
			else if (kRight)
			{
				dir = point_direction(x,y,x + 20,y);	
				repeat(10)
				{
					with (instance_create(x + random_range(-8, 8), bbox_bottom, oParticle))
			        direction = 0 + random_range(-45, 45); 
				}
			}
			else
			{
				if facing == RIGHT
				{
					dir = point_direction(x,y,x + 20,y);
					repeat(10)
					{
						with (instance_create(x + random_range(-8, 8), bbox_bottom, oParticle))
						direction = 0 + random_range(-45, 45); 
					}
				}
				else
				{
					dir = point_direction(x,y,x - 20,y);
					repeat(10)
					{
						with (instance_create(x + random_range(-8, 8), bbox_bottom, oParticle))
					    direction = 180 + random_range(-45, 45); 
					}
				}
			}
		
		}	
}
*/
//Audio
audio_listener_position(x,y,0);
