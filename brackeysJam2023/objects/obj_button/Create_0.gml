/*/
outline is inside bbox.

/*/

//visuals
//is_gui = 0;	//collision works a little funny with gui buttons. they stay in place and detect collision to a different mouse object that also stay within that screen range.
msg = "";
//font = font_button;
depth = DEPTH.button;

colors = {
	text	 : c_white,
	text_disabled : make_color_rgb(180,180,180),
	normal	 : c_col1,
	hover	 : c_col1_light,
	press	 : c_col1_dark,
	disabled : c_col1_gray,
}

//normal_col	 = c_col1;
//hover_col	 = c_col1_light; 
//press_col	 = c_col1_dark;
//disabled_col = c_col1_gray;
//text_col	= c_white;
//text_disabled_col = make_color_rgb(180,180,180);

current_col = colors.normal;
current_text_col = colors.text;
halign = fa_left;
valign = fa_top;

outline_w = OUTLINE_W;
margin = 5;

//logic
active = 1;
parent = noone;
state = 0;
state_functions = [];

//my_function = function(){show_message("hi")};

is_hold = 0;	//if true, when pressing instantly transition to hold, and execute the function every frame.
leave_hold_function = function(){};
fix_bbox_must = 1;
make_center = 0;	//if true, pushes itself back and up to mimick fa_center

enum BUTTON_STATES{
	natural,	//natural states. transitions to hover on hover.
	hover,		//transition to natural when cursor leaves or to down on press.
	down,		//when mouse released, trans to natural if cursor is not on me, otherwise execute function and then natural.
	disabled,	//cant reach on my own. set from outside to make me stuck. uninteractable.
	hold,		//needs to set is_hold to true. stay down for as long as pressing the mouse and execute the function every frame.
}

/// states functions
state_functions[BUTTON_STATES.natural] = function()
{
	current_col = colors.normal;
	current_text_col = colors.text;
	
	//edge cases to victory
	//if(instance_exists(obj_dropdown) and parent == noone)
	//{
	//	msg = "drop";
	//	return;
	//}
	
	//detect hover
	if(active and is_hovered() and !mouse_check_button(mb_left))
	{
		state = BUTTON_STATES.hover;
	}
}
state_functions[BUTTON_STATES.hover] = function()
{
	current_col = colors.hover;
	current_text_col = colors.text;
	
	//detect unhover
	if(!is_hovered())
	{
		
		state = BUTTON_STATES.natural;
	}
	
	//press
	if(mouse_check_button_pressed(mb_left))
	{
		state = BUTTON_STATES.down;
		
		if(is_hold)
			state = BUTTON_STATES.hold;
	}
}
state_functions[BUTTON_STATES.down] = function()
{
	current_col = colors.press;
	current_text_col = colors.text;
	
	//end press
	if(!mouse_check_button(mb_left))
	{
		state = BUTTON_STATES.natural;
		
		//execute
		if(is_hovered())
		{
			my_function();
		}
	}
}
state_functions[BUTTON_STATES.disabled] = function()
{
	current_col = colors.disabled;
	current_text_col = colors.text_disabled;
}
state_functions[BUTTON_STATES.hold]		= function()
{
	//color
	current_col = colors.press;
	current_text_col = colors.text;
	
	//function
	my_function();
	
	//leave state
	if(!mouse_check_button(mb_left))
	{
		leave_hold_function();
		state = BUTTON_STATES.natural;
	}
}

//functions
function is_hovered()
{
	return (place_meeting(x,y,obj_mouse) and !is_gui) or (place_meeting(x,y,obj_mouse) and is_gui)
}
set_size = function(width,height)
{
	fix_bbox_must = 0;
	fix_bbox = 0;
	
	sprite_index = mask_pixel;

	image_xscale = width;
	image_yscale = height;
}
set_height = function(height)
{
	sprite_index = mask_pixel;
	image_yscale = height;
}
function fix_bbox_manual()
{
	fix_bbox_must = 0;
	
	//create the button around the content
	if(fix_bbox)
	{
		fix_bbox = 0;
		sprite_index = mask_pixel;
	
		draw_set_font(font);
		var _w  = string_width_scribble(text)  + 2*margin + 2*outline_w;
		var _h  = string_height_scribble(text) + 2*margin + 2*outline_w;

		image_xscale = _w;
		image_yscale = _h;
	
	}
	//just spread out the bbox to the margin
	else
	{
		var _w = sprite_width  //+ 2*margin;
		var _h = sprite_height //+ 2*margin;
		
		sprite_index = mask_pixel
		
		image_xscale = _w;
		image_yscale = _h;
	}
	
	if(make_center)
	{
		x -= sprite_width/2;
		y -= sprite_height/2;
	}
}
function centerize()
{
	make_center = 1;
}