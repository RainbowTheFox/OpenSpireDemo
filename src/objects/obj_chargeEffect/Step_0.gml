updateEffectPosition();

if (playerID.sprite_index == playerID.spr_dive || (playerID.state != 33 && !(playerID.state == 3 && playerID.movespeed >= 12) && !(playerID.state == 12 && playerID.mach3Roll > 0) && playerID.state != 45 && playerID.sprite_index != spr_player_PZ_flicked))
	instance_destroy();
