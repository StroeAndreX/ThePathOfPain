/*========================================
  1.   I N P U T
========================================*/

globalvar key_right, key_left, key_up, key_down, key_A, key_B;
globalvar key_right_p, key_left_p, key_up_p, key_down_p, key_A_p, key_B_p;

// key is down

key_right = 0;
key_left = 0;
key_up = 0;
key_down = 0;

key_A = 0;
key_B = 0;

// key pressed

key_right_p = 0;
key_left_p = 0;
key_up_p = 0;
key_down_p = 0;

key_A_p = 0;
key_B_p = 0;


/*========================================
  2.   L E V E L   S T U F F
========================================*/

globalvar grav;
grav = 0.15;

globalvar wait;
wait = 0;

globalvar pause;
pause = 0;

globalvar mute;
mute = 0;

draw_set_font(font)
counter = 0;

globalvar testfreeze;
testfreeze = 0;

/*========================================
  3.   C A M E R A
========================================*/

globalvar default_width;
default_width = 64;
globalvar default_height;
default_height = 64;

globalvar VXA, VXB, VYA, VYB, VXA_pre, VXB_pre, VYA_pre, VYB_pre, VW, VH, PINL, PINR, PINU, PIND;

globalvar VXA_tar, VXB_tar, VYA_tar, VYB_tar; 

VXA = room_width/2-default_width;
VXB = VXA + default_width*2;

VXA_pre = VXA;
VXB_pre = VXB;

VXA_tar = 0;
VXB_tar = 0;

VYA = room_height/2-default_height;
VYB = VYA + default_height*2;

VYA_pre = VYA;
VYB_pre = VYB;

VYA_tar = 0;
VYB_tar = 0;

VW = VXB - VXA;
VH = VYB - VYA;

PINL = 0;
PINR = 0;
PINU = 0;
PIND = 0;

shake = 0;
shake_counter = 0;

mousex = mouse_x;
mousey = mouse_y;
mousex_p = mousex;
mousey_p = mousey;
mouse_active = 0;

ammo_max = 0;
ammo = ammo_max;

dest = room;

globalvar SPECIALROOM;
SPECIALROOM = 0;

///////////// SOUND BALANCING

audio_sound_gain(snd_land,0.3,0)
audio_sound_gain(snd_jump,0.4,0)
audio_sound_gain(snd_throw,0.4,0)
audio_sound_gain(snd_pinned,0.3,0)
audio_sound_gain(snd_wallpin,0.4,0)
audio_sound_gain(snd_walljump,0.5,0)
audio_sound_gain(snd_walk,0.4,0)
audio_sound_gain(snd_drag,0.11,0)
audio_sound_gain(snd_door,0.5,0)
audio_sound_gain(snd_dead,0.7,0)
audio_sound_gain(snd_enemy_dead,0.8,0)
audio_sound_gain(snd_fireball,0.3,0)
audio_sound_gain(snd_fireball_make,0.3,0)
audio_sound_gain(snd_UI_grab,1,0)
audio_sound_gain(snd_UI_ungrab,1,0)
audio_sound_gain(snd_R,1,0)
audio_sound_gain(snd_enemy_appear,1,0)
audio_sound_gain(snd_key,0.8,0)
audio_sound_gain(snd_slide,0.2,0)
audio_sound_gain(snd_shake,0.1,0)
audio_sound_gain(mus_main,0.07,0)


audio_play_sound(mus_main,0,1);





/* */
/*  */

/// @description ///////////////////////////////
//                              //
//   BktGlitch 1.2              //
//    Written by Blokatt        //
//     (Jan Vorisek)            //
//      @blokatt | blokatt.net  //
//       jan@blokatt.net        //
//        26/12/2017            //
//                              //
//////////////////////////////////

/*
    DON'T FORGET, BktGlitch_init(); needs to be executed at the start of the game!
    Also, if you're on Windows 10, make sure DirectX 9 is installed.
*/

BktGlitch_init(); //getting uniform pointers
application_surface_draw_enable(false); //disabling automatic redrawing of the application surface
//display_set_gui_size(display_get_gui_width(), display_get_gui_height()); //making sure the GUI layer stays always the same size
//display_set_gui_size(display_get_width(), display_get_height()); 
//display_set_gui_size(1024, 576); 
display_set_gui_size(640, 360); 

global.ballHit = 0; //every time the ball bounces, we'll change the effect intensity
global.seed = random(1); //we'll also change the RNG seed every time
depth = -300;
/* */
/*  */

//Changes 
lineShift = 0.003000;
intensity = 0.266667;

superfall_shader = false;
superfall_shader_timer = 0;

//1010101010010011001
Psycho_xport = camera_get_view_x(view_camera[0])
Psycho_yport = camera_get_view_y(view_camera[0])