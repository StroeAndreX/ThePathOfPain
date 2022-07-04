if(instance_exists(oDying)) 
{
	physics_apply_force(x+random_range(-2,2), y+1, random_range(-35,35), -90)
}
timer = 0; 
diff_time = irandom(30);