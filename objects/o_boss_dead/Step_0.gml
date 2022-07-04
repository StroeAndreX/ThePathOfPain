counter++;
if(counter > 60){

  o.specialwindow = 0;
  PINL = 0;
  PINR = 0;
  PINU = 0;
  PIND = 0;
  instance_destroy();

} else {

  o.specialwindow = 1;
  f_shake(2);

}

