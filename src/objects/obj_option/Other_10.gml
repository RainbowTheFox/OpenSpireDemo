handle_savedoption();
kill_sounds([activeSFX]);
var onOffToggle = ["opt_off", "opt_on"];
var toMainPage = new option_button("opt_back", function()
{
	event_play_oneshot("event:/SFX/ui/menuBack");
	option_goto(backMenu, backOption);
});

switch (optionMenu)
{
	default:
		alignCenter = true;
		backMenu = -4;
		backOption = 0;
		options = [new option_button("opt_audio", function()
		{
			option_goto(2);
		}).add_icon(spr_newpause_icons, 5), new option_button("opt_video", function()
		{
			option_goto(1);
		}).add_icon(spr_newpause_icons, 6), new option_button("opt_game", function()
		{
			option_goto(3);
		}).add_icon(spr_newpause_icons, 8), new option_button("opt_controls", function()
		{
			option_goto(5);
		}).add_icon(spr_newpause_icons, 7)];
		break;
	
	case 2:
		backMenu = 0;
		backOption = 0;
		alignCenter = false;
		sliderSprite = spr_optionslide_bar;
		sliderIcon = spr_optionslide_end;
		var speaker_options = ["opt_aud_mono", "opt_aud_stereo"];
		options = [toMainPage, new option_slider("opt_aud_master", function(argument0)
		{
			global.masterVolume = argument0 / 100;
			set_volume_options();
		}, function(argument0)
		{
			global.masterVolume = argument0 / 100;
			set_volume_options();
			quick_write_option("Settings", "mastervol", global.masterVolume);
		}, round(global.masterVolume * 100), "event:/SFX/ui/sliderMaster"), new option_slider("opt_aud_music", function(argument0)
		{
			global.musicVolume = argument0 / 100;
			set_volume_options();
		}, function(argument0)
		{
			global.musicVolume = argument0 / 100;
			set_volume_options();
			quick_write_option("Settings", "musicvol", global.musicVolume);
		}, round(global.musicVolume * 100), "event:/SFX/ui/sliderMusic"), new option_slider("opt_aud_sfx", function(argument0)
		{
			global.soundVolume = argument0 / 100;
			set_volume_options();
		}, function(argument0)
		{
			global.soundVolume = argument0 / 100;
			set_volume_options();
			quick_write_option("Settings", "soundvol", global.soundVolume);
		}, round(global.soundVolume * 100), "event:/SFX/ui/sliderSFX"), new option_normal("opt_aud_focus", onOffToggle, function(argument0)
		{
			quick_write_option("Settings", "unfocusmute", argument0);
			global.unfocusedMute = argument0;
		}, global.unfocusedMute), new option_normal("opt_aud_speaker", speaker_options, function(argument0)
		{
			quick_write_option("Settings", "speaker", argument0);
			global.speakerOption = argument0;
			fmod_studio_system_set_parameter_by_name("speakerOption", argument0, true);
		}, global.speakerOption)];
		break;
	
	case 1:
		backMenu = 0;
		backOption = 1;
		alignCenter = false;
		var res = [];
		
		for (var i = 0; i < array_length(global.resolutions); i++)
			array_push(res, string("{0}X{1}", global.resolutions[i][0], global.resolutions[i][1]));
		
		options = [toMainPage, new option_normal("opt_vid_windowmode", ["opt_vid_windowmode_windowed", "opt_vid_windowmode_exclusive", "opt_vid_windowmode_borderless"], function(argument0)
		{
			quick_write_option("Settings", "fullscrn", argument0);
			global.fullscreen = argument0;
			
			with (obj_screen)
				alarm[0] = 1;
		}, global.fullscreen), new option_normal("opt_vid_resolution", res, function(argument0)
		{
			quick_write_option("Settings", "resolution", argument0);
			global.selectedResolution = argument0;
			set_resolution_option(global.selectedResolution);
		}, global.selectedResolution, false), new option_normal("opt_vid_vsync", onOffToggle, function(argument0)
		{
			quick_write_option("Settings", "vsync", argument0);
			display_reset(0, global.Vsync);
			global.Vsync = argument0;
		}, global.Vsync), new option_normal("opt_vid_texturefilter", onOffToggle, function(argument0)
		{
			quick_write_option("Settings", "TextureFiltering", argument0);
			global.TextureFiltering = argument0;
		}, global.TextureFiltering), new option_normal("opt_vid_showHUD", onOffToggle, function(argument0)
		{
			quick_write_option("Settings", "showHUD", argument0);
			global.ShowHUD = argument0;
		}, global.ShowHUD)];
		break;
	
	case 3:
		backMenu = 0;
		backOption = 2;
		alignCenter = false;
		var timer_options = ["opt_game_timer_type_level", "opt_game_timer_type_save", "opt_game_timer_type_both"];
		options = [toMainPage, new option_normal("opt_game_vibrate", onOffToggle, function(argument0)
		{
			quick_write_option("Settings", "vibration", argument0);
			global.controllerVibration = argument0;
		}, global.controllerVibration), new option_normal("opt_game_screenshake", onOffToggle, function(argument0)
		{
			quick_write_option("Settings", "screenshake", argument0);
			global.ScreenShake = argument0;
		}, global.ScreenShake), new option_normal("opt_game_timer", onOffToggle, function(argument0)
		{
			quick_write_option("Settings", "timer", argument0);
			global.toggleTimer = argument0;
		}, global.toggleTimer), new option_normal("opt_game_timerspeedrun", onOffToggle, function(argument0)
		{
			quick_write_option("Settings", "timerspeedrun", argument0);
			global.option_speedrun_timer = argument0;
		}, global.option_speedrun_timer), new option_normal("opt_game_timer_type", timer_options, function(argument0)
		{
			quick_write_option("Settings", "timertype", argument0);
			global.option_timer_type = argument0;
		}, global.option_timer_type)];
		break;
	
	case 4:
		backMenu = 3;
		backOption = 1;
		alignCenter = false;
		var lang_switcher = new option_normal("opt_access_lang", global.langFiles, function(argument0)
		{
			var f = global.langFiles[argument0];
			
			if (f != string("{0}.txt", global.langName))
			{
				scr_lang_set_file(f);
				quick_write_option("Settings", "lang", global.langName);
				trace("Current language: ", lang_get("language"));
			}
		}, array_get_index(global.langFiles, string("{0}.txt", global.langName)));
		
		with (lang_switcher)
			translate_opt = false;
		
		var timer_options = ["PER LEVEL", "PER SAVE", "BOTH"];
		options = [toMainPage, lang_switcher];
		break;
	
	case 5:
		backMenu = 0;
		backOption = 3;
		alignCenter = false;
		options = [toMainPage, new option_button("opt_ctrl_keyboard", function()
		{
			option_goto(6);
		}), new option_button("opt_ctrl_controller", function()
		{
			option_goto(7);
		})];
		break;
	
	case 6:
		backMenu = 5;
		backOption = 1;
		alignCenter = false;
		options = [toMainPage, new option_button("opt_ctrl_bindings", function()
		{
			if (!instance_exists(obj_option_keyconfig))
			{
				scr_input_varinit();
				
				with (instance_create(x, y, obj_option_keyconfig))
					gamepad = false;
			}
		}), new option_normal("opt_ctrl_keyboardsuperjump", onOffToggle, function(argument0)
		{
			quick_write_option("Settings", "dsjumpkey", argument0);
			global.option_sjump_key = argument0;
		}, global.option_sjump_key), new option_normal("opt_ctrl_keyboardgroundpound", onOffToggle, function(argument0)
		{
			quick_write_option("Settings", "dgroundpoundkey", argument0);
			global.option_groundpound_key = argument0;
		}, global.option_groundpound_key)];
		break;
	
	case 7:
		backMenu = 5;
		backOption = 2;
		alignCenter = false;
		options = [toMainPage, new option_button("opt_ctrl_bindings", function()
		{
			if (!instance_exists(obj_option_keyconfig))
			{
				scr_input_varinit();
				
				with (instance_create(x, y, obj_option_keyconfig))
					gamepad = true;
			}
		}), new option_button("opt_ctrl_deadzones", function()
		{
			option_goto(8);
		}), new option_normal("opt_ctrl_controllersuperjump", onOffToggle, function(argument0)
		{
			quick_write_option("Settings", "dsjumpgp", argument0);
			global.option_sjump_gp = argument0;
		}, global.option_sjump_gp), new option_normal("opt_ctrl_controllergroundpound", onOffToggle, function(argument0)
		{
			quick_write_option("Settings", "dgroundpoundgp", argument0);
			global.option_groundpound_gp = argument0;
		}, global.option_groundpound_gp)];
		break;
	
	case 8:
		backMenu = 7;
		backOption = 2;
		alignCenter = false;
		sliderSprite = spr_optionSlider;
		sliderIcon = spr_optionSliderIcon2;
		options = [toMainPage, new option_slider("opt_ctrl_dz_gen", function(argument0)
		{
			global.deadzones[0] = argument0 / 100;
		}, function(argument0)
		{
			global.deadzones[0] = argument0 / 100;
			quick_write_option("Settings", "deadzoneMaster", global.deadzones[0]);
		}, round(global.deadzones[0] * 100)), new option_slider("opt_ctrl_dz_vert", function(argument0)
		{
			global.deadzones[1] = argument0 / 100;
		}, function(argument0)
		{
			global.deadzones[1] = argument0 / 100;
			quick_write_option("Settings", "deadzoneVertical", global.deadzones[1]);
		}, round(global.deadzones[1] * 100)), new option_slider("opt_ctrl_dz_horiz", function(argument0)
		{
			global.deadzones[2] = argument0 / 100;
		}, function(argument0)
		{
			global.deadzones[2] = argument0 / 100;
			quick_write_option("Settings", "deadzoneHorizontal", global.deadzones[2]);
		}, round(global.deadzones[2] * 100)), new option_slider("opt_ctrl_dz_press", function(argument0)
		{
			global.deadzones[3] = argument0 / 100;
		}, function(argument0)
		{
			global.deadzones[3] = argument0 / 100;
			quick_write_option("Settings", "deadzonePress", global.deadzones[3]);
		}, round(global.deadzones[3] * 100)), new option_slider("opt_ctrl_dz_superjump", function(argument0)
		{
			global.deadzones[4] = argument0 / 100;
		}, function(argument0)
		{
			global.deadzones[4] = argument0 / 100;
			quick_write_option("Settings", "deadzoneSJump", global.deadzones[4]);
		}, round(global.deadzones[4] * 100)), new option_slider("opt_ctrl_dz_crouchwalk", function(argument0)
		{
			global.deadzones[5] = argument0 / 100;
		}, function(argument0)
		{
			global.deadzones[5] = argument0 / 100;
			quick_write_option("Settings", "deadzoneCrouch", global.deadzones[5]);
		}, round(global.deadzones[5] * 100))];
		break;
}
