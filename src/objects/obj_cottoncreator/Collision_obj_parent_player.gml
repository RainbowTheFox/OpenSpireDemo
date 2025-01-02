if (global.freezeframe)
	exit;

with (other)
{
	if (!player_complete_invulnerability() && state != 47 && state != 56 && state != 40 && state != 57 && state != 58)
	{
		event_play_oneshot("event:/SFX/cotton/intro", x, y);
		global.ComboFreeze = 15;
		state = 47;
		x = other.x;
		y = other.y + 33;
		flash = 0;
		targetxscale = xscale;
		xscale = 1;
		sprite_index = other.image_xscale ? spr_cottonIntroLeft : spr_cottonIntroRight;
		image_index = 0;
	}
}
