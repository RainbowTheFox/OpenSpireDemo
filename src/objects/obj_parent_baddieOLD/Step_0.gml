switch (state)
{
	case 856:
		scr_enemy_idle();
		break;
	
	case 858:
		scr_enemy_turn();
		break;
	
	case 857:
		scr_enemy_walk();
		break;
	
	case 863:
		scr_enemy_hit();
		break;
	
	case 868:
		scr_enemy_charge();
		break;
	
	case 861:
		scr_enemy_stun();
		break;
	
	case 865:
		scr_enemy_frozen();
		break;
	
	case 869:
		hsp = 0;
		vsp = 0;
		break;
	
	case 874:
		scr_enemy_float();
		break;
	
	case 875:
		scr_enemy_thief();
		break;
	
	case 864:
		scr_enemy_panicWait();
		break;
	
	case 866:
		scr_enemy_secretWait();
		break;
	
	case 859:
		scr_enemy_throw();
		break;
	
	case 862:
		scr_enemy_grabbed();
		break;
	
	case 860:
		scr_enemy_scared();
		break;
	
	case 867:
		scr_enemy_cherrywait();
		break;
	
	case 870:
		scr_enemy_charcherry();
		break;
	
	case 872:
		scr_enemy_slugjump();
		break;
	
	case 873:
		scr_enemy_slugparry();
		break;
	
	case 876:
		scr_enemy_eyescreamwait();
		break;
	
	case 877:
		scr_enemy_eyescream();
		break;
	
	case 878:
		scr_enemy_rage();
		break;
}

if (baddieCollisionBoxEnabled)
	scr_baddieCollisionBox();

if (y > (room_height + 64))
	instance_destroy();

if (state != 860 && state != 865)
	baddieScareBuffer = 0;

if (tauntBuffer)
{
	if (!instance_exists(tauntBufferEffect))
	{
		with (instance_create(x, y, obj_baddieAngryCloud, 
		{
			baddieID: id
		}))
			other.tauntBufferEffect = id;
	}
	
	if (!global.freezeframe)
	{
		if (obj_parent_player.state != 18 && obj_parent_player.state != 51 && state != 859)
		{
			tauntBuffer = false;
			enemyAttackTimer = 0;
			ragereset = 0;
			baddieStunTimer = 0;
			enemyAttackTimer = 0;
			burrowTimer = 0;
			baddieScareBuffer = 0;
		}
	}
}

if (state == 861 && baddieStunTimer >= 50 && !birdCreated && object_index != obj_coneboyCutout && object_index != obj_cherrycardboard)
{
	birdCreated = true;
	instance_create(x, y - 40, obj_enemyBirdEffect, 
	{
		baddieID: id
	});
}

if (doRedAfterImage && redAfterImagebuffer-- < 0)
{
	with (create_afterimage(7, image_xscale))
		image_alpha = 0.85;
	
	redAfterImagebuffer = redAfterImagebufferMax;
}

doRedAfterImage = false;
wetTimer = approach(wetTimer, 0, 1);

if (wetTimer > 0 && wetTimerEffect-- <= 0)
	wetTimerEffect = 3;

if (baddieInvincibilityBuffer > 0 && !global.freezeframe)
	baddieInvincibilityBuffer--;

if (global.freezeframe && state != 865)
{
	frozenState = state;
	frozenSpriteIndex = sprite_index;
	frozenImageIndex = image_index;
	frozenImageSpeed = image_speed;
	frozenMoveSpeed = movespeed;
	frozenGrav = grav;
	frozenHsp = hsp;
	frozenVsp = vsp;
	state = 865;
}

if (markedForDeath && !global.freezeframe && object_index != obj_iceblock)
{
	instance_destroy();
	create_particle(x, y, spr_genericPoofEffect);
}

if (flash && alarm[2] <= 0)
	alarm[2] = room_speed * 0.15;

if (state != 862)
	depth = 0;

if (grounded && vsp > 0 && sprite_index == baddieSpriteWalk && sprite_animation_end() && sign(hsp) == sign(image_xscale))
	create_particle(x - (image_xscale * 20), y + 43, spr_cloudEffect);
