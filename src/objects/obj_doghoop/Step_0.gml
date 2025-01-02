if (place_meeting(x + 4, y, obj_parent_player) && (obj_parent_player.state == 41 || obj_parent_player.state == 42 || obj_parent_player.state == 44))
{
	instance_destroy();
	ds_list_add(global.SaveRoom, id);
}
