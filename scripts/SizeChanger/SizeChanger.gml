//image_xscale = xscale;
//image_yscale = xscale;

time_to_change++;

if(time_to_change >= 30*2) 
{
	time_to_change = 0;
	if(change == 1) change = 0;
	else if(change == 0) change = 1;
}

if(change == 1)	xscale -= argument0;
else if(change == 0) xscale += argument0;

return xscale;