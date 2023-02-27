function draw_set_all(alpha,color,font,halign,valign)
{
	draw_set_alpha(alpha);
	draw_set_color(color);
	draw_set_halign(halign);
	draw_set_valign(valign);
	draw_set_font(font);
}
function draw_reset()
{
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

function wave(from, to, duration, offset)
{
	// Returns a value that will wave back and forth between [from-to] over [duration] seconds
	// Examples
	//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
	//      x = Wave(-10,10,0.25,0)         -> move left and right quickly
 
	// Or here is a fun one! Make an object be all squishy!! ^u^
	//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
	//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)
 
	a4 = (argument1 - argument0) * 0.5;
	return argument0 + a4 + sin((((current_time * 0.001) + argument2 * argument3) / argument2) * (pi*2)) * a4;
}
function log(msg)
{
	show_debug_message(msg);
}

function room_transition(rm)
{
	///@param room
	
	if(instance_exists(obj_transition)) return;
	
	instance_create_depth(0,0,0,obj_transition,{room_dest:rm});
}
function create_vfx(xx,yy,sprite,scale=1,in=0,out=0)
{
	///@param x
	///@param y
	///@param sprite
	///@param scale
	///@param fade_in
	///@param fade_out
	
	return instance_create_depth(xx,yy,DEPTH.vfx,obj_vfx,{sprite_index: sprite, image_xscale: scale, image_yscale: scale, fade_in: in, fade_out: out});
}