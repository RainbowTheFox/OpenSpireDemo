function state_player_parry()
{
	hsp = movespeed * xscale;
	
	if (movespeed < 0)
		movespeed += 0.5;
	
	movespeed = min(movespeed, 0);
	
	if (sprite_animation_end())
		state = 1;
	
	image_speed = 0.35;
}
