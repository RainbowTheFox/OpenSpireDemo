depth = 4;

canCollide = function(argument0 = obj_parent_player)
{
	switch (argument0)
	{
		case obj_parent_player:
		case obj_player1:
		case obj_player2:
			var _state = global.freezeframe ? argument0.frozenState : argument0.state;
			return _state != 76 && _state != 47 && _state != 56 && _state != 57 && _state != 54 && _state != 18 && _state != 35 && _state != 70 && _state != 0;
			break;
		
		case obj_creamThief:
		case obj_bigcherry:
		case obj_gigacherrydead:
		case obj_cherryBombCart:
			return true;
			break;
		
		default:
			return false;
			break;
	}
};
