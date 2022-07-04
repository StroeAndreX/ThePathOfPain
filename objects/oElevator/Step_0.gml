if(gp_press(0,gp_face3) && idd == oPlayer.compareID && active_elevator == false && activated = false) active_elevator = true; 

if(active_elevator == true)
{
	activated = true;
	eVsp = -1;
	oCamera.i = random_range(-3,3);
	onHold.turns = true;
	gamepad_set_vibration(0,0.6,0.6);
	if(place_meeting(x,y+eVsp,inst_54D89BA1))
	{
		active_elevator = false;
		if(instance_exists(oElevatorDoor)) 
		{
			inst_212F2E4B.sprite_index = sElevatorDoor_unlock;
			inst_1D310042.sprite_index = sElevatorDoor_unlock;
		}
		onHold.turns = false;	
	}
	
	if(place_meeting(x,y+eVsp,inst_2DCD75AB))
	{
		active_elevator = false;
		if(instance_exists(oElevatorDoor)) 
		{
			inst_A356C51.sprite_index = sElevatorDoor_unlock;
		}
		onHold.turns = false;	
	}
}

//------------------
if(place_meeting(x,y+eVsp,oStopElevator))
{
	while(!place_meeting(x,y+sign(eVsp),oStopElevator))
	{
		y += sign(eVsp);
	} 
	eVsp = 0;
}
//------------------
y += eVsp;


