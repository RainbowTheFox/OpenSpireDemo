function scr_player_changeCharacter(argument0 = obj_player1, argument1, argument2 = false)
{
	with (argument0)
	{
		previousCharacter = global.playerCharacter;
		global.playerCharacter = argument1;
		
		if (!argument2)
			mainPlayerCharacter = argument1;
		
		scr_characterSprite();
	}
}

function scr_playerrespawn(argument0 = true, argument1 = false)
{
	if (!argument0)
	{
		if (state != 19 && (state != 70 || instance_exists(obj_techdiff)) && state != 59 && !place_meeting(x, y + 32, obj_vertical_hallway) && !instance_exists(obj_fadeoutTransition) && room != timesuproom && room != rank_room)
		{
			var _checkpoint = instance_nearest(x, y, obj_checkpoint_invis);
			var _checkpointReal = -4;
			
			with (obj_checkpoint)
			{
				if (Checkpointactivated)
					_checkpointReal = id;
			}
			
			if (instance_exists(_checkpoint) && _checkpoint.Checkpointactivated)
			{
				x = _checkpoint.x;
				y = _checkpoint.y;
				instance_create(_checkpoint.x, _checkpoint.y, obj_poofeffect);
			}
			else if (instance_exists(_checkpointReal) && _checkpointReal.Checkpointactivated)
			{
				x = _checkpointReal.x;
				y = _checkpointReal.y;
				instance_create(_checkpointReal.x, _checkpointReal.y, obj_poofeffect);
			}
			else
			{
				x = roomStartX;
				y = roomStartY;
				instance_create(roomStartX, roomStartY, obj_poofeffect);
			}
			
			state = 1;
			alarm[7] = 60;
			hurted = true;
			sprite_index = spr_idle;
		}
	}
	else if (!instance_exists(obj_techdiff))
	{
		if (!argument1)
		{
			event_play_oneshot("event:/SFX/player/groundpound", x, room_height - 100);
			camera_shake_add(3, 3);
			hsp = 0;
			vsp = 0;
		}
		
		instance_create(x, y, obj_techdiff, 
		{
			drowned: argument1
		});
		state = 70;
	}
	
	with (obj_achievementTracker)
		hitInMinecart = true;
}

function scr_playerstate()
{
	var state_function = undefined;
	
	switch (state)
	{
		case 1:
			state_function = state_player_normal;
			break;
		
		case 24:
			state_function = state_player_jump;
			break;
		
		case 3:
			state_function = state_player_run;
			break;
		
		case 2:
			state_function = state_player_titlescreen;
			break;
		
		case 4:
			state_function = state_player_charge;
			break;
		
		case 6:
			state_function = state_player_climbwall;
			break;
		
		case 7:
			state_function = state_player_wallkick;
			break;
		
		case 8:
			state_function = state_player_machtumble;
			break;
		
		case 10:
			state_function = state_player_grabdash;
			break;
		
		case 17:
			state_function = state_player_grab;
			break;
		
		case 11:
			state_function = state_player_timesup;
			break;
		
		case 12:
			state_function = state_player_machroll;
			break;
		
		case 14:
			state_function = state_player_swingclub;
			break;
		
		case 15:
			state_function = state_player_superslam;
			break;
		
		case 16:
			state_function = state_player_grind;
			break;
		
		case 39:
			state_function = state_player_hang;
			break;
		
		case 18:
			state_function = state_player_taunt;
			break;
		
		case 19:
			state_function = state_player_gameover;
			break;
		
		case 20:
			state_function = state_player_ceilingCrash;
			break;
		
		case 21:
			state_function = state_player_freefallprep;
			break;
		
		case 13:
			state_function = state_player_tackle;
			break;
		
		case 22:
			state_function = state_player_slipnslide;
			break;
		
		case 23:
			state_function = state_player_ladder;
			break;
		
		case 25:
			state_function = state_player_victory;
			break;
		
		case 26:
			state_function = state_player_comingoutdoor;
			break;
		
		case 27:
			state_function = state_player_Sjump;
			break;
		
		case 28:
			state_function = state_player_Sjumpprep;
			break;
		
		case 29:
			state_function = state_player_crouch;
			break;
		
		case 30:
			state_function = state_player_crouchjump;
			break;
		
		case 31:
			state_function = state_player_mach1;
			break;
		
		case 32:
			state_function = state_player_mach2;
			break;
		
		case 33:
			state_function = state_player_mach3;
			break;
		
		case 34:
			state_function = state_player_machslide;
			break;
		
		case 35:
			state_function = state_player_bump;
			break;
		
		case 36:
			state_function = state_player_hurt;
			break;
		
		case 37:
			state_function = state_player_freefall;
			break;
		
		case 38:
			state_function = state_player_freefallland;
			break;
		
		case 40:
			state_function = state_player_door;
			break;
		
		case 41:
			state_function = state_player_doughmount;
			break;
		
		case 42:
			state_function = state_player_doughmountspin;
			break;
		
		case 44:
			state_function = state_player_doughmountballoon;
			break;
		
		case 45:
			state_function = state_player_doughmountpancake;
			break;
		
		case 55:
			state_function = state_player_gotkey;
			break;
		
		case 46:
			state_function = state_player_finishingblow;
			break;
		
		case 47:
			state_function = state_player_cotton;
			break;
		
		case 48:
			state_function = state_player_uppercut;
			break;
		
		case 49:
			state_function = state_player_pal;
			break;
		
		case 50:
			state_function = state_player_shocked;
			break;
		
		case 73:
			state_function = state_player_rocketlauncher;
			break;
		
		case 51:
			state_function = state_player_parry;
			break;
		
		case 54:
			state_function = state_player_tumble;
			break;
		
		case 52:
			state_function = state_player_talkto;
			break;
		
		case 53:
			state_function = state_player_puddle;
			break;
		
		case 56:
			state_function = state_player_cottondrill;
			break;
		
		case 57:
			state_function = state_player_cottonroll;
			break;
		
		case 58:
			state_function = state_player_cottondig;
			break;
		
		case 59:
			state_function = state_player_fling;
			break;
		
		case 60:
			state_function = state_player_breakdance;
			break;
		
		case 61:
			state_function = state_player_minecart;
			break;
		
		case 63:
			state_function = state_player_minecart_bump;
			break;
		
		case 62:
			state_function = state_player_minecart_launched;
			break;
		
		case 67:
			state_function = state_player_fireass;
			break;
		
		case 68:
			state_function = state_player_fireassdash;
			break;
		
		case 64:
			state_function = state_player_squished;
			break;
		
		case 65:
			state_function = state_player_machtumble;
			break;
		
		case 66:
			state_function = state_player_dodgetumble;
			break;
		
		case 69:
			state_function = state_player_geyser;
			break;
		
		case 70:
			state_function = state_player_actor;
			break;
		
		case 72:
			state_function = state_player_changing;
			break;
		
		case 71:
			state_function = state_player_donothing;
			break;
		
		case 85:
			state_function = state_player_drown;
			break;
		
		case 0:
			state_function = state_player_frozen;
			break;
		
		case 75:
			state_function = state_player_trick;
			break;
		
		case 76:
			state_function = state_player_noclip;
			break;
		
		case 77:
			state_function = state_player_costumenormal;
			break;
		
		case 78:
			state_function = state_player_costumegrab;
			break;
		
		case 80:
			state_function = state_player_costumechuck;
			break;
		
		case 79:
			state_function = state_player_costumebreeze;
			break;
		
		case 81:
			state_function = state_player_bottlerocket;
			break;
		
		case 88:
			state_function = state_player_frostburnnormal;
			break;
		
		case 89:
			state_function = state_player_frostburnslide;
			break;
		
		case 90:
			state_function = state_player_frostburnjump;
			break;
		
		case 91:
			state_function = state_player_frostburnstick;
			break;
		
		case 92:
			state_function = state_player_supergrab;
			break;
		
		case 43:
			state_function = state_player_doughmountjump;
			break;
		
		case 93:
			state_function = state_player_fling_launch;
			break;
		
		case 94:
			state_function = state_player_freeflight;
			break;
	}
	
	stateName = string("State : {0}", state);
	
	if (!is_undefined(state_function))
	{
		state_function();
		
		if (global.DebugMode)
			stateName = "PlayerState." + string_extract(script_get_name(state_function), "_", 1) + string_extract(script_get_name(state_function), "_", 3);
	}
}

function scr_isMainCharacter()
{
	return global.playerCharacter == 0;
}
