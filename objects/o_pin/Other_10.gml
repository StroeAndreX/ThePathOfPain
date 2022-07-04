pinland = 1;

v_spd = 0;
h_spd = 0;

if(x<=VXA+2) { pinwindow = 1; PINL = 1; pinl = 1; f_shake(4)}
if(x>=VXB-2) { pinwindow = 1; PINR = 1; pinr = 1; f_shake(4)}

f_play_sound_once(snd_pinned)

