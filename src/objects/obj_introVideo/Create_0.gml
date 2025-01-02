if (video_get_status() != 0)
	video_close();

scr_initinput();
real_volume = global.musicVolume * global.masterVolume;
showText = false;
displayVideo = false;

if (!file_exists("gamedata/intro.mp4"))
{
	trace("Intro video not found.");
	event_user(0);
	exit;
}

video_open("gamedata/intro.mp4");
video_set_volume((!global.unfocusedMute || window_has_focus()) ? real_volume : 0);
