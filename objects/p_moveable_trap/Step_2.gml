if(!pause){
if(x > VXA and x < VXB and y > VYA and y < VYB){

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

if(h>0){
  if(f_check_point(x+h_col+h,y-1) 
  || f_check_point(x+h_col+h,y+v_col)
  || f_check_point(x+h_col+h,y+_v_col2)){ // restricted movement
    x = 16*floor((x+h_col+h)/16) -h_col;
    event_user(0);
  } else if(x>=xmax){
    x = xmax+h;
    event_user(0);
  } else {
    x+=h;
  }
} else if (h<0){
  if(f_check_point(x-h_col+h,y-1)
  || f_check_point(x-h_col+h,y+v_col)
  || f_check_point(x-h_col+h,y+_v_col2)){ // restricted movement
    x = 16*ceil((x-h_col+h)/16) +h_col;
    event_user(0);
  } else if(x<=xmin){
    x = xmin+h;
    event_user(0);
  } else {
    x+=h;
  }
}

// vertical

if(v>0){
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
} else if (v<0){
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

if(y>=ymax)  y = ymax+v;
if(y<=ymin)  y = ymin+v
if(x>=xmax)  x = xmax+h;
if(x<=xmin)  x = xmin+h;

if(f_check_point(x-h_col*0.5,y+v_col*0.75) or
   f_check_point(x+h_col*0.5,y+v_col*0.75) or
   f_check_point(x-h_col*0.5,y+v_col*0.25) or
   f_check_point(x+h_col*0.5,y+v_col*0.25)) instance_destroy();

}
}

