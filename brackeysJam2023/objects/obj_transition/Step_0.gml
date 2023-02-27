var _trans_dest = state == TRANS_STATES.exitt ? 1 : 0;
trans_prec = approach(trans_prec,_trans_dest,0.03);

if(trans_prec == _trans_dest)
{
	if(state == TRANS_STATES.exitt)
	{
		state = TRANS_STATES.enter;
		room_goto(room_dest);
	}
	else
	{
		log("die")
		instance_destroy();
	}
}