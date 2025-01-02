doCollision = !(state == 877 || state == 876 || scr_solid(x, y) || state == 2);
trace(doCollision);
baddieCollisionBoxEnabled = state != 879;

if (state == 0)
	state = 877;

if (state == 879)
{
	var p = get_nearestPlayer();
	var _disttoplayer = point_distance(x, y, p.x, p.y);
	hsp = 0;
	vsp = 0;
	image_speed = 0.35;
	
	if (sprite_index != spr_eyescreamsandwich_popout)
	{
		if (abs(_disttoplayer) < 200)
		{
			sprite_index = spr_eyescreamsandwich_popout;
			image_index = 0;
		}
	}
	else if (sprite_animation_end())
	{
		state = 877;
		var dir = point_direction(x, y, p.x, p.y);
		var _spd = 5;
		hsp = lengthdir_x(_spd, dir);
		vsp = lengthdir_y(_spd, dir);
		ragereset = 100;
	}
}

if (doCollision)
	scr_scareenemy();

if (ragereset > 0)
	ragereset--;

event_inherited();

if (state != 5)
	depth = 0;

if (state != 4 && state != 9)
	thrown = 0;
