
if(surface_exists(rainSurface))
{
	surface_set_target(rainSurface);

	surface_reset_target();
} 
else
{
	rainSurface = surface_create(global.camera_xview, global.camera_yview);
}

