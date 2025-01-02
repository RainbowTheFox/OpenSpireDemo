if (sprite_index == spr_file1confirm && !instance_exists(obj_fadeoutTransition))
{
	obj_parent_player.targetRoom = hub_demohallway;
	obj_parent_player.targetDoor = "A";
	instance_create(x, y, obj_fadeoutTransition);
}
