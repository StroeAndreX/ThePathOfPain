/// @description Insert description here
// You can write your code in this editor
timer++
if(timer >= 140)
{
	instance_create_depth(x,y,-111,oDropOfWater);
	timer = 0;
}
