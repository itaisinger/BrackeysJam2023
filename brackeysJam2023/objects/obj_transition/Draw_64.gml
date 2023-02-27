var _img = round(lerp(0,image_number,trans_prec));
draw_sprite_stretched(spr_transition,_img,0,0,display_get_gui_width(),display_get_gui_height());

if(trans_prec > 0.95)
{
	draw_rectangle_color(0,0,9999,9999,c_black,c_black,c_black,c_black,0);
}

log(string(trans_prec) + " : " + string(_img));