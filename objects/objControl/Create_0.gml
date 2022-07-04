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
    
    See Draw GUI of objControl for setup instructions.
    
    Easier example available in objSimpleExample, change the room order to see it in action.
*/

//
application_surface_draw_enable(0); //disabling automatic redrawing of the application surface
display_set_gui_size(1280, 720);    //hard-setting GUI size to HD
BktGlitch_init();                   //initialising the shader (getting uniform pointers)!
//

ui_init();



/* */
/*  */
