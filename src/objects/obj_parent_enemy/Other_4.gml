if (ds_list_find_index(global.BaddieRoom, id) != -1)
	instance_destroy(id, false);

if (escapeEnemy)
	state = 7;
else
	scr_enemyDestroyableCheck();
