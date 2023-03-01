/// @description draw_text_outlined(x, y, string, colour, outline_colour)
/// @param x
/// @param  y
/// @param  string
/// @param  colour
/// @param  outline_colour
function draw_text_outlined(argument0, argument1, argument2, argument3, argument4) {
	var xx = argument0;
	var yy = argument1;
	var str = argument2;
	var _col_prev = draw_get_color();
	draw_set_colour(argument4);
	draw_text(xx-1, yy, string_hash_to_newline(str));
	draw_text(xx+1, yy, string_hash_to_newline(str));
	draw_text(xx, yy-1, string_hash_to_newline(str));
	draw_text(xx, yy+1, string_hash_to_newline(str));
	draw_set_colour(argument3);
	draw_text(xx, yy, string_hash_to_newline(str));
	draw_set_colour(_col_prev);
}
