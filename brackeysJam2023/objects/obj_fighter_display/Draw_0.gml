/// @description Insert description here
// You can write your code in this editor
var _name = name;
var _sprite = sprite;
var _hp = hp;
var _max_hp = max_hp;
var _xs = 1;
var _text_offset = 50;

draw_set_halign(fa_center);
draw_set_color(c_white);
var _spr_h = sprite_get_height(_sprite);

//draw sprite
draw_sprite_ext(_sprite,0,wave(x-5,x+5,2,0),y,_xs/2,1/2,-90,c_white,1);

//draw name
draw_set_valign(fa_center);
draw_text(x,y-_spr_h/3-10,_name);

//draw hp
draw_text(x,y-_spr_h/3-_text_offset,string(_hp) + "/" + string(_max_hp));