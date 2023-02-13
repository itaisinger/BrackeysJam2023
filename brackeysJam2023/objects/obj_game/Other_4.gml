
switch (room) {
    case rm_combat:
        instance_create_depth(x,y,0,obj_player_menu);
		instance_create_depth(x,y,0,obj_combat);
		instance_create_depth(x,y,0,obj_combat_ui);

		obj_combat.init();
        break;
    default:
        // code here
        break;
}
