
//var _name	= my_fighter.name;
//var _sprite = my_fighter.sprite;
//var _hp		= my_fighter.hp;
//var _max_hp = my_fighter.max_hp;
var _text_offset = 50;
var healthbar_w = 3 * my_fighter.max_hp;
var healthbar_h = 15;
draw_set_halign(fa_center);
draw_set_color(c_white);

//draw sprite
draw_sprite_ext(my_fighter.sprite,0,wave(x-5,x+5,2,0)+random_range(-shake_remain,shake_remain),y+random_range(-shake_remain,shake_remain),dir,1,0,c_white,1);

//draw name
draw_set_valign(fa_center);
draw_text(x,y-ORGAN_SPR_H/2-10,my_fighter.name);

//draw hp
draw_text(x,y-ORGAN_SPR_H/2-_text_offset-10,string(my_fighter.hp) + "/" + string(my_fighter.max_hp));
draw_sprite_stretched(spr_healthbar,0,x - healthbar_w/2,y-ORGAN_SPR_H/2-_text_offset,(my_fighter.hp/my_fighter.max_hp) * healthbar_w,healthbar_h);
draw_sprite_stretched(spr_healthbarbackground,0,x - healthbar_w/2,y-ORGAN_SPR_H/2-_text_offset,healthbar_w,healthbar_h);

//draw stats
draw_text(x,y+ORGAN_SPR_H/2,"speed: " + string(my_fighter.speed))
draw_text(x,y+ORGAN_SPR_H/2+_text_offset, "accuracy: " + string(my_fighter.accuracy));

draw_reset();