if (point_in_circle(x, y, obj_parent_player.x + ((75 * obj_parent_player.xscale) + inhaleStrength), obj_parent_player.y, 125) && obj_parent_player.inhaling && state != 881)
	state = 881;

enemyAttackTimer = max(enemyAttackTimer - 1, 0);

if (((obj_parent_player.x > (x - 400) && obj_parent_player.x < (x + 400)) && (y <= (obj_parent_player.y + 60) && y >= (obj_parent_player.y - 60))) && obj_parent_player.state != 47 && obj_parent_player.state != 56 && obj_parent_player.state != 40 && obj_parent_player.state != 57)
{
	if (state != 2 && enemyAttackTimer <= 0 && obj_parent_player.state != 47)
	{
		if (state == 0 || state == 0)
		{
			image_index = 0;
			state = 2;
			
			if (x != obj_parent_player.x)
				image_xscale = sign(obj_parent_player.x - x);
			
			sprite_index = spr_throw;
		}
	}
}

if (state != 5)
	depth = 0;

if (state != 4 && state != 9)
	thrown = 0;

event_inherited();
scr_scareenemy();
