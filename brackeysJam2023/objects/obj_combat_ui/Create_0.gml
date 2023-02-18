positions = {
	player :		[room_width*0.25, room_height*0.4],
	nme :			[room_width*0.75, room_height*0.4],
	main_text :		[room_width*0.5-250,room_height * 0.6],
	player_menu :	[room_width*0.5-250,room_height * 0.7],
	merge :			[room_width/2, room_height/1.5],
}



//main message typer
global.queue_messages = ds_queue_create();
global.messages_skippable = 1;
typer_count = 0;
current_main_text = "";
typer_cd = 3;
alarm[0] = 1;

main_text_a = 1;

/// create fighters display
with(instance_create_depth(positions.player[0],positions.player[1],0,obj_fighter_display)){ set_fighter(global.player_struct); global.player_display = self;};
with(instance_create_depth(positions.nme[0],positions.nme[1],0,obj_fighter_display)) {set_fighter(global.nme_struct); flipx(); global.nme_display = self;};

//player menu
instance_create_depth(positions.player_menu[0],positions.player_menu[1],0,obj_player_menu);

function progress_messages()
{
	current_main_text = "";
	
	if(ds_queue_size(global.queue_messages))
		current_main_text = ds_queue_dequeue(global.queue_messages);
	else
	{
		global.action_done = 1;
	}
	typer_count = 0;
	
	if(current_main_text == "INITIATE MERGE?")
		global.messages_skippable = 0;
	
}
function merge_offer()
{
	//clear prev menu
	instance_destroy(obj_player_menu);
	
	//question
	add_main_message(global.nme_struct.name + " fainted!")
	
	//create merge offer
	instance_create_depth(positions.merge[0],positions.merge[1],0,obj_merge_menu);

}
