/// Script scr_circle_outline(pos_x,pos_y,min_rad,max_thickness,color)
pos_x = argument0; // The X Position for the Circle
pos_y = argument1; // The Y Position for the Circle
min_rad = argument2; // The Radius for the Circle
max_thickness = argument3; // The Thickness for the Circle
circ_color = argument4; // The Color of the Outline


// Draw the Circle
var i;
for (i = 0; i <= max_thickness; i++) {
    draw_set_colour(circ_color);
    draw_circle(pos_x, pos_y, min_rad+i, true);
}