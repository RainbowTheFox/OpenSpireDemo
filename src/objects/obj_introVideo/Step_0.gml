scr_getinput_menu();
video_set_volume((!global.unfocusedMute || window_has_focus()) ? real_volume : 0);

if (video_get_status() == 2)
{
	if (!showText && key_jump)
	{
		showText = true;
		alarm[0] = 120;
	}
	else if (showText && key_jump)
	{
		event_user(0);
		video_close();
		alarm[0] = -1;
	}
}
