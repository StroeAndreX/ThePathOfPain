if(place_meeting(x,y,oPlayer) && (oPlayer.trauma == false))
{
	instance_create_layer(x,y,"TraumaActivators",oTrauma);
	oPlayer.trauma = true;
	oActs.haveWrited = false;
	oCollectable_border.timerFlash = 0;
	oGlitchShader.superfall_shader = true;
	instance_destroy();
}

if(place_meeting(x,y,oPlayer) && (oPlayer.trauma == true))
{
	instance_create_layer(x,y,"TraumaActivators",oTrauma);
	oCollectable_border.timerFlash = 0;
	oPlayer.trauma = false;
	if(instance_exists(obj_text)) with(obj_text) instance_destroy();
	
	instance_destroy();
	
}





