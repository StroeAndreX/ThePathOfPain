if(instance_exists(o_player)){
  if(o_player.x < x - 16) image_xscale = 1;
  else if(o_player.x > x + 16) image_xscale = -1;
}

switch(stage){

  case 0: 
    if(instance_exists(o_player)){
      if(point_distance(x,y,o_player.x,o_player.y) < trigger_radius){
        stage++;      
      }
    }
  break;
  case 1:
    f_pin_remove();
    o.specialwindow = 1;
    pause = 1;
    f_shake(2.5);
    VXA_tar = x - 32;
    VXB_tar = x + 32;
    VYA_tar = y - 32;
    VYB_tar = y + 32;
    cutscene_counter++;
    if(cutscene_counter > 150 or (cutscene_counter > 35 and mouse_check_button(mb_left))){
      repeat(6) f_dust_custom(random_range(-4,4),random_range(-4,0),2,2,x_red);
      sprite_index = s_vampire;
      y += 2;
      cutscene_counter = 0;
      f_play_sound(snd_enemy_appear);
      stage++; 
    }
  break;
  case 2:
    
    o.specialwindow = 1;
    pause = 1;
    VXA_tar = x - 40;
    VXB_tar = x + 40;
    VYA_tar = y - 48;
    VYB_tar = y + 40;
    cutscene_counter++;
    if(cutscene_counter > 120 or (cutscene_counter > 5 and mouse_check_button(mb_left))){
      cutscene_counter = 0;
      stage++; 
    }
  break;
  case 3:
    o.specialwindow = 1;
    pause = 1;
    VXA_tar = xa;
    VXB_tar = xb;
    VYA_tar = ya;
    VYB_tar = yb;
    cutscene_counter++;
    if(cutscene_counter > 60){
      stage++; 
    }  
  break;
  case 4:
    o.specialwindow = 1;
    pause = 0;
    VXA_tar = xa;
    VXB_tar = xb;
    VYA_tar = ya;
    VYB_tar = yb;
  break;    
    
}

