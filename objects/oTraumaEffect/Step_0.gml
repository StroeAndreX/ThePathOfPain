traumaTimer++;
gamepad_set_vibration(0,0.3,0.3);
oCamera.death_shaking = true;
depth = -30000;

if(traumaTimer >= 25 && oPlayer.trauma == true) 
{
	oGlitchShader.intensity = 0.776667;
	oGlitchShader.lineShift = 0.001500;
		
	traumaTimer = 0;
	gamepad_set_vibration(0,0.3,0.3);
	instance_destroy();
}

if(traumaTimer >= 25 && oPlayer.trauma == false) 
{
	//Glitch Shader
	oGlitchShader.lineShift = 0.003000;
	oGlitchShader.intensity = 0.266667;
	
	traumaTimer = 0;
	gamepad_set_vibration(0,0.6,0.6);
	instance_destroy();
}