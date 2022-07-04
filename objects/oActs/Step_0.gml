if(place_meeting(x,y,oPlayer))
{
	if(!haveWrited && Act[0])
	{
		//scr_text("This pain... ", 0.2, 32 * 25, 64);		
		scr_text("This pain... ", 0.2, 10112, 1001);		
		haveWrited = true;
	}
	if(!haveWrited && Act[1])
	{
		//scr_text("This pain... ", 0.2, 32 * 25, 64);		
		scr_text("It Never disapper ", 0.2, 10368, 700);		
		haveWrited = true;
	}
	if(!haveWrited && Act[2])
	{
		//scr_text("This pain... ", 0.2, 32 * 25, 64);		
		scr_dialogues("You. Won't. Excape. From. Me.", 0.2, 0, 448,"Pain");		
		haveWrited = true;
	}
}


