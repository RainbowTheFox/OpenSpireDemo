function particle_init(argument0, argument1, argument2)
{
	ds_map_set(global.particlesMap, argument0, 
	{
		image_speed: argument1,
		depth: argument2
	});
}

function create_particle(argument0, argument1, argument2, argument3 = 0, argument4 = 1, argument5 = 1)
{
	var particle_id = instance_create(argument0 + irandom_range(-argument3, argument3), argument1 + irandom_range(-argument3, argument3), obj_fade_particle);
	particle_id.sprite_index = argument2;
	particle_id.particle_scale(argument4, argument5);
	var _Map = ds_map_find_value(global.particlesMap, argument2);
	
	if (!is_undefined(_Map))
	{
		particle_id.particle_depth(_Map.depth);
		particle_id.particle_imgspd(_Map.image_speed);
	}
	
	return particle_id;
}

function create_destroyable_smoke(argument0, argument1, argument2 = 152734, argument3 = 0, argument4 = 1, argument5 = argument4)
{
	var _x = random_range(argument0 - argument3, argument0 + argument3);
	var _y = random_range(argument1 - argument3, argument1 + argument3);
	return instance_create(_x, _y, obj_destroyableSmoke, 
	{
		image_blend: argument2,
		image_xscale: argument4,
		image_yscale: argument5
	});
}

function sprite_get_destroyable_smoke(argument0 = debrisSprite)
{
	switch (argument0)
	{
		case spr_debris_entryway_wafer:
		case spr_debris_entryway_metal:
		case spr_debris_entryway_brick:
		case spr_minesdebris_dirt:
			smokeColor = [82087];
			break;
		
		case spr_towndebris:
			smokeColor = [4202592];
			break;
		
		case spr_clockdebris:
		case spr_clockblockdebris:
			smokeColor = [8431864];
			break;
		
		case spr_minesdebris_stone_section1:
		case spr_minesdebris_stone_section2:
		case spr_minesdebris_dirt_section1:
			smokeColor = [12619920];
			break;
		
		case spr_debris_molasses_mud:
			smokeColor = [2959217];
			break;
		
		case spr_debris_molasses_temple:
			smokeColor = [12464, 5322880];
			break;
	}
	
	if (place_meeting(x, y, obj_secretPortal))
		smokeColor = [11230063];
}

function create_debris(argument0, argument1, argument2, argument3 = 0)
{
	var img_num = sprite_get_number(argument2);
	var _struct = 
	{
		x: argument0,
		y: argument1,
		sprite_index: argument2,
		image_number: img_num,
		image_index: irandom_range(0, img_num),
		image_angle: random_range(0, 360),
		image_speed: sprite_get_speed(argument2) * argument3,
		image_xscale: 1,
		image_yscale: 1,
		image_blend: c_white,
		image_alpha: 1,
		hsp: random_range(-4, 4),
		vsp: random_range(-5, 5),
		grav: 0.4,
		spr_palette: spr_null,
		paletteSelect: 0,
		canPalette: false,
		terminalVelocity: 20,
		fading: false,
		stopAnimation: false
	};
	ds_list_add(global.particleList, _struct);
	return _struct;
}

function create_collect_effect(argument0, argument1, argument2 = undefined, argument3, argument4 = undefined)
{
	if (is_undefined(argument2))
	{
		switch (global.playerCharacter)
		{
			default:
				argument2 = choose(spr_collect1, spr_collect2, spr_collect3, spr_collect4, spr_collect5);
				break;
		}
		
		if (is_undefined(argument4))
			argument4 = irandom_range(1, 5);
	}
	
	var struct = 
	{
		sprite_index: argument2,
		image_index: 0,
		image_speed: 0.35,
		x: argument0 - camera_get_view_x(view_camera[0]),
		y: argument1 - camera_get_view_y(view_camera[0]),
		paletteSelect: argument4,
		usePalette: !is_undefined(argument4),
		value: argument3
	};
	ds_list_add(global.collectParticleList, struct);
	return struct;
}

function create_baddiedebris(argument0 = x, argument1 = y, argument2 = choose(spr_slapstar, spr_baddieGibs))
{
	var q = instance_create(argument0, argument1, obj_baddieGibs);
	q.sprite_index = argument2;
	q.hsp = random_range(-5, 5);
	q.vsp = random_range(-10, 10);
	return q;
}
