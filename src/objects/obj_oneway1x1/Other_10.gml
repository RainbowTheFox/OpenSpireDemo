var _check = (DestroyedBy.bbox_left > (x + 16) && sign(image_xscale) == 1) || (DestroyedBy.bbox_right < (x - 16) && sign(image_xscale) == -1);

if (_check && !(DestroyedBy.object_index == obj_parent_enemy && DestroyedBy.state == 5))
{
	if (DestroyedBy.object_index == obj_parent_player && ((place_meeting(x, y - DestroyedBy.vsp, DestroyedBy) || place_meeting(x, y - sign(DestroyedBy.vsp), DestroyedBy)) && DestroyedBy.vsp < 0 && DestroyedBy.state == 24))
		DestroyedBy.vsp = 0;
	
	instance_destroy();
}
