event_inherited();

if(stage >= 3 and !spawned){
  
  spawned = 1;
  
  with(o_bat_spawner){
    instance_create(x,y,o_bat);
    instance_destroy();
  } 

}

