game_init();
/// attack speeds ///
enum ATT_SPEEDS{
	slowest = -100,
	
	slow = -20,
	
	normal = 0,
	
	fast = 20,
	
	priority = 100, //priority moves just add this value to their speed
	
}
enum ATT_ACC{
	low		= 70,
	mid		= 80,
	high	= 90,
}

enum TYPES{
	hand,
	eye,
	leg,
	
	torso,
	mouth,
	
	none,
}
#macro TYPES_NUM 3

enum FIGHTER_ACC{
	low = 70,
	mid = 100,
	high = 130,
}
#macro CRIT_CHANCE 0.1
//#macro MISS_CHANCE 0.05
#macro CRIT_MULT 1.5

///sound effect arrays
global.map_sounds = ds_map_create();
global.map_sounds[? "hit"] = [sfx_hit1, sfx_hit2, sfx_hit3];
global.map_sounds[? "heal"] = [sfx_heal];
global.map_sounds[? "crit"] = [sfx_crit];
global.map_sounds[? "drumroll"] = [sfx_drumroll];
global.map_sounds[? "laser"] = [sfx_laser1, sfx_laser2];
global.map_sounds[? "merge"] = [sfx_merge1, sfx_merge2, sfx_merge3, sfx_merge4, sfx_merge5];
global.map_sounds[? "explosion"] = [sfx_explosion];
/// ability scripts
global.map_abilities = ds_map_create();
global.map_abilities[? "heal"] = function(amnt=10)
{
	obj_combat.current_fighter.heal(amnt);	
}
global.map_abilities[? "speed up"] = function(amnt=10)
{
	obj_combat.current_fighter.speed += amnt;
}
global.map_abilities[? "lower nme speed"] = function(amnt=10)
{
	obj_combat.current_nme.speed -= amnt;	
}
global.map_abilities[? "add heal"] = function(amnt=10)
{
	obj_combat.current_fighter.add_item(global.map_items[?"heal"]);
}
global.map_abilities[? "add fuel"] = function(amnt=20)
{
	obj_combat.current_fighter.speed += amnt;
}
global.map_abilities[? "charge"] = function(_attack)
{
	///@param attack
	
	//replace get_action
	with(obj_combat.current_fighter)
	{
		previous_bhvr = get_action;
		charged_attack = _attack;
		get_action = function(){
			get_action = previous_bhvr;
			return charged_attack;
		}
	}
}

// items map
global.map_items = ds_map_create();
global.map_items[? "heal"] = item("heal",0,function(){global.map_abilities[? "heal"](10)},global.map_sounds[?"heal"])

// attacks map
global.map_attacks = ds_map_create();
//					  data name					  ingame name						dmg type		speed	  sound   	                  accuracy	   ability
global.map_attacks[? "cannon2"]			= attack("almightly cannon of destruction",	100,TYPES.none,	20,		global.map_sounds[?"explosion"])
global.map_attacks[? "cannon"]			= attack("almightly cannon",				20,	TYPES.none,	0,		global.map_sounds[?"explosion"] ,80)
global.map_attacks[? "punch"]			= attack("punch",							10,	TYPES.hand, 0,		global.map_sounds[?"hit"])
global.map_attacks[? "sweep"]			= attack("sweep",							13,	TYPES.hand,	-40,	global.map_sounds[?"hit"])
global.map_attacks[? "kick"]			= attack("kick",							13,	TYPES.leg,	ATT_SPEEDS.slow, global.map_sounds[?"hit"])
global.map_attacks[? "scrutinize"]		= attack("scrutinize",						9,	TYPES.eye,	0,		global.map_sounds[?"laser"],	   110)
global.map_attacks[? "pow"]				= attack("pow",								5,  TYPES.none, 0,		global.map_sounds[?"hit"])
global.map_attacks[? "feet"]			= attack("feet",							7,	TYPES.leg,  0,		global.map_sounds[?"hit"])
global.map_attacks[? "fetus"]			= attack("fetus",							1,	TYPES.leg,	ATT_SPEEDS.priority, global.map_sounds[?"hit"])
global.map_attacks[? "grow"]			= attack("grow",							0,	TYPES.leg,	0,		global.map_sounds[?"heal"],      100,			global.map_abilities[?"add heal"])
global.map_attacks[? "thunder"]			= attack("zues's thuder",					20, TYPES.eye, -20,		global.map_sounds[?"explosion"])
global.map_attacks[? "laser beam"]		= attack("laser beam",						5,	TYPES.eye,  ATT_SPEEDS.priority, global.map_sounds[?"laser"])
global.map_attacks[? "run over"]        = attack("run over",                        12, TYPES.leg,	ATT_SPEEDS.slow, global.map_sounds[?"hit"])
global.map_attacks[? "add fuel"]		= attack("add fuel",						0,	TYPES.none, 0,		global.map_sounds[?"heal"],	    100,			global.map_abilities[? "add fuel"])
global.map_attacks[? "plunge"]          = attack("plunge",                          8,  TYPES.hand, 0,		global.map_sounds[?"hit"],       100,			function(){global.map_abilities[? "lower nme speed"](10)})
global.map_attacks[? "charge cannon"]	= attack("charge cannon",					0,	TYPES.none,	0,		global.map_sounds[?"explosion"],	100,			function(){global.map_abilities[?"charge"](global.map_attacks[?"cannon"])})

//type matchups
#macro SUPER_EFFECTIVE 2
#macro NOT_EFFECTIVE 0.5
global.type_matchups = ds_grid_create(TYPES_NUM,TYPES_NUM);
global.type_matchups[# TYPES.hand,	TYPES.eye]	= SUPER_EFFECTIVE;
global.type_matchups[# TYPES.hand,	TYPES.leg]	= NOT_EFFECTIVE;
global.type_matchups[# TYPES.eye,	TYPES.leg]	= SUPER_EFFECTIVE;
global.type_matchups[# TYPES.eye,	TYPES.hand] = NOT_EFFECTIVE;
global.type_matchups[# TYPES.leg,	TYPES.hand] = SUPER_EFFECTIVE;
global.type_matchups[# TYPES.leg,	TYPES.eye]	= NOT_EFFECTIVE;
global.type_matchups[# TYPES.leg,	TYPES.leg]	= 1;
global.type_matchups[# TYPES.hand,	TYPES.hand]	= 1;
global.type_matchups[# TYPES.eye,	TYPES.eye]	= 1;

// fighters list
enum FIGHTERS{
	hand,
	eye,
	leg,
	wheel,
	laser_visor,
	rocket,
	plumber,
	
	maxx,
}

global.list_fighters = ds_list_create();
global.list_fighters[|FIGHTERS.hand] =		base_fighter("handyman",	spr_hand1,	70,	ATT_SPEEDS.fast,	FIGHTER_ACC.mid,	TYPES.hand, [global.map_attacks[?"punch"],global.map_attacks[?"sweep"]], [global.map_items[? "heal"]], bhvr_random);
global.list_fighters[|FIGHTERS.eye] =		base_fighter("anxiety",		spr_eye1,	50,	ATT_SPEEDS.normal,	FIGHTER_ACC.high,	TYPES.eye,	[global.map_attacks[?"scrutinize"]], [], bhvr_scroll);
global.list_fighters[|FIGHTERS.leg] =		base_fighter("leger",		spr_leg1,	90,	ATT_SPEEDS.slow,	FIGHTER_ACC.low,	TYPES.leg,	[global.map_attacks[?"kick"]], [], bhvr_scroll);
global.list_fighters[|FIGHTERS.wheel] =		base_fighter("wheelie",		spr_wheel,	70,	ATT_SPEEDS.slow-10,	FIGHTER_ACC.mid,	TYPES.leg,	[global.map_attacks[?"add fuel"],global.map_attacks[?"run over"]], [], bhvr_scroll);
global.list_fighters[|FIGHTERS.laser_visor]=base_fighter("vetamerse",   spr_visor,  60, ATT_SPEEDS.fast,    FIGHTER_ACC.high,   TYPES.eye,  [global.map_attacks[?"laser beam"]], [], bhvr_scroll);
global.list_fighters[|FIGHTERS.rocket] =    base_fighter("boomy",       spr_rocket, 50, ATT_SPEEDS.slow,    FIGHTER_ACC.mid,    TYPES.hand, [global.map_attacks[?"charge cannon"]], [], bhvr_scroll);
global.list_fighters[|FIGHTERS.plumber] =   base_fighter("plumber",     spr_plunger,60, ATT_SPEEDS.normal,  FIGHTER_ACC.mid,    TYPES.hand, [global.map_attacks[?"plunge"]], [], bhvr_scroll);

function get_fighters_by_type(type) //returns fighters index, not the fighters themselves
{
	var _ret = []
	
	for(var i=0; i < ds_list_size(global.list_fighters); i++)
	{
		if(global.list_fighters[|i].get_main_type() == type)
			array_add(_ret,i);
	}
	
	return _ret;
}

#region action choosing behaviors

//essentially these are functions you assign in the get_action parameter of enemy structs.

//player
function bhvr_player()	//trigger the player menu to activate
{
	var index = obj_player_menu.get_action_index();
	var att_num = array_length(arr_attacks);
	
	//return attack
	if(index < att_num)
	{
		return arr_attacks[index];
	}
	//use item
	else
	{
		var _ret = arr_items[index-att_num];
		array_delete(arr_items,index-att_num,1);
		return _ret;
	}
}

//enemy ai
function bhvr_random()	//choose a random attack or item
{
	var rand = irandom(array_length(arr_attacks) + array_length(arr_items)-1)
	return rand < array_length(arr_attacks) ? arr_attacks[rand] : arr_items[rand - array_length(arr_attacks)];
}
function bhvr_scroll()	//scroll through all the attacks in a loop
{
	//init
	if(!variable_struct_exists(self,"scroll"))
		scroll = -1;
	
	//scroll
	scroll++;
	
	//loop back
	if(scroll >= array_length(arr_attacks))
		scroll = 0;
		
	//return
	return arr_attacks[scroll];
}

//specials


#endregion