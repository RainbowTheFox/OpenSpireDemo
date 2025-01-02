function scr_saveinit()
{
	ini_open(global.SaveFileName);
	global.SaveSeconds = ini_read_real("Game", "seconds", 0);
	global.SaveMinutes = ini_read_real("Game", "minutes", 0);
	global.HurtCounter = ini_read_real("Game", string("damage_{0}", scr_getCharacterPrefix(0)), 0);
	global.HurtMilestone = global.HurtCounter;
	global.PlayerPaletteIndex = ini_read_real("Misc", string("playerPaletteIndex_{0}", scr_getCharacterPrefix(0)), 2);
	ini_close();
	
	with (obj_achievementTracker)
		event_user(0);
}
