function set_volume_options(argument0 = global.masterVolume, argument1 = global.musicVolume, argument2 = global.soundVolume)
{
	fmod_studio_system_set_parameter_by_name("masterVolume", argument0, true);
	fmod_studio_system_set_parameter_by_name("musicVolume", argument1, true);
	fmod_studio_system_set_parameter_by_name("sfxVolume", argument2, true);
}

function stop_music(argument0 = true)
{
	if (!is_undefined(global.RoomMusic))
	{
		fmod_studio_event_instance_stop(global.RoomMusic.musicInst, argument0);
		fmod_studio_event_instance_stop(global.RoomMusic.secretMusicInst, argument0);
	}
	
	fmod_studio_event_instance_stop(global.HarryMusicInst, argument0);
	fmod_studio_event_instance_stop(global.EscapeMusicInst, argument0);
}
