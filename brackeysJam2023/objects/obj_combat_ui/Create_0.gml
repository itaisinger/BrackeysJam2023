positions = {
	player :		[room_width/3, room_height/2],
	nme :			[room_width/1.5, room_height/2],
	main_text :		[room_width*0.4,room_height * 0.6],
	player_menu :	[room_width*0.4,room_height * 0.7],
	merge_que :		[room_width/2, room_height/1.5],
	merge_yes :		[room_width*0.35, room_height*0.7],
	merge_no :		[room_width*0.55, room_height*0.7],
}



//main message typer
global.queue_messages = ds_queue_create();
typer_count = 0;
current_main_text = "";
typer_cd = 3;
alarm[0] = 1;

merge_que_a = 0;
main_text_a = 1;

/// create fighters display
with(instance_create_depth(positions.player[0],positions.player[1],0,obj_fighter_display)) set_fighter(global.player_struct);
with(instance_create_depth(positions.nme[0],positions.nme[1],0,obj_fighter_display)) set_fighter(global.nme_struct);

//player menu
instance_create_depth(positions.player_menu[0],positions.player_menu[1],0,obj_player_menu);

function progress_messages()
{
	if(ds_queue_size(global.queue_messages))
		current_main_text = ds_queue_dequeue(global.queue_messages);
	else
	{
		current_main_text = "";
		global.action_done = 1;
	}
	typer_count = 0;
	
}
function merge_offer()
{
	//clear prev menu
	instance_destroy(obj_player_menu);
	//main_text_a = 0;
	
	//question
	add_main_message(global.nme_struct.name + " fainted!")
	add_main_message("INITIATE MERGE?")
	//merge_que_a = 1;
	
	//create two options
	instance_create_depth(positions.merge_yes[0],positions.merge_yes[1],0,obj_button,button("YES",function(){obj_game.start_merge();}))
	instance_create_depth(positions.merge_no[0],positions.merge_no[1],0,obj_button,button("NO",function(){obj_game.combat_won();}))
}
