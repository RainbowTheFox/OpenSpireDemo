if (global.panic)
{
	with (obj_parent_player)
	{
		if (grounded && (!other.drop || other.drop_state == 1) && key_up && (state == 1 || state == 31 || state == 32 || state == 33 || state == 28))
		{
			targetDoor = "none";
			var use_music = true;
			
			if (global.InternalLevelName == "tutorial")
			{
				use_music = false;
			}
			else
			{
				global.NewFile = false;
				global.UseOfftopic = true;
			}
			
			scr_savelevelDetails(use_music);
			scr_check_end_level_chef_tasks();
			global.CompletedLevel = true;
			
			if (state != 40)
			{
				sprite_index = spr_lookdoor;
				state = 40;
				xscale = 1;
				image_index = 0;
			}
			
			instance_destroy(obj_minesgem);
			
			if (!instance_exists(obj_endlevelfade))
			{
				with (instance_create(x, y, obj_endlevelfade))
				{
					var _cam_x = camera_get_view_x(view_camera[0]);
					var _cam_y = camera_get_view_y(view_camera[0]);
					PlayerX = other.x - _cam_x;
					PlayerY = other.y - _cam_y;
				}
			}
			
			global.panic = false;
			global.lapmusic = false;
		}
	}
}
