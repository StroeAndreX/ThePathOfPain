x = display_get_gui_width() - 32;
y = display_get_gui_height() - 32;

draw_self();

draw_set_halign(fa_right);

if sprite_index == spr_button_on
    {
    draw_text(x - 48, y - 8, string_hash_to_newline("Update Texture (Only use with views)"));
    }
else
    {
    draw_text(x - 48, y - 8, string_hash_to_newline("Don't Update Texture (Only enable with views)"));
    }

draw_set_halign(fa_left);


