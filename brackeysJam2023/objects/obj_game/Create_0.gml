
game_init();
randomise();

//text:
//global.player_struct = fighter("yossi",spr_hand1,100,10,FIGHTER_ACC.mid,
//					[global.map_attacks[?"jab"],global.map_attacks[?"kick"],global.map_attacks[?"cannon"],global.map_attacks[?"scrutinize"]],
//					[item("messanger",0,function(){show_message("the messanger!")}),
//					item("heal",1,function(){global.map_abilities[?"heal"](10)},0,-20)],
//					bhvr_player);

global.player_struct = create_base_fighter(FIGHTERS.hand);
global.player_struct.get_action = bhvr_player;
global.player_struct.dmg_mult = 1.1;
global.player_struct.color = c_col3;
//global.player_struct.merge_stats(get_base_fighter(FIGHTERS.eye));
//global.player_struct.name = "moshe";
//global.player_struct.set_attack(global.map_attacks[?"cannon"],2);

global.nme_struct = -1;

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
		_max_merge += 0.8;
		ds_list_add(global.list_encounters,create_base_fighter(irandom(FIGHTERS.maxx-1)));
		
		repeat(irandom_range(max(0,floor(_max_merge-2)),floor(_max_merge)))
		{
			global.list_encounters[|ds_list_size(global.list_encounters)-1].merge_auto(get_base_fighter(irandom(FIGHTERS.maxx-1)),true);
		}
	}
	
	/// first enemy weak
	
	//get array of the corresponding fighters
	var _player_type = global.player_struct.get_main_type();
	var _fighters = [];
	switch(_player_type)
	{
		case TYPES.hand:
			_fighters = get_fighters_by_type(TYPES.eye);
			break;
		case TYPES.eye:
			_fighters = get_fighters_by_type(TYPES.leg);
			break;
		case TYPES.leg:
			_fighters = get_fighters_by_type(TYPES.hand);
			break;
	}
	
	//apply one of them as the first enemy
	global.list_encounters[|0] = create_base_fighter(_fighters[irandom(array_length(_fighters)-1)]);
	
	
	//boss
	var _boss = global.list_encounters[|ds_list_size(global.list_encounters)-1];
	_boss.name += " boss";
	repeat(4)
	{
		_boss.merge_auto(get_base_fighter(irandom(FIGHTERS.maxx-1)));
	}
	
}


/// methods, api.

function start_run()
{
	global.current_floor = 0;
	
	//loading screen
	var _fx = create_vfx(room_width/2,room_height/2,spr_loading,3)
	_fx.image_speed = 0;
	
	alarm[0] = 1;
	room_transition(rm_map);
}
function start_combat()
{
	global.nme_struct = global.list_encounters[|global.current_floor]
	room_transition(rm_combat);
}
function combat_won()
{
	global.current_floor++;
	//global.player_struct.heal_relative(0.1);
	
	//end game
	if(global.current_floor >= ds_list_size(global.list_encounters))
	{
		room_transition(rm_win);
	}
	//continute to next floor
	else
	{
		room_transition(rm_map);
	}
}
function combat_lost()
{
	room_transition(rm_end);
}
function start_merge()
{
	room_transition(rm_merge);
}
function finish_merge()
{
	combat_won();
}
function finish_run()
{
	global.player_struct = global.nme_struct;
	global.player_struct.hp = global.player_struct.max_hp;
	global.player_struct.get_action = bhvr_player;
	
	room_transition(rm_menu);
}
function win_run()
{
	global.player_struct.hp = global.player_struct.max_hp;
	
	room_transition(rm_menu);
}