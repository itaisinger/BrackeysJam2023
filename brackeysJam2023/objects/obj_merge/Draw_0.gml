
if(sur == -1)
	sur_init();

draw_surface(sur,(_screenw-FIGHTER_SPR_W)/2,(_screenh-FIGHTER_SPR_H)/2);

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