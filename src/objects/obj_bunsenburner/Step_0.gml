if (sprite_index == candleBurn || global.freezeframe)
	exit;

var touched = false;

if (place_meeting(x, y, obj_parent_player))
{
	with (obj_parent_player)
	{
		if (state == 76 || state == 0)
			exit;
		
		if (state == 41 || state == 42)
		{
			if (sprite_index != spr_player_PZ_dogMount_inflate_jump)
			{
				sprite_index = spr_player_PZ_dogMount_inflate;
				image_index = 0;
				vsp = -10;
				state = 44;
				touched = true;
			}
		}
		else if (state != 44)
		{
			sprite_index = spr_player_PZ_fireAss_intro;
			vsp = -20;
			state = 67;
			image_index = 0;
			movespeed = hsp;
			
			if (!event_instance_isplaying(sndFireass))
				fmod_studio_event_instance_start(sndFireass);
			
			event_play_oneshot("event:/SFX/player/burn", x, y);
			touched = true;
		}
	}
}

if (sprite_index != candleBurn && touched)
{
	sprite_index = candleBurn;
	image_index = 0;
}
