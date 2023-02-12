
draw_set_halign(fa_center);

//draw player
var _player = global.player_struct;
var _pos = positions.player;
draw_sprite(_player.sprite,0,_pos[0],_pos[1]);
draw_set_valign(fa_bottom);
draw_text(_pos[0],_pos[1]-sprite_get_height(_player.sprite)-3,_player.name);
draw_set_valign(fa_top);
draw_text(_pos[0],_pos[1],"hp: " + string(_player.hp) + "/" + string(_player.max_hp))

//draw enemy
var _nme = global.nme_struct;
_pos = positions.nme;
draw_sprite_ext(_nme.sprite,0,_pos[0],_pos[1],-1,1,0,c_white,1);
draw_set_valign(fa_bottom);
draw_text(_pos[0],_pos[1]-sprite_get_height(_nme.sprite)-3,_nme.name);
draw_set_valign(fa_top);
draw_text(_pos[0],_pos[1],"hp: " + string(_nme.hp) + "/" + string(_nme.max_hp))

//draw main text
_pos = positions.main_text;
draw_panel(_pos[0],_pos[1],500,60,c_col1,c_col1);
draw_text_scribble(_pos[0]+10,_pos[1]+10,global.main_text);