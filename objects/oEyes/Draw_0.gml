/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_color(c_black);
draw_sprite(sG_Eyes, -1, 0, 0);
draw_sprite(sV_Eyes, -1, room_width/2, room_height/2);
draw_sprite(sD_Eyes, -1, room_width/2, room_height/2);
draw_sprite(sS_Eyes, -1, room_width/2, room_height/2);

draw_sprite_ext(sEyes,-1,Pxx,Pyy,image_xscale,image_yscale,image_angle,image_blend,0.5);
draw_sprite_ext(sEyes,-1,Nxx,Nyy,image_xscale,image_yscale,image_angle,image_blend,0.5);

if(changeScene == true)
{
	draw_set_color(c_black);
	draw_set_alpha(alpha);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_alpha(1);
}