if mouse_check_button_released(mb_left)
{
image_index = 0;
button_timer = room_speed / 3;
}

if image_index < 2
{
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
image_index = 0;
if point_in_rectangle(_mx, _my, x - 30, y - 30, x + 29, y + 29)
    {
    image_index = 1;
    if mouse_check_button(mb_left)
        {
        image_index = 2;
        alarm[0] = button_timer;
        		button_timer = max(button_timer - 2, 5); 
        event_user(0);
        }
    }
}


