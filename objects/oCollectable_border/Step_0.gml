angle += 0.005;
max_dim = abs(sin(angle)/5) + .40


if(oPlayer.trauma) 
{
	timerFlash++;
	whenToChange = random_range(10,60);
	
	if(timerFlash <= 1)
	{
		endTrauma = true;
		alarm[0] = 10;
		alarm[1] = 15;
		alarm[2] = 25;
		alarm[3] = 27;
		alarm[4] = 40;
	}
}

if(!oPlayer.trauma) 
{
	timerFlash++;
	
	if(timerFlash <= 1)
	{
		endTrauma = true;
		alarm[0] = 10;
		alarm[1] = 15;
		alarm[2] = 25;
		alarm[3] = 27;
		alarm[4] = 40;
	}
}

