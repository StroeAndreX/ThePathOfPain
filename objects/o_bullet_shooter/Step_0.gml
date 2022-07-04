counter++;
if(counter > rate){
  counter -= rate;
  with(instance_create(x+8-h_spd*2,y+8-v_spd*2,o_bullet)){
  
    h_spd = other.h_spd;
    v_spd = other.v_spd;
  
  }
}

