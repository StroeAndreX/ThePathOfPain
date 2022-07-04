// check keyboard

f_player_prefire();

f_player_wall_init();

//// DEBUG

//if(keyboard_check_pressed(ord("T"))) f_full_transition(0,0,room,0)

if(!pause){

if(collision_rectangle(x-h_col+1, y+v_col+2, x+h_col-1, y-2, p_hazard, 1, 0)){
  f_die();
}

if(collision_rectangle(x-h_col+1, y+v_col+2, x+h_col-1, y-2, p_enemy, 1, 0)){
  f_die();
}

if(collision_rectangle(x-h_col+1, y+v_col+2, x+h_col-1, y-2, o_bullet, 1, 0)){
  f_die();
}

if(collision_rectangle(x-h_col+1, y+v_col+2, x+h_col-1, y-2, o_door, 1, 0)){
  if(o_door.locked==0){
    f_full_transition(1, 3, room+1, 0);
    f_play_sound(snd_door);
  }
}

if(collision_rectangle(x-h_col+1, y+v_col+2, x+h_col-1, y-2, o_ammo, 1, 0)){
  with(o_ammo) instance_destroy();
  f_play_sound(snd_key);
  o.ammo_max = 6;
  o.ammo = 6;
  instance_create(room_width/2,room_height/2,o_ammo_tutorial);
}

if(collision_rectangle(x-h_col+1, y+v_col+2, x+h_col-1, y-2, o_key, 1, 0)){
  with(o_key) instance_destroy();
  f_play_sound(snd_key);
}


if(keyboard_check_pressed(ord("P"))) { // BIG OL' CHEAT BUTTON

  if(instance_exists(o_boss)) with(o_boss) event_user(2);
  else if(instance_exists(o_ending)){} // do nothing
  else {
    f_full_transition(0,0,room+1,0);
    f_play_sound(snd_door);
  }
  

}


/*========================================
  1.   H O R I Z O N T A L
========================================*/

if(wait){
  h_spd = f_approach(h_spd, 0, h_acc/2);
} else if(on_ground){

/*----------------------------------------
  1.1 ground
----------------------------------------*/

  if((key_left ^^ !key_right)){ // not walking
    h_spd = f_approach(h_spd, 0, h_acc);
  } else { // walking
  
  
    // GRASS PUFFS
    
    walk_counter-=abs(h_spd);
    if(walk_counter < 0){
      walk_counter += random_range(15,25);
      f_play_sound(snd_walk);    
    }
    
    if(f_chance(0.35)){
      var _h_spd = h_spd;
      with(instance_create(other.x,other.y,o_dust)){
        h_spd = _h_spd*0.25;
        v_spd = random_range(-0.75,0.25);
      }
    }

    if (key_left){
      h_spd = f_approach(h_spd, -h_spd_aim, h_acc);
    } else if (key_right){
      h_spd = f_approach(h_spd, h_spd_aim, h_acc);
    }
  }
  
  flying = 0;
  fly = 1;

} else {

/*----------------------------------------
  1.3 wall
----------------------------------------*/

  if((key_left ^^ !key_right)){ // not moving
    h_spd = f_approach(h_spd, 0, h_acc/2)
  } else if (key_left){
    h_spd = f_approach(h_spd, -h_spd_aim, h_acc/2)
  } else if (key_right){
    h_spd = f_approach(h_spd, h_spd_aim, h_acc/2)
  }
}

/*========================================
  2.   V E R T I C A L
========================================*/

// variable jumping

var _grav_variable = grav;
if(v_spd < -0.5){
  if(!key_A and vj){
    _grav_variable = grav*3;
    //_grav_variable = clamp(grav-(v_spd+0.5)*0.4, grav, 0.75);
  }
}

if(key_down and can_d) _grav_variable *= 1.3;

if(wait){
  if(!on_ground) v_spd = f_approach(v_spd, v_spd_max, _grav_variable);
} else if(on_ground){

/*----------------------------------------
  2.1 ground
----------------------------------------*/

  on_ground_counter = 4;
  vj = 1;
  
  // jump
  if(key_A_p or prefire_jump>0){
    /*if(key_down and on_jumpthru){
      v_spd = 1;
      y++;
      prefire_jump = 0;
    } else {*/
      f_player_jump();
    //}
  }

} else if (on_wall_near != 0){

  /*----------------------------------------
    2.4 close to a wall
  ----------------------------------------*/

  if((key_A_p or prefire_jump>0) and can_wj){
  
    /*----------------------------------------
      2.4.1 jumping off
    ----------------------------------------*/
    
    f_player_wall_jump();
    
  } else if(on_wall != 0 and on_wall_counter>0 and can_ws){
  
    /*----------------------------------------
      2.4.2 sliding down
    ----------------------------------------*/
      
      if(on_ground_counter>0)
        on_ground_counter--;   
      
        slide_counter--;
        if(slide_counter <=0){
          slide_counter = irandom_range(3,5);        
          f_play_sound(snd_slide);
        }
        
    
      f_player_dust(h_col*on_wall,-random(4),-0.3,0.3,-0.3,0.3);
    
      if(v_spd > 1) v_spd = f_approach(v_spd, 1, _grav_variable);
      else if(v_spd >= 0) v_spd = f_approach(v_spd, 1, _grav_variable/2);
      else v_spd = -2; //v_spd = f_approach(v_spd, 1, _grav_variable); // normal      

      
  } else {
    // not pressing against wall
    
    f_player_air(_grav_variable);
    
  }
  
} else {

/*----------------------------------------
  2.5 air
----------------------------------------*/

  f_player_air(_grav_variable);

}

/*========================================
  3.   S H O O T I N G
========================================*/

if(mouse_check_button_pressed(mb_left) and o.ammo>0){

  o.ammo--;

  with(instance_create(x,y-8,o_pin)){
    var _dir = point_direction(x,-y,o.mousex,-o.mousey);
    h_spd = 10*dcos(_dir);
    v_spd = 10*dsin(_dir);
    angle = point_direction(0,0,h_spd,v_spd);
  }
  f_play_sound(snd_throw);

}

} // end pause check

/*========================================
  4.   O T H E R   I N F L U E N C E S
========================================*/

if(abs(image_xscale)!=1){
  image_xscale = f_approach(image_xscale, sign(image_xscale), 0.01+abs(image_xscale - sign(image_xscale))*0.1);
}

if(abs(image_yscale)!=1){
  image_yscale = f_approach(image_yscale, sign(image_yscale), 0.01+abs(image_yscale - sign(image_yscale))*0.1);
}

if(f_check_point(x,y+v_col*0.6)/* or
   f_check_point(x+h_col*0.5,y+v_col*0.75) or
   f_check_point(x-h_col*0.5,y+v_col*0.25) or
   f_check_point(x+h_col*0.5,y+v_col*0.25)*/) f_die();
   
if(h_spd > 0.1) image_xscale = abs(image_xscale);
else if(h_spd < -0.1) image_xscale = -abs(image_xscale);

if(on_ground){

  if(abs(h_spd)>0.1) {
    sprite_index = s_player_walking;
    image_speed = abs(h_spd)/10;
  }
  else sprite_index = s_player;
  
} else {

  if(on_wall!=0) sprite_index = s_player_wall;
  else{
    sprite_index = s_player_jump;
    if(v_spd < -1) image_index = 0;
    else if(v_spd < 1) image_index = 1;
    else image_index = 2; 
  }

}


/*========================================
  5.   M I S C   &   D E B U G
========================================*/

if keyboard_check_pressed(ord("R")) {
 room_restart();
}


/* */
/*  */
