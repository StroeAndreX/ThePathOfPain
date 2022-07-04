counter++;
o.specialwindow = 1;

if(counter > 240 or (counter > 60 and mouse_check_button(mb_left))){

  PINL = 0;
  PINR = 0;
  PINU = 0;
  PIND = 0;
  o.specialwindow = 0;
  f_full_transition(1,0,room+1,0);  

} else {

  VXA_tar = x - 50;
  VXB_tar = x + 50
  VYA_tar = y - 50;
  VYB_tar = y + 50;

}

