gpu_set_blendmode(bm_add); //Probably gonna working on
draw_set_alpha(0.04);
draw_circle_color(x ,y,150 * (rgCircle * 2),c_white,c_black,false);
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);
