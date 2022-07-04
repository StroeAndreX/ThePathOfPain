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
display_set_gui_size(1024, 576); 


global.ballHit = 0; //every time the ball bounces, we'll change the effect intensity
global.seed = random(1); //we'll also change the RNG seed every time

/* */
/*  */

//Changes 
lineShift = 0.005667;
lineShiftSpeed = 0.093333;
intensity = 0.066667;

superfall_shader = false;
superfall_shader_timer = 0;

BrainControll_shader = false;
BrainControll_shader_timer = 0;

shockwaves_shader = true;
shockwaves_shader_timer = 0;

trauma_shader = false;
trauma_shader_timer = 0;

corruptEffect = false;
whenCorruptedEffect = random(200);
corruptedTimer = 0;