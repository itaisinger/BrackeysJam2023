
player_struct = global.player_struct;
list_encounters = global.list_encounters;
anim_spd = 0.26;

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
	
	player.xscale = approach(player.xscale,wave(1.05,0.95,2,0),anim_spd);
	player.yscale = approach(player.yscale,wave(0.95,1.05,2,0),anim_spd);
}
arr_stage_functions[MAP_STAGES.zoom_out] = function()
{
	//count eyes
	if(stage_changed)
	{
		eyes_remain = 0;
		var _children = player_struct.arr_children;
		for (var i = 0; i < array_length(_children); ++i) {
		    if(_children[i].type == TYPES.eye)
				eyes_remain++;
		}
		
	}
	
	//zoom out again or finish stage
	if(abs(obj_camera.zoom - obj_camera.zoom_dest) < 0.01)
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
	
	player.xscale = approach(player.xscale,wave(1.05,0.95,2,0),anim_spd);
	player.yscale = approach(player.yscale,wave(0.95,1.05,2,0),anim_spd);
}
arr_stage_functions[MAP_STAGES.walk] = function()
{
	if(stage_changed)
	{
		player.ystart = player.y;
		player.ydest = player.y - _margin;
		player.yprog = 0;
	}
	
	player.yprog = approach(player.yprog,1, 0.01)
	player.y = lerp(player.ystart,player.ydest, player.yprog)
	
	player.xscale = approach(player.xscale,wave(1.15,0.85,1,0),anim_spd);
	player.yscale = approach(player.yscale,wave(0.85,1.15,1,0),anim_spd);
	//player.angle = approach(player.angle,wave(-25,25,2,0),anim_spd);
	
	if(player.y == player.ydest)
		stage = MAP_STAGES.endd
}
arr_stage_functions[MAP_STAGES.endd] = function()
{
	player.xscale = approach(player.xscale,wave(1.05,0.95,2,0),anim_spd);
	player.yscale = approach(player.yscale,wave(0.95,1.05,2,0),anim_spd);
	player.angle = approach(player.angle,0,anim_spd*0.3);
	
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






