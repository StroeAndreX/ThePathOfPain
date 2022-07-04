if(open == -1)
{
	shakingTimer = 0;
	if(image_index < 11) image_index += 2.2;
}

if(open == 1)
{
	if(image_index > 0) image_index -= 2.2;
	if(image_index == 0) 
	{
		shakingTimer++;
		if(shakingTimer <= 8) oCamera.i = random_range(-8,8);
		if(shakingTimer > 8 && shakingTimer < 11) oCamera.i = 0;
	}
}
