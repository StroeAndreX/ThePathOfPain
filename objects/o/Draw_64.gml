
var ww = display_get_gui_width();
var hh = display_get_gui_height();

if(!surface_exists(surface_main)){

  surface_main = surface_create(room_width,room_height);
  __view_set( e__VW.SurfaceID, 0, surface_main );
  //display_set_gui_size(__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ));
	
}

//shader_set(shader_main);
shader_set(shdBktGlitch);
//}


//setting the resolution
BktGlitch_set_resolution_of_application_surface();

//passing time to the shader (making sure nothing stays static)
BktGlitch_set_time(current_time * 0.06);

//quickly setting all parameters at once using a preset
BktGlitch_config_preset(BktGlitchPreset.C);

//additional tweaking
//LineSpeed = 0.070000 < Original
//LineSpeed = 0.030000 < Changed
BktGlitch_config(lineShift, 0.060000, 1.000000, 0.100000, 0.000000, 0.300000, 1.000000, 0.200000, 0.190000, 0.590000, 0.009000, 0.060000, 0.500000, intensity, 0.000000, current_time * 0.06);

//draw_text(20,24,"" + string(oPlayer.collectables));
//drawing the application surface

draw_surface(application_surface, 0, 0);


//done using the shader


if (surface_exists(surface_main)){
  draw_set_blend_mode_ext(bm_one,bm_inv_src_alpha); // because of particles
  draw_surface_stretched(surface_main, 0, 0, ww, hh);
  draw_set_blend_mode(bm_normal);
}


shader_reset();

if(instance_exists(o_player))
{
	gpu_set_blendmode(bm_subtract)
	//draw_circle_color(camera_get_view_width(view_camera[0]/2),camera_get_view_height(view_camera[0]/2),60,c_black,c_white ,false);
	draw_circle_color(display_get_gui_width()/2,display_get_gui_height()/2,500,c_black,c_white ,false);
	//draw_circle_color(o_player.x,o_player.y,60,c_black,c_white ,false);
	//draw_circle_color(global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2),circle,c_orange,c_black,true);
	gpu_set_blendmode(bm_normal);
}

/*
draw_set_font(ft_collectables);
draw_text(32,32,"B: " + string(camera_get_view_width(view_camera[0]/2)))
//shader_reset();

//activating the shader

//if (os_device == os_macosx){
//	shader_set(shdBktGlitchMac);
//}else{
