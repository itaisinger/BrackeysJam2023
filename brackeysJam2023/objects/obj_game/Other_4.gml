
switch (room) {
    case rm_combat:
		instance_create_depth(x,y,0,obj_combat);
		instance_create_depth(x,y,0,obj_combat_ui);

		obj_combat.init();
        break;
	///////////
	case rm_menu:
		obj_fighter_display.set_fighter(global.player_struct);
		break;
	///////////
	case rm_end:
		obj_fighter_display.set_fighter(global.nme_struct);
		break;
    default:
        // code here
        break;
}
