
#region MoveCameraLevelToLevel
var xTo, yTo;

if (instance_exists(oPlayer)) 
{

    xTo = ( oPlayer.x div __view_get( e__VW.WView, 0 )) * __view_get( e__VW.WView, 0 )
    yTo = ( oPlayer.y div __view_get( e__VW.HView, 0 )) * __view_get( e__VW.HView, 0 )
    
    
    var difX, difY;
    difX = (xTo - x)
    difY = (yTo - y)
    if (abs(difX) < 1) x = xTo; else x += difX/15;
    if (abs(difY) < 1) y = yTo; else y += difY/15;

}

//i = random_range(-3,3);

__view_set( e__VW.XView , 0, x + i  );
__view_set( e__VW.YView , 0, y );

#endregion

#region GetThePositionOnTheMap
global.camera_xport = camera_get_view_x(view_camera[0]);
global.camera_yport = camera_get_view_y(view_camera[0]);

#endregion

#region ShakeScript 

	#region DeathShaking
	if(death_shaking == true)
	{
		camera_set_view_angle(view_camera[0],global.camera_angle + random_range(-2,+2));
		shaking_time++;
		
		if(shaking_time >= 25)
		{
			death_shaking = false;
			shaking_time = 0;
			camera_set_view_angle(view_camera[0],global.camera_angle);
		}
	}
	#endregion
	
	#region SuperFallShaking
	if(superfall_shaking == true)
	{
		gamepad_set_vibration(0, 0.6, 0.6);
		if(shaking_time >= 6)
		{	
			gamepad_set_vibration(0, 0, 0); 
		}
		camera_set_view_angle(view_camera[0],global.camera_angle + random_range(-2,+2));
		shaking_time++;
		
		if(shaking_time >= 18)
		{	
			superfall_shaking = false;
			shaking_time = 0;
			camera_set_view_angle(view_camera[0],global.camera_angle);
		}
	}
	#endregion

#endregion


