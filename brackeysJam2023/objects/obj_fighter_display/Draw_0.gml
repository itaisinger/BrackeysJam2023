
//var _name	= my_fighter.name;
//var _sprite = my_fighter.sprite;
//var _hp		= my_fighter.hp;
//var _max_hp = my_fighter.max_hp;
var _xs = 1;
var _text_offset = 50;

draw_set_halign(fa_center);
draw_set_color(c_white);
var _spr_h = sprite_get_height(my_fighter.sprite);

//draw sprite
draw_sprite_ext(my_fighter.sprite,0,wave(x-5,x+5,2,0),y,_xs/2,1/2,-90,c_white,1);

//draw name
draw_set_valign(fa_center);
draw_text(x,y-_spr_h/3-10,my_fighter.name);

//draw hp
draw_text(x,y-_spr_h/3-_text_offset,string(my_fighter.hp) + "/" + string(my_fighter.max_hp));

//would this shake work?
function shake()
{
	draw_sprite_ext(my_fighter.sprite,0,wave(x-2,x+2,0.5,0),wave(y-2,y+2,0.5,0),1,1,wave(-15,15,0.5,0),c_white,1);
}
draw_reset();