function dropdown_menu(_x,_y,_width,_height,func,data_arr)
{
	//var _dir = 1;
	var _total_height = array_length(data_arr)*(_height+2*OUTLINE_W);
	if(_y + _total_height > room_height)
		_y -= _total_height;

	
	var _inst = instance_create_depth(_x,_y,0,obj_dropdown)
	with(_inst)
	{
		width = _width;
		height = _height;
		my_function = func;
		
		//create the buttons
		for(var i=0; i < array_length(data_arr); i++)
		{
			arr_buttons[i] = instance_create_depth(_x,_y + i*(_height),0,obj_button)
			arr_buttons[i].text = data_arr[i][0];
			arr_buttons[i].my_function = dropdown_button_function;
			arr_buttons[i].return_value = data_arr[i][1];
			arr_buttons[i].fix_bbox = 0;
			arr_buttons[i].parent = self;
			arr_buttons[i].set_size(_width,_height);
			arr_buttons[i].index = i;	//its here becuase its widely used and cant be put anywhere else.
		}
	}
	
	return _inst;
}
function dropdown_button_function()
{
	parent.return_value = return_value;
}

function button(_text,func) constructor
{
	return {text: _text, my_function : func};
}
function add_main_message(text)
{
	ds_queue_enqueue(global.queue_messages,text);
	with obj_combat_ui
	{
		if(current_main_text == "")
			progress_messages();
	}
}