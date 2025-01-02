if (point_in_circle(x, y, obj_parent_player.x + (75 * obj_parent_player.xscale), obj_parent_player.y, 125) && obj_parent_player.inhaling && state != 881)
	state = 881;

if (state != 5)
	depth = 0;

if (state != 4 && state != 9)
	thrown = 0;

enemyAttackTimer = max(enemyAttackTimer - 1, 0);

if (((obj_parent_player.x > (x - 50) && obj_parent_player.x < (x + 50)) && (y <= (obj_parent_player.y + 300) && y >= (obj_parent_player.y - 300))) && obj_parent_player.state != 47 && obj_parent_player.state != 56 && obj_parent_player.state != 40 && obj_parent_player.state != 57)
{
	if (state != 2 && enemyAttackTimer <= 0 && obj_parent_player.state != 47)
	{
		if (state == 874)
		{
			image_index = 0;
			state = 2;
			
			if (x != obj_parent_player.x)
				image_xscale = sign(obj_parent_player.x - x);
			
			sprite_index = spr_throw;
		}
	}
}

if (state == 4)
	grav = 0.5;
else
	grav = 0;

if (state == 0)
	state = 874;

event_inherited();

if (state != 2)
	scr_scareenemy();
