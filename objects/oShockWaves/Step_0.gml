if keyboard_check(vk_anykey)
{
	if view_num > -1
    {
    var _vx = __view_get( e__VW.XView, 0 );
    var _vy = __view_get( e__VW.XView, 0 );
    var _vw = __view_get( e__VW.XView, 0 );
    var _vh = __view_get( e__VW.XView, 0 );
    var _cx = clamp(_vx + (keyboard_check(vk_right) - keyboard_check(vk_left))* 3, 0, room_width - _vw);
    var _cy = clamp(_vy + (keyboard_check(vk_down) - keyboard_check(vk_up)) * 3, 0, room_height - _vh);
    __view_set( e__VW.XView, 0, _cx );
    __view_set( e__VW.YView, 0, _cy );
    }
}

if ability //mouse_check_button_pressed(mb_left) //|| mouse_check_button(mb_right)
{
	oPlayer.cannot_controll = 0;
	timer_ability++;
	if(timer_ability mod 30 = 0)
	{
		oGlitchShader.shockwaves_shader = true;
		var _go = true;
		with (obj_DEMO_Button_Parent)
		    {
			   if image_index > 0
		        {
		        		_go = false;
		        }
		    }
			gamepad_set_vibration(0, 0.6, 0.6);
			activeShakeTimer = true;
		if _go shockwave_create(oPlayer.x, oPlayer.y, -100, view_num, ring_width, ring_max, ring_speed, ring_segments, ring_push, ring_update, ring_colour, ring_blend); 
	}
	if(timer_ability >= 90) 
	{
		oPlayer.cannot_controll = 1;  
		timer_ability = 0;
		ability = 0;
	}
}

if(activeShakeTimer) timer_shake++;
if(timer_shake <= 15 && activeShakeTimer) 
{
	oCamera.i = random_range(-3,3);
} else {
	gamepad_set_vibration(0, 0, 0);
	timer_shake = 0;
	activeShakeTimer = 0;
}


