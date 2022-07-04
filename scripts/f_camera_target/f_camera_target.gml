with(o){
  if(instance_exists(view_target)){
    view_target_x = view_target.x - __view_get( e__VW.WView, 0 )/2;
    view_target_y = view_target.y - __view_get( e__VW.HView, 0 )/2;
  } else {
    view_target_x = x;
    view_target_y = y;
  }
   
  VXA_pre = view_target.x - 4;
  VXB_pre = view_target.x + 4;
  VYA_pre = view_target.y - 12;
  VYB_pre = view_target.y - 4;
  
  VXA = round(VXA_pre);
  VXB = round(VXB_pre);
  VYA = round(VYA_pre);
  VYB = round(VYB_pre);
  
  VW = VXB-VXA;
  VH = VYB-VYA;
  
  if(SPECIALROOM){   
  
    __view_set( e__VW.XView, 0, VXA );
    __view_set( e__VW.YView, 0, VYA );
    __view_set( e__VW.WView, 0, VW );
    __view_set( e__VW.HView, 0, VH );
    f_set_viewport();
    if(window_get_width() != __view_get( e__VW.WPort, 0 ) or window_get_height() != __view_get( e__VW.HPort, 0 ))
      window_set_size(__view_get( e__VW.WPort, 0 ),__view_get( e__VW.HPort, 0 ));
    window_set_position(display_get_width()/2-__view_get( e__VW.WPort, 0 )/2, display_get_height()/2-__view_get( e__VW.HPort, 0 )/2);
    
  
  }
}
