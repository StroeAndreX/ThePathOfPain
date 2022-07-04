//draw_sprite_ext(sCollectable_border,-1,0,0,0.5,0.5,0,image_blend,0.3);
//draw_sprite_ext(sCollectable_Fragments,-1,18,32,1,1,0,image_blend,image_alpha);
//draw_sprite_ext(sExampleOfPlantyFont,-1,32,15,1,1,0,image_blend,image_alpha);

draw_set_font(ft_collectables);
draw_set_color(make_color_rgb(34,33,38));

draw_set_color(c_white);
//draw_text(32,75,"Debug " + string(check_betweenCollision));
draw_set_font(ft_collectables);


gpu_set_blendmode(bm_subtract)
//draw_circle_color(x ,y,800*1.1,c_black,c_white,false);
//draw_circle_color((global.camera_xview/2), (global.camera_yview/2),900 * 1.1,c_black,c_white,false);
gpu_set_blendmode(bm_normal);

/*
draw_sprite(sLightningShader,0,0,0);
