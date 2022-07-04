if(oPlayer.compareID == idd  && gp_press(0,gp_face3)) 
{
	active = true;
}

	
if(active == true) 
{
	if(inst_625BA781.active_elevator == true)
	{
		y += inst_625BA781.eVsp;
		if(inst_625BA781.active_elevator == false) active = false;
	}
	
		if(inst_10A1012F.active_elevator == true)
	{
		y += inst_10A1012F.eVsp;
		if(inst_10A1012F.active_elevator == false) active = false;
	}
}
