/// @description Insert description here
// You can write your code in this editor
if(active_particles == true)
{
	sName = part_system_create();

	particle1 = part_type_create();
	part_type_sprite(particle1,sScraps,0,0,0);
	part_type_size(particle1,1,1,0,0);
	part_type_scale(particle1,2,2);
	part_type_color1(particle1,16777215);
	part_type_alpha1(particle1,1);
	part_type_speed(particle1,1,6,0,0);
	part_type_direction(particle1,0,359,0,0);
	part_type_gravity(particle1,0,270);
	part_type_orientation(particle1,0,0,0,0,1);
	part_type_blend(particle1,1);
	part_type_life(particle1,10,20);

	part_particles_create(sName,x,y,particle1,35);
	
	alarm[1] = 0;
	instance_destroy();
}
