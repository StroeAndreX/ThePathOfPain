if(argument0 < 0 or argument1 < 0 or argument0*8 >= room_width or argument1*8 >= room_height) return 1;
else return o.grid[argument0,argument1] != 0;
