/// @description Insert description here
// You can write your code in this editor
/*
if(keyboard_check_pressed(ord("L")))
{
	active_effect = 1;
}
if(keyboard_check_pressed(ord("K")))
{
	active_effect = 0;
}
camera_set_view_target(view_camera[0],oPlayer);

if(active_effect == 1)
{
	alpha = 0.2;
	oPlayer.y -= 1;
	oPlayer.grav = 0;
	oPlayer.sprite_index = sPlayerJump;
	camera_set_view_size(view_camera[0],camera_set_twidth,camera_set_theight);
} else {
	alpha = 0;
}



