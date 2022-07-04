event_inherited();

counter++;

if(stage == 0){

  if(instance_exists(o_player)) if(abs(o_player.x - x) < 16) stage++;

}

if(instance_exists(o_player)){
  if(stage >= 4){
  
    move_counter++;  
    x = xstart + h_range*dsin(move_counter*0.7);
  
    attack_counter++;
    if(attack_counter > attack_length[attack_stage]){
      var _new = 0;
      while(!_new){
        var _new_attack = irandom(attack_number-1);
        if(_new_attack != attack_stage){
          attack_stage = _new_attack;
          _new = 1;
        }          
      }
      attack_counter = 0;
      attack_random = random_range(-1,1);
    }
    
    switch(attack_stage){
    
      case 0:
      
        if(attack_counter <= 5){
          
          var _dir = point_direction(x,-y,o_player.x,-o_player.y)+attack_counter;
          with(instance_create(x,y,o_bullet)){
            h_spd = (1.8+other.attack_counter*0.05)*dcos(_dir);
            v_spd = (1.8+other.attack_counter*0.05)*dsin(_dir);
          }
          var _dir = point_direction(x,-y,o_player.x,-o_player.y)-attack_counter;
          with(instance_create(x,y,o_bullet)){
            h_spd = (1.8+other.attack_counter*0.05)*dcos(_dir);
            v_spd = (1.8+other.attack_counter*0.05)*dsin(_dir);
          }
        }
        
        /*if(attack_counter == 0){
          with(o_bat_spawner) instance_create(x,y,o_bat);
        }*/
      break;
      case 1:
        if((attack_counter <= 30 or f_between(attack_counter, 60, 90) or f_between(attack_counter,120,150)) and (attack_counter mod 6) == 0){
          var _dir = point_direction(x,-y,o_player.x,-o_player.y) + random_range(-6,6);
          with(instance_create(x,y,o_bullet)){
            h_spd = 2.5*dcos(_dir);
            v_spd = 2.5*dsin(_dir);
          }
        }
      break;
      case 2:
        if((attack_counter <= 120) and (attack_counter mod 8) == 0){
          var _dir = random_range(45,135)
          with(instance_create(x,y,o_bullet)){
            h_spd = 2*dcos(_dir);
            v_spd = 2*dsin(_dir);
          }
        }
      break;
      case 3:
        if(attack_counter <= 11){
          
          var _dir = 48+attack_counter*(42/5.5)+attack_random*3;
          with(instance_create(x,y,o_bullet)){
            h_spd = 1.5*dcos(_dir);
            v_spd = 1.5*dsin(_dir);
          }
        }
        
        if(f_between(attack_counter, 49, 60)){
          
          var _dir = 132-(attack_counter-49)*(42/5.5)+attack_random*3;
          with(instance_create(x,y,o_bullet)){
            h_spd = 1.5*dcos(_dir);
            v_spd = 1.5*dsin(_dir);
          }
        }
      break;
    
    }
    
  }
}

/* */
/*  */
