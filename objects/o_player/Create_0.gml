event_inherited();

/*========================================
  1.   G A M E
========================================*/

can_j = 1
can_ws = 1
can_wj = 1
can_d = 1

/*========================================
  2.   P H Y S I C S
========================================*/

h_col = 5; // horizontal bounding box
v_col = -12; // upwards vertical bounding box (downwards is 0)

h_acc = 0.25; // 0.15
v_acc = 0.25;

h_spd_aim = 2;
h_spd_max = 7.5; // 1.5

v_jump = - 3.3;
v_wjump = -2.7;
h_wjump = 2.4;
v_fjump = -2.7; // -2.65

v_spd_max = 12;

on_ground = 1; // if on the ground or in air
on_ground_counter = 0;
on_wall = 0; // -1, 0 or 1
on_wall_counter = 0;
on_wall_counter_max = 6;
on_wall_pressing = 0;
on_wall_offset = 8; // was 8

walk_counter = 0; // for audio
slide_counter = 0; // for audio

prefire_jump = 0;

on_jumpthru = 0;

on_wall_near = 0;

vj = 0; // variable jump

/*========================================
  4.   M I S C   &   C O U N T E R S
========================================*/

frame_counter = 0; // for hair and stuff?!

dust_counter = 10;


o.ammo = o.ammo_max;

/* */
/*  */
