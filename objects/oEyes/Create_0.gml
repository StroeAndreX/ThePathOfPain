//spawn position
x = room_width/2;
y = room_height/2;

//Camera control
wZoom = global.camera_xview;
hZoom = global.camera_yview;
angle = camera_get_view_angle(view_camera[0]);

//Create Event
Pxx = room_width/2;
Pyy = room_height/2;
Nxx = room_width/2;
Nyy = room_height/2;

sPAngle = 0;
sNAngle = 0;
inc = 2;

//ChangeScene
timer = 0;
changeScene = false;
wr_one = false;
wr_two = false;
alpha = 0;
endScene = false;