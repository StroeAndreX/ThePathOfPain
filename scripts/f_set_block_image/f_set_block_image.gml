var _x = x/16;
var _y = y/16;
if(f_check_grid(_x,_y-1)){
  if(f_check_grid(_x,_y+1)){
    if(f_check_grid(_x-1,_y)){
      if(f_check_grid(_x+1,_y)){
        if(!f_check_grid(_x-1,_y-1)){
          if(!f_check_grid(_x+1,_y-1)){
            image_index = 18;
          } else {            
            image_index = 16;
          }
        } else if(!f_check_grid(_x+1,_y-1)){
          image_index = 17;
        } else {
          image_index = 5;
        }
      } else {
        image_index = 6;
      }
    } else {
      if(f_check_grid(_x+1,_y)){
        image_index = 4;
      } else {
        image_index = 7;
      }
    }    
  } else {
    if(f_check_grid(_x-1,_y)){
      if(f_check_grid(_x+1,_y)){
        image_index = 9;
      } else {
        image_index = 10;
      }
    } else {
      if(f_check_grid(_x+1,_y)){
        image_index = 8;
      } else {
        image_index = 11;
      }
    }    
  }  
} else {
  if(f_check_grid(_x,_y+1)){
    if(f_check_grid(_x-1,_y)){
      if(f_check_grid(_x+1,_y)){
        image_index = 1;
      } else {
        image_index = 2;
      }
    } else {
      if(f_check_grid(_x+1,_y)){
        image_index = 0;
      } else {
        image_index = 3;
      }
    }    
  } else {
    if(f_check_grid(_x-1,_y)){
      if(f_check_grid(_x+1,_y)){
        image_index = 13;
      } else {
        image_index = 14;
      }
    } else {
      if(f_check_grid(_x+1,_y)){
        image_index = 12;
      } else {
        image_index = 15;
      }
    }    
  }  
}
