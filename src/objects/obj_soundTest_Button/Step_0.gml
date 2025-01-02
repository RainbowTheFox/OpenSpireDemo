with (obj_parent_player)
{
	if (place_meeting(x, y, other.id) && alarm[0] <= 0 && !instance_exists(obj_fadeoutTransition) && key_up2 && grounded && (state == 1 || state == 28 || state == 32 || state == 33 || state == 3) && state != 40 && state != 25 && state != 26)
	{
		with (other)
		{
			sprite_index = spr_soundTest_buttonPressed;
			alarm[0] = 5;
		}
	}
}
