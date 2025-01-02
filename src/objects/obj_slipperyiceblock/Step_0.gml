if (!global.freezeframe)
{
	var _player = instance_nearest(x, y, obj_parent_player);
	
	if (place_meeting(x, y - 1, _player) && _player.grounded && !_player.cutscene && _player.state != 76 && _player.state != 0)
	{
		with (_player)
		{
			if (state == 88 || state == 90 || state == 91)
			{
				state = 89;
				
				if (move != 0)
					xscale = move;
				else if (hsp != 0)
					xscale = sign(hsp);
			}
			
			if (state != 89)
				state = 22;
			
			movespeed = clamp(movespeed, 12, 14);
		}
	}
}
