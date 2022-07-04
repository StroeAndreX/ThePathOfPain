draw_set_color(color); 
for(var i = 0; i < image_xscale; i ++) {
    var A = (sin(angle + i/wave_wide) * wave_size);
    var B = i * image_width;
	draw_set_alpha(0.58);
    draw_rectangle(x + B + 1, y + A + 1, x + B + image_width, y + image_height * image_yscale, false);
    draw_sprite(image, image_index, x + B, y + A);
}
draw_set_alpha(1);
draw_set_color(c_black); 

