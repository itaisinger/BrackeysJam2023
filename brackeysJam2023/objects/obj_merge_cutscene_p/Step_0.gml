if(jumping)
{
	vsp += 0.8;

	if(yy > ystart)
	{
		vsp = -11;
	}
	
	yy += vsp;
}