with (other)
{
	if (state != 70 && sprite_index != spr_gotTreasure)
	{
		event_play_oneshot("event:/SFX/general/foundtreasure");
		scr_taunt_storeVariables();
		hsp = 0;
		vsp = 0;
		state = 70;
		sprite_index = spr_gotTreasure;
		other.alarm[0] = 120;
		other.playerID = id;
		other.x = x;
		other.y = y - 65;
	}
}
