
function set_fighter(_fighter)
{
	my_fighter = _fighter;
}
dir = 1;
name = "boi";
hp = 5;
max_hp = 10;
sprite = spr_torso2;
shake_remain = 0;

my_fighter = global.list_fighters[|FIGHTERS.plumber];
function flipx()
{
	dir *= -1;
}
function shake(_remain)
{
	shake_remain = _remain;
}