function cutscene_create(argument0)
{
	global.cutsceneManager = instance_create(0, 0, obj_cutsceneManager);
	
	with (global.cutsceneManager)
	{
		show_debug_message("Cutscene Manager: QUEUED FUNCTIONS");
		Event = argument0[0];
		show_debug_message(string("Cutscene Manager: [{0}], [Event: 0]", argument0[0]));
		
		for (var i = 1; i < array_length(argument0); i++)
		{
			ds_queue_enqueue(Cutscene, argument0[i]);
			show_debug_message(string("Cutscene Manager: [{0}], [Event: {1}]", argument0[i], i));
		}
	}
	
	return global.cutsceneManager;
}

function cutscene_event_end()
{
	with (global.cutsceneManager)
	{
		if (!ds_queue_empty(Cutscene))
		{
			var _event = ds_queue_dequeue(Cutscene);
			Event = _event;
			show_debug_message("Cutscene Manager: NEW EVENT");
		}
		else
		{
			instance_destroy();
		}
	}
}

function cutscene_declare_actor(argument0, argument1)
{
	with (global.cutsceneManager)
	{
		if (ds_exists(ActorMap, ds_type_map))
			ds_map_set(ActorMap, argument1, argument0);
	}
	
	return true;
}

function cutscene_get_actor(argument0)
{
	with (global.cutsceneManager)
	{
		if (ds_exists(ActorMap, ds_type_map))
			return ds_map_find_value(ActorMap, argument0);
	}
	
	return false;
}
