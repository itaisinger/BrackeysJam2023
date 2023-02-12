function fighter(_name, _sprite, _hp, _speed, _attacks, _items) constructor
{
	///@param name
	///@param sprite
	///@param hp
	///@param speed
	///@param attacks
	///@param items
	return {
		name: _name,
		sprite: _sprite,
		hp: _hp,
		speed: _speed,
		arr_attacks: _attacks,
		arr_items: _items,
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
function item(_name, _sprite_num, _script)
{
	///@param name
	///@param sprite_index
	///@param script
	
	return {
		name: _name,
		sprite: _sprite_num,
		script: _script,
	}
}