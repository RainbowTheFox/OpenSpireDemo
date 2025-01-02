global.instancelist = ds_list_create();

function check_and_destroy(argument0, argument1, argument2, argument3 = -4)
{
	if (!place_meeting(argument0, argument1, argument2))
		return false;
	
	var _result = false;
	var _num = instance_place_list(argument0, argument1, argument2, global.instancelist, false);
	
	if (_num > 0)
	{
		for (var i = 0; i < ds_list_size(global.instancelist); i++)
		{
			with (ds_list_find_value(global.instancelist, i))
			{
				if (argument3 == -4 || argument[3](other.id, id))
				{
					DestroyedBy = other.id;
					event_user(0);
					_result = true;
				}
			}
		}
		
		ds_list_clear(global.instancelist);
	}
	
	return _result;
}

function scr_collide_destructibles()
{
	static dont_break_worms = function(argument0, argument1)
	{
		return argument1.object_index != obj_gummyWormBump;
	};
	
	var old_mask = mask_index;
	
	if (state == 65)
		mask_index = spr_player_mask;
	
	var _player_dir = sign(obj_player1.hsp) ? max(obj_player1.xscale, obj_player1.hsp) : min(obj_player1.xscale, obj_player1.hsp);
	var side_to_side_states = [32, 4, 22, 88, 90, 89, 16, 39, 75, 69, 33, 3, 86, 12, 57, 65, 66, 48, 51, 53, 54, 40, 26, 61, 41, 42, 68, 58, 8, 7];
	
	if (array_contains(side_to_side_states, state) || (state == 17 && sprite_index == spr_swingDing) || (state == 81 && substate == 0))
	{
		check_and_destroy(x + hsp, y, obj_destructibles);
		check_and_destroy(x + sign(hsp), y, obj_destructibles);
		check_and_destroy(x + xscale, y, obj_destructibles);
	}
	
	if ((state == 12 && sprite_index == spr_dive) || (state == 47 && momentum && movespeed >= 12) || state == 7 || state == 69 || state == 58 || state == 93)
	{
		check_and_destroy(x + hsp, y + vsp, obj_destructibles);
		check_and_destroy(x + sign(hsp), y + sign(vsp), obj_destructibles);
	}
	
	if (((state == 65 || state == 58 || state == 15 || state == 53) && vsp >= 0) || (state == 56 || (state == 81 && substate == 2) || state == 69) || ((state == 6 || state == 7 || state == 48) && vsp < 0))
	{
		check_and_destroy(x, y + vsp, obj_destructibles);
		check_and_destroy(x, y + sign(vsp), obj_destructibles);
		check_and_destroy(x, y + vsp + 2, obj_destructibles);
	}
	
	if (vsp >= 0 && (state == 53 || state == 90 || state == 15 || state == 7 || (state == 37 || state == 38)))
	{
		if (state == 53 || (state == 90 && sprite_index == spr_player_PZ_frostburn_spin) || (state == 15 && freeFallSmash >= 10) || ((state == 37 || state == 38) && freeFallSmash >= 10))
		{
			check_and_destroy(x, y + vsp, obj_metalblock);
			check_and_destroy(x, y + sign(vsp), obj_metalblock);
			check_and_destroy(x, y + 1, obj_metalblock);
		}
		
		check_and_destroy(x, y + vsp, obj_destructibles);
		check_and_destroy(x, y + sign(vsp), obj_destructibles);
		check_and_destroy(x, y + vsp + 2, obj_destructibles);
	}
	
	if ((state == 24 || state == 27 || state == 32 || state == 33 || state == 7) && vsp <= grav)
	{
		var ceiling_hit_head = check_and_destroy(x, y - 1, obj_destructibles, dont_break_worms);
		
		if (ceiling_hit_head && (state == 24 || state == 32 || state == 33) && !place_meeting(x, y - 1, obj_destructibles))
		{
			vsp = grav;
			jumpStop = true;
		}
	}
	
	if (state == 10)
	{
		with (obj_destructibles)
		{
			if (place_meeting(x - obj_parent_player.hsp, y, obj_parent_player))
			{
				var _player = instance_nearest(x, y, obj_parent_player);
				DestroyedBy = _player;
				event_user(0);
			}
		}
	}
	
	if (state == 34 || state == 6)
		check_and_destroy(x + sign(hsp), y + sign(vsp), obj_parent_clutterDestroyable);
	
	if (state == 24 || state == 1)
	{
		check_and_destroy(x, y + 1, obj_parent_clutterDestroyable);
		check_and_destroy(x, y + vsp, obj_parent_clutterDestroyable);
		check_and_destroy(x, y + sign(vsp), obj_parent_clutterDestroyable);
	}
	
	mask_index = old_mask;
}

function scr_baddie_collide_destroyables()
{
	if (state == 6 || canBreakBlocks)
	{
		check_and_destroy(x + hsp, y + vsp, obj_destructibles);
		check_and_destroy(x + sign(hsp), y + sign(vsp), obj_destructibles);
	}
}
