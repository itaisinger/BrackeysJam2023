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
		
		if(ds_priority_size(prio_actions))	//there are actions left, start the next one.
		{
			var _action = ds_priority_delete_max(prio_actions);
			
			//send ui text the new attack text
			global.main_text = _action[0].name + " used " + _action[1].name + "!";
			
			current_fighter = _action[0];
			current_nme = current_fighter == global.player_struct ? global.nme_struct : global.player_struct;
			
			//act out attack
			current_nme.damage(_action[1].damage)
			_action[1].ability_script();
			
			//update stuff
			obj_player_menu.update_player(global.player_struct);
		}
		else	//turns done, start a new combat loop.
		{
			state = COMBAT_STATES.choose_action;
		}
	}
	
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
