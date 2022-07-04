/// @description Insert description here
// You can write your code in this editor

if kb_press(ord("T"))
{
	angle = 1;
}

if(turns == true)
{
	if(idd == 0) spd = 0.8;
	if(idd == 1) spd = -0.8;
	image_angle += spd;
}
