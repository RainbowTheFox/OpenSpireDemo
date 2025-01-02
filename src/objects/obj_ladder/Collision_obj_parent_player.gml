with (other)
{
	if (key_up && !place_meeting_collision(other.x + (other.sprite_width / 2), round(y), 12) && !inputLadderBuffer && (state == 1 || state == 48 || state == 32 || state == 33 || state == 31 || state == 24) && state != 36 && state != 34 && state != 37 && state != 38)
	{
		hsp = 0;
		vsp = 0;
		state = 23;
		x = other.x + (other.sprite_width / 2);
		y = round(y);
		
		if ((y % 2) == 1)
			y -= 1;
	}
}
