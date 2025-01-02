if (point_in_circle(x, y, obj_parent_player.x + (75 * obj_parent_player.xscale), obj_parent_player.y, 125) && obj_parent_player.inhaling && state != 881)
	state = 881;

if (state != 5)
	depth = 0;

if (state != 4 && state != 9)
	thrown = 0;

event_inherited();

if (state != 2)
	scr_scareenemy();

enemyAttackTimer = max(enemyAttackTimer - 1, 0);
ragereset = max(ragereset - 1, 0);

if (point_in_rectangle(obj_parent_player.x, obj_parent_player.y, x - 100, y - 50, x + 100, y + 50) && obj_parent_player.state != 40 && obj_parent_player.state != 26)
{
	if (state != 2 && state == 0 && (obj_parent_player.state == 41 || obj_parent_player.state == 42) && enemyAttackTimer <= 0)
	{
		image_index = 0;
		flash = true;
		create_heat_afterimage(0);
		state = 2;
		sprite_index = spr_golfburger_golf;
		enemyAttackTimer = 200;
	}
}

if (sprite_index == spr_golfburger_golf || invisFrames > 0)
	baddieInvincibilityBuffer = 1;
else
	baddieInvincibilityBuffer = 0;

if (invisFrames > 0)
	invisFrames--;
