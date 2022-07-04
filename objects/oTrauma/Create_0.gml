if(oPlayer.trauma == false)
{
	//Create the transition effect
	instance_create_layer(x,y,"Control",oTraumaEffect);

	//Change Background
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	layer_background_sprite(back_id, sBg_LevelsBlack);

	//Darkness zone
	oPlayer.darkness = 0.35;
	oPlayer.aura = true;
	
	//Decrease Player speed/jump
	oPlayer.cannot_controll = 1;
	oPlayer.traumaJump = 1;
	oPlayer.trumaSpeed = 0.65;
	
	//Delete
	instance_destroy();
}

if(oPlayer.trauma == true)
{
	//Create the transition effect
	instance_create_layer(x,y,"Control",oTraumaEffect);

	//Change Background
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	layer_background_sprite(back_id, sBg_Levels);

	//Darkness zone
	oPlayer.darkness = 0.15;
	oPlayer.aura = false;
	
	//Increase Player speed
	oPlayer.cannot_controll = 1; 
	oPlayer.traumaJump = 1;
	oPlayer.trumaSpeed = 1;

	//Camera Controlling RESET
	oCamera.i = 0;
	
	//Delete
	oPlayer.trauma = false
	instance_destroy();
}
