global.sounds_list = ds_list_create();
global.play_sfx = function play_sfx(_sfx, _priority, _loops, _gain)
{
	ds_list_add(global.sounds_list,audio_play_sound(_sfx,_priority,_loops,_gain));
}
global.stop_all_sfx = function stop_all_sfx(_sfx)
{
	var index = 0;
	repeat(ds_list_size(global.sounds_list))
	{
		audio_stop_sound(global.sounds_list[| index]);
		ds_list_delete(global.sounds_list[| index], index++);
	}
}