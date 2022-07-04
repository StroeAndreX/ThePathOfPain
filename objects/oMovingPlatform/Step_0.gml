// --> Draw Gears
gearLeft.image_xscale = 0.1317377;
gearLeft.image_yscale = 0.1339869;
gearRight.image_yscale = 0.1339869;
gearRight.image_xscale = 0.1317377;

var v_axis = gp_axis(0, gp_axisrv);

if(vsp_m == 0) 
{
	gearLeft.angle = 0;
	gearRight.angle = 0;
}


// --> Storage the ID to a file
var file;
file = file_text_open_append("ids.txt");
			
//Check if the object is in the actual viewPort
if(distance_to_object(oCheckDistances) < 587)
{
	if(gp_press(0,gp_stickr) && idCollected == false) //have to be changed <-
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
if(oPlayer.compareID == idd)
{
	//Draw the connection Line
	showTheConnection = true;
	
	//Active MovingPlatform... automatic functions
	if(gp_press(0,gp_face3))
	{
		if(vsp_m == 0) vsp_m = 2;
		else if(vsp_m > 0) vsp_m = 0;
		active_alone = 1;
	}

	//Using the RightAxis to control the MovingPlatform
	else if(gp_axis(0, gp_axisrv) != 0)
	{
		var vaxis = gp_axis(0, gp_axisrv);
		vsp_m =  vaxis * 2;
		active_alone =  0;
			
		if(vsp_m < 0 || vsp_m >= 0)
		{
			if(v_axis != 0)
			{
				gearLeft.angle = 2 * v_axis;
				gearRight.angle = 2 * v_axis;
			}
			else
			{
				if(vsp_m > 0)
				{
					gearLeft.angle = 2;
					gearRight.angle = 2;
				}
				if(vsp_m < 0)
				{
					gearLeft.angle = -2;
					gearRight.angle = -2;
				}
			}
		}
		// -->When the MovingPlatform collide with oStopElevator it stops
		if (place_meeting(x, y + sign(vsp_m), oStopElevator)) 
		{
			while(!place_meeting(x, y + sign(vsp_m), oStopElevator)) 
			{
				y += sign(vsp_m + 2);
			}
			vsp_m = 0;
		}
	}
	///--> End Actions 
} 
else
{
	//Toggle the connection Line
	showTheConnection = false;
}
y += vsp_m; //Moving

// -> Player Following the MovingPlatform.
if(place_meeting(x,y - (vsp_m + 2),oPlayer))
{
	oPlayer.y += vsp_m;
	if(sprite_index == sPlayerFall) sprite_index = sPlayerIdle;
}

// ->When you control the movingPlatform with axisR, when you release it the movingPlatform stop moving.
if(active_alone == 0) if(gp_axis(0, gp_axisrv) == 0) vsp_m = 0;

// ->If the MovingPlaform is moving automatically, when collide with oStopElevator it change the direction.  
if(active_alone == 1)
{
	if(place_meeting(x,y + vsp_m,oStopElevator)) vsp_m *= -1;
	if(vsp_m > 0)
		{
			gearLeft.angle = 2;
			gearRight.angle = 2;
		}
		if(vsp_m < 0)
		{
			gearLeft.angle = -2;
			gearRight.angle = -2;
		}
}


gearLeft.y = self.y + 16;
gearRight.y = self.y + 16;