//if(kb_press(vk_enter)) doo = true;
if(oPlayer.x >= self.x - 8 && oPlayer.x <= self.x + 8 )
{
	doo = true;
	goUP = false;
}

if(!doo) exit;
image_angle = clamp(image_angle, -15, 0.1);

if(!place_meeting(x,y + boneVsp,oStopBones) && !goUP)
{
	timer = 0;
	boneVsp += 2;
}
else if(place_meeting(x,y + boneVsp,oStopBones) && !goUP)
{
	boneVsp = 0;
	timer++;
	if(timer <= 20) oCamera.i = random_range(-8,8);
	if(timer >= 21 && timer <= 23) oCamera.i = 0;
	if(timer >= 60)
	{
		goUP = true;
		timer = 0;
	}
}

if(goUP && y >= yy - 10)
{
	boneVsp = -2;	
}
if(y <= yy - 10 && goUP)
{
	goUP = false;
	boneVsp = 15;
	doo = false;
}
y += boneVsp;