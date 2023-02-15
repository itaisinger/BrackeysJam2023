//move
x = mouse_x;
y = mouse_y;

//resize
var _add = 1*(keyboard_check(vk_up) - keyboard_check(vk_down));
image_xscale += _add;
image_yscale += _add;

//rotate
var _add = 5*(keyboard_check(vk_right) - keyboard_check(vk_left));
image_angle -= _add;
