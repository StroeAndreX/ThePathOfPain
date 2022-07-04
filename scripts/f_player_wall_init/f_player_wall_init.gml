on_wall_pressing = 0;


if(!on_ground){
  if(on_wall != 0 and on_wall == key_right - key_left and v_spd >= 0){ // pressing against
    on_wall_pressing = 1;
    on_wall_counter = on_wall_counter_max;
  } else {
    on_wall_counter = f_approach(on_wall_counter, 0, 1);
  }
} else {
  on_wall_counter = 0;
}
