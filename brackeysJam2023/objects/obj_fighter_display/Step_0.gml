shake_remain = approach(shake_remain,0,0.2);
shake_remain = smooth_approach(shake_remain,0,0.05);
hit_prec = approach(hit_prec,1,0.025);

if(my_fighter.hp <= 0) 
{
	xscale = 1.3;
	yscale = 0.7;
	wave_range = 0;
}