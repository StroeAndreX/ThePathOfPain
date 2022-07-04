if(!pinwindow){

  var h, v;
  
  h_counter += h_spd;
  v_counter += v_spd;
  
  h = round(h_counter);
  v = round(v_counter);
  
  h_counter -= h;
  v_counter -= v;
  
  var _v_col2 = v_col/2;
  
  // horizontal
  
  xmax = VXB - h_col - h;
  xmin = VXA + h_col - h;
  ymax = VYB - v;
  ymin = VYA - v_col - v;
  
  var _hit = 0;
  
  if(h>0){
    if(f_check_point(x+h_col+h,y-1)
    || f_check_point(x+h_col+h,y+v_col)
    || f_check_point(x+h_col+h,y+_v_col2)){ // restricted movement
      _hit = 1;
      x = 16*floor((x+h_col+h)/16) -h_col;
      event_user(0);
    } else if(x>=xmax){
      _hit = 1;
      x = xmax+h;
      event_user(0);
    } else {
      x+=h;
    }
  } else if (h<0){
    if(f_check_point(x-h_col+h,y-1)
    || f_check_point(x-h_col+h,y+v_col)
    || f_check_point(x-h_col+h,y+_v_col2)){ // restricted movement
      _hit = 1;
      x = 16*ceil((x-h_col+h)/16) +h_col;
      event_user(0);
    } else if(x<=xmin){
      _hit = 1;
      x = xmin+h;
      event_user(0);
    } else {
      x+=h;
    }
  }
  
  // vertical
  
  if(v>0 and !_hit){
    if((f_check_point_jumpthru(x+h_col-1,y+v) and !f_check_point_jumpthru(x+h_col-1,y))
    || (f_check_point_jumpthru(x-h_col,y+v)   and !f_check_point_jumpthru(x-h_col,y))
    || (f_check_point_jumpthru(x,y+v)         and !f_check_point_jumpthru(x,y))){ // restricted movement
      y = 16*floor((y+v)/16);
      event_user(1);
    } else if(y>=ymax){
      y = ymax+v;
      event_user(1);
    } else {
      y+=v;
    }
  } else if (v<0 and !_hit){
    if(f_check_point(x+h_col-1,y+v_col+v)
    || f_check_point(x-h_col,y+v_col+v)
    || f_check_point(x,y+v_col+v)){ // restricted movement
      y = 16*ceil((y+v_col+v)/16) -v_col;
      event_user(1);
    } else if(y<ymin){
      y = ymin+v;
      event_user(1);
    } else {
      y+=v;
    }
  }


}

if(pinland){

  if(!pinl and x <= VXA) { if(!o.restart_room) f_play_sound_once(snd_wallpin); pinwindow = 1; PINL = 1; pinl = 1; f_shake(2)};
  if(!pinr and x >= VXB) { if(!o.restart_room) f_play_sound_once(snd_wallpin); pinwindow = 1; PINR = 1; pinr = 1; f_shake(2)};
  if(!pinu and y <= VYA) { if(!o.restart_room) f_play_sound_once(snd_wallpin); pinwindow = 1; PINU = 1; pinu = 1; f_shake(2)};
  if(!pind and y >= VYB) { if(!o.restart_room) f_play_sound_once(snd_wallpin); pinwindow = 1; PIND = 1; pind = 1; f_shake(2)};

  if(pinl) x = VXA;
  else if(pinr) x = VXB;
  
  if(pinu) y = VYA;
  else if(pind) y = VYB;

}

