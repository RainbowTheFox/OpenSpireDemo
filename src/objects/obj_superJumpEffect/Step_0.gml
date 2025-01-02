updateEffectPosition();

if ((playerID.state != 6 && playerID.state != 27) || playerID.sprite_index == playerID.spr_superjumpCancelIntro)
	instance_destroy();
