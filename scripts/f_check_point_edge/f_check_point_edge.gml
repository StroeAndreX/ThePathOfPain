if(argument0<0 or argument1<0 or argument0>=room_width or argument1>=room_height or argument0<=VXA or argument1<=VYA or argument0 >= VXB or argument1 >= VYB) return 1;
else return (o.grid[argument0/16,argument1/16]==1); // >0
