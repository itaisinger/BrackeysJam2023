///@desc do merges

while(ds_queue_size(queue_merges))
{
	//init surface
	var _sur = surface_create(FIGHTER_SPR_W,FIGHTER_SPR_H);
	surface_set_target(_sur);
	
	//loop through sprites
	var _fighter = ds_queue_dequeue(queue_merges);
	var _grid = _fighter.grid_organ_places;
	var _gridw = ds_grid_width(_grid);
	var _gridh = ds_grid_height(_grid);
	var _scale, _flipx, _flipy, _rot, _pos;
	for (var i = 0; i < _gridw; ++i) {
	    for (var j = 0; j < _gridh; ++j) {
		    
			//roll vars
			_scale = random_range(0.4,0.9);
			_flipx = choose(-1,1);
			_flipy = choose(-1,1);
			_rot = random(360);
			
			//pos
			_pos = [i * (FIGHTER_SPR_W/_gridw),j * (FIGHTER_SPR_H/_gridh)];
			_pos = [(_pos[0] + FIGHTER_SPR_W)/2,(_pos[1] + FIGHTER_SPR_H)/2];
			
			//draw
			if(_grid[# i,j] != -1)
			draw_sprite_ext(_grid[# i,j], 0, _pos[0],_pos[1], _scale*_flipx, _scale*_flipy, _rot,c_white,1);
		}
	}
	
	//save
	var _spr = sprite_create_from_surface(_sur,0,0,FIGHTER_SPR_W,FIGHTER_SPR_H,0,0,FIGHTER_SPR_W/2,FIGHTER_SPR_H/2);
	sprite_save(_spr,0,"hi.png");
	_fighter.set_sprite(_spr);
	
	surface_reset_target();
	surface_free(_sur);
}