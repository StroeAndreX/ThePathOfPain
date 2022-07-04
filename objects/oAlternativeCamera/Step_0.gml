
if(superfall_shaking == true)
{
	gamepad_set_vibration(0, 0.6, 0.6);
	if(shaking_time >= 6)
	{	
		gamepad_set_vibration(0, 0, 0); 
	}
	camera_set_view_angle(view_camera[0],camera_angle + random_range(-2,+2));
	shaking_time++;
		
	if(shaking_time >= 18)
	{	
		superfall_shaking = false;
		shaking_time = 0;
		camera_set_view_angle(view_camera[0],camera_angle);
	}
}
