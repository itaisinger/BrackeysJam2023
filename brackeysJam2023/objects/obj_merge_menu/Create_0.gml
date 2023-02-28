/*/
this object handles the merge offer choices

merge? yes\no
choose organ
choose attack\item to take
choose spot to insert


buttons are created with the instance_create and a struct

there are menu lists that hold button data structs.
use change_menu(menu) to replace the current buttons with new oens.
/*/


list_buttons_insts = ds_list_create();	//holds the current buttons

menu = ds_list_create();

//menu yes\no
ds_list_add(menu,button("MERGE",function(){next_stage();}));
ds_list_add(menu,button("CONSUME",function(){
		global.player_struct.heal_relative(0.3);
		obj_game.combat_won();
		}));


//logic
stage = 0;

//choices
organ_to_merge = noone;
attack_index = -1;
item_index = -1;
spot_to_insert = -1;

//methods
function change_menu(menu)
{
	//destroy current buttons
	for(var i=0; i < ds_list_size(list_buttons_insts); i++)
	{
		instance_destroy(list_buttons_insts[|i]);
	}
	ds_list_destroy(list_buttons_insts);
	
	//populate new list
	list_buttons_insts = ds_list_create();
	draw_set_font(font_button);
	var _button_h = 50, _button_w = 245;
	var _margin = 10;
	var _num = ds_list_size(menu);
	var _yy = y;
	var _xx = x - (_button_w + _margin)*_num/2;
	
	for(var i=0; i < _num; i++)
	{
		//create button
		ds_list_add(list_buttons_insts,instance_create_depth(_xx,_yy,0,obj_button,menu[|i]));
		list_buttons_insts[|i].index = i;
		list_buttons_insts[|i].parent = self;
		list_buttons_insts[|i].set_size(_button_w,_button_h)
		
		//calculate next button place
		_xx += _button_w + _margin;
	}
}

function next_stage()
{
	
	switch stage
	{
		#region yes or not
		case 0:
		
		add_main_message("INITIATE MERGE? OR CONSUME?")
		//global.messages_skippable = 0;
		change_menu(menu)
		
		break;
		#endregion
		#region choose organ
		case 1:
		
		
		var _organ = global.nme_struct.arr_children;
		
		//skip stage if only one organ
		if(array_length(_organ) == 1)
		{
			stage++;
			organ_to_merge = _organ[0];
			next_stage();
			return;
		}
		
		//send message
		add_main_message("choose enemy organ to merge")
		obj_combat_ui.progress_messages();
		
		//populate organ list
		ds_list_clear(menu);
		for(var i=0; i < array_length(_organ); i++)
		{
			ds_list_add(menu,button(_organ[i].name,function(){
				organ_to_merge = global.nme_struct.arr_children[other.i]
				next_stage();
				}
				))	/// ????? does other works to get back to the scope the function was run from?
			menu[|i].i = i;
		}
		
		change_menu(menu);
		
		break;
		#endregion
		#region choose attack\item to take
		case 2:
		
		//send message
		add_main_message("choose an attack or item to take")
		obj_combat_ui.progress_messages();
		
		//destroy current buttons
		for(var i=0; i < ds_list_size(list_buttons_insts); i++)
		{
			instance_destroy(list_buttons_insts[|i]);
		}
		ds_list_clear(list_buttons_insts);
	
		
		draw_set_font(font_button);
		var _button_h = 50, _button_w = 245;
		var _margin = 10;
		
		/// create attacks menu
		var _arr = organ_to_merge.arr_attacks
		var _num = array_length(_arr);
		var _yy = y;
		var _xx = x - (_button_w + _margin)*2.5;
	
		for(var i=0; i < MAX_ATTACKS; i++)
		{
			var _data = _num > i ? button(_arr[i].name, function(){attack_index = other.index; next_stage();}) : {text:"", state: BUTTON_STATES.disabled};
			
			//create button
			ds_list_add(list_buttons_insts,instance_create_depth(_xx,_yy,0,obj_button,_data));
			list_buttons_insts[|i].index = i;
			list_buttons_insts[|i].parent = self;
			list_buttons_insts[|i].set_size(_button_w,_button_h)
		
			//calculate next button place
			_xx += _button_w + _margin;
			
			if(i == 1)
			{
				_xx = x - (_button_w + _margin)*2.5;
				_yy += _button_h + _margin;
			}
		}
		
		
		/// create items menu
		var _arr = organ_to_merge.arr_items
		var _num = array_length(_arr);
		var _yy = y;
		var _xx = x + (_button_w + _margin)*0.5;
	
		for(var i=0; i < organ_to_merge.max_items; i++)
		{
			var _data = _num > i ? button(_arr[i].name, function(){item_index = other.index; next_stage();}) : {text:"", state: BUTTON_STATES.disabled};
			
			//create button
			ds_list_add(list_buttons_insts,instance_create_depth(_xx,_yy,0,obj_button,_data));
			list_buttons_insts[|ds_list_size(list_buttons_insts)-1].index = i;
			list_buttons_insts[|ds_list_size(list_buttons_insts)-1].parent = self;
			list_buttons_insts[|ds_list_size(list_buttons_insts)-1].set_size(_button_w,_button_h)
		
			//calculate next button place
			_xx += _button_w + _margin;
			
			if(i == 1)
			{
				_xx = x + (_button_w + _margin)*0.5;
				_yy += _button_h + _margin;
			}
		}
		
		
		break;
		#endregion
		#region choose spot to insert
		case 3:
		
		//send message
		add_main_message("choose a spot to insert it into")
		obj_combat_ui.progress_messages();
		
		//destroy current buttons
		for(var i=0; i < ds_list_size(list_buttons_insts); i++)
		{
			instance_destroy(list_buttons_insts[|i]);
		}
		ds_list_clear(list_buttons_insts);
	
		
		draw_set_font(font_button);
		var _button_h = 50, _button_w = 245;
		var _margin = 10;
		
		
		/// choose which menu to create
		var _arr, _num;
		if(attack_index != -1)
		{
			_arr = global.player_struct.arr_attacks;
			_num = MAX_ATTACKS;
		}
		else
		{
			_arr = global.player_struct.arr_items;
			_num = global.player_struct.max_items;
		}
		
		/// create menu
		var _yy = y;
		var _xx = x - (_button_w + _margin)*2;
	
		for(var i=0; i < _num; i++)
		{
			var _data = array_length(_arr) > i ? {text:_arr[i].name} : {text:""};
			_data.my_function = function(){spot_to_insert = other.index; next_stage();}
			
			//create button
			ds_list_add(list_buttons_insts,instance_create_depth(_xx,_yy,0,obj_button,_data));
			list_buttons_insts[|i].index = i;
			list_buttons_insts[|i].parent = self;
			list_buttons_insts[|i].set_size(_button_w,_button_h)
		
			//calculate next button place
			_xx += _button_w + _margin;
			
			if(i == 1)
			{
				_xx = x - (_button_w + _margin)*2;
				_yy += _button_h + _margin;
			}
		}
		
		break;
		#endregion
		#region do it
		case 4:
		
		//add attack
		if(attack_index != -1)
		{
			global.player_struct.set_attack(organ_to_merge.arr_attacks[attack_index],spot_to_insert);
		}
		//add item
		else if(item_index != -1)
		{
			global.player_struct.set_item(organ_to_merge.arr_items[item_index],spot_to_insert);
		}
		
		//end
		global.player_struct.merge_stats(global.nme_struct);	//merge stats with the whole enemy, not just the organ.
		global.nme_struct = organ_to_merge;	//send in the organ, since we are merging the sprite only with it.
		obj_game.start_merge();
		
		break;
		#endregion
	}
	
	stage++;
}

next_stage();