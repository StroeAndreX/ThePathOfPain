draw_self();

gpu_set_blendmode(bm_add)
draw_set_alpha(0.15);
draw_circle_color(x,y + 7,20,c_white,c_black,false);
//draw_circle_color(global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2),circle,c_orange,c_black,true);
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);