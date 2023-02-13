function draw_panel(_x,_y,width,height,col_1,col_2,o_width=2,o_color=c_black)
{
	///@param x
	///@param y
	///@param width
	///@param height
	///@param color_1
	///@param color_2
	///@param outline_width
	///@param outline_color
	
	//draws a button without anything in it
	//the outline is scaled inside
	
	var _alpha_prev = draw_get_alpha()
	
	//draw outline
	draw_rectangle_color(_x,_y, _x+width,_y+height,
						col_1,col_2, col_2,col_1,0);
						
	draw_set_alpha(_alpha_prev*0.5);
	draw_set_color(o_color);
	draw_rectangle(_x,_y, _x+width,_y+height, 0);
	
	//draw inside
	draw_set_alpha(_alpha_prev);
	draw_rectangle_color(_x+o_width,_y+o_width, _x+width-o_width,_y+height-o_width,
						col_1,col_2, col_2,col_1,0);
}

