var b = instance_create_layer(x ,y ,"TraumaEnemies",oEnemyBullet);
b.speed = 17;
if(offset == 1)
{
	b.image_angle = -45;
	//b.direction = 325;
	b.direction = -45;
}
if(offset == -1)
{
	b.image_angle = 225;
	b.direction = -135;;
}

alarm[1] = 90;