if(!(distance_to_object(oLever) < 587) && !(distance_to_object(oMovingPlatform) < 587)  && oPlayer.MindControll == true) 
{
	//show_message("Oh Nope.");
	oPlayer.MindControll = false;
	instance_destroy();
}