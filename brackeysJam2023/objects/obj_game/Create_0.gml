game_init();

var _m = instance_create_depth(x,y,0,obj_player_menu);

var _player = fighter("yossi",spr_hand,100,10,
					[attack("pow",5),attack("zues's thuder",20,ATT_SPEEDS.slow)],
					[item("messanger",0)])
	
_m.set_player(_player);