game_init();
randomise();

//text:
global.player_struct = fighter("yossi",spr_hand1,100,10,FIGHTER_ACC.mid,
					[global.map_attacks[?"punch"],global.map_attacks[?"kick"],global.map_attacks[?"cannon"],global.map_attacks[?"scrutinize"]],
					[item("messanger",0,function(){show_message("the messanger!")}),
					item("heal",1,function(){global.map_abilities[?"heal"](10)},0,-20)],
					bhvr_player);

global.nme_struct = -1;

global.player_struct.merge_child(get_base_fighter(FIGHTERS.eye));
global.player_struct.merge_child(get_base_fighter(FIGHTERS.hand));
global.player_struct.merge_child(get_base_fighter(FIGHTERS.hand));
global.player_struct.merge_child(get_base_fighter(FIGHTERS.hand));
global.player_struct.merge_child(get_base_fighter(FIGHTERS.hand));

//create objs
instance_create_depth(x,y,0,obj_mouse);
instance_create_depth(x,y,0,obj_sprite_merger);

/*/
globals to set:
list_encounters
current_floor

/*/

/// private functions

function generate_run()
{
	ds_list_destroy(global.list_encounters);
	global.list_encounters = ds_list_create();
	var _max_merge = 0;
	repeat(10)
	{
		_max_merge += 0.4;
		ds_list_add(global.list_encounters,create_base_fighter(irandom(FIGHTERS.maxx-1)));
		
		repeat(irandom_range(max(0,floor(_max_merge-2)),floor(_max_merge)))
		{
			global.list_encounters[|ds_list_size(global.list_encounters)-1].merge_child(get_base_fighter(irandom(FIGHTERS.maxx-1)),true);
		}
	}
}


/// methods, api.

function start_run()
{
	global.current_floor = 0;
	generate_run();
	room_goto(rm_map);
}
function start_combat()
{
	obj_music.change_music(ost_combat);
	global.nme_struct = global.list_encounters[|global.current_floor]
	room_goto(rm_combat);
}
function combat_won()
{
	obj_music.change_music(ost_menu);
	global.current_floor++;
	global.player_struct.heal_relative(0.1);
	
	//end game
	if(global.current_floor >= ds_list_size(global.list_encounters))
	{
		room_goto(rm_win);
	}
	//continute to next floor
	else
	{
		room_goto(rm_map);
	}
}
function combat_lost()
{
	room_goto(rm_end);
}
function start_merge()
{
	obj_music.change_music(ost_menu);
	room_goto(rm_merge);
}
function finish_merge()
{
	combat_won();
}
function finish_run()
{
	global.player_struct = global.nme_struct;
	global.player_struct.hp = global.player_struct.max_hp;
	
	room_goto(rm_menu);
}
function win_run()
{
	global.player_struct.hp = global.player_struct.max_hp;
	
	room_goto(rm_menu);
}