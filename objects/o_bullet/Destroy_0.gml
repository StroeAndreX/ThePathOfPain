repeat(3) f_dust_custom(0,0,1,1,x_red);
repeat(2) f_dust_custom(0,0,1,1,x_black);
with(instance_place(x,y,o_block_wood)){

  instance_destroy();

}

if(alive>1) f_play_sound(snd_fireball)

