/// @description  vertical collision

if(abs(v_spd) > 0.5){

  var _speed = v_spd;
  repeat(4+_speed*2){
    with(instance_create(other.x+random_range(-2,2),other.y,o_dust)){
      v_spd = random_range(-1,0);
      h_spd = abs(_speed)*random_range(-0.4,0.4);
    }
  }
  
  f_player_squeeze(1.1+v_spd/40, 0.9-v_spd/40);
  
  f_play_sound(snd_land)
  
}

v_spd = 0;


