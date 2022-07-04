if(draw == false)
{
	// --> Storage the ID to a file

	//Open File
	var file;
	file = file_text_open_append("ids.txt");
			

	//Check if the object is in the actual viewPort
	if(distance_to_object(oCheckDistances) < 587)
	{
		if(gp_press(0,gp_stickr) && idCollected = false) //have to be changed <-
		{

			file_text_write_real(file, idd);
			file_text_writeln(file);
			idCollected = true;
		}
	}

	if(!instance_exists(oCheckDistances))
	{
		showTheConnection = false;
		idCollected = false;
	}

	//Close file
	file_text_close(file);

	// -->Check if this object is selected by the user, so it can be used
	if(oPlayer.compareID == idd) //--> If is not near it
	{
		angle += 0.5;
		//Draw the connection Line
		showTheConnection = true;
	
		//Activate Lever 
		if(gp_press(0,gp_face3))
		{
			//image_index = 1;
			if(idd == 13)
			{
				if(image_index == 0) image_index = 1;
				if(image_index == 1) image_index = 0;		
				inst_113C1DB1.open *= -1;
				inst_25E91F15.open *= -1;
			}
		}
	} 
	else if(place_meeting(x,y,oPlayer) && gp_press(0,gp_face3))
	{
		oPlayer.compareID = idd;
		//image_index = 1;
		if(idd == 13)
		{
			if(image_index == 0) image_index = 1;
			if(image_index == 1) image_index = 0;			
			inst_113C1DB1.open *= -1;
			inst_25E91F15.open *= -1;
		}
	}
	else
	{
		//Toggle the connection Line
		showTheConnection = false;
	}
}
else
{
	if(!place_meeting(x,y,oBlockMental) && nevercreated == true) instance_create_layer(x,y,"Test",oBlockMental);
	
	if(distance_to_object(oPlayer) < 128)
	{
		if(place_meeting(x,y,oBlockMental) && place_meeting(x,y,oPlayer) && gp_released(0,gp_face3))
		{
			nevercreated = false;
			unlockedBM_effect = true;
			unlockedBM_shaking = true;
			oBlockMental.alarm[0] = 5;
			alarm[0] = 20; //Shaking effect
			alarm[1] = 60; //Delete the effect
			oPlayer.compareID = idd;
		}
	
		if(unlockedBM_effect)
		{
			alpha_effect += 0.002;
			if(unlockedBM_shaking) oCamera.i = random_range(-6,6);
		
		
			size_lm = clamp(size_lm, 0, 3);
			size_lm += 0.02;

		}
	}
}