if(stage >= 4){
  SPECIALROOM = 1;
  hp--;
  if(hp==0){
  
    // start the endgame...
    instance_destroy()
    f_shake(200);
    with(o_bullet) instance_destroy();
    with(o_bat) instance_destroy();
    with(o_spikes_auto) instance_destroy();
    with(o_block) instance_destroy();
    with(o_jumpthru) instance_destroy();
    o.ammo_max = 0;
    f_pin_remove();
    instance_create(0,0,o_ending);
  
  
  } else {
  
    with(o_bat_spawner) instance_create(x,y,o_bat);
    
    h_range -= 32;
    f_shake(6);
    repeat(10) f_dust_custom(random_range(-4,4),random_range(-8,0),2,2,x_red);
    move_counter = random(360);
    x = xstart + h_range*dsin(move_counter*0.7);
    repeat(10) f_dust_custom(random_range(-4,4),random_range(-8,0),2,2,x_white);
    
    xa += 48;
    xb -= 48;
  
  }

}

