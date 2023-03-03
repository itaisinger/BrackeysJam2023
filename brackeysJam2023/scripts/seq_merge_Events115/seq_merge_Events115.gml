// Auto-generated stubs for each available event.

function seq_merge_change_sprite()
{
	//obj_merge.trigger_finish = 1;
	obj_merge_cutscene_p.jump();
	obj_merge_cutscene_p.sprite_index = global.player_struct.sprite;
}

function merge_seq_done()
{
	obj_game.finish_merge();
}