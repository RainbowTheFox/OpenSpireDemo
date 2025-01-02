with (instance_nearest(x, y, obj_parent_player))
{
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x + xscale, y, other.id)) && (state == 33 || (state == 3 && movespeed >= 12) || state == 89 || (state == 90 && movespeed > 5) || state == 53 || (state == 12 && mach3Roll > 0) || state == 61 || (state == 81 && substate == 0)))
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
	}
	
	if ((place_meeting(x + hsp, y, other.id) || place_meeting(x - xscale, y, other.id)) && state == 86 && movespeed >= 12)
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
	}
	
	if (((place_meeting(x, y + vsp, other.id) && vsp < 0) || place_meeting(x, y - 1, other.id)) && state == 27)
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
	}
	
	if (((place_meeting(x, y + vsp, other.id) && vsp < 0) || place_meeting(x, y - 1, other.id)) && state == 93)
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
	}
	
	if (((place_meeting(x, y + vsp, other.id) && vsp < 0) || place_meeting(x, y - 1, other.id)) && state == 6 && machTwo >= 100)
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
	}
	
	if (((place_meeting(x, y + vsp, other.id) && vsp >= 0) || place_meeting(x, y + 1, other.id)) && state == 38 && freeFallSmash > 10)
	{
		with (other.id)
		{
			DestroyedBy = other.id;
			event_user(0);
		}
	}
}
