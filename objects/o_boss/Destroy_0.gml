repeat(8) f_dust_custom(random_range(-4,4),random_range(-8,0),2,2,x_black);
f_shake(30);
//o.specialwindow = 0;
instance_create(x,y,o_boss_dead);
pause = 0;
o.ammo_max--;

f_play_sound(snd_enemy_dead)

