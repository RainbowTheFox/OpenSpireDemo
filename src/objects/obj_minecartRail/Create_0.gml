depth = 4;

canCollide = function(argument0 = obj_parent_player)
{
	switch (argument0)
	{
		case obj_parent_player:
		case obj_player1:
		case obj_player2:
			var _state = global.freezeframe ? argument0.frozenState : argument0.state;
			return _state == 61 || _state == 62 || _state == 63 || _state == 70;
			break;
		
		case obj_minecart:
		case obj_creamThiefCar:
		case obj_minecartCutscene:
		case obj_creamThief:
		case obj_cherryBombCart:
			return true;
			break;
		
		default:
			return false;
			break;
	}
};
