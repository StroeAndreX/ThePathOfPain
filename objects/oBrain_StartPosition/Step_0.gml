/// @description Insert description here
// You can write your code in this editor
sped = clamp(sped,0.11,7);
sped -= 0.11201;
//move_towards_point(oBrain_Position.x,oBrain_Position.y,spd)
move_towards_point(oBrain_Position.x,oBrain_Position,sped);

