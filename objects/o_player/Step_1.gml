event_inherited();

if(!on_ground){

  if(f_check_point_edge(x+h_col,y-on_wall_offset)) on_wall = 1; // against a wall to the right
  else if(f_check_point_edge(x-h_col-1,y-on_wall_offset)) on_wall = -1; // against a wall to the left
  else on_wall = 0; // not against a wall
  
  if(f_check_point_edge(x+h_col+2,y-on_wall_offset)) on_wall_near = 1; // wall near the right
  else if(f_check_point_edge(x-h_col-3,y-on_wall_offset)) on_wall_near = -1; // wall near the left
  else on_wall_near = 0; // no wall nearby
  
} else {

  on_jumpthru = !(f_check_point_jumpthru_new(x+h_col-1,y)
               || f_check_point_jumpthru_new(x-h_col,y)
               || f_check_point_jumpthru_new(x,y))

  on_wall = 0;
  on_wall_near = 0;
  
  v_spd = 0;
}

