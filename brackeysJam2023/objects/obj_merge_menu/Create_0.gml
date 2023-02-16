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
ds_list_add(menu,button("YES",function(){next_stage();}));
ds_list_add(menu,button("NO",function(){obj_game.combat_won();}));


//logic
stage = 0;
organ_to_merge = noone;

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
	var _yy = y;
	var _xx = x;
	draw_set_font(font_button);
	var _button_h = 50;
	var _button_w = 245;
	var _margin = 10;
	var _num = menu == menu_attacks ? MAX_ATTACKS : player_struct.max_items;
	for(var i=0; i < _num; i++)
	{
		//create button
		var _data = i < ds_list_size(menu) ? menu[|i] : {text: "",state: BUTTON_STATES.disabled};
		ds_list_add(list_buttons_insts,instance_create_depth(_xx,_yy,0,obj_button,_data));
		list_buttons_insts[|i].index = i;
		list_buttons_insts[|i].parent = self;
		list_buttons_insts[|i].set_size(_button_w,_button_h)
		
		//calculate next button place
		_yy += _button_h + _margin;
		if(i == 1)
		{
			_yy = y;
			_xx += _button_w + _margin;
		}
	}
}
function update_player(player)
{
	//send in a player struct or object to fill in data
	player_struct = player;
	
	//clear previous data
	ds_list_clear(menu_attacks);
	ds_list_clear(menu_items);
	
	//fill data
	for(var i=0; i < array_length(player.arr_attacks); i ++)
	{
		menu_attacks[|i] = {text : player.arr_attacks[i].name,my_function : function(){parent.attack_index = index}};
	}
	for(var i=0; i < array_length(player.arr_items); i ++)
	{
		menu_items[|i] = {text : player.arr_items[i].name, my_function : function(){parent.item_index = index}};
	}
	
	change_menu(menu_attacks);
}

function next_stage()
{
	stage++;
	switch stage
	{
		#region yes or not
		case 0:
			
			change_menu(menu)
			
		break;
		#endregion
		#region choose organ
		case 1:
		
		//populate organ list
		ds_list_clear(menu);
		var _organ = global.nme_struct.arr_children;
		for(var i=0; i < array_length(_organ); i++)
		{
			ds_list_add(menu,button(_organ.name,function(){organ_to_merge = global.nme_struct.arr_children[other.i]}))	/// ????? does other works to get back to the scope the function was run from?
			menu[|i].i = i;
		}
		
		change_menu(menu);
		
		break;
		#endregion
		#region choose attack\item to take
		case 2:
		
		break;
		#endregion
		#region choose spot to insert
		case 3:
		
		break;
		#endregion
	}
}

