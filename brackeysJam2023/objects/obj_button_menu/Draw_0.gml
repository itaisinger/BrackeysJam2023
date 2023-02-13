draw_set_font(font);

//draw panel
draw_set_alpha(state == BUTTON_STATES.natural ? 0 : 0.4);
draw_panel(x,y, sprite_width,sprite_height, current_col,current_col,outline_w, c_black);

//draw text
draw_set_alpha(1);
draw_set_color(current_text_col);
draw_set_valign(fa_top);
draw_text_scribble(x+margin+outline_w+2,y+margin+outline_w+3,text);

draw_reset();