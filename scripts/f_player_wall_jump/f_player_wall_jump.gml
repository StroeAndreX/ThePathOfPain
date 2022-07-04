repeat(8) with(instance_create(x+h_col*on_wall,y-random(10),o_dust)){
  //image_blend = x_dk_blue;
  h_spd = random_range(-0.6,0.6);
  v_spd = random_range(-0.3,0.3);
}

image_xscale = -on_wall_near;
f_player_squeeze(1.2,0.8);
f_play_sound(snd_walljump);


prefire_jump = 0;
on_wall_counter = 0;
on_wall = 0;
on_ground_counter = 0;

v_spd = v_wjump;
h_spd = -on_wall_near*h_wjump;
