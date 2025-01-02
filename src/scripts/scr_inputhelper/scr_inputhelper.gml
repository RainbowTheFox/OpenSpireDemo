function scr_checkanygamepad(argument0)
{
	var gpButtons = [32769, 32770, 32771, 32772, 32773, 32775, 32774, 32776, 32777, 32778, 32779, 32780, 32781, 32782, 32783, 32784, 32785, 32786, 32788, 32787];
	
	for (var i = 0; i < array_length(gpButtons); i++)
	{
		if (gamepad_button_check_pressed(argument0, gpButtons[i]))
			return gpButtons[i];
	}
	
	return -4;
}

function scr_check_joysticks(argument0, argument1 = 0.5)
{
	var sticks = [32785, 32786, 32787, 32788];
	
	for (var i = 0; i < array_length(sticks); i++)
	{
		var val = gamepad_axis_value(argument0, sticks[i]);
		
		if (val > argument1)
			return sticks[i];
		
		if (val < -argument1)
			return sticks[i];
	}
	
	return -4;
}

function scr_checkanystick(argument0, argument1 = 0.5)
{
	var sticks = [32785, 32786, 32787, 32788];
	
	for (var i = 0; i < array_length(sticks); i++)
	{
		var val = gamepad_axis_value(argument0, sticks[i]);
		
		if (val > argument1 || val < -argument1)
			return true;
	}
	
	return false;
}

function scr_checksuperjump()
{
	var disabled = global.option_sjump_gp;
	
	if (global.PlayerInputDevice < 0)
		disabled = global.option_sjump_key;
	
	return (disabled && key_up) || key_superjump;
}

function scr_checkgroundpound()
{
	var disabled = global.option_groundpound_gp;
	
	if (global.PlayerInputDevice < 0)
		disabled = global.option_groundpound_key;
	
	return (disabled && key_down2) || key_groundpound;
}

function scr_input_init_sprites()
{
	if (!variable_global_exists("input_icons"))
		global.input_icons = ds_map_create();
	
	scr_input_icon_add(["UNSET"], spr_key_empty, 0);
	scr_input_icon_add(["NONE"], spr_key_special, 0);
	scr_input_icon_add([32], spr_key_special, 1);
	scr_input_icon_add([38], spr_key_special, 2);
	scr_input_icon_add([39], spr_key_special, 3);
	scr_input_icon_add([40], spr_key_special, 4);
	scr_input_icon_add([37], spr_key_special, 5);
	scr_input_icon_add([16, 160, 161], spr_key_special, 6);
	scr_input_icon_add([17, 162, 163], spr_key_special, 7);
	scr_input_icon_add([18, 164, 165], spr_key_special, 8);
	scr_input_icon_add([27], spr_key_special, 9);
	scr_input_icon_add([13], spr_key_special, 10);
	scr_input_icon_add([8], spr_key_special, 11);
	scr_input_icon_add([20], spr_key_special, 12);
	scr_input_icon_add([9], spr_key_special, 13);
	scr_input_icon_add([32785, 32786], spr_key_controller, 18);
	scr_input_icon_add([32787, 32788], spr_key_controller, 19);
	scr_input_icon_add([32779], spr_key_controller, 18);
	scr_input_icon_add([32780], spr_key_controller, 19);
	scr_input_icon_add([32769], spr_key_controller, 8);
	scr_input_icon_add([32771], spr_key_controller, 9);
	scr_input_icon_add([32772], spr_key_controller, 10);
	scr_input_icon_add([32770], spr_key_controller, 11);
	scr_input_icon_add([32781], spr_key_controller, 0);
	scr_input_icon_add([32782], spr_key_controller, 1);
	scr_input_icon_add([32784], spr_key_controller, 2);
	scr_input_icon_add([32783], spr_key_controller, 3);
	scr_input_icon_add([32778], spr_key_controller, 17);
	scr_input_icon_add([32777], spr_key_controller, 16);
	scr_input_icon_add([32775], spr_key_controller, 12);
	scr_input_icon_add([32776], spr_key_controller, 13);
	scr_input_icon_add([32773], spr_key_controller, 14);
	scr_input_icon_add([32774], spr_key_controller, 15);
}

function scr_input_icon_add(argument0, argument1, argument2)
{
	for (var i = 0; i < array_length(argument0); i++)
	{
		var input = argument0[i];
		ds_map_set(global.input_icons, input, [argument1, argument2]);
		trace("Added ", sprite_get_name(argument1), string(" (frame: {0}) to input icon map for {1}.", argument2, input));
	}
}

function scr_input_get_actions(argument0)
{
	var inputArr = [];
	var use_gamepad = global.PlayerInputDevice >= 0;
	
	if (instance_exists(obj_option_keyconfig))
		use_gamepad = obj_option_keyconfig.gamepad;
	
	if (use_gamepad && !string_ends_with(argument0, "C"))
		argument0 = string_concat(argument0, "C");
	
	var input = input_get(argument0);
	
	if (is_undefined(input))
		return inputArr;
	
	if (!use_gamepad && array_length(input.keyInputs) > 0)
		inputArr = input.keyInputs;
	else if (use_gamepad && array_length(input.gpInputs) > 0)
		inputArr = input.gpInputs;
	
	return inputArr;
}

function scr_input_get_icon(argument0, argument1 = false)
{
	var result = [];
	var inputArr = scr_input_get_actions(argument0);
	var length = argument1 ? array_length(inputArr) : 1;
	
	if (array_length(inputArr) > 0)
	{
		for (var i = 0; i < length; i++)
		{
			var ico = ds_map_find_value(global.input_icons, array_get(inputArr, i));
			var iarr = [inputArr[i]];
			
			if (!is_undefined(ico))
				array_push(result, array_concat(ico, iarr));
			else
				array_push(result, array_concat(ds_map_find_value(global.input_icons, "UNSET"), iarr));
		}
	}
	else
	{
		result = [array_concat(ds_map_find_value(global.input_icons, "NONE"), [-1])];
	}
	
	return argument1 ? result : result[0];
}

function get_control_sprite(argument0, argument1 = false)
{
	var _controller = global.PlayerInputDevice >= 0;
	
	switch (argument0)
	{
		case "forward":
			argument0 = (obj_parent_player.xscale == -1) ? "left" : "right";
			break;
		
		case "backward":
			argument0 = (obj_parent_player.xscale == 1) ? "left" : "right";
			break;
		
		case "dialogSJ":
			var _enabled = _controller ? global.option_sjump_gp : global.option_sjump_key;
			argument0 = _enabled ? "superjump" : "up";
			break;
		
		case "dialogGP":
			var _enabled = _controller ? global.option_groundpound_gp : global.option_groundpound_key;
			argument0 = _enabled ? "groundpound" : "down";
			break;
	}
	
	var icon = scr_input_get_icon(argument0);
	
	if (argument1)
		return icon;
	
	var str = string("[{0}]", sprite_get_name(icon[0]) + ", " + string(floor(icon[1])));
	
	if (icon[0] == spr_key_empty)
		str += string("[spr_keyDrawFont]{0}", scr_keyname(icon[2]));
	
	return str;
}

function draw_control_sprite(argument0, argument1, argument2)
{
	var icon = get_control_sprite(argument0, true);
	var base = scribble(string("[{0}, {1}]", sprite_get_name(icon[0]), floor(icon[1]))).align(1, 1).blend(draw_get_color(), draw_get_alpha()).draw(argument1, argument2);
	
	if (icon[0] == spr_key_empty)
		scribble(string_copy(scr_keyname(icon[2]), 1, 3)).starting_format(font_get_name(global.keyDrawFont), 0).align(1, 1).blend(draw_get_color(), draw_get_alpha()).draw(argument1 + 16, argument2);
	
	return base;
}
