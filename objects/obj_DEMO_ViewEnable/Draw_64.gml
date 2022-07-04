x = display_get_gui_width() - 32;
y = display_get_gui_height() - 96;

draw_self();

draw_set_halign(fa_right);

if sprite_index == spr_button_on
    {
    draw_text(x - 48, y - 8, string_hash_to_newline("View Enabled (Use arrow keys to move)"));
    }
else
    {
    draw_text(x - 48, y - 8, string_hash_to_newline("View Disabled"));
    }

draw_set_halign(fa_left);


