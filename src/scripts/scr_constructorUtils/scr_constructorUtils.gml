function subSprite(argument0, argument1 = 0, argument2 = 0.35, argument3 = true) constructor
{
	static update = function(argument0 = image_speed)
	{
		image_number = sprite_get_number(sprite_index);
		image_index += argument0;
		
		if (doWrap)
			image_index = wrap(image_index, 0, image_number);
		else
			image_index = clamp(image_index, 0, image_number);
		
		return image_index;
	};
	
	static setPosition = function(argument0, argument1)
	{
		x = argument0;
		y = argument1;
		return self;
	};
	
	static draw = function(argument0 = x, argument1 = y, argument2 = image_xscale, argument3 = image_yscale, argument4 = image_angle, argument5 = image_blend, argument6 = image_alpha)
	{
		if (!visible)
			exit;
		
		draw_sprite_ext(sprite_index, image_index, argument0, argument1, argument2, argument3, argument4, argument5, argument6);
		return self;
	};
	
	static setFunction = function(argument0)
	{
		custom_func = method(self, argument0);
		return self;
	};
	
	sprite_index = argument0;
	image_index = argument1;
	image_speed = argument2;
	doWrap = argument3;
	image_xscale = 1;
	image_yscale = 1;
	visible = true;
	image_angle = 0;
	image_blend = c_white;
	image_alpha = 1;
	x = 0;
	y = 0;
	image_number = sprite_get_number(sprite_index);
	finalFrame = image_number;
	custom_func = -4;
	return self;
}
