x += hsp;

switch (state)
{
	case 0:
		hsp = movespeed * image_xscale;
		image_speed = 0.35;
		
		if (movespeed <= 0)
		{
			sprite_index = spr_idle;
		}
		else
		{
			sprite_index = spr_run;
			var will_turn = false;
			
			if (scr_solid(x + image_xscale, y))
				will_turn = true;
			
			if (place_meeting(x + image_xscale, y, obj_hallway))
			{
				var hallway_direction = -sign(instance_place(x + sign(image_xscale), y, obj_hallway).image_xscale);
				
				if (sign(other.image_xscale) != hallway_direction)
					will_turn = true;
			}
			
			var _bbox_side = (image_xscale >= 1) ? bbox_right : bbox_left;
			
			if (!scr_solid(_bbox_side + image_xscale, y + 31, true))
				will_turn = true;
			
			if (will_turn)
			{
				image_xscale *= -1;
				hsp *= -1;
			}
		}
		
		if (roamTimer-- <= 0)
			event_user(0);
		
		if (obj_parent_player.state == 18 && obj_parent_player.sprite_index == obj_parent_player.spr_taunt && state != 1 && state != 2)
		{
			state = 1;
			
			with (instance_create(x, y, obj_confectitaunt))
			{
				depth = other.depth - 1;
				o_id = other.id;
			}
			
			image_index = irandom_range(0, sprite_get_number(spr_taunt) - 1);
		}
		
		break;
	
	case 1:
		image_speed = 0;
		hsp = 0;
		sprite_index = spr_taunt;
		
		if (obj_parent_player.state != 18)
			state = 0;
		
		break;
}
