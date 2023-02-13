positions = {
	player :		[room_width/3, room_height/2],
	nme :			[room_width/1.5, room_height/2],
	main_text :		[500,room_height * 0.6],
	player_menu :	[500,room_height * 0.7],
}

obj_player_menu.x = positions.player_menu[0];
obj_player_menu.y = positions.player_menu[1];

//main message typer
global.queue_messages = ds_queue_create();
typer_count = 0;
current_main_text = "";
typer_cd = 5;
alarm[0] = 1;

function progress_messages()
{
	if(ds_queue_size(global.queue_messages))
		current_main_text = ds_queue_dequeue(global.queue_messages);
	else
		global.action_done = 1;
	typer_count = 0;
	
	
}

