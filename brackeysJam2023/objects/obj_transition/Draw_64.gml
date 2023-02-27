var _img = round(lerp(0,image_number-1,trans_prec));
draw_sprite_stretched(spr_transition,_img,0,0,display_get_gui_width(),display_get_gui_height());

//draw_text(5,5,trans_prec);
//log(string(trans_prec) + " : " + string(_img));