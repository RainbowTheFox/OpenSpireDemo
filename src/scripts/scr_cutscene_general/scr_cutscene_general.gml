function cutscene_wait(argument0)
{
	with (obj_cutsceneManager)
	{
		timer++;
		
		if (timer >= argument0)
		{
			timer = 0;
			cutscene_event_end();
		}
	}
}

function cutscene_end_player()
{
	obj_parent_player.state = 1;
	obj_parent_player.hsp = 0;
	obj_parent_player.vsp = 0;
	obj_parent_player.sprite_index = obj_parent_player.spr_idle;
	cutscene_event_end();
}

function cutscene_start_player()
{
	obj_parent_player.state = 70;
	obj_parent_player.hsp = 0;
	obj_parent_player.vsp = 0;
	obj_parent_player.sprite_index = obj_parent_player.spr_idle;
	cutscene_event_end();
}

function cutscene_create_instance(argument0, argument1, argument2)
{
	instance_create(argument0, argument1, argument2);
	cutscene_event_end();
}

function cutscene_do_func(argument0)
{
	argument[0]();
	cutscene_event_end();
}

function cutscene_with_actor(argument0, argument1)
{
	cutscene_event_end();
	
	with (cutscene_get_actor(argument0))
		return argument[1]();
}

function cutscene_do_dialog(argument0, argument1 = false)
{
	queue_dialogue(argument0, argument1);
	
	with (obj_dialogue)
		instant_destroy = argument1;
	
	cutscene_event_end();
}

function cutscene_wait_dialog()
{
	var finished = false;
	
	if (!instance_exists(obj_dialogue) && !instance_exists(obj_dialogue_choices))
		finished = true;
	
	if (finished)
		cutscene_event_end();
}

function cutscene_lerp_actor(argument0, argument1, argument2, argument3)
{
	var finished = false;
	
	with (cutscene_get_actor(argument0))
	{
		x = lerp(x, argument1, argument3);
		y = lerp(y, argument2, argument3);
		
		if (distance_to_point(argument1, argument2) <= 4)
		{
			finished = true;
			x = argument1;
			y = argument2;
		}
	}
	
	if (finished)
		cutscene_event_end();
}

function cutscene_move_actor(argument0, argument1, argument2, argument3)
{
	var finished = false;
	var real_actor = cutscene_get_actor(argument0);
	
	with (real_actor)
	{
		var angle = point_direction(x, y, argument1, argument2);
		var dir_x = lengthdir_x(argument3, angle);
		var dir_y = lengthdir_y(argument3, angle);
		x = approach(x, argument1, dir_x);
		y = approach(y, argument2, dir_y);
		
		if (x == argument1 && y == argument2)
			finished = true;
	}
	
	if (finished || !real_actor)
		cutscene_event_end();
}

function cutscene_new_actor(argument0, argument1, argument2, argument3)
{
	var new_actor = instance_create(argument0, argument1, obj_actor);
	new_actor.sprite_index = argument2;
	
	with (new_actor)
		cutscene_declare_actor(id, argument3);
	
	cutscene_event_end();
	return new_actor;
}

function cutscene_actor_animend(argument0)
{
	var finished = false;
	
	with (cutscene_get_actor(argument0))
	{
		if (sprite_animation_end())
			finished = true;
	}
	
	if (finished)
		cutscene_event_end();
}
