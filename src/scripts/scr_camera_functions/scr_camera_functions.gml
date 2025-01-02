function point_in_camera(argument0, argument1, argument2)
{
	var cam_x = camera_get_view_x(argument2);
	var cam_y = camera_get_view_y(argument2);
	var cam_w = camera_get_view_width(argument2);
	var cam_h = camera_get_view_height(argument2);
	return point_in_rectangle(argument0, argument1, cam_x, cam_y, cam_x + cam_w, cam_y + cam_h);
}

function bbox_in_camera(argument0, argument1, argument2 = 0)
{
	var cam_x = camera_get_view_x(argument1);
	var cam_y = camera_get_view_y(argument1);
	var cam_w = camera_get_view_width(argument1);
	var cam_h = camera_get_view_height(argument1);
	return bbox_in_rectangle(argument0, cam_x - argument2, cam_y - argument2, cam_x + cam_w + argument2, cam_y + cam_h + argument2);
}

function camera_get_position_struct(argument0, argument1 = -4) constructor
{
	var _cam_x = camera_get_view_x(argument0);
	var _cam_y = camera_get_view_y(argument0);
	var _cam_width = camera_get_view_width(argument0);
	var _cam_height = camera_get_view_height(argument0);
	centeredcam_x = _cam_x + (_cam_width / 2);
	centeredcam_y = _cam_y + (_cam_height / 2);
	cam_x = _cam_x;
	cam_y = _cam_y;
	
	if (argument1 != -4)
	{
		centeredcam_x -= argument1[0];
		centeredcam_y -= argument1[1];
	}
}

function screen_flash(argument0)
{
	global.screenflash = argument0;
}

function pummel_dim()
{
}

function camera_shake_add(argument0, argument1, argument2 = 0)
{
	with (obj_camera)
		ds_list_add(cameraShakeList, new addCameraShake(argument0, argument1 / room_speed, argument2));
}

function camera_shake_clearAll(argument0 = false)
{
	with (obj_camera)
	{
		for (var i = 0; i < ds_list_size(cameraShakeList); i++)
		{
			with (ds_list_find_value(cameraShakeList, i))
			{
				shakeTime = 0;
				
				if (argument0)
				{
					shakeMag = 0;
					ds_list_set(other.cameraShakeList, i, undefined);
					ds_list_delete(other.cameraShakeList, i);
				}
				else
				{
				}
			}
		}
	}
}
