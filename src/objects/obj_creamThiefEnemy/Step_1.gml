event_inherited();

if (!active)
{
	if (state != 0)
		state = 0;
	
	if (baddieStunTimer > 0)
		active = true;
}
