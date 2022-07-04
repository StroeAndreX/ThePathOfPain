

var c_PathShadow = make_color_rgb(34,33,38);
var c_PathLight = make_color_rgb(204,204,204);

if(unlockedBM_effect)
{
	draw_set_alpha(0.4);
	draw_set_color(c_PathShadow);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_rectangle(0,global.camera_yview - 128, global.camera_xview, global.camera_yview - 64,false);
	draw_set_color(c_PathLight)
	draw_text(global.camera_xview/2,global.camera_yview - ((128 + 64)/2), "Mental Block deleted...");
	draw_set_alpha(1);	
}