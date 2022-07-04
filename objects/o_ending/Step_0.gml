counter++;
o.specialwindow = 1;

if(counter > 180){

  var _mag = counter - 180;

  var _size = 32 - _mag*0.05
  if(_size <= 1) game_end();
  
  VXA_tar = o_player.x-_size;
  VXB_tar = o_player.x+_size;
  VYA_tar = o_player.y-_size;
  VYB_tar = o_player.y+_size;

  o_player.h_spd = 0;
  o_player.v_spd = 0;
  o_player.x = f_approach(o_player.x,room_width/2,abs(o_player.x-room_width/2)*0.02)
  o_player.y = f_approach(o_player.y,room_height/2,abs(o_player.y-room_height/2)*0.02)


  f_shake(1+random(_mag*0.02));
  VXA_tar += random_range(-1,1)*_mag*0.04*_size;
  VXB_tar += random_range(-1,1)*_mag*0.04*_size;
  VYA_tar += random_range(-1,1)*_mag*0.04*_size;
  VYB_tar += random_range(-1,1)*_mag*0.04*_size;

}

