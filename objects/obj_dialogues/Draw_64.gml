var c_PathShadow = make_color_rgb(34,33,38);
var c_PathLight = make_color_rgb(194,194,194);

if (time < text_length)
{
    time += spd;
    print = string_copy(text,0,time)
}

///Render textbox & text
alpha = 1;

if(character == "Pain") 
{
	draw_sprite_ext(sDialogueBox,-1,x,y - 100,image_xscale,image_yscale,image_angle,image_blend,2);
}
draw_set_alpha(2);

draw_set_font(fnt);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_text_ext
(
    x + padding + 16,
    y + padding,
    string_hash_to_newline(print),
    font_size+(font_size/2),
    maxlength
);

draw_set_alpha(1);

