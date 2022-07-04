image_index = random(3);
image_speed = 1/8

event_inherited();

h_col = 6
v_col = -6;

counter = 0;

stage = 0;

cutscene_counter = 0;
trigger_radius = 200;

// 0 - start
// 1 - trigger cutscene
// 2 - expand to show name
// 3 - expand to full view
// 4 - end cutscene, lock border, begin fight

name = "Oediv"

xa = x - 128;
xb = x + 128;
ya = y - 128;
yb = y + 128;

