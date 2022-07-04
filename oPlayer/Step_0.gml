#region InputVariables
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right) || gamepad_button_check(0,gp_padr) || (gamepad_axis_value(0,gp_axislh) > 0);
key_left = -(keyboard_check(ord("A")) || keyboard_check(vk_left) || gamepad_button_check(0,gp_padl) || (gamepad_axis_value(0,gp_axislh) < 0));
key_jump = keyboard_check_pressed(vk_space) || (gamepad_button_check_pressed(0,gp_face1));
key_sprint = keyboard_check(vk_shift) || gamepad_button_check(0,gp_shoulderrb);
BrainControl_Key = keyboard_check_pressed(ord("B")) || gamepad_button_check_pressed(0,gp_shoulderr) 
#endregion

#region Acceleration
//Start movement
move = key_right + key_left;
if(move > 0) hsp = spd_start;
if(move < 0) hsp = -spd_start
//Const Movement
if(move != 0)
{
	speed_timer++;
	if(speed_timer >= 8)
	{
		if(move > 0) hsp = spd_const;
		if(move < 0) hsp = -spd_const;
	}
		
}
//Sprint
if((key_sprint) && !(place_meeting(x,y+1,oSolid)))
{
	spd_const = 6;
	spd_start = 5;
	#region CreateParticles
	sprint_time++;
	if(sprint_time mod 10) instance_create_depth(x + random_range(-8,8), y + random_range(-4,4), 0, oParticles);
	#endregion
}
else if((!key_sprint) || (place_meeting(x,y+1,oSolid)))
{
	spd_start = 3;
	spd_const = 4;
	sprint_time = 0;
}
//Stop Movement

if(!key_right && !-key_left)
{
	hsp = 0;
	speed_timer = 0;
}
	
#endregion

#region Gravity
if(vsp < max_gravity) vsp += grav; 

#endregion

#region Jump
if(place_meeting(x,y+1,oSolid))
{
	jumps_timer = 0;
	max_jumps = 2;
}
else
{
	jumps_timer++;
	if((jumps_timer >= 20) && (max_jumps == 2)) 
	{
		max_jumps = 1;
	}
}
if((key_jump) && (max_jumps > 0)) 
{
	vsp = -jump;
	max_jumps--;
}

#endregion

#region H_Collision
if(place_meeting(x+hsp,y,oSolid))
{
	while(!place_meeting(x+sign(hsp),y,oSolid))
	{
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;
#endregion

#region V_Collision
if(place_meeting(x,y+vsp,oSolid))
{
	while(!place_meeting(x,y+sign(vsp),oSolid))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

#endregion

#region CheckPoint
if(place_meeting(x,y,oActive_CP))
{
	with(oCheckPoint) 
	{
		if(instance_exists(oCheckPoint)) 
		{
			instance_destroy();
		}
	}
	instance_create_depth(x,y,0,oCheckPoint);
}

#endregion

#region Death 
if(place_meeting(x,y,oDeath)) 
{
	instance_change(oDying,true);
}

if((check_betweenCollision == 1) && (check_MovePlatform == 1))
{
	instance_change(oDying,true);
}

#endregion

#region CheckCollisionBetweenTwoObjects
if(place_meeting(x,y+24,oBetweenCollision) || (place_meeting(x,y-16,oBetweenCollision))) 
{
	check_betweenCollision = 1;
} else {
	check_betweenCollision = 0;
}

if(place_meeting(x,y+10,object24) || (place_meeting(x,y-13,object24))) 
{
	check_MovePlatform = 1;
} else {
	check_MovePlatform = 0;
}

#endregion

#region Animation
if (move!=0) image_xscale = move;
if (place_meeting(x,y+1,oSolid))
{
    if (move!=0) 
    {
        sprite_index = sPlayerRun; 
        image_speed = 1;
    }
    else sprite_index = sPlayerIdle; image_speed = 0.5;
}
else
{
    if (vsp < 0) sprite_index = sPlayerJump; else sprite_index = sPlayerFall;
}

#endregion

#region Debugger
if(keyboard_check_pressed(ord("R")) || gamepad_button_check_pressed(0,gp_start))
{
	x = oCheckPoint.x;
	y = oCheckPoint.y;
}

//if(keyboard_check_pressed(ord("Q"))) instance_create_depth(x+32,y+32,0,oHead_fragment);
#endregion

#region SeparateLevels
if(global.camera_xport == 0 && global.camera_yport == 0) world[1] = 1;
if(global.camera_xport == 1024 && global.camera_yport == 0) world[1] = 2;

#endregion

#region BrainTransition
if(BrainControl_Key) 
{
	depth = -300;
	brain_control = true;
	instance_create_depth(global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2), 0, oBrain_Position);
	instance_create_depth(global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2) + 200, 0, oBrain_StartPosition);
}
if(brain_control)
{
	brain_xscale += 0.001;
	brain_yscale += 0.001;
	brain_y += 0.01;
	brain_shaking = random_range(-2,2);	
	brain_duration++;
	
	objects_alpha = clamp(objects_alpha,0,0.3);
	if(brain_duration >= 200) objects_alpha += 0.05;
}
if(brain_duration >= 240)
{
	brain_alpha -= 0.05;
	darklight -= 0.01;
}
if(brain_alpha <= 0)
{
	//sprite_delete(sBrain);
	brain_y = 0;
	brain_alpha = 1;
	darklight = 0.2;
	brain_duration = 0;
	brain_xscale = 0.6;
	brain_yscale = 0.6;
	brain_control = false;
	instance_destroy(oBrain_Position);
	instance_destroy(oBrain_StartPosition);
}


#region World1 
if(room == FeelThePain && brain_control == true)
{
	x = 6081;
	y = 771;
}


#endregion

#endregion

#region Trampoline
if(place_meeting(x,y,oTrampoline))
{
	vsp = -12;
}
if(place_meeting(x,y,oTrampoline) && (super_fall == true))
{
	max_gravity = 30;
	grav = 0.3;
	super_fall = false;
	image_angle = 0;
	vsp = random_range(-20,-16);
}

#endregion

#region StompAttack + upgrade Trampoline
if((super_fall == true) && (place_meeting(x,y+vsp, oBreak))) //BRAKE
{
	oBreak.active_particles = true;
	oCamera.superfall_shaking = true;
	oGlitchShader.superfall_shader = true;
	max_gravity = 30;
	grav = 0.3;
	super_fall = false;
	image_angle = 0;
	vsp = -5.5;
}

if((super_fall == true) && (place_meeting(x,y+vsp, oBreakFast))) //BREAKFAST
{
	oBreakFast.active_particles = true;
	oCamera.superfall_shaking = true;
	oGlitchShader.superfall_shader = true;
	max_gravity = 30;
	grav = 0.3;
	image_angle = 0;
	vsp = -5.5;
}


if(keyboard_check_pressed(ord("Y")) && (vsp != 0) || gamepad_button_check_pressed(0,gp_face4) && (vsp != 0)) //ACTIVE STUMP ATTACK
{
	max_gravity = 60;
	grav = 0.8;
	super_fall = true;
	image_angle = clamp(image_angle, 0, 180);
	image_angle = 180;
}

if(place_meeting(x, y+16, oSolid) && (super_fall == true) || place_meeting(x, y+16, oSolid) && (super_fall == true)) //STOP STUMP ATTACK                                                   
{
	oCamera.superfall_shaking = true;
	oGlitchShader.superfall_shader = true;
	max_gravity = 30;
	grav = 0.3;
	super_fall = false;
	image_angle = 0;
	repeat(random_range(4,10)) //In Hold -- Have to create dust based on the vsp 
	{
			instance_create_depth(oPlayer.x + random_range(0,100), oPlayer.y + random_range(-16,16), -99, oParticles_Dust);
			instance_create_depth(oPlayer.x + random_range(-0,-100), oPlayer.y + random_range(-16,16), -99, oParticles_Dust);
	}
}

#endregion

#region Collectables
if(place_meeting(x,y,oCollectable_fragment))
{
	collectables++;
}

#endregion

#region Dialogue System
if(gamepad_button_check_pressed(0,gp_select)) room_restart();


//Sei nel posto giusto.. è questo il posto che ti renderà felice. Resta qua.  <-- storia del gioco. 
if(place_meeting(x,y,oLimbo))
{
	if(keyboard_check_pressed(ord("P")))
	{
		scr_text("Why can't I just be happy...?",0.1, global.camera_xport + (global.camera_xview/2), 448);
	}
}

#endregion

#region Details
inc += 0.05;
Player_scale = (sin(inc)/10 + 1.10);
#endregion