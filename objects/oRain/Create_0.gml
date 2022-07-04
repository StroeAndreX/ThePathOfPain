rainSurface = surface_create(global.camera_xview,global.camera_yview);

surface_set_target(rainSurface);
alpha = 0;
alpha2 = 0;

partRain_sys = part_system_create();

//Rain Particle
partRain = part_type_create();
part_type_shape(partRain,pt_shape_line);
part_type_size(partRain,0.2,0.3,0,0);
part_type_color2(partRain,make_color_rgb(34,33,38), make_color_rgb(34,33,38));
part_type_alpha2(partRain,0.2,0.05);
part_type_gravity(partRain,0.1 * (global.controlTime - 0.4),225);
part_type_speed(partRain,0.1,0.1,0,0);
part_type_direction(partRain,250,330,0,1);
part_type_orientation(partRain,225,225,0,0,0);
part_type_life(partRain,20 * 2.5,180 * 2.5);

//Puddle Particle
partPuddle = part_type_create();
part_type_shape(partPuddle,pt_shape_circle);
part_type_size(partPuddle,0.5,0.8,.01,0);
part_type_scale(partPuddle,alpha,alpha2);
part_type_color1(partPuddle,c_silver);
part_type_alpha2(partPuddle,.4,0);
part_type_speed(partPuddle,0,0,0,0);
part_type_direction(partPuddle,0,0,0,0);
part_type_gravity(partPuddle,0,270);
part_type_life(partPuddle,0,0);

//Set Sequence
part_type_death(partRain,1,partPuddle);

//Create Emitter(!room Eyes)
partRain_emit = part_emitter_create(partRain_sys);
if(!part_emitter_stream(partRain_sys,partRain_emit,partRain,50))
{
	if(room != rEyes)
	{
		//part_emitter_region(partRain_sys,partRain_emit,global.camera_xview-1024,room_width,(global.camera_yview-576)-100, global.camera_yview-576,ps_shape_line,ps_distr_linear);
		part_emitter_region(partRain_sys,partRain_emit,global.camera_xview-1024,room_width,(global.camera_yview-576)-100, global.camera_yview-576,ps_shape_line,ps_distr_linear);
		part_emitter_stream(partRain_sys,partRain_emit,partRain,50);
		//Advance System
	} 
	else 
	{
		part_emitter_region(partRain_sys,partRain_emit,global.camera_xview-1024,room_width + 600,(global.camera_yview-576)-300, global.camera_yview-576,ps_shape_line,ps_distr_linear);
		part_emitter_stream(partRain_sys,partRain_emit,partRain,40);
	}
}
repeat (room_speed * 3 * global.controlTime) part_system_update(partRain_sys);

surface_reset_target();