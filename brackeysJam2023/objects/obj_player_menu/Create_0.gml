/*/
this object handles the player action buttons

side bar:
 - attack
 - item
 - action(?)

buttons are created with the instance_create and a struct

there are menu lists that hold button data structs.
use change_menu(menu) to replace the current buttons with new oens.
/*/


list_buttons_insts = ds_list_create();	//holds the current main buttons
list_buttons_side = ds_list_create();

menu_side	 = ds_list_create();
menu_attacks = ds_list_create();
menu_items   = ds_list_create();
menu_actions = ds_list_create();

//side menu
ds_list_add(menu_side,button("attacks"	,function(){change_menu(menu_attacks)}));
ds_list_add(menu_side,button("items"	,function(){change_menu(menu_items)}));
ds_list_add(menu_side,button("actions"	,function(){change_menu(menu_actions)}));


//logic
attack_index = -1;
item_index = -1;
player_struct = {
	arr_attacks : [],
	arr_items : [],
};

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
	var _button_w = 200;
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
function activate()
{
	//activate if the player is now choosing attacks normally, otherwise skip this.
	if(global.player_struct.get_action != bhvr_player)
		return;
	
	attack_index = -1;
	item_index = -1;
	change_menu(menu_attacks);
}
function get_action_index()
{
	//called by the player structs
	//returns an attack/item index, and the player get_action function makes sense out of it.
	return attack_index != -1 ? attack_index : array_length(player_struct.arr_attacks) + item_index;
}
function is_action_chosen()
{
	return attack_index != -1 or item_index != -1
}

function init_side_menu()
{
	//clear
	while(ds_list_size(list_buttons_side))
	{
		instance_destroy(list_buttons_side[|0]);
		ds_list_delete(list_buttons_side,0);
	}
	
	//repopulate
	for(var i=0; i < 3; i++)
	{
		ds_list_add(list_buttons_side,instance_create_depth(x - 170,y + 39*i,0,obj_button,menu_side[|i]));
		list_buttons_side[|i].margin -= 2;
		list_buttons_side[|i].set_size(150,33);
	}
}
change_menu(menu_attacks);
init_side_menu();