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
function array_add(array,value)
{
	array_insert(array,array_length(array),value);
}
/// @function                       deep_copy(ref)
/// @param {T} ref                  Thing to deep copy
/// @returns {T}                    New array, or new struct, or new instance of the class, anything else (real / string / etc.) will be returned as-is
/// @description                    Returns a deep recursive copy of the provided array / struct / constructed struct
function deep_copy(ref) {
    var ref_new;
    
    if (is_array(ref)) {
        ref_new = array_create(array_length(ref));
        
        var length = array_length(ref_new);
        
        for (var i = 0; i < length; i++) {
            ref_new[i] = deep_copy(ref[i]);
        }
        
        return ref_new;
    }

    else if (is_struct(ref)) {
        var base = instanceof(ref);
        
        switch (base) {
			case "function": return ref;
            case "struct":
            case "weakref":
                ref_new = {};
                break;
                
            default:
                var constr = method(undefined, asset_get_index(base));
                ref_new = new constr();
        }
        
        var names = variable_struct_get_names(ref);
        var length = variable_struct_names_count(ref);
        
        for (var i = 0; i < length; i++) {
            var name = names[i];
            
            variable_struct_set(ref_new, name, deep_copy(variable_struct_get(ref, name)));
        }
        
        return ref_new;
    } else {
        return ref;
    }
}
