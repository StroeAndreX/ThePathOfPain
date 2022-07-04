if(((f_check_point(x+h_col-1,y) and !f_check_point_jumpthru(x+h_col-1,y-1))
 || (f_check_point(x-h_col,y) and !f_check_point_jumpthru(x-h_col,y-1))
 || (f_check_point(x,y) and !f_check_point_jumpthru(x,y-1))) and v_spd>=0){
  on_ground = 1;
  v_spd = 0;
} else {
  on_ground = 0;
}

//show_debug_message(string(view_yview+view_hview) + " vs " + string(y))

