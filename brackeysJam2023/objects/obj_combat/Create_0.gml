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
		
		if(global.player_struct.hp <= 0 or global.nme_struct.hp <= 0)
		{
			state = COMBAT_STATES.end_loop;
			return;
		}
		
		/// play out next action ///	
		
		if(ds_priority_size(prio_actions))	//there are actions left, start the next one.
		{
			current_action = ds_priority_delete_max(prio_actions);
			
			//set currents for everyone to use
			current_fighter = current_action[0];
			current_nme = current_fighter == global.player_struct ? global.nme_struct : global.player_struct;
			global.__scribble_colours.c_fighter = current_fighter.color;
			global.__scribble_colours.c_nme = current_nme.color;
			
			
			//main attack text
			add_main_message("[c_fighter]" + current_action[0].name + "[/color] used " + current_action[1].name + "!");
			var _soundvariant = irandom(array_length(current_action[1].sound) - 1);
			audio_play_sound(current_action[1].sound[_soundvariant], 750, false);
			
			
			//act out attack
			if(variable_struct_exists(current_action[1],"ability_script"))
				current_action[1].ability_script();
			
			//calculate crit or miss
			/*/ 
			roll a number from 0-100
			if the number is larger than the the final attack accuracy, miss.
			if the number is smalled than the acc/10, crit.
			/*/
			
			var _acc = (current_action[0].accuracy/100) * (current_action[1].accuracy/100);
			var _roll = random(1);
			var _is_miss = _roll > _acc;
			var _is_crit = _roll < (_acc * CRIT_CHANCE);
			
			var _final_damage = current_action[1].damage * current_action[0].dmg_mult;
			
			//// all hail workarounds.
			if(current_nme == global.player_struct)
			{
				while(	(_final_damage > current_nme.max_hp * 0.6) or	//cant take away more than 60% of hp at once
						(_final_damage > current_nme.hp and  current_nme.hp <= current_nme.max_hp * 0.4)	//cant one shot from 40%
						)
				{
					_final_damage *= 0.95
				}
			}	//doesnt account for effectiveness. maybe move to inside damage method.
			
			if(_is_crit) _final_damage *= CRIT_MULT;
			if(_is_miss) _final_damage = 0;
			
			var _dmg = current_nme.damage(_final_damage,current_action[1].type);
			var _eff = _dmg[0] / _final_damage;//get_type_damage(current_action[1].type,current_nme.get_main_type());//

			//send shake
			var _shake = 20;

			if(_is_crit)
			{
				add_main_message("CRIT!");
				_shake *= 2;
			}
			if(_is_miss) 
			{
				add_main_message("But he missed..");
				_shake = 0;	
			}
			else
			{
				if(_eff >= (SUPER_EFFECTIVE+1)/2)
				{
					_shake *= 1.5;
					add_main_message("It's super effective! (" + string(_eff) + ")");
				}
				if(_eff <= (NOT_EFFECTIVE+1)/2)
				{
					_shake *= 0.5;
					add_main_message("it wasn't very effective..(" + string(_eff) + ")");	
				}
			}
			
			//displays
			var _shake = 100 * (_final_damage / current_nme.max_hp)	//will not work properly if some sort of block is added.
			var _current_nme_display = current_nme == global.nme_struct ? global.nme_display : global.player_display;
			var _current_player_display = current_nme == global.nme_struct ? global.player_display : global.nme_display;
			
			_current_nme_display.shake(_shake);
			_current_player_display.hit();
			
			if(variable_struct_exists(current_action[1],"vfx"))
				create_vfx(_current_player_display.x,_current_player_display.y,current_action[1].vfx,1,1,1);
			
			
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
	{
		state = COMBAT_STATES.off;
		obj_combat_ui.merge_offer();
	}	
	//player lost
	else if(global.player_struct.hp <= 0)
	{
		state = COMBAT_STATES.off;
		obj_game.combat_lost();
	}
	
	else state = COMBAT_STATES.choose_action;
}

//methods
function init()
{
	state = COMBAT_STATES.init;
}