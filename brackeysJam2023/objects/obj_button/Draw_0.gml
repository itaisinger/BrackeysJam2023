if(is_gui) exit;

draw_set_font(font);

//draw panel
draw_panel(x,y, sprite_width,sprite_height, current_col,current_col,outline_w, c_black);

//draw text
draw_set_color(current_text_col);
draw_text_scribble(x+margin+outline_w,y+margin+outline_w,text);