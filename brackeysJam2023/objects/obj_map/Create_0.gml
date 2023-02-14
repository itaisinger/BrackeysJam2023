
player_struct = global.player_struct;
list_encounters = global.list_encounters;

global.map_player = {
	x : room_width/2, 
	y : room_height-100,
	xscale : 1,
	yscale : 1,
	angle : 0,
	z : 0,
	}
player = global.map_player;

stage = 0;
arr_stage_functions = [];
stage_changed = 0;
enum MAP_STAGES{
	start,
	zoom_out,
	walk,
	endd,
}

arr_stage_functions[MAP_STAGES.start] = function()
{
	if(obj_camera.zoom == obj_camera.zoom_dest)
		stage = MAP_STAGES.zoom_out;
		
	player.xscale = wave(1.1,0.9,2,0);
	player.yscale = wave(0.9,1.1,2,0);
}
arr_stage_functions[MAP_STAGES.zoom_out] = function()
{
	//count eyes
	if(stage_changed)
	{
		eyes_remain = 0;
		var _children = player_struct.arr_children;
		for (var i = 0; i < array_length(_children); ++i) {
		    if(_children[i] == TYPES.eye)
				eyes_remain++;
		}
		
	}
	
	//zoom out again or finish stage
	if(obj_camera.zoom == obj_camera.zoom_dest)
	{
		if(eyes_remain > 0)
		{
			obj_camera.zoom_dest += 0.2;
			eyes_remain--;
		}
		else
		{
			stage = MAP_STAGES.walk;
		}
	}
	
	player.xscale = wave(1.1,0.9,2,0);
	player.yscale = wave(0.9,1.1,2,0);
}
arr_stage_functions[MAP_STAGES.walk] = function()
{
	if(stage_changed)
	{
		player.ydest = player.y - _margin;
	}
	
	player.y = approach(player.y,player.ydest, 0.5)
	
	player.xscale = wave(1.3,0.7,1,0);
	player.yscale = wave(0.7,1.3,1,0);
	player.angle = wave(-20,20,2,0);
	
	if(player.y == player.ydest)
		stage = MAP_STAGES.endd
}
arr_stage_functions[MAP_STAGES.endd] = function()
{
	if(stage_changed)
	{
		wait = 1;
		player.angle = 0;
	}
	
	wait = approach(wait,0,0.05);
	
	if(wait <= 0)
		obj_game.start_combat();
}


// methods
