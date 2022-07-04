draw_self();
//draw_sprite_ext(sprite_index,image_index,x,y,Player_scale,Player_scale,image_angle,c_white,image_alpha);

#region Brain Transition
if(brain_control == true)
{
	draw_set_alpha(darklight);
	draw_set_color(c_black);
	draw_rectangle(0,0,global.camera_xport + (global.camera_xview),global.camera_yport + (global.camera_yview),false);
	draw_set_alpha(1);
	draw_sprite_ext(sBrain, image_index, (oBrain_StartPosition.x + brain_shaking),(oBrain_StartPosition.y + brain_shaking) - brain_y, brain_xscale, brain_yscale,image_angle,image_blend,brain_alpha); 
}

#endregion

#region StompAttack Animation
if(super_fall == true) 
{
	if(vsp >= 6)
	{
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16, image_xscale, image_yscale, 180, image_blend, 0.5);
	}
	if(vsp >= 12)
	{
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16, image_xscale, image_yscale, 180, image_blend, 0.5);
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16 * 2, image_xscale, image_yscale, 180, image_blend, 0.5);
	}
	if(vsp >= 18)
	{
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16, image_xscale, image_yscale, 180, image_blend, 0.5);
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16 * 2, image_xscale, image_yscale, 180, image_blend, 0.5);
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16 * 3, image_xscale, image_yscale, 180, image_blend, 0.5);
	}
	if(vsp >= 24)
	{
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16, image_xscale, image_yscale, 180, image_blend, 0.5);
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16 * 2, image_xscale, image_yscale, 180, image_blend, 0.5);
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16 * 3, image_xscale, image_yscale, 180, image_blend, 0.5);
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16 * 4, image_xscale, image_yscale, 180, image_blend, 0.5);
	}
	else if(vsp >= 30)
	{
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16, image_xscale, image_yscale, 180, image_blend, 0.5);
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16 * 2, image_xscale, image_yscale, 180, image_blend, 0.5);
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16 * 3, image_xscale, image_yscale, 180, image_blend, 0.5);
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16 * 4, image_xscale, image_yscale, 180, image_blend, 0.5);
		draw_sprite_ext(sPlayerFall,image_index,x, y - 16 * 5, image_xscale, image_yscale, 180, image_blend, 0.5);
	}
}

#endregion

#region DrawLevels

	#region TheTruth 
		//1 
			draw_sprite(sTheTruth_G0,image_index,0,0);
			draw_sprite(sTheTruth_V0,image_index,0,0);
			draw_sprite(sTheTruth_D0,image_index,-23,52);
			draw_sprite(sTheTruth_S0,image_index,5,75);
		//2
			draw_sprite(sTheTruth_G1,image_index,1024,0);
			draw_sprite(sTheTruth_V1,image_index,1024,0);
			draw_sprite(sTheTruth_D1,image_index,1024,0);
			draw_sprite(sTheTruth_S1,image_index,1024,0);
			//draw_sprite_ext(sprite51,image_index,1524,0,image_xscale,image_yscale,image_angle,image_blend,0.5)
		//3
			draw_sprite(sTheTruth_G2,image_index,1024*2,0);
		//4
			draw_sprite(sTheTruth_G3,image_index,1024*3,0);
	#endregion

#endregion

