function fighter(_name, _sprite, _hp, _speed, _attacks, _items, _action) constructor
{
	///@param name
	///@param sprite
	///@param hp
	///@param speed
	///@param attacks
	///@param items
	///@param behavior
	return {
		name: _name,
		sprite: _sprite,
		hp: _hp,
		max_hp : _hp,
		speed: _speed,
		arr_attacks: _attacks,
		arr_items: _items,
		get_action : _action,
		
		arr_types : array_create(3,0),	//array of 0-1 for each type, representing %.
		arr_children : [],
		max_items : 1,
		
		//methods
		damage	: function(dmg)		//returns how much damage was done
		{	
			var hpprev = hp;
			hp = max(0,hp-dmg)
			
			return hp - hpprev;	
			},
		heal	: function(amnt)	//returns how much hp was healed
			{
			var hpprev = hp;
			hp = min(max_hp,hp+amnt)
			return hp - hpprev;
			},
		add_item: function(_item){	//returns whether the item was added or not
			if(array_length(arr_items) >= 4) return false;
			array_push(arr_items,_item);
			return true;
		},
		merge_child : function(child) //send in a fighter to merge it into me
		{	
			///@param child_fighter
			
			//hp
			var _hp_remain_prec = hp/max_hp;
			max_hp = ceil((max_hp + child.max_hp)/2);
			hp = max_hp * _hp_remain_prec;
			
			speed = (speed + child.speed)/2;
			array_push(arr_children,child.type);	//will crash if trying to merge a non base fighter.
			update_types();
			//attacks and item merges are called by set_attack and set_item.
			
			//put here code about more item count for more hands
		},
		set_attack : function(_attack,_pos)
		{
			///@param attack
			///@param position
			arr_attacks[_pos] = _attack;
		},
		set_item : function(_item,_pos)	//set item. override current items
		{
			///@param item
			///@param position
			arr_items[_pos] = _item;
		},
		update_types : function()	//just loop through the child_arr and update the types_arr
		{
			/*/
			create a temp array of how many are of each type
			/*/
			var _childs_num = array_length(arr_children)
			var _types_cnt = array_create(TYPES_NUM,0);
			for(var i=0; i < _childs_num; i++)
			{
				_types_cnt[arr_children[i]]++;
			}
			
			//loop through types.
			//for each type, the % is the value in the corresponding spot in the types_cnt arr divided by the total amount of children.
			for(var i=0; i < array_length(arr_types); i++)
			{
				arr_types[i] = _types_cnt[i] / _childs_num;
			}
		},
	}
}
function base_fighter(_name, _sprite, _hp, _speed, _type, _attacks, _items, _action) constructor
{
	///@param name
	///@param sprite
	///@param hp
	///@param speed
	///@param type
	///@param attacks
	///@param items
	///@param behavior
	
	var _f =  fighter(_name, _sprite, _hp, _speed, _attacks, _items, _action)
	_f.type = _type
	_f.arr_children[0] = _type;
	_f.update_types();
	
	return _f;
}
function get_base_fighter(fighter_index) constructor
{
	return global.list_fighters[|fighter_index];
}
function attack(_name, _damage, _speed_add=0, _ability=function(){}) constructor
{
	///@param name
	///@param damage
	///@param speed_add
	///@param ability_script
	
	return {
		name: _name,
		damage: _damage,
		speed_add: _speed_add,
		ability_script: _ability,
	}
}
function item(_name, _sprite_num, _script, _damage=0, _spd=0) constructor
{
	///@param name
	///@param sprite_index
	///@param script
	///@param damage
	///@param speed_add
	
	return {
		name: _name,
		sprite: _sprite_num,
		ability_script: _script,
		damage: _damage,
		speed_add: _spd,
	}
}

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
global.map_attacks[? "cannon"] = attack("almightly cannon of destruction",50,-20)
global.map_attacks[? "punch"] = attack("punch",10)
global.map_attacks[? "sweep"] = attack("sweep",13,-40)
global.map_attacks[? "kick"] = attack("kick",15,ATT_SPEEDS.slow)
global.map_attacks[? "scrutinize"] = attack("scrutinize",8)
global.map_attacks[? "charge cannon"] = attack("charge cannon",0,0,function(){global.map_abilities[?"charge"](global.map_attacks[?"cannon"])})


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