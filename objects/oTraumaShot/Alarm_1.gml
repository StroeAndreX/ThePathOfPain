var b = instance_create_layer(x,y,"TraumaEnemies",oEnemyBullet);
b.speed = 17;
if(offset == 1)
{
	b.image_angle = 320;
	b.direction = -45;
}
if(offset == -1)
{
	b.image_angle = 220;
	b.direction = -135;
}

alarm[0] = 90;