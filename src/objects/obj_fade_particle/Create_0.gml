depth = 0;
image_speed = 0.35;
playerID = -4;
step_function = -4;
followPlayer = false;

particle_imgspd = function(argument0)
{
	image_speed = argument0;
	return self;
};

particle_depth = function(argument0)
{
	depth = argument0;
	return self;
};

particle_scale = function(argument0, argument1)
{
	image_xscale = argument0;
	image_yscale = argument1;
	return self;
};

particle_followobj = function(argument0)
{
	if (instance_exists(argument0))
	{
		playerID = argument0;
		followPlayer = true;
		x = playerID.x;
		y = playerID.y;
	}
	
	return self;
};
