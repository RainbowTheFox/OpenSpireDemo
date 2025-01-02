function gate_createlayer(argument0, argument1, argument2 = 0, argument3 = 0, argument4 = 0)
{
	var w = sprite_get_width(argument0);
	var h = sprite_get_height(argument0);
	var x1 = sprite_get_xoffset(argument0);
	var y1 = sprite_get_yoffset(argument0);
	return 
	{
		sprite_index: argument0,
		image_index: argument1,
		image_xscale: 1,
		image_yscale: 1,
		image_speed: argument4,
		image_alpha: 1,
		image_blend: c_white,
		image_angle: 0,
		x: 0,
		y: 0,
		xstart: 0,
		ystart: h,
		hspeed: argument2,
		vspeed: argument3,
		readjust: false,
		dbg: false,
		func: -4
	};
}

function default_gate_scroll(argument0)
{
	var length = sprite_get_number(argument0);
	var arr = [];
	var debug_arr = [];
	
	for (var i = length; i > 0; i--)
	{
		var pct = lerp(-0.5, -0.85, i / length);
		array_push(arr, gate_createlayer(argument0, i - 1, pct));
		array_push(debug_arr, i - 1);
	}
	
	return arr;
}

function default_gate_parallax(argument0)
{
	var length = sprite_get_number(argument0);
	var arr = [];
	var xoffset = x;
	var yoffset = y - (sprite_height / 2);
	
	for (var i = length; i > 0; i--)
	{
		var pct = lerp(0.15, 0.05, i / length);
		var g = gate_createlayer(argument0, i - 1, pct, pct);
		
		with (g)
		{
			xoff = xoffset;
			yoff = yoffset;
			
			func = function()
			{
				x = ((camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2)) - xoff) * hspeed;
				y = ((camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2)) - yoff) * vspeed;
			};
		}
		
		array_push(arr, g);
	}
	
	trace(arr);
	return arr;
}
