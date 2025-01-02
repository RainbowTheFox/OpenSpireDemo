global.ParallaxMap = ds_map_create();

function scr_calculate_farParallaxX(argument0, argument1)
{
	if (!sprite_exists(argument0))
		return 0;
	
	var sprite_size = sprite_get_width(argument0) - camera_get_view_width(view_camera[0]);
	var max_pos = 0;
	
	if (room_width > camera_get_view_width(view_camera[0]) && sprite_size <= room_width)
		max_pos = camera_get_view_x(view_camera[0]) / (room_width - camera_get_view_width(view_camera[0]));
	
	return max(sprite_size * max_pos * argument1, 0);
}

function scr_calculate_farParallaxY(argument0, argument1)
{
	if (!sprite_exists(argument0))
		return 0;
	
	var sprite_size = sprite_get_height(argument0) - camera_get_view_height(view_camera[0]);
	var max_pos = 0;
	
	if (room_height > camera_get_view_height(view_camera[0]) && sprite_size <= room_height)
		max_pos = camera_get_view_y(view_camera[0]) / (room_height - camera_get_view_height(view_camera[0]));
	
	return max(sprite_size * max_pos * argument1, 0);
}

function scr_addParallaxLayer(argument0, argument1, argument2 = [])
{
	ds_map_set(global.ParallaxMap, argument0, 
	{
		func: argument1,
		args: argument2
	});
	exit;
}

function defaultParallax(argument0, argument1)
{
	x += (camera_get_view_x(view_camera[0]) * argument0);
	y += (camera_get_view_y(view_camera[0]) * argument1);
}

function defaultParallaxGround(argument0, argument1)
{
	x += (camera_get_view_x(view_camera[0]) * argument0);
	y += round(room_height - sprite_get_height(layer_background_get_sprite(layer_background_get_id_fixed(id))));
}

function defaultParallaxZigZag(argument0, argument1, argument2, argument3)
{
	var time = global.CurrentTime;
	x += (camera_get_view_x(view_camera[0]) * argument0);
	y += (camera_get_view_y(view_camera[0]) * argument1);
	x += wave(-argument2, argument2, 4, 10, time);
	y += wave(-argument3, argument3, 4, 10, time);
}

function defaultParallaxH(argument0, argument1)
{
	var sprite = layer_background_get_sprite(layer_background_get_id_fixed(id));
	x += (camera_get_view_x(view_camera[0]) * argument0);
	y += (camera_get_view_y(view_camera[0]) - scr_calculate_farParallaxY(sprite, argument1));
}

function defaultParallaxV(argument0, argument1)
{
	var sprite = layer_background_get_sprite(layer_background_get_id_fixed(id));
	x += (camera_get_view_x(view_camera[0]) - scr_calculate_farParallaxX(sprite, argument0));
	y += (camera_get_view_y(view_camera[0]) * argument1);
}

function defaultParallaxFar(argument0, argument1)
{
	var sprite = layer_background_get_sprite(layer_background_get_id_fixed(id));
	x += (camera_get_view_x(view_camera[0]) - scr_calculate_farParallaxX(sprite, argument0));
	y += (camera_get_view_y(view_camera[0]) - scr_calculate_farParallaxY(sprite, argument1));
}

function parallaxZigZagV(argument0, argument1)
{
	var _spd = layer_get_vspeed(id);
	var _sin = wave(-_spd, _spd, 1, 0);
	x += (camera_get_view_x(view_camera[0]) * argument0);
	y += ((camera_get_view_y(view_camera[0]) * argument1) + _sin);
	y -= yShift;
}

function parallaxZigZagHFar(argument0, argument1)
{
	var time = global.ScrollOffset / 60;
	var _spd = vspeed;
	var _sin = wave(-_spd, _spd, 1, 0);
	var sprite = layer_background_get_sprite(layer_background_get_id_fixed(id));
	x += (camera_get_view_x(view_camera[0]) * argument0);
	y += (camera_get_view_y(view_camera[0]) - scr_calculate_farParallaxY(sprite, argument1));
	y += _sin;
	y -= yShift;
}

function parallaxZigZagVFar(argument0, argument1)
{
	var time = global.ScrollOffset / 60;
	var _spd = vspeed;
	var _sin = wave(-_spd, _spd, 1, 0);
	var sprite = layer_background_get_sprite(layer_background_get_id_fixed(id));
	x += (camera_get_view_x(view_camera[0]) - scr_calculate_farParallaxX(sprite, argument0));
	y += (camera_get_view_y(view_camera[0]) - scr_calculate_farParallaxY(sprite, argument1));
	y += _sin;
	y -= yShift;
}
