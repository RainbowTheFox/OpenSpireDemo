if (place_meeting(x, y, obj_parryhitbox) || global.freezeframe)
	exit;

with (other.id)
{
	if (instance_exists(other.baddieID) && !cutscene && scr_transformationCheck(state) == undefined && !hurted && state != 40 && state != 25 && state != 26 && state != 76 && state != 54 && state != 59 && state != 93 && state != 66 && state != 47 && state != 56 && state != 57 && sprite_index != spr_tumbleend)
	{
		state = 54;
		image_speed = 0.35;
		xscale = other.baddieID.image_xscale;
		movespeed = 10;
		vsp = 0;
		sprite_index = spr_tumble;
	}
}

if (instance_exists(baddieID))
	baddieID.baddieInvincibilityBuffer = 50;
