
function set_fighter(_fighter)
{
	my_fighter = _fighter;
}

name = "boi";
hp = 5;
max_hp = 10;
sprite = spr_torso2;
shake_remain = 0;

function shake()
{
	shake_remain = 5;
//	draw_sprite_ext(my_fighter.sprite,0,wave(x-2,x+2,0.5,0),wave(y-2,y+2,0.5,0),1,1,wave(-15,15,0.5,0),c_white,1);
}