

//// UI !!! ////

shake_counter+=shake;
var _h = round(shake*sin(shake_counter));
var _v = round(shake*sin(shake_counter + 120));
shake*=0.875;

if(f_chance((shake-0.5)/8)) f_play_sound(snd_shake); 

VXA+=_h;
VXB+=_h;
VYA+=_v;
VYB+=_v;

draw_set_colour(x_black);

draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),VXA-1,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ),0);
draw_rectangle(VXB+1,__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ),0);
draw_rectangle(VXA-1,__view_get( e__VW.YView, 0 ),VXB+1,VYA-1,0);
draw_rectangle(VXA-1,VYB+1,VXB+1,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ),0);


// VOID STUFF!!

with(o_boss){

  if(!f_check_in_window(x,y)) draw_sprite(s_vampbat_eyes,image_index,x,y);

}

with(o_boss_final){

  if(stage == 0) draw_sprite(s_skull, counter/6, x, y);

}

// WINDOW STUFF!!

draw_set_colour(x_black);

draw_rectangle(VXA-1,VYA-1,VXB+1,VYB+1,1);
draw_rectangle(VXA-2,VYA-2,VXB+2,VYB+2,1);

draw_sprite_ext(s_UI_window_v,PINL,VXA-5,VYA-2,1,VH+5,0,x_white,1);
draw_sprite_ext(s_UI_window_v,PINR,VXB+3,VYA-2,1,VH+5,0,x_white,1);
draw_sprite_ext(s_UI_window_top,PINU,VXA-2,VYA-5,VW+5,1,0,x_white,1);
draw_sprite_ext(s_UI_window_h,PIND,VXA-2,VYB+3,VW+5,1,0,x_white,1);

draw_sprite(s_UI_window_corners, 0, VXA-5, VYB+3);
draw_sprite(s_UI_window_corners, 1, VXB+3, VYB+3);
draw_sprite(s_UI_window_corners, 2, VXA-5, VYA-14);
draw_sprite(s_UI_window_corners, 3, VXB+3, VYA-14);

draw_sprite(s_UI_window_x, specialwindow, VXB, VYA);

VXA-=_h;
VXB-=_h;
VYA-=_v;
VYB-=_v;


with(o_pin){

  if(pinwindow){
    draw_sprite(s_UI_pinpush,0,x+dcos(angle)*5+_h*0.5,y-dsin(angle)*5+_v*0.5);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, image_blend, image_alpha);
  }

}

if(SPECIALROOM){
mousex = mouse_x/room_width*__view_get( e__VW.WView, 0 )+__view_get( e__VW.XView, 0 );
mousey = mouse_y/room_height*__view_get( e__VW.HView, 0 )+__view_get( e__VW.YView, 0 );
} else {
mousex = mouse_x;
mousey = mouse_y;
}


//show_debug_message(string(mousex) + " / " + string(mouse_x));

mousex_p = (mousex_p*2 + mousex)/3;
mousey_p = (mousey_p*2 + mousey)/3;


// MOUSE DRAW!!!

if(mouse_check_button(mb_right)){
  if(instance_exists(o_player)){
    if(!o_player.on_ground){
      with(o_pin){
        if(position_meeting(o.mousex,o.mousey,id)) o.mouse_active = 4;
      }
    }
  }
}

draw_sprite(s_UI_mouse,mouse_active,mousex_p,mousey_p);
  
draw_sprite(s_UI_mouse,3,mousex,mousey);

for(var _i = 0; _i < ammo; _i++){
  draw_sprite(s_UI_ammo,0,(mousex_p+mousex)/2-(ammo-1)*2+_i*4,(mousey_p+mousey)/2+12);
}

mouse_active = 0;

/*

if(PINL) draw_sprite_ext(s_UI_window_v,PINL,VXA-5,VYA-2,1,VH+5,0,x_white,1);
//else draw_sprite_ext(s_UI_window_v,0,VXA-5,VYA-2,1,VH+5,0,x_white,1);

if(PINR) draw_sprite_ext(s_UI_window_v,0,VXB+3,VYA-2,1,VH+5,0,x_blue,1);
else draw_sprite_ext(s_UI_window_v,0,VXB+3,VYA-2,1,VH+5,0,x_white,1);

if(PINU) draw_sprite_ext(s_UI_window_h,0,VXA-2,VYA-5,VW+5,1,0,x_blue,1);
else draw_sprite_ext(s_UI_window_h,0,VXA-2,VYA-5,VW+5,1,0,x_white,1);

if(PIND) draw_sprite_ext(s_UI_window_h,0,VXA-2,VYB+3,VW+5,1,0,x_blue,1);
else draw_sprite_ext(s_UI_window_h,0,VXA-2,VYB+3,VW+5,1,0,x_white,1);



/* */
/*  */
