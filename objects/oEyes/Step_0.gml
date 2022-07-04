//wZoom -= 0.07;
//hZoom -= 0.07;

wZoom -= 0.09;
hZoom -= 0.09;
angle -= 0.003;
camera_set_view_angle(view_camera[0], angle);
camera_set_view_size(view_camera[0],wZoom,hZoom);

//Step
sPAngle += inc;
Pxx = room_width/2+lengthdir_x(10,sPAngle);
Pyy = room_height/2+lengthdir_y(10,sPAngle);

sNAngle -= inc;
Nxx = room_width/2+lengthdir_x(8,sNAngle);
Nyy = room_height/2+lengthdir_y(8,sNAngle);

//ChangeScene
timer++;
if(timer/60 >= 18) 
{
	depth = -100000; 
	changeScene = true;
	if(alpha < 0.8 && endScene == false) alpha += 0.06;
	if(timer/60 == 19) wr_one = true;
	if(timer/60 == 21) wr_two = true;
}

if(wr_one) 
{
	scr_text("Now I understand... ",0.2,room_width/2, 64);
	wr_one = false;
}

if(wr_two) 
{
	alarm[0] = 85;
	scr_text("I'm in the hell...",0.2,room_width/2, 448);
	wr_two = false;
}

if(endScene == true)
{	
	alpha += 0.01;
}

if(kb_press(ord("R")))
{
	game_restart();
}