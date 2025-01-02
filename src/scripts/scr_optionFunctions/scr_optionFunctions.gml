function set_resolution_option(argument0)
{
	window_set_size(global.resolutions[argument0][0], global.resolutions[argument0][1]);
	window_center();
}

function create_option() constructor
{
	static add_icon = function(argument0, argument1)
	{
		sprite_index = argument0;
		image_index = argument1;
		return self;
	};
	
	value = 0;
	options = [];
	id = "";
	translate_opt = true;
	translate_name = true;
	on_toggle = undefined;
	on_slide = undefined;
	on_stop = undefined;
	sound = -4;
	alpha = 1;
	moving = false;
	show_percent = false;
	sprite_index = -4;
	image_index = 0;
	icon_alpha = 0;
}

function option_normal(argument0, argument1, argument2, argument3, argument4 = true) : create_option() constructor
{
	id = argument0;
	type = 2;
	options = argument1;
	on_toggle = argument2;
	value = argument3;
	translate_opt = argument4;
}

function option_button(argument0, argument1) : create_option() constructor
{
	id = argument0;
	on_toggle = argument1;
	type = 6;
}

function option_slider(argument0, argument1, argument2, argument3, argument4 = -4, argument5 = false) : create_option() constructor
{
	id = argument0;
	on_slide = argument1;
	on_stop = argument2;
	type = 7;
	sound = argument4;
	value = argument3;
	show_percent = argument5;
}

function option_goto(argument0, argument1 = 0)
{
	var _OldMenu = optionMenu;
	optionMenu = argument0;
	optionSelected = argument1;
	inputBuffer = 2;
	event_user(0);
}

function draw_option(argument0, argument1, argument2, argument3)
{
	draw_set_color(c_white);
	
	if (!argument3)
		draw_set_color(#666666);
	
	draw_text(argument0, argument1, argument2);
	draw_set_color(c_white);
}

function init_option()
{
	ini_open("optionData.ini");
	global.fullscreen = ini_read_real("Settings", "fullscrn", 0);
	global.selectedResolution = ini_read_real("Settings", "resolution", 1);
	global.smoothcam = false;
	global.hitstunEnabled = true;
	global.Vsync = ini_read_real("Settings", "vsync", 1);
	global.ShowHUD = ini_read_real("Settings", "ShowHUD", 1);
	global.screentilt = false;
	global.playerrotate = false;
	global.ScreenShake = ini_read_real("Settings", "screenshake", 1);
	global.tvmessages = false;
	global.lowperformance = false;
	global.TextureFiltering = ini_read_real("Settings", "TextureFiltering", 0);
	global.unfocusedMute = ini_read_real("Settings", "unfocusmute", 1);
	global.toggleTimer = ini_read_real("Settings", "timer", 1);
	global.controllerVibration = ini_read_real("Settings", "vibration", 1);
	global.musicVolume = ini_read_real("Settings", "musicvol", 0.9);
	global.dialogueVolume = ini_read_real("Settings", "dialoguevol", 1);
	global.soundVolume = ini_read_real("Settings", "soundvol", 1);
	global.masterVolume = ini_read_real("Settings", "mastervol", 1);
	global.speakerOption = ini_read_real("Settings", "speaker", 1);
	global.option_sjump_key = ini_read_real("Settings", "dsjumpkey", 1);
	global.option_sjump_gp = ini_read_real("Settings", "dsjumpgp", 1);
	global.option_groundpound_key = ini_read_real("Settings", "dgroundpoundkey", 1);
	global.option_groundpound_gp = ini_read_real("Settings", "dgroundpoundgp", 1);
	global.option_speedrun_timer = ini_read_real("Settings", "timerspeedrun", 0);
	global.option_timer_type = ini_read_real("Settings", "timertype", 2);
	global.option_livesplit_enabled = ini_read_real("Settings", "livesplit", 0);
	ini_close();
	scr_setinput_init();
	scr_input_create();
	scr_lang_init();
	display_reset(0, global.Vsync);
	set_resolution_option(global.selectedResolution);
	
	with (obj_screen)
		event_perform(ev_alarm, 0);
	
	scr_initKeyNameMap();
}

function quick_write_option(argument0, argument1, argument2)
{
	ini_open("optionData.ini");
	
	if (is_string(argument2))
		ini_write_string(argument0, argument1, argument2);
	else
		ini_write_real(argument0, argument1, argument2);
	
	ini_close();
}

function create_option_menu(argument0, argument1, argument2, argument3 = camera_get_view_width(view_camera[0]) / 2, argument4 = 150, argument5 = 25)
{
	return -4;
	var q = 
	{
		centered: argument0,
		backto: argument1,
		options: argument2,
		xpad: argument3,
		ypad: argument4,
		textpad: argument5
	};
	return q;
}

function create_option_toggle(argument0, argument1, argument2, argument3)
{
	return -4;
	var q = 
	{
		name: argument1,
		desc: argument2,
		type: 0,
		alpha: 1,
		func: argument3,
		value: 0
	};
	array_push(argument0, q);
	return q;
}

function create_option_press(argument0, argument1, argument2, argument3)
{
	return -4;
	var q = 
	{
		name: argument1,
		desc: argument2,
		type: 3,
		alpha: 1,
		func: argument3,
		value: 0
	};
	array_push(argument0, q);
	return q;
}

function create_option_multichoice(argument0, argument1, argument2, argument3, argument4)
{
	return -4;
	var q = 
	{
		name: argument1,
		desc: argument2,
		type: 2,
		alpha: 1,
		choices: argument3,
		func: argument4,
		value: 0
	};
	array_push(argument0, q);
	return q;
}

function create_option_slider(argument0, argument1, argument2, argument3, argument4, argument5 = undefined)
{
	return -4;
	var q = 
	{
		name: argument1,
		desc: argument2,
		type: 1,
		alpha: 1,
		on_move: argument3,
		on_stop: argument4,
		value: 0,
		moving: false,
		sound: undefined
	};
	
	if (!is_undefined(argument5))
		q.sound = fmod_createEventInstance(argument5);
	
	array_push(argument0, q);
	return q;
}

function goto_menu(argument0)
{
	return -4;
	selectedmenu = argument0;
	optionselected = 0;
	textScroll = -9999;
	pgHeight = 0;
	showdesc = false;
}
