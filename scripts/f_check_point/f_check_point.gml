/*if(argument0<0 or argument1<0 or argument0>=room_width or argument1>=room_height or argument0<view_xview or argument1<view_yview or argument0 > view_xview+view_wview or argument1 > view_yview+view_hview) return 1;
else return (o.grid[argument0/16,argument1/16]>0);
*/


if(argument0<0 or argument1<0 or argument0>=room_width or argument1>=room_height) return 1;
else return (o.grid[argument0/16,argument1/16]==1); // >0
