function event_instance_isplaying(argument0)
{
	return fmod_studio_event_instance_get_playback_state(argument0) == 0;
}

function event_instance_exists(argument0)
{
	return fmod_studio_event_description_get_instance_count(argument0) > 0;
}

function event_play_oneshot(argument0 = "", argument1 = undefined, argument2 = undefined, argument3 = 0)
{
	var _id = fmod_createEventInstance(argument0);
	fmod_studio_event_instance_start(_id);
	
	if (!is_undefined(argument1) && !is_undefined(argument2))
		fmod_event_set3DPosition(_id, argument1, argument2, argument3);
	
	fmod_studio_event_instance_release(_id);
	return _id;
}

function event_play_oneshot_ext(argument0 = "", argument1 = undefined, argument2 = undefined, argument3 = 0)
{
	var _id = fmod_createEventInstance(argument0);
	fmod_studio_event_instance_start(_id);
	
	if (!is_undefined(argument1) && !is_undefined(argument2))
		fmod_event_set3DPosition(_id, argument1, argument2, argument3);
	
	ds_list_add(global.FMOD_OneShotList, 
	{
		id: _id,
		name: argument0,
		one_shot: true
	});
	return _id;
}

function event_play_multiple(argument0 = "", argument1 = undefined, argument2 = undefined, argument3 = 0)
{
	event_play_oneshot(argument0, argument1, argument2, argument3);
}

function fmod_quick3D(argument0, argument1 = x, argument2 = y, argument3 = 0)
{
	if (event_instance_isplaying(argument0))
		fmod_event_set3DPosition(argument0, argument1, argument2, argument3);
}

function kill_sounds(argument0)
{
	if (is_array(argument0))
	{
		for (var i = 0; i < array_length(argument0); i++)
		{
			var snd = argument0[i];
			fmod_studio_event_instance_stop(snd, true);
			fmod_studio_event_instance_release(snd);
		}
	}
	else
	{
		fmod_studio_event_instance_stop(argument0, true);
		fmod_studio_event_instance_release(argument0);
	}
}

function kill_sound_list(argument0)
{
	if (is_array(argument0))
	{
		for (var i = 0; i < array_length(argument0); i++)
		{
			var snd_id = argument0[i];
			
			for (var p = 0; p < ds_list_size(global.FMOD_OneShotList); p++)
			{
				var entry = ds_list_find_value(global.FMOD_OneShotList, p);
				
				if (entry != -4 && !is_undefined(entry) && entry.id == snd_id)
				{
					kill_sounds(snd_id);
					ds_list_delete(global.FMOD_OneShotList, p);
					p--;
				}
			}
		}
	}
	else
	{
		var snd_id = argument0;
		
		for (var p = 0; p < ds_list_size(global.FMOD_OneShotList); p++)
		{
			var entry = ds_list_find_value(global.FMOD_OneShotList, p);
			
			if (entry != -4 && !is_undefined(entry) && entry.id == snd_id)
			{
				kill_sounds(snd_id);
				ds_list_delete(global.FMOD_OneShotList, p);
			}
		}
	}
}
