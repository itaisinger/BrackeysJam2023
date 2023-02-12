//deactivate buttons after choosing a move
if(attack_index != -1 or item_index != -1)
{
	for(var i=0; i < MAX_ATTACKS; i++)
		list_buttons_insts[|i].state = BUTTON_STATES.disabled;
}

//readjust positions
if(x != xprevious or y != yprevious)
{
	change_menu(menu_attacks);
	init_side_menu();
}