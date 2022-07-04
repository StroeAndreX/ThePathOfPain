  __view_set( e__VW.XView, 0, 0 );
  __view_set( e__VW.YView, 0, 0 );
  __view_set( e__VW.WView, 0, 640 );
  __view_set( e__VW.HView, 0, 360 );
  //view_ratio = view_wview[0]/view_hview[0];
  __view_set( e__VW.WPort, 0, 1280 );
  __view_set( e__VW.HPort, 0, 720 );
  
 
  o.surface_main = surface_create(__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ));
  __view_set( e__VW.SurfaceID, 0, o.surface_main );
  display_set_gui_size(__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ));
  
  if(window_get_width() != __view_get( e__VW.WPort, 0 ) or window_get_height() != __view_get( e__VW.HPort, 0 )){
    window_set_size(__view_get( e__VW.WPort, 0 ),__view_get( e__VW.HPort, 0 ));
    window_set_position(display_get_width()/2-__view_get( e__VW.WPort, 0 )/2, display_get_height()/2-__view_get( e__VW.HPort, 0 )/2);
  }
