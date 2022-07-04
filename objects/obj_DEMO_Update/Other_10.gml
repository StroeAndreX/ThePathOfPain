if sprite_index == spr_button_on
    {
    sprite_index = spr_button_off;
    with (obj_DEMO) ring_update = false;
    }
else
    {
    sprite_index = spr_button_on;
    with (obj_DEMO) ring_update = true;
    }


