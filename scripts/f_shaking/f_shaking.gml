timer = argument0
shaking = argument1 
duration = argument2

timer++;
if(timer <= duration)
{
	camera_set_view_angle(view_camera[0],global.camera_angle + random_range(-shaking,shaking));
}
else if(timer >= duration)
{
	timer = 0;
	camera_set_view_angle(view_camera[0],global.camera_angle);
}
