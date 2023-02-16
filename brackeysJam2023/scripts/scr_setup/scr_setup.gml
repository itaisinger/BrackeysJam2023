
function game_init(){
	
	/// UI ELEMENTS MACROS ///
	
	global.color_1 = make_color_rgb(251,77,130);
	global.color_2 = make_color_rgb(251,77,216);
	global.color_3 = make_color_rgb(25,127,120);
	
	global.color_1_dark = merge_color(global.color_1,c_black,0.4);
	global.color_2_dark = merge_color(global.color_2,c_black,0.4);
	global.color_1_dark2 = merge_color(global.color_1,c_black,0.7);
	global.color_2_dark2 = merge_color(global.color_2,c_black,0.7);
	
	global.color_1_light = merge_color(global.color_1,c_white,0.4);
	global.color_2_light = merge_color(global.color_2,c_white,0.4);
	
	global.color_1_gray = merge_color(global.color_1,c_gray,0.3);
	global.color_2_gray = merge_color(global.color_2,c_gray,0.3);
	
	#macro c_col1		global.color_1
	#macro c_col2		global.color_2
	#macro c_col1_dark	global.color_1_dark
	#macro c_col2_dark	global.color_2_dark
	#macro c_col1_dark2	global.color_1_dark2
	#macro c_col2_dark2	global.color_2_dark2
	#macro c_col1_light global.color_1_light
	#macro c_col2_light global.color_2_light
	#macro c_col1_gray  global.color_1_gray
	#macro c_col2_gray  global.color_2_gray
	
	global.base_outline_width = 4;
	#macro OUTLINE_W global.base_outline_width
	#macro ATTACK_BUTTON_MARGIN 3
	#macro MAX_ATTACKS 4
	
	randomise();
	
	global.list_encounters = ds_list_create();
	global.current_floor = 0;
	
	#macro FIGHTER_SPR_W 900
	#macro FIGHTER_SPR_H 900
	#macro ORGAN_SPR_W 300
	#macro ORGAN_SPR_H 300
	
}

enum DEPTH{
	button = 0,
	dropdown = -3,
}

