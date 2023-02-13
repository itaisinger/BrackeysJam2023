game_init();

//text:
global.player_struct = fighter("yossi",spr_hand,100,10,
					[global.map_attacks[?"punch"],global.map_attacks[?"kick"],global.map_attacks[?"grow"],global.map_attacks[?"charge cannon"]],
					[item("messanger",0,function(){show_message("the messanger!")}),
					item("heal",1,function(){global.map_abilities[?"heal"](10)},0,-20)],
					bhvr_player);

global.nme_struct = fighter("bungalos",spr_zombie,100,7,
					[global.map_attacks[?"feet"],global.map_attacks[?"fetus"]],
					[],
					bhvr_scroll);

global.player_struct.merge_child(get_base_fighter(FIGHTERS.eye));
global.player_struct.merge_child(get_base_fighter(FIGHTERS.hand));
global.player_struct.merge_child(get_base_fighter(FIGHTERS.hand));
global.player_struct.merge_child(get_base_fighter(FIGHTERS.hand));
global.player_struct.merge_child(get_base_fighter(FIGHTERS.hand));
global.nme_struct.merge_child(get_base_fighter(FIGHTERS.hand));
global.nme_struct.merge_child(get_base_fighter(FIGHTERS.eye));

//create objs
instance_create_depth(x,y,0,obj_mouse);


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
	repeat(10)
	{
		ds_list_add(global.list_encounters,get_base_fighter(irandom(FIGHTERS.maxx-1)));
	}
}


/// methods, api.

function start_run()
{
	generate_run();
	room_goto(rm_map);
}
function combat_won()
{

}
function combat_lost()
{

}