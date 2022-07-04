if(!pinland and point_distance(0,0,h_spd,v_spd)>3){
  with(other) event_user(2);
  h_spd *= -0.15;
  v_spd *= 0.15;
  v_spd -= 0.4;
  repeat(2) f_dust_custom(0,0,0,0,x_blue);
}

