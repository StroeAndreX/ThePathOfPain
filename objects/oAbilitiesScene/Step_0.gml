if(sprite_index == sBrain_destroying)
{
	if(image_index >= 7)
	{
		instance_destroy();
		oPlayer.exec_NewAbilityEffect = true;
	}
}