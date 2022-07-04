
#region Movements Variables
//Trying Acceleration
spd_start = 3;
spd_const = 4;
sprint = 1; 
speed_timer = 0;
hsp = 0;
cannot_controll = 1;   //0 = YOU CAN'T MOVE //1 = YOU CAN MOVE

#endregion

#region Gravity Variables

grav = 0.3;
vsp = 0;
max_gravity = 30;
super_fall = false;

#endregion

#region Jumps Variable
jump = 6.5;
traumaJump = 1;
max_jumps = 2;
jumps_timer = 0;

#endregion

#region GamePad 

gamepad_set_axis_deadzone(0,0.5);

#endregion

#region CreateParticlesWhileYouReSprinting
sprint_time = 0;

#endregion

#region Death
camera_angle = 0;
death_timer = 0;
death = false;

#endregion

#region CheckIfYouAreBetweenTwoObjects
check_betweenCollision = 0;
check_MovePlatform = 0;

#endregion

#region BrainTransition
brain_control = false;
brain_xscale = 1.2;
brain_yscale = 1.2;
brain_shaking = 5;
brain_duration = 0;
brainAlpha = 0;
brain_y = 0;
darklight = 0.2;
objects_alpha = 0;
teleportation = 0;

#endregion

#region SeparateWorld
TheTruth[0] = 0; 

#endregion

#region Collectables
collectables = 0;
animaCrystal = 0;

#endregion

#region Details
inc = 0;
Player_scale = 0;
tmp_x = 0;
tmp_y = 0;
darkness = 0;
//darkness = 0.15;




#endregion

#region ActiveAbility
draw_NewAbilityEffect = false;
exec_NewAbilityEffect = false;
deactivate_effect = false;
blackSquare_alpha = 0.1;
lightTriangle_y = 0; 
goingUp = 0.5;
abilityEffect_timer = 0;
widthA = 0;
widthB = 0; 
drawVideo = false;
videoXScale	= 0;
videoYScale = 0;

#region MindControl
MindControll = false;
fileDim = 0;
IDS[100] = -1;
readFromFile = true;
compareID = -1;
arrPosition = 0;


for(var i = 0; i < 100; i++)
{
	IDS[i] = -1;
}

#endregion

#endregion

#region Trauma
trauma = false;
trumaSpeed = 1;
aura = false;
auraINC = 0;
shaking = 0;

#endregion 

Talk[0] = false;

abilitySlowMo = false;

godMode = false;


//Create Event
Pxx = oLimbo;
Pyy = oLimbo + 32;
Nxx = room_width/2;
Nyy = room_height/2;

sPAngle = 0;
sNAngle = 0;
inc = 2;



