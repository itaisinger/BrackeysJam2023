

//find proper size
var _screenw = window_get_width();
var _screenh = window_get_height();
var _playerw = sprite_get_width(global.player_struct.sprite);
var _playerh = sprite_get_height(global.player_struct.sprite);

var _sizew = _screenw / _playerw;
var _sizeh = _screenh / _playerh;

size = min(_sizew,_sizeh)/2;

//surface
sur = -1;



function sur_init()
{
	var _screenw = window_get_width();
	var _screenh = window_get_height();
	sur = surface_create(_screenw,_screenh);
	surface_set_target(sur);

	//draw player sprite
	draw_sprite_ext(global.player_struct.sprite,0,room_width/2,room_height/2,size,size,0,c_white,1);

	surface_reset_target();
}