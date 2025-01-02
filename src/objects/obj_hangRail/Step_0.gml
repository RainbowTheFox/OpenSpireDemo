with (obj_parent_player)
{
	if (state != 76 && state != 47 && state != 56 && state != 57 && state != 54 && state != 18 && state != 35 && state != 70 && state != 0)
	{
		if (place_meeting(x, y, other) && vsp <= 4 && !grounded && place_meeting_collision(x, y - 16) && y >= other.y && state != 39)
		{
			state = 39;
			vsp = -16;
		}
	}
}
