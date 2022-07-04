randomize();

/*========================================
  1.   V I E W   and   S U R F A C E S
========================================*/

/*
if(room <= rm_LV1
or room == rm_LV1
or room == rm_controls
or f_between(room, rm_E3, rm_corridor1)
/*or room == 
or room == 
or room == 
or room == 
/
)
  SPECIALROOM = 1;
else
  SPECIALROOM = 0;
*/
SPECIALROOM = 1;
if(SPECIALROOM){

/*  view_wview[0] = 16;
  view_hview[0] = 16;
  view_wport[0] = 32;
  view_hport[0] = 32;*/
  
  surface_main = surface_create(room_width,room_height);
  __view_set( e__VW.SurfaceID, 0, surface_main );
  display_set_gui_size(__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ));

} else {

  f_set_normal_room();
  
}

__background_set_colour( x_plum );



/*========================================
  2.   L E V E L
========================================*/



for(var _i = 0; _i < room_width/16; _i++){
  for(var _j = 0; _j < room_height/16; _j++){
    grid[_i,_j] = 0;
  }
}


with(o_block_fill){
  for(var _i = 0; _i < image_xscale; _i++){
    for(var _j = 0; _j < image_yscale; _j++){
      instance_create(x+_i*16,y+_j*16,o_block);
    }
  }
}

with(o_block){
  o.grid[x/16,y/16] = 1;
}


// SPIKES

with(o_spikes_auto){
  if(o.grid[x/16,y/16+1]){sprite_index = s_spikes}
  else if(o.grid[x/16,y/16-1]){sprite_index = s_spikes_down}
  else if(o.grid[x/16-1,y/16]){sprite_index = s_spikes_right}
  else if(o.grid[x/16+1,y/16]){sprite_index = s_spikes_left}
  else {}
}

with(o_jumpthru){
  o.grid[x/16,y/16] = 2;
}

with(o_block){
  f_set_block_image()
}

with(o_block_border){
  f_set_block_image()
}

with(o_block_wood){
  o.grid[x/16,y/16] = 1;
}

retrieve_counter = 0; // hold to retrieve ammo...
restart_room = 0; // for deaths
restart_counter = -30;
ammo = ammo_max;

/*========================================
  3.   C A M E R A
========================================*/

PINL = 0;
PINR = 0;
PINU = 0;
PIND = 0;

if(instance_exists(o_player)) view_target = o_player;
else view_target = id;

view_w = VW; // !!! make these smaller, so levels "pop" in
view_h = VH;

f_camera_target();

specialwindow = 0; // is the window being controlled elsewhere?
pause = 0;

/*========================================
  4.   B A C K G R O U N D
========================================*/


/*========================================
  5.   P A U S E
========================================*/


/* */
/*  */
