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

setup();

list_buttons_insts = ds_list_create();	//holds the current main buttons
list_buttons_side = ds_list_create();

menu_side	 = ds_list_create();
menu_attacks = ds_list_create();
menu_items   = ds_list_create();
menu_actions = ds_list_create();

var _fun = function(){change_menu(menu_options)}

//side menu
ds_list_add(menu_side,button("attacks"	,function(){change_menu(menu_attacks)}));
ds_list_add(menu_side,button("items"	,function(){change_menu(menu_items)}));
ds_list_add(menu_side,button("actions"	,function(){change_menu(menu_actions)}));



//visuals
trans_prec = 0;

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
	var _ystart = y;
	draw_set_font(font_menu);
	var _margin = string_height("hi") * 1.1;
	for(var i=0; i < ds_list_size(menu); i++)
	{
		ds_list_add(list_buttons_insts,instance_create_depth(x,_ystart + i*_margin,0,obj_button_fade,menu[|i]));
		list_buttons_insts[|i].font = font_menu;
		list_buttons_insts[|i].margin = 0;
		//list_buttons_insts[|i].centerize();
		list_buttons_insts[|i].image_alpha = 0;
	}
}
function set_player(player)
{
	//send in a player struct or object to fill in data
	
	//clear previous data
	ds_list_clear(menu_attacks);
	ds_list_clear(menu_items);
	
	//fill data
	for(var i=0; i < ds_list_size(player.list_attacks); i ++)
	{
		menu_attacks[|i] = player.list_attacks[|i];
	}
	for(var i=0; i < ds_list_size(player.list_items); i ++)
	{
		menu_items[|i] = player.list_items[|i];
	}
}

change_menu(menu_main);