function approach(argument0, argument1, argument2)
{
	return argument0 + clamp(argument1 - argument0, -argument2, argument2);
}

function instance_random(argument0)
{
	return instance_find(argument0, irandom(instance_number(argument0) - 1));
}

function trace()
{
	var trace_string = "";
	
	for (var i = 0; i < argument_count; i++)
		trace_string += string(argument[i]);
	
	show_debug_message(trace_string);
	exit;
}

function get_panic()
{
	return (global.panic && !global.RoomIsSecret) || instance_exists(obj_sucroseTimer);
}

function chance(argument0)
{
	return random(100) <= argument0;
}

function wave(argument0, argument1, argument2, argument3, argument4 = global.CurrentTime)
{
	var a4 = (argument1 - argument0) / 2;
	return argument0 + a4 + (sin((((argument4 * 0.001) + (argument2 * argument3)) / argument2) * 2 * pi) * a4);
}

function wrap(argument0, argument1, argument2)
{
	var _min = min(argument1, argument2);
	var _max = max(argument1, argument2);
	var range = (_max - _min) + 1;
	return ((((argument0 - _min) % range) + range) % range) + _min;
}

function animation_end_old(argument0 = floor(image_index), argument1 = image_number - 1)
{
	return argument0 >= argument1;
}

function sprite_animation_end(argument0 = sprite_index, argument1 = image_index, argument2 = sprite_get_number(argument0), argument3 = image_speed)
{
	return (argument1 + ((argument3 * sprite_get_speed(argument0)) / ((sprite_get_speed_type(argument0) == 1) ? 1 : game_get_speed(gamespeed_fps)))) >= argument2;
}

function absfloor(argument0)
{
	return (argument0 > 0) ? floor(argument0) : ceil(argument0);
}

function rank_checker(argument0 = global.rank)
{
	var ranks = ["d", "c", "b", "a", "s", "p"];
	
	for (var i = 0; i < array_length(ranks); i++)
	{
		if (argument0 == ranks[i])
			return i;
	}
	
	return -4;
}

function string_extract(argument0, argument1, argument2)
{
	var len = string_length(argument1) - 1;
	
	repeat (argument2)
		argument0 = string_delete(argument0, 1, string_pos(argument1, argument0) + len);
	
	argument0 = string_delete(argument0, string_pos(argument1, argument0), string_length(argument0));
	return argument0;
}

function create_small_number(argument0, argument1, argument2, argument3 = 16777215)
{
	return instance_create(argument0, argument1, obj_smallnumber, 
	{
		image_blend: argument3,
		number: string(argument2)
	});
}

function array_get_any(argument0)
{
	return array_get(argument0, irandom_range(0, array_length(argument0) - 1));
}

function draw_sprite_ext_flash(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8)
{
	gpu_set_fog(true, argument7, 0, 1);
	draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);
	gpu_set_fog(false, c_black, 0, 0);
}

function draw_self_flash(argument0)
{
	draw_sprite_ext_flash(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, argument0, image_alpha);
}

function draw_sprite_ext_duotone(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9)
{
	shader_set(shd_afterimage);
	var color_blend_1 = shader_get_uniform(shd_afterimage, "blendcolor1");
	var color_blend_2 = shader_get_uniform(shd_afterimage, "blendcolor2");
	shader_set_uniform_f(color_blend_1, color_get_red(argument7) / 255, color_get_green(argument7) / 255, color_get_blue(argument7) / 255);
	shader_set_uniform_f(color_blend_2, color_get_red(argument8) / 255, color_get_green(argument8) / 255, color_get_blue(argument8) / 255);
	draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, c_white, argument9);
	shader_reset();
}

function draw_self_duotone(argument0, argument1)
{
	draw_sprite_ext_duotone(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, argument0, argument1, image_alpha);
}

function time_in_frames(argument0, argument1)
{
	return ((argument0 * 60) + argument1) * 60;
}

function onBeat(argument0, argument1 = false)
{
	var bps = argument0 / 60;
	var spb = 1 / bps;
	var song_timer = audio_sound_get_track_position(global.music);
	var game_fps = 60;
	var beat2 = floor(song_timer) / (spb * game_fps);
	
	if (beat != beat2)
	{
		beat = beat2;
		return true;
	}
	
	return false;
}

function solid_in_line(argument0, argument1 = -4, argument2 = self)
{
	var _list = ds_list_create();
	var set_list = collision_line_list(x, y, argument0.x, argument0.y, obj_parent_collision, true, true, _list, true);
	
	if (set_list > 0)
	{
		for (var i = 0; i < set_list; i++)
		{
			var obj = ds_list_find_value(_list, i);
			
			if (argument1 != -4)
			{
				var found_obj = false;
				
				for (var b = 0; b < array_length(argument1); b++)
				{
					var arr = argument1[b];
					
					if (obj.object_index == arr)
						found_obj = true;
				}
				
				if (!found_obj)
				{
					ds_list_destroy(_list);
					return true;
				}
			}
			else
			{
				ds_list_destroy(_list);
				return true;
			}
		}
	}
	
	ds_list_destroy(_list);
	return false;
}

function angle_rotate(argument0, argument1, argument2)
{
	var diff = wrap(argument1 - argument0, -180, 180);
	
	if (diff < -argument2)
		return argument0 - argument2;
	
	if (diff > argument2)
		return argument0 + argument2;
	
	return argument1;
}

function getFacingDirection(argument0, argument1)
{
	if (argument0 != argument1)
		return -sign(argument0 - argument1);
	
	return 1;
}

function number_in_range(argument0, argument1, argument2)
{
	return argument0 >= argument1 && argument0 <= argument2;
}

function parameter_get_array()
{
	var p_num = parameter_count();
	var p_string = [];
	
	if (p_num > 0)
	{
		for (var i = 0; i < p_num; i++)
			p_string[i] = parameter_string(i);
	}
	
	return p_string;
}

function round_nearest(argument0, argument1)
{
	var val = abs(argument1[0] - argument0);
	var ind = 0;
	
	for (var i = 1; i < array_length(argument1); i++)
	{
		var dist = abs(argument1[i] - argument0);
		
		if (dist < val)
		{
			ind = i;
			val = dist;
		}
	}
	
	return argument1[ind];
}

function randomize_animations(argument0)
{
	if (!variable_instance_exists(self, "saved_rand_anim"))
		saved_rand_anim = [];
	
	if (!variable_instance_exists(self, "rand_anim"))
		rand_anim = [];
	
	if (saved_rand_anim != argument0 || array_length(rand_anim) <= 0)
	{
		saved_rand_anim = argument0;
		rand_anim = array_shuffle(argument0);
	}
	
	return array_shift(rand_anim);
}

function array_clone(argument0)
{
	var temp_arr = [];
	array_copy(temp_arr, 0, argument0, 0, array_length(argument0));
	return temp_arr;
}
