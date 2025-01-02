with (other)
{
	if (!cutscene && !global.freezeframe && (state != 18 && state != 37 && state != 21 && state != 38))
	{
		jumpStop = true;
		vsp = -18;
		
		if (state == 1 || state == 29 || state == 10 || state == 34)
			state = 24;
		
		if (state == 88 || state == 91 || state == 90)
		{
			image_index = 0;
			sprite_index = spr_player_PZ_frostburn_jump;
			state = 90;
		}
		
		if (state == 6 || state == 12)
			state = 32;
		
		if (state == 24 || state == 1)
		{
			sprite_index = spr_player_PZ_fall_outOfControl;
			image_index = 0;
		}
		
		with (other)
		{
			if (sprite_index != spr_marshmallowSpring_active)
				event_play_oneshot("event:/SFX/general/mallowbounce", x, y);
			
			sprite_index = spr_marshmallowSpring_active;
			image_index = 0;
		}
	}
}
