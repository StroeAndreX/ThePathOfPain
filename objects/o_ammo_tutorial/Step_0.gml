if(active){

  counter++;
  o.specialwindow = 1;
  
  if((counter > 300 or (counter > 60) and mouse_check_button(mb_left))){
  
    active = 0;
  
    SPECIALROOM = 0;
    f_set_normal_room();
    f_shake(10);
  
    //PINL = 0;
    //PINR = 0;
    //PINU = 0;
    //PIND = 0;
    o.specialwindow = 0;
    //instance_destroy();
  
  } else {
  
    VXA_tar = 64
    VXB_tar = room_width-64
    VYA_tar = 40
    VYB_tar = room_height - 48;
  
  }

}

