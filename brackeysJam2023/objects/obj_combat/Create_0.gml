/*/
main combat manage

combat stages:
player chooses attack
gather attacks from the player and the enemy
play out attacks in order
end the combat if necessary

/*/

enum COMBAT_STATES{
	off,
	init,
	
	choose_action,
	gather_actions,
	play_out,
	end_loop,
}

//base logic
state = COMBAT_STATES.off;
state_prev = state;
state_changed = 0;
arr_states_functions = [];

//game logic
list_fighters = ds_list_create();
ds_list_add(list_fighters,global.player_struct);
ds_list_add(list_fighters,global.nme_struct);

prio_actions = ds_priority_create();	//values in this priority ds are arrays: [fighter,action].
current_fighter = -1;	//the fighter that is currently taking action. can be used from within action scripts.
current_nme = -1;		//the enemy of the fighter that is currently taking action (equals to the player when the enemy is attacking).

//ui logic
global.action_done = 0;


//states functions
arr_states_functions[COMBAT_STATES.off] = function()
{
}
arr_states_functions[COMBAT_STATES.init] = function(){
	obj_player_menu.update_player(global.player_struct);
	
	//send the ui object the fighters data
	
	state = COMBAT_STATES.choose_action;
}
arr_states_functions[COMBAT_STATES.choose_action] = function(){

	//activate player menu
	if(state_changed)
		obj_player_menu.activate();
		
	//wait for the player to choose an action
	if(obj_player_menu.is_action_chosen())
		state = COMBAT_STATES.gather_actions;
}
arr_states_functions[COMBAT_STATES.gather_actions] = function(){

	for(var i=0; i < ds_list_size(list_fighters); i++)
	{
		var _turn = list_fighters[|i].get_action()
		var _speed = list_fighters[|i].speed + _turn.speed_add;
		ds_priority_add(prio_actions,[list_fighters[|i],_turn],_speed);
	}
	
	state = COMBAT_STATES.play_out;
}
arr_states_functions[COMBAT_STATES.play_out] = function(){
	
	//this state runs on a realtime loop. a loop end is triggered by the ui telling us the anim is done.
	if(state_changed)
		global.action_done = 1;
		
		
	if(global.action_done)	//start a new action
	{
		global.action_done = 0;
		
		/// check if combat is done ///
		
		//player won
		if(global.nme_struct.hp <= 0)
		{
			obj_combat_ui.merge_offer();
			return;
		}
		
		//player lost
		else if(global.player_struct.hp <= 0)
		{
			obj_game.combat_lost();
			return;
		}
		
		
		/// play out next action ///	
		
		if(ds_priority_size(prio_actions))	//there are actions left, start the next one.
		{
			var _action = ds_priority_delete_max(prio_actions);
			
			current_fighter = _action[0];
			current_nme = current_fighter == global.player_struct ? global.nme_struct : global.player_struct;
			
			//calculate crit or miss
			var _acc = (_action[0].accuracy/100) * (_action[1].accuracy/100);
			var _roll = random(1);
			var _hit_acc = _acc*_roll;

			var _is_crit = _hit_acc > CRIT_CHANCE;
			var _is_miss = _hit_acc < MISS_CHANCE;

			
			var _final_damage = _action[1].damage
			if(_is_crit) _final_damage *= CRIT_MULT;
			if(_is_miss) _final_damage = 0;
			
			//act out attack
			var _dmg_dealt = current_nme.damage(_final_damage,_action[1].type);
			var _eff = _dmg_dealt / _action[1].damage;
			_action[1].ability_script();
			
			//send ui text the new attack text
			add_main_message(_action[0].name + " used " + _action[1].name + "!");
			
			if(_is_crit) add_main_message("CRIT!");
			if(_is_miss) add_main_message("But he missed..");
			else
			{
				if(_eff >= (SUPER_EFFECTIVE+1)/2)
					add_main_message("HOLY SHIT");
				if(_eff <= (NOT_EFFECTIVE+1)/2)
					add_main_message("yikes..");	
			}
			
			//update stuff
			obj_player_menu.update_player(global.player_struct);
		}
		else	//turns done, start a new combat loop.
		{
			state = COMBAT_STATES.end_loop;
		}
	}
	
}
arr_states_functions[COMBAT_STATES.end_loop] = function()
{
	//player won
	if(global.nme_struct.hp <= 0)
		obj_combat_ui.merge_offer();
		
	//player lost
	else if(global.player_struct.hp <= 0)
		obj_game.combat_lost();
		
	else state = COMBAT_STATES.choose_action;
}

//methods
function init()
{
	state = COMBAT_STATES.init;
}


#region ability scripts

//these scripts are initizlised here so that they would be bound to this object.
//this can be workarouned by just having them use obj_combat.current_fighter every time, but fuck it.

//cancelled

#endregion
