updateEffectPosition();

if (playerID.state != 37 && playerID.state != 90 && playerID.state != 6 && playerID.state != 27 && playerID.state != 15)
	instance_destroy();

if (playerID.state == 15 && playerID.sprite_index == playerID.spr_piledriverland)
	instance_destroy();
