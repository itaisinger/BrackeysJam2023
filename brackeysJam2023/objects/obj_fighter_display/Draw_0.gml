draw_set_font(font_fighter);

var _text_offset = 50;
var healthbar_w = 3 * my_fighter.max_hp;
var healthbar_h = 15;
draw_set_halign(fa_center);
draw_set_color(my_fighter.color);

//draw sprite
var _x = x + dir*(wave(-wave_range,wave_range,2,0) + 1.5*animcurve_channel_evaluate(animcurve_get_channel(animcurve_get(cur_hit),0),hit_prec));
draw_sprite_ext(my_fighter.sprite,0,_x+random_range(-shake_remain,shake_remain),y+random_range(-shake_remain,shake_remain),dir*xscale,yscale,0,c_white,1);

//draw name
draw_set_valign(fa_center);
draw_text_outlined(x,y-ORGAN_SPR_H/2-10,my_fighter.name,my_fighter.color,merge_color(my_fighter.color,c_black,0.5));

//draw hp
draw_set_font(font_hp);
draw_set_valign(fa_middle);
draw_sprite_stretched(spr_healthbar,0,x - healthbar_w/2,y-ORGAN_SPR_H/2-_text_offset,(my_fighter.hp/my_fighter.max_hp) * healthbar_w,healthbar_h);
draw_sprite_stretched(spr_healthbarbackground,0,x - healthbar_w/2,y-ORGAN_SPR_H/2-_text_offset,healthbar_w,healthbar_h);
draw_text_outlined(x,y-ORGAN_SPR_H/2 - _text_offset,string(my_fighter.hp) + "/" + string(my_fighter.max_hp),c_red,merge_color(c_black,c_red,0.5));

//draw stats
_text_offset = string_height("g") + 3;
draw_text_outlined(x,y+ORGAN_SPR_H/2,"speed: " + string(my_fighter.speed),col,o_col)
draw_text_outlined(x,y+ORGAN_SPR_H/2+_text_offset, "accuracy: " + string(my_fighter.accuracy),col,o_col);


draw_reset();