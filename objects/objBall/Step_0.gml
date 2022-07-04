if (bbox_right >= room_width || bbox_left <= 0){
    dX = -dX;
    global.ballHit = 1;
    global.seed = random(1);
}

if (bbox_top <= 0 || bbox_bottom >= room_height){
    dY = -dY;
    global.ballHit = 1;
    global.seed = random(1);
}

x += dX;
y += dY;

