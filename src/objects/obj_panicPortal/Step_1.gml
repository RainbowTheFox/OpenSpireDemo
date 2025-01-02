if (global.freezeframe)
{
	image_speed = 0;
	image_index = frozenImageIndex;
	exit;
}

image_speed = 0.5;

if (!spawnEnemy && sprite_animation_end(sprite_index, image_index, 5))
{
	spawnEnemy = true;
	
	with (baddieID)
	{
		if (state != 7)
			exit;
		
		event_play_oneshot("event:/SFX/enemies/escapespawn", xstart, ystart);
		instance_create(xstart, ystart, obj_poofeffect);
		x = xstart;
		y = ystart;
		baddieStunTimer = 20;
		
		if (!scr_enemyDestroyableCheck(x, y))
		{
			baddieStunTimer = 20;
			invincibleBaddie = false;
			visible = true;
			state = 4;
			sprite_index = baddieSpriteStun;
			image_index = 0;
			
			if (escapeEnemyUnStun)
			{
				image_index = 0;
				state = 0;
				sprite_index = baddieSpriteWalk;
			}
		}
	}
}
