#region InputVariables
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right) || gamepad_button_check(0,gp_padr) || (gamepad_axis_value(0,gp_axislh) > 0);
key_left = -(keyboard_check(ord("A")) || keyboard_check(vk_left) || gamepad_button_check(0,gp_padl) || (gamepad_axis_value(0,gp_axislh) < 0));
key_jump = keyboard_check_pressed(vk_space) || (gamepad_button_check_pressed(0,gp_face1));
key_sprint = keyboard_check(vk_shift) || gamepad_button_check(0,gp_shoulderrb);
BrainControl_Key = keyboard_check_pressed(ord("B")) || gamepad_button_check_pressed(0,gp_shoulderr) 
#endregion

#region Acceleration
//Start movement
move = (key_right * cannot_controll) + (key_left * cannot_controll);
if(move > 0) hsp = spd_start * cannot_controll;
if(move < 0) hsp = -spd_start * cannot_controll;
//Const Movement
if(move != 0)
{
	speed_timer++;
	if(speed_timer >= 8)
	{
		if(move > 0) hsp = spd_const * cannot_controll;
		if(move < 0) hsp = -spd_const * cannot_controll;
	}
		
}
	//Sprint
	if((key_sprint) && !(place_meeting(x,y+1,oSolid)))
{
	spd_const = 6 * trumaSpeed;
	spd_start = 5 * trumaSpeed;
	#region CreateParticles
	sprint_time++;
	if(sprint_time mod 10) instance_create_depth(x + random_range(-8,8), y + random_range(-4,4), 0, oParticles);
	#endregion
}
else if((!key_sprint) || (place_meeting(x,y+1,oSolid)))
{
	spd_start = 3 * trumaSpeed;
	spd_const = 4 * trumaSpeed;
	sprint_time = 0;
}
//Stop Movement
if(!key_right && !-key_left)
{
	hsp = 0;
	speed_timer = 0;
}
//If Double Input
if(key_right && -key_left)
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
	vsp = -jump * cannot_controll;
	max_jumps--;
}

#endregion

#region H_Collision
if place_meeting(x+hsp,y,oSolid)
{
	sprite_index = sPlayerRun;
    yplus = 0;
    while (place_meeting(x+hsp,y-yplus,oSolid) && yplus <= abs(1*hsp)) yplus += 1;
    if place_meeting(x+hsp,y-yplus,oSolid)
    {
        while (!place_meeting(x+sign(hsp),y,oSolid)) x+=sign(hsp);
		sprite_index = sPlayerRun;
        hsp = 0;
    }
    else
    {
        y -= yplus;
		sprite_index = sPlayerRun;
    }
}

x += hsp * cannot_controll;
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
if(place_meeting(x,y,oDeath) || place_meeting(x,y,oBones)) 
{
	instance_create(x,y,oDying);
	vsp = 0;
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

if(place_meeting(x,y+10,oMovingPlatform) || (place_meeting(x,y-13,oMovingPlatform))) 
{
	check_MovePlatform = 1;
} else {
	check_MovePlatform = 0;
}

#endregion

#region Animation
if (move!=0) image_xscale = move;
if (place_meeting(x,y+7,oSolid))
{
    if (move!=0) 
    {
        sprite_index = sPlayerRun; 
    }
    else sprite_index = sPlayerIdle; //if(abilitySlowMo) image_speed = 0.2; if(abilitySlowMo) image_speed = 0.5;
}
else
{
    if (vsp < 0 && !place_meeting(x, y, oSolid)) sprite_index = sPlayerJump; 
	else sprite_index = sPlayerFall;
}

if(room == FeelThePain_Beginning)
{
	if (move!=0) image_xscale = move * 1.2; 
    else image_xscale = 1.2;
	image_yscale = 1.2;
}

#endregion

#region Debugger

//if(keyboard_check_pressed(ord("R")) || gamepad_button_check_pressed(0,gp_start))
//{
//	x = oCheckPoint.x;
//	y = oCheckPoint.y;
//}
if(kb_press(ord("Q"))) room_restart();
//if(keyboard_check_pressed(ord("Q"))) instance_create_depth(x+32,y+32,0,oHead_fragment);
if(keyboard_check_pressed(ord("u"))) with(oCamera) instance_destroy();

#region GodMode
if(kb_press(ord("P"))) 
{
	godMode = true;
}

if(godMode == true)
{
	grav = 0;
	if(kb_press(ord("L"))) 
	{
		x += 1024;
	}
	if(kb_press(ord("K"))) 
	{
		y += 576;
	}
}

#endregion

#region DeactiveEffect
/*
if(keyboard_check_pressed(vk_control))
{
	instance_deactivate_object(oGlitchShader);
	instance_deactivate_object(oLight_OnHold);
	instance_deactivate_object(oCollectable_border);
	instance_deactivate_object(oRain);
}
if(keyboard_check_pressed(vk_alt))
{
	instance_activate_object(oGlitchShader);
	instance_activate_object(oLight_OnHold);
	instance_activate_object(oCollectable_border);
	instance_activate_object(oRain);
}
*/
#endregion
#endregion

#region SeparateLevels
if(global.camera_xport == 0 && global.camera_yport == 0) world[1] = 1;
if(global.camera_xport == 1024 && global.camera_yport == 0) world[1] = 2;

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
	if(instance_exists(oCamera)) oCamera.superfall_shaking = true;
	if(instance_exists(oAlternativeCamera)) oAlternativeCamera.superfall_shaking = true;
	oGlitchShader.superfall_shader = true;
	max_gravity = 30;
	grav = 0.3;
	super_fall = false;
	image_angle = 0;
	vsp = -5.5;
}

if((super_fall == true) && (place_meeting(x+hsp,y+16, oBreakFast))) //BREAKFAST
{
	oBreakFast.active_particles = true;
	if(instance_exists(oCamera)) oCamera.superfall_shaking = true;
	if(instance_exists(oAlternativeCamera)) oAlternativeCamera.superfall_shaking = true;
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

if(place_meeting(x, y+sign(vsp + 10), oSolid) && (super_fall == true) || place_meeting(x, y-sign(vsp + 10), oSolid) && (super_fall == true)) //STOP STUMP ATTACK                                                   
{
	repeat(random_range(4,15)) //In Hold -- Have to create dust based on the vsp 
	{
			instance_create_depth(oPlayer.x + random_range(0,100), oPlayer.y + random_range(-16,16), -99, oParticles_Dust);
			instance_create_depth(oPlayer.x + random_range(-0,-100), oPlayer.y + random_range(-16,16), -99, oParticles_Dust);
	}
	if(instance_exists(oCamera)) oCamera.superfall_shaking = true;
	if(instance_exists(oAlternativeCamera)) oAlternativeCamera.superfall_shaking = true;
	oGlitchShader.superfall_shader = true;
	max_gravity = 30;
	grav = 0.3;
	super_fall = false;
	image_angle = 0;
}

#endregion

#region Collectables
if(place_meeting(x,y,oCollectable_fragment))
{
	collectables++;
}
if(place_meeting(x,y,oAnimaCrystal))
{
	animaCrystal++;
}
#endregion

#region Dialogue System
if(gamepad_button_check_pressed(0,gp_select)) room_restart();


//Sei nel posto giusto.. è questo il posto che ti renderà felice. Resta qua.  <-- storia del gioco. 
/*if(place_meeting(x,y,oLimbo))
{
	if(keyboard_check_pressed(ord("P")))
	{
		Talk[oLimbo.idd] = true;
		//scr_text("Streamingggg!!! :D ",0.1, global.camera_xport + (global.camera_xview/2), 448);
	}
}
*/

#endregion

#region Details
inc += 0.05;
Player_scale = (sin(inc)/10 + 1.10);

if(keyboard_check_pressed(ord("L"))) room_speed /= 3;
#endregion

#region Abilities

#region ActiveAbility

if((place_meeting(x,y,oAbilitiesScene)) && (gp_press(0,gp_face3)) && instance_exists(oAbilitiesScene))
{
	lightTriangle_y = inst_5C93577E.y;
	tmp_x = oAbilitiesScene.x;
	tmp_y = oAbilitiesScene.y;
	draw_NewAbilityEffect = true;
	//oAbilities_Effect.active_effect = 1;
	oAbilitiesScene.sprite_index = sBrain_destroying; 	
	x = oAbilitiesScene.x;
}

if(exec_NewAbilityEffect)
{
	//Draw -> LightEffect 
	widthA = clamp(widthA,0,53);
	widthA++;
	widthB = clamp(widthB,0,43);
	widthB++;	
	
	//Player can't move 
	cannot_controll = 0;
	grav = 0;
	
	//Player go to the sky.
	y -= goingUp;
	if(goingUp > 0) goingUp -= 0.002;
	
	//Deactivate the whole effect.
	if(goingUp <= 0)  
	{
		abilityEffect_timer++;
		if(abilityEffect_timer >= 20)
		{
			exec_NewAbilityEffect = false; 
			abilityEffect_timer = 0;
			grav = 0.3;
			cannot_controll = 1;
			room_goto_next();
		}
		drawVideo = true;
		depth = -10000000;
		if(drawVideo) 
		{
			videoXScale = clamp(videoXScale,0,1);
			videoXScale += 0.05;
			videoYScale = clamp(videoYScale,0,1);
			videoYScale += 0.05;
		}
	}
}

//Delete the drawing smoothly 
if(widthA > 1 && widthB > 1 && exec_NewAbilityEffect == false)
{
	widthA = clamp(widthA,1,53);
	widthA--;
	widthB = clamp(widthB,1,43);
	widthB--;	
	blackSquare_alpha = clamp(blackSquare_alpha,0,0.11);
	blackSquare_alpha -= 0.01;
	if(widthA == 1 && widthB == 1) draw_NewAbilityEffect = false;
}

#endregion

#region SlowMotion
//Input for Slowmotion(GB/KB)
if gp_press(0, gp_shoulderl) || kb_press(ord("F")) abilitySlowMo = true;
if gp_released(0, gp_shoulderl) || kb_released(ord("F")) 
{
	if(oPointer.image_angle = 270) 
	{
		oShockWaves.ability = true;
		grav = 0;
		vsp = 0;
	}
	abilitySlowMo = false;
}
if(oShockWaves.timer_ability >= 85) grav = 0.3;
//Active the SlowMotion
if(abilitySlowMo)
{
	instance_create_depth(global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2),-300,oBrain_Position);
	instance_create_depth(global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2), -300, oPointer)
	brainAlpha += 0.1;
	depth = -300;
	room_speed = 10;
	image_speed = 0.15;
}

//Deactivve the SlowMotion
if(!abilitySlowMo) 
{
	with(oBrain_Position) instance_destroy();
	with(oPointer) instance_destroy();
	brainAlpha = 0;
	depth = -90;
	room_speed = 60;
	image_speed = 0.5;
}

#endregion

#region ShockWaves
if(kb_press(ord("U")))
{
	oShockWaves.ability = true;
}
#endregion

#region MindControl
//Active the MindControl ability
if(gp_press(0,gp_stickr) && MindControll == false) 
{	
	MindControll = true;
	instance_create_layer(global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2),"Control",oCheckDistances);
	//Init Variable
	compareID = -1;
}

//While activated.. 
if(MindControll)
{
	// 1--> Getting from file the number of ids presented in the viewPort. 
	if(readFromFile)
	{		
		//open file
		var file;
		file = file_text_open_read(working_directory + "ids.txt");
	
		//Get the number of lines
		fileDim = FileLines();
	
		//Import IDS
		for(var i = 0; i < fileDim; i++)
		{
			IDS[i] = file_text_read_real(file);
			file_text_readln(file);
			if(i == fileDim - 1)  readFromFile = false;
		}
		
		//Close the file
		file_text_close(file);
	}
	
	// 2--> Assign one of the collected ID to a variable, which will be compared with the ID of the actual obstacle to control  
	
	//Change selectedID by increasing
	if(gp_press(0,gp_padr))
	{
		if(arrPosition < fileDim - 1)
		{
			arrPosition++;
		}
		else
		{
			arrPosition = 0;
		}
	}
	
	//Change selectedID by decreasing
	if(gp_press(0,gp_padl))
	{
		if(arrPosition > 0)
		{
			arrPosition--;
		}
		else
		{
			arrPosition = fileDim - 1;
		}
	}
	
	//Assign the comparedID
	compareID = IDS[arrPosition];
	
	
	// 3--> Destroy if the viewPort change
	if(instance_exists(oCheckDistances) && distance_to_object(oCheckDistances) > 587)
	{
		MindControll = false; //Set the ability to false
		compareID = -1;
		with(oCheckDistances) instance_destroy();
	}
}

// --> While the ability is deactivated 
if(!MindControll)
{
	//Reset Variables
	compareID = -1;
	arrPosition = 0;
	fileDim = 0;
	readFromFile = true;
		
	//Delete
	if(!MindControll && file_exists("ids.txt")) 
	{
		file_delete("ids.txt"); 
		for(var i = 0; i < 100; i++)
		{
			IDS[i] = -1;
		}
	}
}

#endregion
#endregion

#region Trauma

var BonesTraumaVertical = layer_get_id("BonesTraumaVertical");
var BonesTraumaHorizontal = layer_get_id("BonesTraumaHorizontal");
var TraumaEnemies = layer_get_id("TraumaEnemies");
var TraumaLights = layer_get_id("TraumaLights");

//// --> Controlling when the layer are going to activate or deactivate based on the trauma effect.
if(trauma) 
{	
	layer_set_visible(BonesTraumaVertical,true);
	layer_set_visible(BonesTraumaHorizontal,true);
	instance_activate_layer(TraumaEnemies);
	instance_activate_layer(TraumaLights);
}
else
{
	layer_set_visible(BonesTraumaVertical,false);
	layer_set_visible(BonesTraumaHorizontal,false);	
	instance_deactivate_layer(TraumaEnemies);
	instance_deactivate_layer(TraumaLights);
}

#endregion

auraINC++;
if(instance_exists(obj_dialogues)) cannot_controll = 0;
if(gp_press(0,gp_face2)) 
{
	if(instance_exists(obj_dialogues)) 
	{
		cannot_controll = 1;
		with(obj_dialogues) instance_destroy();
	}
}

f_RoomScreenShot("K");

if(room == FeelThePain_Beginning)
{
	depth = -800;
	image_alpha = .8;
}
if(kb_press(ord("H"))) room_goto_next();