canCollide = function(argument0 = obj_parent_player)
{
	switch (argument0)
	{
		case obj_parent_player:
		case obj_player1:
		case obj_player2:
			return argument0.state != 61 && argument0.state != 63 && argument0.state != 62;
			break;
		
		default:
			return true;
			break;
	}
};

image_speed = 0.05;
