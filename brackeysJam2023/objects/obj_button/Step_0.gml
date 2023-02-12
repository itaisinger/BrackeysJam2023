//state machine
msg = "";

state_functions[state]();

//fix bbox 
if(fix_bbox_must)
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
		var _w = sprite_width  + 2*margin;
		var _h = sprite_height + 2*margin;
		
		sprite_index = mask_pixel
		
		image_xscale = _w;
		image_yscale = _h;
	}
	
	if(make_center)
	{
		make_center = 0;
		x -= sprite_width/2;
		y -= sprite_height/2;
	}
}

