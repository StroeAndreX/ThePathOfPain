if(!instance_exists(o_ending) and !o.restart_room)
{
  f_play_sound(snd_dead);  
  f_full_transition(1, 6, room, 30);
}
