if(instance_exists(o_player)){
  var _dir = point_direction(x,-y,o_player.x,-o_player.y);
  h_spd = 0.6*dcos(_dir) + 0.1*dcos(counter*3);
  v_spd = 0.6*dsin(_dir) + 0.15*dsin(counter*3);
  if(on_ground and v_spd >0) v_spd = 0;
  counter++;
}

