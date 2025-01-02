depth = 110;
image_speed = 1;
scr_collision_init();
movespeed = 0;
verticalMovespeed = 0;
grav = 0.5;
state = 0;
scr_taunt_storeVariables();
randomBufferMin = 80;
randomBufferMax = 50;
randomBuffer = randomBufferMin + irandom(randomBufferMax);

switch (character)
{
	case 0:
		idleSprite = spr_builderBear_ted_idle;
		walkSprite = spr_builderBear_ted_walk;
		panicSprite = spr_builderBear_ted_panic;
		tauntSprite = spr_builderBear_ted_taunt;
		break;
	
	case 1:
		idleSprite = spr_builderBear_tedAlt_idle;
		walkSprite = spr_builderBear_tedAlt_walk;
		panicSprite = spr_builderBear_ted_panic;
		tauntSprite = spr_builderBear_tedAlt_taunt;
		break;
	
	case 2:
		idleSprite = spr_builderBear_sarah_idle;
		walkSprite = spr_builderBear_sarah_walk;
		panicSprite = spr_builderBear_sarah_panic;
		tauntSprite = spr_builderBear_sarah_taunt;
		break;
	
	case 3:
		idleSprite = spr_builderBear_jack;
		walkSprite = spr_builderBear_jack;
		panicSprite = spr_builderBear_jack;
		tauntSprite = spr_builderBear_jack;
		break;
	
	case 4:
		idleSprite = spr_builderBear_karen_idle;
		walkSprite = spr_builderBear_karen_idle;
		panicSprite = spr_builderBear_karen_panic;
		tauntSprite = spr_builderBear_karen_taunt;
		break;
}
