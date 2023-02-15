var _stage_prev = stage;
arr_stage_functions[stage]();

if(keyboard_check_pressed(vk_space))
	stage = MAP_STAGES.endd;

stage_changed = _stage_prev != stage;

