if(sprite_index == sElevatorDoor_unlock)
{
	if(image_index >= 31) 
	{
		oCamera.i = random_range(-2,2);
	}
	if(image_index >= 54) 
	{
		instance_destroy();
		oCamera.i = 0;
	}
}

