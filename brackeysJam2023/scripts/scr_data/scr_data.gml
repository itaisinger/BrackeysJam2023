/// attack speeds ///
enum ATT_SPEEDS{
	slowest = -100,
	
	slow = -20,
	
	normal = 0,
	
	fast = 20,
	
	priority = 100, //priority moves just add this value to their speed
	
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



/// ability scripts
global.map_abilities = ds_map_create();
global.map_abilities[? "heal"] = function(amnt)
{
	obj_combat.current_fighter.heal(amnt);	
}
global.map_abilities[? "speed up"] = function(amnt)
{
	obj_combat.current_fighter.speed += amnt;
}
global.map_abilities[? "add heal"] = function(amnt)
{
	obj_combat.current_fighter.add_item(global.map_items[?"heal"]);
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
global.map_items[? "heal"] = item("heal",0,function(){global.map_abilities[? "heal"](10)})

// attacks map
global.map_attacks = ds_map_create();
//					  data name					  ingame name						dmg type		speed				ability
global.map_attacks[? "cannon"]			= attack("almightly cannon of destruction",	50,	TYPES.none,	-20)
global.map_attacks[? "punch"]			= attack("punch",							10,	TYPES.hand)
global.map_attacks[? "sweep"]			= attack("sweep",							13,	TYPES.hand,	-40)
global.map_attacks[? "kick"]			= attack("kick",							15,	TYPES.leg,	ATT_SPEEDS.slow)
global.map_attacks[? "scrutinize"]		= attack("scrutinize",						8)
global.map_attacks[? "pow"]				= attack("pow",								5)
global.map_attacks[? "feet"]			= attack("feet",							7,	TYPES.leg)
global.map_attacks[? "fetus"]			= attack("fetus",							1,	TYPES.leg,	ATT_SPEEDS.priority)
global.map_attacks[? "grow"]			= attack("grow",							0,	TYPES.leg,	0,					global.map_abilities[?"add heal"])
global.map_attacks[? "thunder"]			= attack("zues's thuder",					20, TYPES.eye, -20)
global.map_attacks[? "charge cannon"]	= attack("charge cannon",					0,	TYPES.none,	0,					function(){global.map_abilities[?"charge"](global.map_attacks[?"cannon"])})

//type matchups
#macro SUPER_EFFECTIVE 3
#macro NOT_EFFECTIVE 0.3
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
	zombie,
	eye,
	leg,
}

global.list_fighters = ds_list_create();
global.list_fighters[|FIGHTERS.hand] =		base_fighter("handyman",	spr_hand,	70,	ATT_SPEEDS.fast,	TYPES.hand, [global.map_attacks[?"punch"],global.map_attacks[?"sweep"]], [global.map_items[? "heal"]], bhvr_random);
global.list_fighters[|FIGHTERS.eye] =		base_fighter("anxiety",		spr_eye,	50,	ATT_SPEEDS.normal,	TYPES.eye,	[global.map_attacks[?"scrutinize"]], [], bhvr_scroll);
global.list_fighters[|FIGHTERS.leg] =		base_fighter("leger",		spr_leg,	90,	ATT_SPEEDS.slow,	TYPES.leg,	[global.map_attacks[?"kick"]], [], bhvr_scroll);

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
	var rand = irandom(array_length(arr_attacks) + array_length(arr_items))
	return rand < arr_attacks ? arr_attacks[rand] : arr_items[rand - array_length(arr_attacks)];
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