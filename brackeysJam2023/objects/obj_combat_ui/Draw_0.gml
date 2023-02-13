


//draw fighters
var _fighter = global.player_struct
var _pos = positions.player;
var _xs = 1;

repeat(2)
{
	draw_set_halign(fa_center);
	var _spr_h = sprite_get_height(_fighter.sprite);
	var _spr_w = sprite_get_width(_fighter.sprite);
	
	//draw sprite
	draw_sprite_ext(_fighter.sprite,0,_pos[0],_pos[1],_xs,1,0,c_white,1);
	
	//name
	draw_set_valign(fa_bottom);
	draw_text(_pos[0],_pos[1]-_spr_h-3,_fighter.name);
	
	//hp
	draw_set_valign(fa_top);
	draw_text(_pos[0],_pos[1],string(_fighter.hp) + "/" + string(_fighter.max_hp))

	draw_set_halign(fa_left)
	var _m = string_height("hi")+2
	var _types = ["hand","eye","leg"];
	for(var i=0; i < 3; i++)
		draw_text(_pos[0] + _spr_w,_pos[1]+_m*i - _spr_h,_types[i] + ": " + string(_fighter.arr_types[i]));

	//set enemy
	_fighter = global.nme_struct
	_pos = positions.nme;
	_xs = -1;
}


//draw main text
_pos = positions.main_text;
draw_panel(_pos[0],_pos[1],500,60,c_col1,c_col1);
draw_text_scribble(_pos[0]+10,_pos[1]+10,current_main_text,typer_count);
draw_text(500,2,ds_queue_size(global.queue_messages))