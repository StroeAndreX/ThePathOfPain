pinland = 1;
v_spd = 0;
h_spd = 0;

if(y<=VYA+2) { pinwindow = 1; PINU = 1; pinu = 1; f_shake(4)}
if(y>=VYB-2) { pinwindow = 1; PIND = 1; pind = 1; f_shake(4)}

f_play_sound_once(snd_pinned)

