if (flash && alarm[2] <= 0)
{
}

if (state != 5)
	depth = 0;

if (state != 4 && state != 9)
	thrown = 0;

event_inherited();

if (state != 2 && state != 0)
	scr_scareenemy();

enemyAttackTimer = max(enemyAttackTimer - 1, 0);
ragereset = max(ragereset - 1, 0);

if (state == 0)
	enemyAttackTimer = 0;

if (point_in_rectangle(obj_parent_player.x, obj_parent_player.y, x - 300, y - 50, x + 300, y + 50) && obj_parent_player.state != 40 && obj_parent_player.state != 26)
{
	if ((state == 0 || state == 0) && enemyAttackTimer <= 0)
	{
		image_index = 0;
		flash = true;
		fmod_studio_event_instance_start(sndCharge);
		create_heat_afterimage(0);
		state = 2;
		
		if (x != obj_parent_player.x)
			image_xscale = sign(obj_parent_player.x - x);
		
		sprite_index = spr_badmarsh_ragestart;
	}
}
