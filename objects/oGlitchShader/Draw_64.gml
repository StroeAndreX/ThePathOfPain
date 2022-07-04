//activating the shader

//if (os_device == os_macosx){
shader_set(shdBktGlitchMac);
//}else{
//shader_set(shdBktGlitch);
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
if(room != FeelThePain) BktGlitch_config(0.006667, 0.103333, 0.360000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.100000, 0.000000, 0.000000, 0.026667, 0.000000, 0.066667, 0.000000, current_time * 0.06);
if(room == FeelThePain_Beginning) BktGlitch_config(lineShift, lineShiftSpeed, 0.360000, 0.400000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.026667, 0.000000, intensity, 0.000000, current_time * 0.06);
//draw_text(20,24,"" + string(oPlayer.collectables));
//drawing the application surface

draw_surface(application_surface, 0, 0);

//done using the shader
shader_reset();
/*
gpu_set_blendmode(bm_subtract)
draw_circle_color(global.camera_xview/2 ,global.camera_yview/2,1000*1.1,c_black,c_white ,false);
//draw_circle_color(global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2),circle,c_orange,c_black,true);
gpu_set_blendmode(bm_normal);
*/

//draw_text(48,48,string(corruptedTimer) + " | " + string(whenCorruptedEffect));
