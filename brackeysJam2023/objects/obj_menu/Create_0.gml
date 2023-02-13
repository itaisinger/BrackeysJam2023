/*/
this object handles the main menu
the menu options are:

- start run
- options
- quit

buttons are created with the instance_create and a struct

there are menu lists that hold button data structs.
use change_menu(menu) to replace the current buttons with new oens.
/*/

list_buttons_insts = ds_list_create();	//holds the current button insts
//list_buttons_insts = ds_list_create();	//used in transition to temp hold the new buttons

menu_main = ds_list_create();
menu_options = ds_list_create();

var _fun = function(){change_menu(menu_options)}

ds_list_add(menu_main,button("start run", function(){obj_game.start_run()}));
ds_list_add(menu_main,button("options", function(){change_menu(menu_options)}));
ds_list_add(menu_main,button("quit", function(){game_end()}));

ds_list_add(menu_options,{text: "sfx volume", my_function: function(){show_message("pow!")}});
ds_list_add(menu_options,{text: "back", my_function: function(){obj_menu.change_menu(obj_menu.menu_main)}});


//visuals

//methods
function change_menu(menu)
{
	/*/
	the transition works as follow:
		when recieving a new buttons struct, they are created in list_buttons_insts, and the old buttons stay inside list_buttons_insts.
		they both exists simutanesely to create the fade effect
		when the effect is done, call finish_menu_swap() to destroy the old list and put the new one's reference inside the varieble.
	
	/*/
	
	//destroy current buttons
	for(var i=0; i < ds_list_size(list_buttons_insts); i++)
	{
		instance_destroy(list_buttons_insts[|i]);
	}
	ds_list_destroy(list_buttons_insts);
	
	//populate new list
	list_buttons_insts = ds_list_create();
	var _ystart = room_height/2;
	draw_set_font(font_menu);
	var _margin = string_height("hi") * 1.4;
	for(var i=0; i < ds_list_size(menu); i++)
	{
		ds_list_add(list_buttons_insts,instance_create_depth(room_width/2,_ystart + i*_margin,0,obj_button_menu,menu[|i]));
		list_buttons_insts[|i].font = font_menu;
		list_buttons_insts[|i].margin = 3;
		list_buttons_insts[|i].outline_w = 0;
		list_buttons_insts[|i].centerize();
	}
}

change_menu(menu_main);