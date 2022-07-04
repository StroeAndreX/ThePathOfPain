var _x = argument0;
var _y = argument1;

if(_x < 0 or _y < 0 or _x >= room_width/16 or _y >= room_height/16) return 1;
else return o.grid[_x,_y]==1;
