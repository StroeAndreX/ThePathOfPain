global.ballHit = max(0, global.ballHit - .05);

#region StumpAttack change shader 
if(superfall_shader == true)
{
	intensity = 1.366667;
	lineShift = 0.003500;
	superfall_shader_timer++;
	if(superfall_shader_timer >= 10)
	{
			intensity = 0.266667;
			lineShift = 0.003000;
			superfall_shader_timer = 0;
			superfall_shader = false;
	}
}
#endregion

#region BrainControll 
if(BrainControll_shader == true)
{
	lineShift += 0.0001/2;
	intensity += 0.01/3;
	BrainControll_shader_timer++;
	if(BrainControll_shader_timer >= 250)
	{
			intensity = 0.266667;
			lineShift = 0.003000;
			BrainControll_shader_timer = 0;
			BrainControll_shader = false;
	}
}

#endregion

#region StumpAttack change shader 
if(shockwaves_shader == true)
{
	intensity = 0.766667;
	lineShift = 0.003500;
	shockwaves_shader_timer++;
	if(shockwaves_shader_timer >= 10)
	{
			intensity = 0.266667;
			lineShift = 0.003000;
			shockwaves_shader_timer = 0;
			shockwaves_shader = false;
	}
}
#endregion

#region EyesIntroduction
if(room == rEyes)
{
	lineShift += 0.00000094;
	intensity += 0.0002267;
}

#endregion

#region CorruptedEffect

if(corruptEffect)
{
	corruptedTimer++;
	if(corruptedTimer >= whenCorruptedEffect - 10) intensity = 0.166667; lineShift = 0.016667;
	if(corruptedTimer >= whenCorruptedEffect)
	{
		intensity = 0.066667;
		whenCorruptedEffect = random(200);
		corruptedTimer = 0;
	}
}

#endregion