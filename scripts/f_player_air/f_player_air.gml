v_spd = f_approach(v_spd, v_spd_max, argument0);

// late jump
if(on_ground_counter>0) {
  on_ground_counter--;    
  f_player_late_jump();
}

