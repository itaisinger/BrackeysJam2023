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
		speed: _speed,
		arr_attacks: _attacks,
		arr_items: _items,
		damage : function(dmg){hp = max(0,hp-dmg)},
		get_action : _action,
	}
}
function attack(_name, _damage, _speed_add=0, _ability=function(){})
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
function item(_name, _sprite_num, _script, _damage=0)
{
	///@param name
	///@param sprite_index
	///@param script
	///@param damage
	
	return {
		name: _name,
		sprite: _sprite_num,
		ability_script: _script,
		damage: _damage,
	}
}