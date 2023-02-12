/// attack speeds ///
enum ATT_SPEEDS{
	slowest = -100,
	
	slow = -20,
	
	normal = 0,
	
	fast = 20,
	
	priority = 100, //priority moves just add this value to their speed
	
}


// enemy behaviours
//essentially these are functions you assign in the get_action parameter of enemy structs.
function player_get_action()
{
	var index = obj_player_menu.get_action_index();
	var att_num = array_length(arr_attacks);
	
	//return attack
	if(index < att_num)
	{
		return arr_attacks[index];
	}
	//use item
	else
	{
		var _ret = arr_items[index-att_num];
		array_delete(arr_items,index-att_num,1);
		return _ret;
	}
}
function nme_rand()
{
	var rand = irandom(array_length(arr_attacks) + array_length(arr_items))
	return rand < arr_attacks ? arr_attacks[rand] : arr_items[rand - array_length(arr_attacks)];
}
function nme_scroll()
{
	//init
	if(!variable_struct_exists(self,"scroll"))
		scroll = -1;
	
	//scroll
	scroll++;
	
	//loop back
	if(scroll >= array_length(arr_attacks))
		scroll = 0;
		
	//return
	return arr_attacks[scroll];
}