image_xscale = obj_parent_player.xscale;
x = obj_parent_player.x;
y = obj_parent_player.y;

if (!global.freezeframe && obj_parent_player.state != 0 && obj_parent_player.state != 46)
	instance_destroy();
