cur_music = ost_menu;
transition_time = 1000;
changing_music = false;
audio_play_sound(cur_music,1000,true);

function change_music(new_music)
{
	audio_sound_gain(cur_music,0,transition_time-300);
	audio_play_sound(new_music,1000,true);
	audio_sound_gain(new_music,0,0);
	audio_sound_gain(new_music,1,transition_time);
	changing_music = true;
	next_music = new_music;
}