draw_self();
//draw_sprite_ext(sprite_index,image_index,x,y,Player_scale,Player_scale,image_angle,c_white,image_alpha);
#region Init
draw_set_color(make_color_rgb(34,33,38));
draw_set_alpha(darkness);
draw_rectangle(0,0,room_width,room_height,false);
draw_set_alpha(1);


#endregion

#region Brain Transition
//if(brain_control == true)
if(abilitySlowMo == true)
{
	draw_set_alpha(darklight);
	draw_set_color(c_black);
	draw_rectangle(0,0,global.camera_xport + (global.camera_xview),global.camera_yport + (global.camera_yview),false);
	draw_set_alpha(1);
	draw_sprite_ext(sBrain, image_index, global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2), brain_xscale, brain_yscale,image_angle,image_blend,brainAlpha); 
	draw_sprite_ext(sTheAbility, image_index, global.camera_xport + (global.camera_xview/2) + (120),global.camera_yport + (global.camera_yview/2), brain_xscale, brain_yscale,image_angle,image_blend,brainAlpha);
	draw_sprite_ext(sTheAbility, image_index, global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2) + (100), brain_xscale, brain_yscale,image_angle,image_blend,brainAlpha);
	draw_sprite_ext(sTheAbility, image_index, global.camera_xport + (global.camera_xview/2) - (120),global.camera_yport + (global.camera_yview/2) , brain_xscale, brain_yscale,image_angle,image_blend,brainAlpha);
	draw_sprite_ext(sTheAbility, image_index, global.camera_xport + (global.camera_xview/2),global.camera_yport + (global.camera_yview/2) - (100), brain_xscale, brain_yscale,image_angle,image_blend,brainAlpha);
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


#region Spam_Text
/*
if(Talk[oLimbo.idd] == true)
{
	draw_set_font(ft_lowpixel);
	draw_set_color(c_black);
	draw_set_alpha(0.7);
	draw_text_ext(oLimbo.x + random_range(-1,1),(oLimbo.y - 32) + random_range(-1,1),"Unhappiness...",3,300);
	draw_text_ext((oLimbo.x - 80) + random_range(-1,1),(oLimbo.y - 24) + random_range(-1,1),"Unhappiness...",3,300);
	draw_text_ext((oLimbo.x + 80) + random_range(-1,1),(oLimbo.y - 24) + random_range(-1,1),"Unhappiness...",3,300);
	draw_set_alpha(1);
}
*/
#endregion

#region Abilities
if(draw_NewAbilityEffect)
{
	draw_set_alpha(blackSquare_alpha);
	//draw_set_color(make_color_rgb(255,255,178));
	draw_set_color(c_black);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_color(c_white);
	draw_triangle(tmp_x,tmp_y - 300,tmp_x - widthA, lightTriangle_y,tmp_x + widthA,lightTriangle_y,false);
	draw_triangle(tmp_x,tmp_y - 300,tmp_x - widthB, lightTriangle_y,tmp_x + widthB,lightTriangle_y,false);
	//draw_rectangle(oAbilitiesScene.x - 54, 0,oAbilitiesScene.x + 54,oPlayer.y + (37 - 22),false);
	draw_set_alpha(0.05);
	//draw_rectangle(oAbilitiesScene.x - 38, 0,oAbilitiesScene.x + 38,oPlayer.y + (37 - 22),false);
	draw_set_alpha(1);
}
	//draw_set_alpha(blackSquare_alpha);
	//draw_set_color(c_white);
	//draw_triangle(tmp_x,tmp_y - 300,tmp_x - widthA, lightTriangle_y,tmp_x + widthA,lightTriangle_y,false);
	//draw_triangle(tmp_x,tmp_y - 300,tmp_x - widthB, lightTriangle_y,tmp_x + widthB,lightTriangle_y,false);
	//draw_set_alpha(1);


#endregion