if (!window_has_focus() || !variable_global_exists("fullscreen"))
{
	alarm[0] = 1;
	exit;
}

switch (global.fullscreen)
{
	case 0:
if (GAMEFRAME)
{
		gameframe_set_fullscreen(0);
}
else
{
	window_set_fullscreen(false);
}
		break;
	
	case 2:
		alarm[1] = 1;
	
	case 1:
if (GAMEFRAME)
{
		gameframe_set_fullscreen(true);
}
else
{
	window_set_fullscreen(true);
}
		break;
}

set_resolution_option(global.selectedResolution);
