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
		damage	: function(dmg){hp = max(0,hp-dmg)},
		heal	: function(amnt){hp = min(max_hp,hp+amnt)},
		add_item: function(_item){
			if(array_length(arr_items) >= 4) return false;
			array_push(arr_items,_item);
			return true;
		}
	}
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
global.map_attacks[? "charge cannon"] = attack("charge cannon",0,0,function(){global.map_abilities[?"charge"](global.map_attacks[?"cannon"])})

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