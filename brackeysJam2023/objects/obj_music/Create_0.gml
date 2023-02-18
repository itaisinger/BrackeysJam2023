cur_music = audio_play_sound(ost_menu,0,true,1);
transition_time = 1000;
changing_music = false;
audio_play_sound(cur_music,1000,true);

function change_music(new_music)
{
	//cancel if already playing this song
	if(audio_get_name(cur_music) == new_music or audio_get_name(cur_music) == next_music) return;
	
	//if not done fading out, instant fade out last music to not create overlap
	if(next_music != -1)
	{
		audio_stop_sound(cur_music);
		cur_music = next_music;
		next_music = -1;
		changing_music = false;
	}
	
	audio_sound_gain(cur_music,0,transition_time);
	next_music = audio_play_sound(new_music,0,true,0);	//
	audio_sound_gain(next_music,1,transition_time);
	changing_music = true;
	//next_music = new_music;
}