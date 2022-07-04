/// @description Insert description here
// You can write your code in this editor

y -= 0.4;
x = xstart + random_range(-3,3);

if(place_meeting(x,y,oSolid))
{
	instance_destroy();
}