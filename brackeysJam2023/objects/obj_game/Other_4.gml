
switch (room) {
    case rm_combat:
		obj_music.change_music(ost_combat);
		instance_create_depth(x,y,0,obj_combat);
		instance_create_depth(x,y,0,obj_combat_ui);

		obj_combat.init();
        break;
	///////////
	case rm_menu:
		obj_music.change_music(ost_menu);
		obj_fighter_display.set_fighter(global.player_struct);
		break;
	////////////
	case rm_map:
		obj_music.change_music(ost_menu);
		break;
	///////////
	case rm_end:
		obj_fighter_display.set_fighter(global.nme_struct);
		break;
	///////////
	case rm_win:
		obj_fighter_display.set_fighter(global.player_struct);
		break;
	///////////
	case rm_merge:
		obj_music.change_music(ost_menu);
		break;
    default:
        // code here
        break;
}
