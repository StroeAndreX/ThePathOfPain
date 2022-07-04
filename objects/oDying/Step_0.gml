death_timer++;
gamepad_set_vibration(0,0.3,0.3);
oCamera.death_shaking = true;

if(death_timer == 1)
{
	repeat(2) instance_create_depth(x+random_range(-12,+12),y + random_range(-16,16),-99,oParticles);
}

if(death_timer >= 25) 
{
	oGlitchShader.lineShift = 0.003000;
	oGlitchShader.intensity = 0.266667;
	death_timer = 0;
	gamepad_set_vibration(0,0,0);
	//instance_create_depth(oCheckPoint.x+6,oCheckPoint.y,-999,oPlayer);
	oPlayer.x = oCheckPoint.x + 6;
	oPlayer.y = oCheckPoint.y;
	repeat(2) instance_create_depth(oCheckPoint.x + random_range(-12,12),oCheckPoint.y + random_range(-16,16), -999, oParticles);
	instance_destroy();
}