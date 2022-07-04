if((place_meeting(x,y,oSolid)) || (place_meeting(x,y,oSaw)))
{
	detect = true;
}
else
{
	detect = false;
}


if((detect == true))
{
	image_xscale *= -1;
	dir *= -1;
}

if(!place_meeting(x,y+1,oSolid))
{
	image_xscale *= -1;
	dir *= -1;
	x += (dir) + 6;
}

x += 2 * dir;