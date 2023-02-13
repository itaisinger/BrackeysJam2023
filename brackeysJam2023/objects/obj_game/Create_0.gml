game_init();

global.main_text = "";

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


/// methods, api.

function start_run()
{
	
}
function combat_won()
{

}
function combat_lost()
{

}