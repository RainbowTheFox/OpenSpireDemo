var target_player = instance_nearest(x, y, obj_parent_player);

if (!instance_exists(ID) || (target_player.state == 33 || target_player.state == 68 || target_player.state == 61 || target_player.state == 42))
	instance_destroy();

if (instance_exists(ID))
{
	x = ID.x;
	y = ID.y;
	image_xscale = ID.image_xscale;
	image_index = ID.image_index;
	
	with (ID)
	{
		switch (object_index)
		{
			case obj_knight:
				if (state != 0 && state != 0)
				{
					hitboxcreate = 0;
					instance_destroy(other.id);
				}
				
				break;
			
			case obj_boxFrog:
				if ((vsp >= 0 && grounded) || state != 2)
				{
					hitboxcreate = false;
					instance_destroy(other.id);
				}
				
				break;
			
			case obj_miniHarry:
				if (state != 2)
				{
					hitboxcreate = 0;
					instance_destroy(other.id);
				}
				
				break;
			
			case obj_sluggy:
				if (vsp >= 0 || state != 2)
				{
					hitboxcreate = 0;
					instance_destroy(other.id);
				}
				
				break;
			
			case obj_bananaCharger:
			case obj_swedishfish:
				if (state != 4)
				{
					hitboxcreate = 0;
					instance_destroy(other.id);
				}
				
				break;
			
			case obj_doggy:
				if (sprite_index != spr_badmarsh_rage)
					instance_destroy(other.id);
				
				break;
				break;
			
			case obj_betonbacon:
				if (state != 2 && state != 0)
					instance_destroy(other.id);
				
				break;
		}
	}
}
