function scr_slopeanglenonplayer(argument0, argument1, argument2 = 1)
{
	var array = 0;
	var checkside = -1;
	var height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index);
	var top = -4;
	var i = 0;
	array[0] = argument1;
	array[1] = argument1;
	
	var _function = function(argument0, argument1)
	{
		return scr_solid(argument0, argument1) || (scr_slope_ext(argument0, argument1) && scr_slopePlatform(argument0, argument1));
	};
	
	while (i < 2)
	{
		while (top < height)
		{
			array[i] = argument1;
			var check_1 = _function(argument0 + (argument2 * checkside), argument1 + top);
			var check_2 = !_function(argument0 + (argument2 * checkside), (argument1 + top) - 1);
			
			if (check_1 && check_2)
			{
				var sex = (argument1 + top) - 1;
				array[i] = sex;
				break;
			}
			
			top++;
		}
		
		checkside = !checkside;
		i++;
	}
	
	var pointer1 = array[0];
	var pointer2 = array[1];
	var _angle = 0;
	
	if (pointer1 != pointer2)
		_angle = point_direction(argument0 - argument2, pointer1, argument0 + argument2, pointer2);
	
	return _angle;
}

function scr_checkSlopeAngle()
{
	return scr_checkPositionSolidAngle(x, bbox_bottom, abs(x - bbox_left), abs(x - bbox_right) - 1, (bbox_bottom - bbox_top) / 2, -90, undefined, true);
}
