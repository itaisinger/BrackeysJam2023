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
global.map_abilities[? "heal"] = function heal(amnt)
{
	obj_combat.current_fighter.heal(amnt);	
}
//global.map_abilities[? "speed up"] = function