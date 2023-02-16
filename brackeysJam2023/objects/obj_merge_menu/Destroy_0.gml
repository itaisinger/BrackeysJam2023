///@desc destroy my buttons

//destroy current buttons
for(var i=0; i < ds_list_size(list_buttons_insts); i++)
{
	instance_destroy(list_buttons_insts[|i]);
}