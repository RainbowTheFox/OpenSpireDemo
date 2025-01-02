function scr_checkPositionSolidAngle(argument0, argument1, argument2, argument3, argument4, argument5, argument6 = 0, argument7 = false)
{
	var point_a = 
	{
		x: argument0,
		y: argument1,
		xstart: argument0,
		ystart: argument1,
		targetX: argument0,
		targetY: argument1
	};
	var point_b = 
	{
		x: argument0,
		y: argument1,
		xstart: argument0,
		ystart: argument1,
		targetX: argument0,
		targetY: argument1
	};
	var _check = false;
	var _dist = argument2;
	
	while (!_check)
	{
		point_a.x = round(point_a.xstart + lengthdir_x(argument2, 90 + argument5));
		point_a.y = round(point_a.ystart + lengthdir_y(argument2, 90 + argument5));
		point_a.targetX = round(point_a.x + lengthdir_x(argument4, argument5));
		point_a.targetY = round(point_a.y + lengthdir_y(argument4, argument5));
		
		while (point_distance(point_a.x, point_a.y, point_a.targetX, point_a.targetY) > 0)
		{
			if (position_meeting_collision(point_a.x, point_a.y, argument6))
			{
				_check = true;
				break;
			}
			
			point_a.x += lengthdir_x(1, argument5);
			point_a.y += lengthdir_y(1, argument5);
			
			if (point_distance(point_a.x, 0, point_a.targetX, 0) <= 1)
				point_a.x = point_a.targetX;
			
			if (point_distance(0, point_a.y, 0, point_a.targetY) <= 1)
				point_a.y = point_a.targetY;
		}
		
		if (argument7 && argument2 != -_dist && !_check)
		{
			argument2 = approach(argument2, -_dist, 1);
		}
		else if (!_check)
		{
			point_a.x = point_a.xstart + lengthdir_x(_dist, 90 + argument5);
			point_a.y = point_a.ystart + lengthdir_y(_dist, 90 + argument5);
			point_a.targetX = round(point_a.x + lengthdir_x(argument4, argument5));
			point_a.targetY = round(point_a.y + lengthdir_y(argument4, argument5));
			_check = true;
		}
	}
	
	_check = false;
	_dist = argument3;
	
	while (!_check)
	{
		point_b.x = round(point_b.xstart + lengthdir_x(argument3, -90 + argument5));
		point_b.y = round(point_b.ystart + lengthdir_y(argument3, -90 + argument5));
		point_b.targetX = round(point_b.x + lengthdir_x(argument4, argument5));
		point_b.targetY = round(point_b.y + lengthdir_y(argument4, argument5));
		
		while (point_distance(point_b.x, point_b.y, point_b.targetX, point_b.targetY) > 0)
		{
			if (position_meeting_collision(point_b.x, point_b.y, argument6))
			{
				_check = true;
				break;
			}
			
			point_b.x += lengthdir_x(1, argument5);
			point_b.y += lengthdir_y(1, argument5);
			
			if (point_distance(point_b.x, 0, point_b.targetX, 0) <= 1)
				point_b.x = point_b.targetX;
			
			if (point_distance(0, point_b.y, 0, point_b.targetY) <= 1)
				point_b.y = point_b.targetY;
		}
		
		if (argument7 && argument3 != -_dist && !_check)
		{
			argument3 = approach(argument3, -_dist, 1);
		}
		else if (!_check)
		{
			point_b.x = point_b.xstart + lengthdir_x(_dist, -90 + argument5);
			point_b.y = point_b.ystart + lengthdir_y(_dist, -90 + argument5);
			point_b.targetX = round(point_b.x + lengthdir_x(argument4, argument5));
			point_b.targetY = round(point_b.y + lengthdir_y(argument4, argument5));
			_check = true;
		}
	}
	
	var _angle = point_direction(point_a.x, point_a.y, point_b.x, point_b.y) - 180;
	return _angle;
}

function triangle_meeting(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7)
{
	var old_x = x;
	var old_y = y;
	x = argument0;
	y = argument1;
	var result = rectangle_in_triangle(bbox_left, bbox_top, bbox_right, bbox_bottom, argument2, argument3, argument4, argument5, argument6, argument7) > 0;
	x = old_x;
	y = old_y;
	return result;
}

function conveyorBelt_hsp()
{
	if (place_meeting(x, y + 1, obj_conveyorBelt) && vsp >= 0 && grounded)
	{
		var rail_inst = instance_place(x, y + 1, obj_conveyorBelt);
		return rail_inst.movespeed * sign(rail_inst.image_xscale);
	}
	
	return 0;
}

function scr_conveyorBeltKinematics()
{
	useConveyorFlag = true;
}

function bbox_in_rectangle(argument0, argument1, argument2, argument3, argument4)
{
	if (!instance_exists(argument0))
		return false;
	
	return rectangle_in_rectangle(argument0.bbox_left, argument0.bbox_top, argument0.bbox_right, argument0.bbox_bottom, argument1, argument2, argument3, argument4);
}

function place_meeting_adjacent(argument0)
{
	return place_meeting(x, y, argument0) || place_meeting(x - 1, y, argument0) || place_meeting(x + 1, y, argument0) || place_meeting(x, y - 1, argument0) || place_meeting(x, y + 1, argument0) || place_meeting(x - 1, y - 1, argument0) || place_meeting(x + 1, y - 1, argument0) || place_meeting(x - 1, y + 1, argument0) || place_meeting(x + 1, y + 1, argument0);
}
