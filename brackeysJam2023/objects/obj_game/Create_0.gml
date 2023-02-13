game_init();

global.main_text = "";

global.player_struct = fighter("yossi",spr_hand,100,10,
					[attack("pow",5),attack("zues's thuder",20,ATT_SPEEDS.slow),attack("grow",0,0,global.map_abilities[?"add heal"]),global.map_attacks[?"charge cannon"]],
					[item("messanger",0,function(){show_message("the messanger!")}),
					item("heal",1,function(){global.map_abilities[?"heal"](10)},0,-20)],
					bhvr_player);

global.nme_struct = fighter("bungalos",spr_zombie,100,7,
					[attack("feet",5),attack("fetus",1,ATT_SPEEDS.priority)],
					[],
					bhvr_scroll);

global.player_struct.merge_child(get_base_fighter(FIGHTERS.eye));
global.player_struct.merge_child(get_base_fighter(FIGHTERS.leg));
global.nme_struct.merge_child(get_base_fighter(FIGHTERS.hand));
global.nme_struct.merge_child(get_base_fighter(FIGHTERS.eye));

//create objs
instance_create_depth(x,y,0,obj_player_menu);
instance_create_depth(x,y,0,obj_combat);
instance_create_depth(x,y,0,obj_combat_ui);

obj_combat.init();
