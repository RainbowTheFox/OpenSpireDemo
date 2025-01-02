function scr_hurtplayer(argument0 = obj_parent_player, argument1)
{
	if (!global.freezeframe && argument0.state != 70 && argument0.state != 51 && argument0.state != 66 && argument0.state != 36)
	{
		with (argument0)
		{
			if (cutscene)
				continue;
			
			if (state == 76)
				continue;
			
			if (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4)
				continue;
			
			if (state == 61)
			{
				sprite_index = spr_player_PZ_hitWall_mach3;
				state = 35;
				hsp = 2.5 * xscale;
				vsp = -3;
				machTwo = 0;
				image_index = 0;
				instance_create(x, y, obj_bombExplosion);
				
				for (var i = 0; i < (sprite_get_number(spr_minecartdebris) - 1); i++)
				{
					with (create_debris(x + random_range(-10, 10), y + random_range(-10, 10), spr_minecartdebris))
						image_index = i;
				}
			}
			else if (state == 47 || state == 56 || state == 57 || state == 58 || state == 93 || state == 59)
			{
			}
			else if (state == 81)
			{
			}
			else if (state != 36 && state != 18 && !hurted && !cutscene && state != 35 && state != 54)
			{
				if (state == 41 || state == 42)
				{
					with (instance_create(x, y, obj_dogMount))
					{
						image_xscale = other.xscale;
						sprite_index = spr_dogMount_kick;
						vsp = -16;
						hsp = -image_xscale * 16;
					}
				}
				
				event_play_oneshot("event:/SFX/player/hurt", x, y);
				create_particle(x, y, spr_bangEffect);
				create_particle(x, y, spr_parryeffect);
				state = 36;
				alarm[7] = 120;
				scr_sleep_ext(100);
				hurted = true;
				
				if (chance(50))
					fmod_studio_event_instance_start(voiceHurt);
				
				global.HurtCounter += 1;
				global.LocalHurtCounter += 1;
				
				if ((global.LocalHurtCounter % 10) == 0 && global.LocalHurtCounter >= 10)
				{
					var _string = lang_get("prompt_hurt", [lang_get(string("prompt_{0}", scr_getCharacterPrefix(global.playerCharacter))), global.LocalHurtCounter]);
					scr_queueToolTipPrompt(string("[shake]{0}", _string));
					scr_queueTVAnimation(randomize_animations(global.TvSprPlayer_HurtExp));
				}
				else
				{
					scr_queueTVAnimation(global.TvSprPlayer_Hurt, 60);
				}
				
				sprite_index = (sign(image_xscale) == other.image_xscale) ? spr_hurtjump : spr_hurt;
				movespeed = !is_undefined(argument1) ? argument1 : 8;
				global.ComboTime = clamp(global.ComboTime - 25, 0, 60);
				var _oldcollect = global.Collect;
				global.Collect = max(global.Collect - 50, 0);
				var _repeat = clamp(round((_oldcollect - global.Collect) / 10), 0, 15);
				
				if (_oldcollect > 0)
				{
					instance_create(x, y, obj_pointLoseNumber, 
					{
						image_blend: c_red,
						number: string(global.Collect - _oldcollect)
					});
					
					repeat (_repeat)
						instance_create(x, y, obj_collectableLoss);
				}
				
				instance_create(x, y, obj_spikehurteffect);
				
				repeat (5)
					instance_create(x, y, obj_hurtStars);
				
				image_index = 0;
				flash = true;
				vsp = -12;
				return true;
			}
		}
	}
	
	return false;
}

function player_complete_invulnerability(argument0 = obj_parent_player)
{
	var _states = [2, 76, 70, 19, 52, 26, 40, 25];
	return array_contains(_states, argument0.state);
}

function player_can_hurt(argument0 = obj_parent_player)
{
	var _states = [47, 56, 57, 58, 93, 59];
	return !array_contains(_states, argument0.state) && !player_complete_invulnerability(argument0);
}
