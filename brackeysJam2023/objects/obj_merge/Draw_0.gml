
if(sur == -1)
	sur_init();

var _x1 = (_screenw-FIGHTER_SPR_W)/2;
var _y1 = (_screenh-FIGHTER_SPR_H)/2;
draw_set_alpha(0.4);
draw_rectangle(_x1,_y1,_x1+FIGHTER_SPR_W,_y1+FIGHTER_SPR_H,0)
draw_set_alpha(1);

if(surface_exists(sur))
	draw_surface(sur,_x1,_y1);
else
	draw_sprite(global.player_struct.sprite,0,_x1 + FIGHTER_SPR_W/2,_y1 + FIGHTER_SPR_H/2);

//instructions
arr = ["resize and rotate with arrow keys","flip with mouse buttons","press enter to confirm"];
var _m = string_height("8") + 5
for (var i = 0; i < array_length(arr); ++i) {
    draw_text(5,10 + i * _m, arr[i]);
}

if(trigger_finish)
{
	finish();
	trigger_finish = 0;
}