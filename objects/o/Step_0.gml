if(keyboard_check(vk_alt) and keyboard_check(vk_f4)) game_end();

////// PAUSE
////// PAUSE
////// PAUSE

if(keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(0,gp_start)){
  game_end();
}

if(key_B and instance_exists(o_pin)){

  if(key_left or key_right or key_up or key_down or key_A) retrieve_counter = 0;
  else {
  
    retrieve_counter++;
    f_shake(1+retrieve_counter/30);
    
    if(retrieve_counter >= 75){
    
      retrieve_counter = 0;
      f_play_sound(snd_R);
      f_pin_remove();
    
    }
  }
  
} else {
  retrieve_counter = 0;
}

if(wait>0) wait--;

if(pause){



}

// more buttons
// more buttons
// more buttons

// CAMERA


if(restart_room){

  restart_counter++;
  
  if(restart_counter < 0 and restart_counter > -20 and mouse_check_button_pressed(mb_left)) restart_counter = 0;
  if(restart_counter > 0){
    VXA += VW*0.1;
    VXB -= VW*0.1;
    VYA += VH*0.1;
    VYB -= VH*0.1;
    
    VW = VXB - VXA;
    VH = VYB - VYA;
    if(restart_counter > 35) room_goto(dest);
    else if(restart_counter > 13){
      VXA = -1000;
      VXB = -1000;
      VYA = -1000;
      VYB = -1000;
     
    }
  }
} else if(specialwindow){

  PINL = 2;
  PINR = 2;
  PINU = 2;
  PIND = 2;

  // V-- is set elsewhere, snap to it 
  
  var _target = VXA_tar
  VXA_pre = f_approach(VXA_pre, _target, sqrt(abs(VXA_pre - _target))*0.75);
  var _target = VXB_tar
  VXB_pre = f_approach(VXB_pre, _target, sqrt(abs(VXB_pre - _target))*0.75);
  var _target = VYA_tar
  VYA_pre = f_approach(VYA_pre, _target, sqrt(abs(VYA_pre - _target))*0.75);
  var _target = VYB_tar
  VYB_pre = f_approach(VYB_pre, _target, sqrt(abs(VYB_pre - _target))*0.75);
  
     
  VXA = round(VXA_pre);
  VXB = round(VXB_pre);
  VYA = round(VYA_pre);
  VYB = round(VYB_pre);
  
  VW = VXB - VXA;
  VH = VYB - VYA;
  
} else if(instance_exists(o_player)){

  // left side...  
  if(!PINL){
    var _target = o_player.x - default_width;
    VXA_pre = f_approach(VXA_pre, _target, sqrt(abs(VXA_pre - _target))*0.75);
  }
  // right side...  
  if(!PINR){
    var _target = o_player.x + default_width;
    VXB_pre = f_approach(VXB_pre, _target, sqrt(abs(VXB_pre - _target))*0.75);
  }
  // left side...  
  if(!PINU){
    var _target = o_player.y - default_height - 8;
    VYA_pre = f_approach(VYA_pre, _target, sqrt(abs(VYA_pre - _target))*0.75);
  }
  // left side...  
  if(!PIND){
    var _target = o_player.y + default_height - 8;
    VYB_pre = f_approach(VYB_pre, _target, sqrt(abs(VYB_pre - _target))*0.75);
  }
   
  VXA = round(VXA_pre);
  VXB = round(VXB_pre);
  VYA = round(VYA_pre);
  VYB = round(VYB_pre);
  
  VW = VXB - VXA;
  VH = VYB - VYA;

}



if(SPECIALROOM){

  var _h = round(shake*sin(shake_counter));
  var _v = round(shake*sin(shake_counter + 120));

  __view_set( e__VW.XView, 0, VXA+_h );
  __view_set( e__VW.YView, 0, VYA+_v );
  __view_set( e__VW.WView, 0, VW );
  __view_set( e__VW.HView, 0, VH );
  f_set_viewport();
  if(window_get_width() != __view_get( e__VW.WPort, 0 ) or window_get_height() != __view_get( e__VW.HPort, 0 ))
    window_set_size(__view_get( e__VW.WPort, 0 ),__view_get( e__VW.HPort, 0 ));
  window_set_position(display_get_width()/2-room_width+(VXA+_h)*2, display_get_height()/2-room_height+(VYA+_v)*2);

}


