for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
	var b = ds_list_find_value(global.afterimage_list, i);
	
	with (b)
	{
		for (var l = 0; l < array_length(alarm); l++)
		{
			if (alarm[l] >= 0 && !global.freezeframe)
				alarm[l]--;
		}
		
		if (blink)
			visible = global.BlinkTrail;
		
		if (instance_exists(identity) && object_is_ancestor(identity.object_index, obj_parent_player))
		{
			if (identity.state == 32 || (identity.state == 33 && mach3Afterimage))
				image_alpha = identity.movespeed / 12;
			else
				image_alpha = 1;
			
			if (identity.isInSecretPortal || identity.isInLapPortal)
				image_alpha = 0;
		}
		
		if (instance_exists(identity) && (object_get_parent(identity.object_index) == obj_parent_player || identity.object_index == obj_parent_player) && mach3Afterimage && identity.state != 33 && !(identity.state == 3 && identity.movespeed >= 12) && identity.state != 4 && identity.state != 32 && identity.state != 10 && identity.state != 34 && identity.state != 15 && !(identity.state == 12 && identity.mach3Roll > 0) && identity.state != 27 && identity.state != 51 && identity.state != 54 && identity.state != 125 && identity.state != 24 && identity.state != 48 && identity.state != 65 && identity.state != 31 && identity.state != 90 && identity.state != 54 && identity.state != 27 && identity.state != 7)
			vanish = true;
		
		if (!mach3Afterimage && !fakeMach3Afterimage)
			vanish = true;
		
		if (vanish)
			gonealpha = approach(gonealpha, 0, vanishSpd);
		
		x += hsp;
		y += vsp;
		
		if (alarm[0] == 0 || !instance_exists(identity))
			vanish = true;
		
		if (alarm[1] == 0 || gonealpha == 0)
		{
			b = undefined;
			ds_list_delete(global.afterimage_list, i);
			i--;
		}
	}
}

if (!global.freezeframe)
{
	if (blinkingBuffer > 0)
	{
		blinkingBuffer--;
	}
	else
	{
		event_user(0);
		blinkingBuffer = 3;
	}
}
