/*/
this object is sent sprites from fighter structs, and handles merging them on draw events.
/*/

queue_merges = ds_queue_create();

function get_merged_sprite(_fighter,_sprite)
{
	///@param fighter
	///@param sprite
	
	//to place the organs correctly, use the grid_organs_places. 
	
	//make sure the fighter has a grid, and init one otherwise
	if(!variable_struct_exists(_fighter,"grid_organ_places"))
	{
		_fighter.grid_organ_places = ds_grid_create(5,5);
		ds_grid_clear(_fighter.grid_organ_places,-1);
		_fighter.grid_organ_places[# 2,2] = _fighter.sprite;
	}
	var _grid = _fighter.grid_organ_places;
	var _gridw = ds_grid_width(_grid);
	var _gridh = ds_grid_height(_grid);
	
	//gather ok positions
	var _ok_pos = [];
	for (var i = 0; i < _gridw; ++i) {
	    for (var j = 0; j < _gridh; ++j) {
		    if(
				(i > 0			and (_grid[# i-1, j] != -1))	//left
			or	(i < _gridw-1	and (_grid[# i+1, j] != -1))	//right
			or	(j > 0			and (_grid[# i, j-1] != -1))	//left
			or	(j < _gridh-1	and (_grid[# i, j+1] != -1))	//right
			) and (_grid[# i,j] == -1)
			
				array_insert(_ok_pos,array_length(_ok_pos),[i,j]);
		}
	}
	
	//roll a position 
	var _rand = _ok_pos[irandom(array_length(_ok_pos)-1)]
	
	_grid[# _rand[0],_rand[1]] = _sprite;
	
	//add fighter to queueu
	ds_queue_enqueue(queue_merges,_fighter);
}