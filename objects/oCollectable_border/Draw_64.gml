draw_sprite_ext(sCollectable_border,2,0,0,image_xscale,image_yscale,0,image_blend,0.5);
draw_sprite_ext(sCollectable_Fragments,1,16,18,max_dim,max_dim,0,image_blend,0.5);

if(oPlayer.drawVideo)
{
	//draw_sprite_ext(sGifTest,image_index, global.camera_xview/2,global.camera_yview/2,oPlayer.videoXScale,oPlayer.videoYScale,image_angle,image_blend,image_alpha);
}

var c_PathShadow = make_color_rgb(34,33,38);
var c_PathLight = make_color_rgb(204,204,204);

draw_set_font(ft_collectables);
draw_set_alpha(0.65);
draw_set_color(c_PathLight);
draw_text_transformed(28, 16, "x" + string(oPlayer.collectables),max_dim ,max_dim, 0);
//draw_text_transformed(28, 16, "x" + string(fps),max_dim ,max_dim, 0);

draw_set_alpha(1);


if(oPlayer.trauma && timerFlash mod choose(1,2,3,4,5,6) == 0 && timerFlash <= 35)
{
		draw_set_color(c_black);
		//draw_set_color(choose(c_black,c_white));
		draw_rectangle(0,0,1024,576,false);
}	

if(endTrauma)
{
		draw_set_color(c_black);
		draw_rectangle(0,0,1024,576,false);
}	

