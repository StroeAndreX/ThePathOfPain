//scr_text("Text",speed,x,y);


txt = instance_create_depth(argument2,argument3,-99999,obj_text);
with (txt)
{
    padding = 16;
    maxlength = __view_get( e__VW.WView, 0 );
    text = argument0;
    spd = argument1;
    fnt = ft_dialogues;
    
    text_length = string_length(text);
    font_size = font_get_size(font);
    
    draw_set_font(font);
    
    text_width = string_width_ext(string_hash_to_newline(text),font_size+(font_size/2), maxlength);
    text_height = string_height_ext(string_hash_to_newline(text),font_size+(font_size/2), maxlength);
    
    boxwidth = text_width + (padding*2);
    boxheight = text_height + (padding*2);
}


//Why can't I just be happy... and destroy all this pain I always feel? 