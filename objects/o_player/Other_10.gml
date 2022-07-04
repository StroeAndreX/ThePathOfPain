/// @description  horizontal collision

if(abs(h_spd)>0.5){
  if(!on_ground){
  
    f_player_squeeze(1-abs(h_spd)*0.07,1+abs(h_spd)*0.07);
  
  }
  
  //f_shake(h_spd);
} 

h_spd = 0;

