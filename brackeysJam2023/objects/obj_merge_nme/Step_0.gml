//move
x = mouse_x;
y = mouse_y;

//resize
var _add = 0.05*(keyboard_check(vk_up) - keyboard_check(vk_down));

image_xscale += _add*sign(image_xscale);
image_yscale += _add*sign(image_yscale);

image_xscale = sign(image_xscale) * max(0.3,abs(image_xscale))
image_yscale = sign(image_yscale) * max(0.3,abs(image_yscale))

//rotate
var _add = 2*(keyboard_check(vk_right) - keyboard_check(vk_left));
image_angle -= _add;

var _mergesounds = 4;
//flip and sfx
if(mouse_check_button_pressed(mb_left))
{
	image_xscale *= -1;
	audio_play_sound(global.map_sounds[? "merge"][irandom(_mergesounds)], 750, false);
}
if(mouse_check_button_pressed(mb_right))
{
	image_yscale *= -1;
	audio_play_sound(global.map_sounds[? "merge"][irandom(_mergesounds)], 750, false);
}
if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right))
audio_play_sound(global.map_sounds[? "merge"][irandom(_mergesounds)], 750, false);