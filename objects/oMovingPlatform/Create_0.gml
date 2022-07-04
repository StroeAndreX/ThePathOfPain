image_speed = 0;
active_alone = 3;
offset = 0;

n = 1;
idd = 0;
active_draw = false;
key = 0;
vsp_m = 0;

showTheConnection = false;
idCollected = false;

angle = 0;

draw = false; //if draw is egual to true the object can't be mentally controlled
unlockedBM_effect = false;
alpha_effect = 0;
size_lm = 0;
nevercreated = true;

gearLeft = instance_create_layer(self.x - 58, self.y + 16, "Test", oMovingPlatform_Motor);
gearRight = instance_create_layer(self.x + 58, self.y + 16, "Test", oMovingPlatform_Motor);
