
#region Movements Variables
//Trying Acceleration
spd_start = 3;
spd_const = 4;
sprint = 1; 
speed_timer = 0;
hsp = 0;

#endregion

#region Gravity Variables

grav = 0.3;
vsp = 0;
max_gravity = 30;
super_fall = false;

#endregion

#region Jumps Variable
jump = 6.5;
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
brain_xscale = 0.6;
brain_yscale = 0.6;
brain_shaking = 5;
brain_duration = 0;
brain_alpha = 1;
brain_y = 0;
darklight = 0.2;
objects_alpha = 0;

#endregion

#region SeparateWorld
TheTruth[0] = 0; 

#endregion

#region Collectables
collectables = 0;

#endregion

#region Details
inc = 0;
Player_scale = 0;

#endregion