if(keyboard_check_pressed(vk_enter) and trigger_finish == 0)
{
	trigger_finish = 1; //the sequence triggers this now. no he diesnt
	
	layer_sequence_create("main",room_width/2,room_height/2,seq_merge);
	active = 0;
	
	//create_vfx(room_width/2,room_height/2,spr_explosion,3);
}