// draw encounters
var _num = ds_list_size(list_encounters);
_margin = 100;
var _x = room_width/2;
var _y = room_height - 100 + _margin*global.current_floor;
for(var i=0; i < _num; i++)
{
	_y -= _margin;
	
	var _nme = list_encounters[|i];
	var _type = _nme.get_main_type()
	
	draw_set_color(c_col1_dark);
	draw_circle(_x,_y,50,0);
	
	draw_reset();
	draw_sprite(spr_types,_type,_x,_y)	
}

// draw player
draw_sprite_ext(player_struct.sprite,0,
				player.x,player.y,player.xscale,player.yscale,player.angle,c_white,1)