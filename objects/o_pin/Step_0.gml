if(o.mouse_active == 0 and pinwindow and (position_meeting(o.mousex,o.mousey,id) or position_meeting(o.mousex_p,o.mousey_p,id))){
  if(instance_exists(o_player)){
    if(mouse_check_button_pressed(mb_right) and o_player.on_ground){
    
      pingrabbed = 1;
      f_play_sound(snd_UI_grab);
    
      if(o.mousex!=o.mousex_p or o.mousey!=o.mousey_p){
  
        if(instance_exists(o_player)){
        
          var _mx = (o.mousex-o.mousex_p)/2;
          var _my = (o.mousey-o.mousey_p)/2;
        
          if(pinl and VXA + _mx*2 < o_player.x-o_player.h_col) {f_play_sound(snd_drag); VXA_pre+=max(0,_mx);}
          if(pinr and VXB + _mx*2 > o_player.x+o_player.h_col) {f_play_sound(snd_drag); VXB_pre-=max(0,-_mx); }
          if(pinu and VYA + _my*2 < o_player.y+o_player.v_col-4) {f_play_sound(snd_drag); VYA_pre+=max(0,_my); }
          if(pind and VYB + _my*2 > o_player.y){f_play_sound(snd_drag); VYB_pre-=max(0,-_my);}
        }
      }
      o.mouse_active = 2;
    } else {
      o.mouse_active = 1;
    }
  }
}

if(instance_exists(o_player)){
  if(!o_player.on_ground){
    if(pingrabbed>0){
      pingrabbed = 0;
      f_play_sound(snd_UI_grab);
    }
  }
}

if(pingrabbed){

  if(mouse_check_button(mb_right) and point_distance(x,y,o.mousex,o.mousey) < 64){
  
    if(o.mousex!=o.mousex_p or o.mousey!=o.mousey_p){

      if(instance_exists(o_player)){
      
    //    if(!f_check_point(x,y)){
          if(pinl and VXA < o_player.x-o_player.h_col) { f_play_sound(snd_drag); VXA_pre+=max(0,o.mousex-o.mousex_p)*0.5;}//VXA_pre+=2;
          if(pinr and VXB > o_player.x+o_player.h_col) { f_play_sound(snd_drag); VXB_pre-=max(0,-o.mousex+o.mousex_p)*0.5; }//VXB_pre-=2;
          if(pinu and VYA < o_player.y+o_player.v_col-4) { f_play_sound(snd_drag);  VYA_pre+=max(0,o.mousey-o.mousey_p)*0.5;} //VYA_pre+=2;
          if(pind and VYB > o_player.y) { f_play_sound(snd_drag); VYB_pre-=max(0,-o.mousey+o.mousey_p)*0.5; } //VYB_pre-=2;
    //    }
      }
    }
    o.mouse_active = 2;
  
  } else {
  
    f_play_sound(snd_UI_grab);
    pingrabbed = 0;
  
  }
}

if(!pinland) {
  v_spd += grav //*0.5;
  h_spd *= 0.98
  angle = point_direction(0,0,h_spd,v_spd);
} else {

  

}

/* */
/*  */
