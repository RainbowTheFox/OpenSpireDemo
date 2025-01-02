function scr_confecti_appear()
{
	drawxscale = image_xscale;
	var _end = sprite_animation_end();
	
	if (sprite_index == spr_supertaunt)
	{
		drawxscale = obj_parent_player.xscale;
		_end = sprite_animation_end() && obj_parent_player.state != 18;
	}
	
	if (sprite_index != spr_appear && sprite_index != spr_supertaunt)
		sprite_index = spr_appear;
	
	image_speed = 0.4;
	
	if (sprite_animation_end())
	{
		if (_end)
		{
			sprite_index = spr_idle;
			state = 0;
			
			if (use_interpolation)
				interpolation = 0;
		}
		else
		{
			image_index = image_number - 1;
		}
	}
}
