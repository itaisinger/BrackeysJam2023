

//find proper size
_screenw = window_get_width();
_screenh = window_get_height();
var _playerw = sprite_get_width(global.player_struct.sprite);
var _playerh = sprite_get_height(global.player_struct.sprite);

var _sizew = _screenw / _playerw;
var _sizeh = _screenh / _playerh;

size = min(_sizew,_sizeh)/2;

//surface
sur = -1;

trigger_finish = 0;

function sur_init()
{
	sur = surface_create(FIGHTER_SPR_W,FIGHTER_SPR_H);
	surface_set_target(sur);
	//draw_clear(c_red);
	//draw player sprite
	draw_sprite_ext(global.player_struct.sprite,0,FIGHTER_SPR_W/2,FIGHTER_SPR_H/2,1,1,0,c_white,1);


	surface_reset_target();
}

function finish()
{
	surface_set_target(sur);
	
	//add enemy to surface
	with(obj_merge_nme)
	{	
		x -= (other._screenw-FIGHTER_SPR_W)/2;
		y -= (other._screenh-FIGHTER_SPR_H)/2;
		draw_self();
	}
	surface_reset_target();
	
	//save sprite into the player
	var _spr = sprite_create_from_surface(sur,0,0,FIGHTER_SPR_W,FIGHTER_SPR_H,0,0,FIGHTER_SPR_W/2,FIGHTER_SPR_H/2);
	global.player_struct.set_sprite(_spr);
	
	//free
	surface_free(sur);
	
	obj_game.finish_merge();
}