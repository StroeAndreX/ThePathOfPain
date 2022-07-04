if(gamepad_axis_value(0, gp_axisrv) < 0) 
{
	image_angle = 270;
	y = oBrain_Position.y - 54;
	x = oBrain_Position.x;
}

if(gamepad_axis_value(0, gp_axisrv) > 0) 
{
	image_angle = 90;
	y = oBrain_Position.y + 54;
	x = oBrain_Position.x;
}

if(gamepad_axis_value(0, gp_axisrh) > 0) 
{
	image_angle = 180;
	y = oBrain_Position.y;
	x = oBrain_Position.x + 54;
}

if(gamepad_axis_value(0, gp_axisrh) < 0) 
{
	image_angle = 0;
	y = oBrain_Position.y;
	x = oBrain_Position.x - 54;
}