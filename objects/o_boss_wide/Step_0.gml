event_inherited();

if(stage == 0){

  if(o_player.y > y - 40) stage++;

}

if(stage >= 3){
  
  counter++;
  if(counter <= 120){
  
    ya = f_approach(ya, y - 80, 2);
    yb = f_approach(yb, y + 16, 2);
  
  } else if(counter <= 240){
  
    ya = f_approach(ya, y - 32, 2);
    yb = f_approach(yb, y + 64, 2);  
    
  }
  if(counter>=240) counter -= 240;  
  
}

