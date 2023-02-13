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
		damage	: function(dmg,_type=TYPES.none)		//returns how much damage was done
		{	
			//loop through types and add to the total:	(base_dmg/types_num)*type_effectiveness
			var hpprev = hp;
			var _dmg_todo = 0;
			
			for (var i = 0; i < TYPES_NUM; ++i) {
			    _dmg_todo += (dmg/TYPES_NUM)*get_type_damage(_type,arr_types[i])
			}
			
			//deal damage
			hp = max(0,hp-_dmg_todo);

			//return damage dealt
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
function attack(_name, _damage,  _type=TYPES.none,_speed_add=0, _ability=function(){}) constructor
{
	///@param name
	///@param damage
	///@param type
	///@param speed_add
	///@param ability_script
	
	return {
		name: _name,
		damage: _damage,
		speed_add: _speed_add,
		type : _type,
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


//// combat management scripts ////
function get_type_damage(_attack,_fighter)
{
	///@param attack_type
	///@param fighter_type  
	if(_attack == TYPES.none or _fighter == TYPES.none)
		return 1;
		
	log(global.type_matchups[# _attack,_fighter])
	return global.type_matchups[# _attack,_fighter];
	
}

