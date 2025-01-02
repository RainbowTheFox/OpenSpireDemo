canCollide = function(argument0 = obj_parent_player)
{
	switch (argument0)
	{
		case obj_parent_player:
		case obj_player1:
		case obj_player2:
			return argument0.state != 58 && argument0.sprite_index != spr_player_PZ_werecotton_spin;
			break;
		
		default:
			return true;
			break;
	}
};
