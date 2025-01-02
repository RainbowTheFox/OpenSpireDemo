if (!wearingBox)
{
	baddieSpriteIdle = spr_boxfrog_idle;
	baddieSpriteWalk = spr_boxfrog_idle;
}
else
{
	baddieSpriteIdle = spr_boxfrog_boxidle;
	baddieSpriteWalk = spr_boxfrog_boxidle;
}

event_inherited();

if (!global.freezeframe)
	canGetScared = !(state == 2 || wearingBox);

enemyAttack_TriggerEvent();

if (state != 0 && !global.freezeframe)
	wearingBox = false;

if (oldWearingBox != wearingBox)
{
	oldWearingBox = wearingBox;
	instance_create(x, y, obj_clutterFrog, 
	{
		image_xscale: image_xscale
	});
}

if (state == 2 && (sprite_index == spr_boxfrog_jump || sprite_index == spr_boxfrog_fall))
{
	if (!place_meeting(x, y, obj_clutterFrog))
		canBreakBlocks = true;
	
	doRedAfterImage = true;
	
	if (!instance_exists(hurtboxID))
	{
		with (instance_create(x, y, obj_forkhitbox, 
		{
			ID: other.id
		}))
		{
			other.hurtboxID = id;
			ID = other.id;
			image_xscale = other.image_xscale;
			image_index = other.image_index;
			depth = -1;
			sprite_index = spr_swordhitbox;
			mask_index = sprite_index;
		}
	}
}

if (place_meeting(x, y, obj_clutterFrog))
	canBreakBlocks = false;
