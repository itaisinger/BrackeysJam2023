if(changing_music && audio_sound_get_gain(cur_music) <= 0)
{
	audio_stop_sound(cur_music);
	cur_music = next_music;
	changing_music = false;
}