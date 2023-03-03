function fighter(_name, _sprite, _hp, _speed, _accuracy, _attacks, _items, _action, _color) constructor
{
	///@param name
	///@param sprite
	///@param hp
	///@param speed
	///@param accuracy
	///@param attacks
	///@param items
	///@param behavior
	return {
		name: _name,
		sprite: _sprite,
		hp: _hp,
		max_hp : _hp,
		speed: _speed,
		accuracy: _accuracy,
		arr_attacks: deep_copy(_attacks),
		arr_items: deep_copy(_items),
		get_action : _action,
		color : _color,
		dmg_mult : 1,
		
		arr_types : array_create(3,0),	//array of 0-1 for each type, representing %.
		arr_children : [],				//children structs are inserted. used to calculate types.
		max_items : 1,
		
		//misc
		//arr_children_fighters_structs : [],	//base fighters are inserted when enemies are created, so their data could be used to merge with.
		
		//methods
		damage	: function(dmg,_type=TYPES.none)		//returns [how much dmg was to do, how much damage was done]
		{	
			//loop through types and add to the total:	base_dmg*type_effectiveness*how much of me is this type
			var hpprev = hp;
			var _dmg_todo = 0;
			
			for (var i = 0; i < TYPES_NUM; ++i) {
			    _dmg_todo += dmg*get_type_damage(_type,i)*arr_types[i]
			}
			
			//// all hail workarounds.
			var _eff_dmg = _dmg_todo;
			if(self == global.player_struct)
			{
				if(hp < max_hp * 0.2)
					_dmg_todo *= 0.7;
					
				while(	(_dmg_todo > max_hp * 0.7) or				//cant take away more than 60% of hp at once
						(_dmg_todo > hp and hp >= max_hp * 0.45)	//cant one shot from 45%
						)
				{
					_dmg_todo *= 0.95
				}
			}
			
			//deal damage
			hp = max(0,hp-_dmg_todo);
			
			//return damage dealt
			return [_eff_dmg,hpprev - hp];	
			},
		heal : function(amnt)	//returns how much hp was healed
			{
			var hpprev = hp;
			hp = min(max_hp,hp+amnt)
			return hp - hpprev;
			},
		heal_relative: function(precent) //returns how much hp was healed
		{
			///@param precent[0-1]
			var _to_heal = precent * max_hp;
			
			var _hpprev = hp;
			
			hp = min(max_hp,hp+_to_heal);
			
			return hp - _hpprev;
		},
		add_item: function(_item){	//returns whether the item was added or not
			if(array_length(arr_items) >= max_items) return false;
			array_push(arr_items,_item);
			return true;
		},
		merge_stats : function(child, auto_merge_sprites=0) //send in a fighter to merge it into me
		{	
			///@param child_fighter
			
			//hp
			var _hp_remain_prec = hp/max_hp;
			max_hp = ceil((max_hp + child.max_hp)/2);
			hp = max_hp * _hp_remain_prec;
			
			speed = (speed + child.speed)/2;
			accuracy = (accuracy + child.accuracy)/2
			
			array_push(arr_children,child);	
			
			update_types();
			//attacks and item merges are called by set_attack and set_item.
			
			//more item count for more hands
			if(child.type == TYPES.hand)
			{
				//count hands
				var _cnt = 0;
				for (var i = 0; i < array_length(arr_children); ++i) {
				    _cnt += arr_children[i].type == TYPES.hand;
				}
				
				max_items = _cnt+1;//min(4,2 + floor(_cnt/1.5));
				//0-1: 2
				//2: 3
				//4: 4
			}
			
			//sprite
			if(auto_merge_sprites)
				obj_sprite_merger.get_merged_sprite(self,child.sprite);
			
			//color
			color = merge_color(color,child.color,0.5);
			
			//name
			var _insert = string_copy(child.name,irandom(string_length(child.name)-2),2);
			name = string_insert(_insert,name,irandom(string_length(name)));
			
		},
		merge_auto : function(child)
		{
			//stats
			merge_stats(child);
			
			//sprite
			obj_sprite_merger.get_merged_sprite(self,child.sprite);
			
			//add attack or item
			var _att_num = array_length(child.arr_attacks), _item_num = array_length(child.arr_items);
			var _rand = irandom(_att_num + _item_num - 1);
			
			//take attack
			if(_rand < _att_num)
			{
				var _pos = array_length(arr_attacks);
				if(_pos >= MAX_ATTACKS)
					_pos = irandom(_pos-1);
					
				set_attack(child.arr_attacks[_rand],_pos);
			}
			//take item
			else
			{
				add_item(child.arr_items[_rand-_att_num]);
			}	
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
				_types_cnt[arr_children[i].type]++;
			}
			
			//loop through types.
			//for each type, the % is the value in the corresponding spot in the types_cnt arr divided by the total amount of children.
			for(var i=0; i < array_length(arr_types); i++)
			{
				arr_types[i] = _types_cnt[i] / _childs_num;
			}
		},
		get_main_type: function()
		{
			var _main_type = TYPES.none;
			var _max_prec = 0;

			for (var i = 0; i < TYPES_NUM; ++i) {
			    if(arr_types[i] > _max_prec)
					_main_type = i;
			}
			
			return _main_type;
		},
		set_sprite: function(_spr)
		{
			///@param new_sprite
			sprite = _spr;
		},
	}
}
function base_fighter(_name, _sprite, _hp, _speed, _accuracy, _type, _attacks, _items, _action, _color) constructor
{
	///@param name
	///@param sprite
	///@param hp
	///@param speed
	///@param accuracy
	///@param type
	///@param attacks
	///@param items
	///@param behavior
	
	var _f =  fighter(_name, _sprite, _hp, _speed, _accuracy, _attacks, _items, _action, _color)
	_f.type = _type
	_f.arr_children[0] = _f;
	_f.update_types();
	
	return _f;
}
function get_base_fighter(fighter_index) constructor
{
	return global.list_fighters[|fighter_index];
}
function create_base_fighter(fighter_index) constructor
{
	var source = global.list_fighters[|fighter_index];

	var copy = fighter(source.name,source.sprite,source.hp,source.speed,source.accuracy,
					   [],[],source.get_action, source.color);
					   
	array_copy(copy.arr_attacks,0,source.arr_attacks,0,array_length(source.arr_attacks))
	array_copy(copy.arr_items,0,source.arr_items,0,array_length(source.arr_items))
	
	copy.type = source.type;
	copy.merge_stats(source);
	return copy;
}
function attack(_name, _damage,  _type=TYPES.none,_speed_add=0, _sound, _acc=100, _ability=function(){}) constructor
{
	///@param name
	///@param damage
	///@param type
	///@param speed_add
	///@param sound
	///@param accuracy
	///@param ability_script
	
	return {
		name: _name,
		damage: _damage,
		speed_add: _speed_add,
		type : _type,
		ability_script: _ability,
		accuracy: _acc,
		sound: _sound
	}
}
function item(_name, _sprite_num, _script, _sound, _damage=0, _spd=0, _acc=100) constructor
{
	///@param name
	///@param vfx
	///@param script
	///@param sound
	///@param damage
	///@param speed_add
	///@param accuracy
	
	return {
		name: _name,
		vfx: _sprite_num,
		ability_script: _script,
		damage: _damage,
		speed_add: _spd,
		type : TYPES.none,
		accuracy: _acc,
		sound: _sound
	}
}


//// combat management scripts ////
function get_type_damage(_attack,_fighter)
{
	///@param attack_type
	///@param fighter_type  
	if(_attack == TYPES.none or _fighter == TYPES.none)
		return 1;
		
	return global.type_matchups[# _attack,_fighter];
	
}
