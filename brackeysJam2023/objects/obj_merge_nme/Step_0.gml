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

//flip
if(mouse_check_button_pressed(mb_left)) image_xscale *= -1;
if(mouse_check_button_pressed(mb_right)) image_yscale *= -1;