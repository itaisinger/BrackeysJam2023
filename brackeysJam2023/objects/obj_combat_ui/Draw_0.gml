//draw main text
draw_set_alpha(main_text_a)
draw_set_font(font_main_text);
var _pos = positions.main_text;
draw_panel(_pos[0],_pos[1],500,60,c_col1,c_col1);
draw_text_scribble(_pos[0]+10,_pos[1]+10,current_main_text,typer_count);

draw_reset();