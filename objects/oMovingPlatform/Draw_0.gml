draw_self();
if(showTheConnection) 
{
	//draw_set_color(make_color_rgb(127,127,127));
	draw_line_width_color(x - 10,y - 10,oPlayer.x,oPlayer.y,oCollectable_border.max_dim * 3,make_color_rgb(120,120,120),c_black);
}