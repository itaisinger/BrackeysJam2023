//deactivate buttons after choosing a move
if(attack_index != -1 or item_index != -1)
{
	//main buttons
	for(var i=0; i < ds_list_size(list_buttons_insts); i++)
		list_buttons_insts[|i].state = BUTTON_STATES.disabled;
		
	//side menu
	for (var i = 0; i < ds_list_size(list_buttons_side); ++i) {
	    list_buttons_side[|i].state = BUTTON_STATES.disabled;
	}
}

//readjust positions
if(x != xprevious or y != yprevious)
{
	change_menu(menu_attacks);
	init_side_menu();
}