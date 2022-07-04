createParticleTimer++;

if(createParticleTimer mod 5 == 0) instance_create_depth(x + random_range(-4,4), y + random_range(-2,2), 0, oParticles);

if(place_meeting(x + speed, y + speed, oSolid)) instance_destroy();

image_angle += 3;