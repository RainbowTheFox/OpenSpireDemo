if (global.freezeframe)
	exit;

if (!instance_exists(hookStopID))
{
	show_debug_message(string("Hook ({0}) at ({1}, {2}) didn't find stop", id, x, y));
	instance_destroy();
}

switch (state)
{
	case 0:
		visible = true;
		break;
	
	case 1:
		var target_dir = point_direction(x, y, xstart, ystart);
		var pnt_dist = min(point_distance(x, y, xstart, ystart), gobackspeed);
		x += lengthdir_x(pnt_dist, target_dir);
		y += lengthdir_y(pnt_dist, target_dir);
		
		if (point_distance(x, y, xstart, ystart) <= 9)
		{
			x = xstart;
			y = ystart;
			state = 0;
		}
		
		visible = true;
		break;
	
	case 2:
		var target_dir = point_direction(x, y, hookStopID.x, hookStopID.y);
		xprevious = x;
		yprevious = y;
		x += lengthdir_x(movespeed, target_dir);
		y += lengthdir_y(movespeed, target_dir);
		var hsp = sign(x - xprevious);
		var vsp = sign(y - yprevious);
		
		with (playerID)
		{
			if (state == 74)
			{
				x = other.x;
				y = other.y - 14;
				xscale = sign(other.image_xscale);
				
				if (tauntStored.state == 90 || tauntStored.state == 88 || tauntStored.state == 89 || tauntStored.state == 89)
					sprite_index = spr_player_PZ_frostburn_hook;
				else
					sprite_index = spr_player_PZ_hook_vertical;
			}
		}
		
		visible = false;
		
		if (point_distance(x, y, hookStopID.x, hookStopID.y) <= movespeed)
		{
			x = hookStopID.x;
			y = hookStopID.y;
			state = 1;
			visible = true;
			
			with (playerID)
			{
				x = other.hookStopID.x;
				y = other.hookStopID.y - 14;
				
				if (state == 74)
					scr_taunt_setVariables();
			}
		}
		
		break;
}
