var _sprite;

if keyboard_check_pressed(ord(argument0))
{
	window_set_rectangle(0, 0, room_width, room_height);
	surface_resize(application_surface, room_width, room_height)
	_sprite = sprite_create_from_surface(application_surface, 0, 0, room_width, room_height, false, false, 0, 0);
	sprite_save(_sprite, 0, "TSSDStageArtwork" + room_get_name(room) + ".png");
	sprite_delete(_sprite);
}
