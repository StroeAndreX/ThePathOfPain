//Max Drop_Speed
vsp = clamp(vsp,0,30);

//Add Gravity 
vsp += drop_speed;
y += vsp;

