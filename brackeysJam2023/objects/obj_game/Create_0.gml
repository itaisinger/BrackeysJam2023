game_init();

global.main_text = "";

global.player_struct = fighter("yossi",spr_hand,100,10,
					[attack("pow",5),attack("zues's thuder",20,ATT_SPEEDS.slow)],
					[item("messanger",0,function(){show_message("the messanger!")}),],
					player_get_action);
					
global.nme_struct = fighter("bungalos",spr_zombie,100,7,
					[attack("feet",5),attack("fetus",1,ATT_SPEEDS.priority)],
					[],
					nme_scroll);

//create objs
instance_create_depth(x,y,0,obj_player_menu);
instance_create_depth(x,y,0,obj_combat);
instance_create_depth(x,y,0,obj_combat_ui);

obj_combat.init();