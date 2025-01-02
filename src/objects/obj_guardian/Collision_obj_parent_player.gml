if (sprite_index != spr_guardian_wakingUp && state == 3 && chaseActive && !(other.state == 59 || other.state == 93))
{
	scr_hurtplayer(other);
	
	with (obj_achievementTracker)
		tookGuardianDamage = true;
}
