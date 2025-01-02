function scr_enemy_stun()
{
	baddieStunTimer--;
	sprite_index = baddieSpriteStun;
	image_speed = 0.35;
	
	if (grounded)
	{
		hsp = approach(hsp, 0, 0.3);
		scr_conveyorBeltKinematics();
	}
	
	if (grounded && baddieStunTimer < 0)
	{
		image_index = 0;
		
		if (object_index == obj_fizzCloud || object_index == obj_frothCloud)
		{
			movespeed = 5;
			state = 874;
			sprite_index = baddieSpriteWalk;
			vsp -= 8;
		}
		else if (object_index == obj_charCherry)
		{
			state = 870;
			sprite_index = spr_charcherry_run;
			movespeed = 8;
			vsp = 0;
		}
		else if (object_index == obj_candyCorn)
		{
			sprite_index = spr_candyCornRun;
			state = 2;
		}
		else if (object_index != obj_bananaCharger && object_index != obj_swedishfish)
		{
			movespeed = 1;
			state = 0;
			sprite_index = baddieSpriteWalk;
		}
		else
		{
			sprite_index = baddieSpriteIdle;
			state = 0;
		}
	}
}
