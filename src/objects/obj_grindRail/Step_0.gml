with (obj_parent_player)
{
	if (state != 76 && state != 47 && state != 56 && state != 57 && state != 54 && state != 18 && state != 35 && state != 70 && state != 0)
	{
		if (place_meeting_platform(x, y + 1, other) && vsp >= 0 && state != 16)
		{
			state = 16;
			vsp = 0;
		}
	}
}
