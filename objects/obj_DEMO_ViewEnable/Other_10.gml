if sprite_index == spr_button_on
    {
    sprite_index = spr_button_off;
    with (obj_DEMO) view_num = -1;
    surface_resize(application_surface, room_width, room_height);
    view_enabled = false;
    }
else
    {
    sprite_index = spr_button_on;
    with (obj_DEMO) view_num = 0;
    var _vw = __view_get( e__VW.WView, 0 );
    var _vh = __view_get( e__VW.HView, 0 );
    surface_resize(application_surface, _vw, _vh);
    view_enabled = true;
    }


