key_left_previous = key_left;
key_right_previous = key_right;
key_up_previous = key_up;
key_down_previous = key_down;

key_left = 0;
key_right = 0;
key_up = 0;
key_down = 0;

if(keyboard_check(ord("A")) or keyboard_check(vk_left) or gamepad_axis_value(0,gp_axislh)<-0.3) key_left = 1;
if(keyboard_check(ord("D")) or keyboard_check(vk_right) or gamepad_axis_value(0,gp_axislh)>0.3) key_right = 1;
if(keyboard_check(vk_space) or gamepad_button_check_pressed(0,gp_face1)) key_up = 1;
if(keyboard_check(ord("S")) or keyboard_check(vk_down) or gamepad_axis_value(0,gp_axislv)>0.3) key_down = 1;

key_left_p = (key_left and !key_left_previous);
key_right_p = (key_right and !key_right_previous);
key_up_p = (key_up and !key_up_previous);
key_down_p = (key_down and !key_down_previous);

key_A = 0;
key_A_p = 0;

if(keyboard_check(vk_space) or gamepad_button_check_pressed(0,gp_face1) or key_up) key_A = 1;
if(keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0,gp_face1) or key_up_p) key_A_p = 1;

key_B = 0;
key_B_p = 0;

if(keyboard_check(ord("R")) or keyboard_check(vk_shift) or gamepad_button_check(0,gp_face3)) key_B = 1;
if(keyboard_check_pressed(ord("R")) or keyboard_check_pressed(vk_shift) or gamepad_button_check_pressed(0,gp_face3)) key_B_p = 1;
