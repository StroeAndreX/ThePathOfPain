x+=h_spd;
y+=v_spd;

if(f_check_point_edge(x,y)) instance_destroy();
else if(alive==0) alive = 1;
else if(alive==1){
  alive = 2;
  f_play_sound(snd_fireball_make);
}

