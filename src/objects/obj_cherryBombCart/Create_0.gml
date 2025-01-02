canCollide = function(argument0 = obj_parent_player)
{
	switch (argument0)
	{
		case obj_parent_player:
		case obj_player1:
		case obj_player2:
			var _state = global.freezeframe ? argument0.frozenState : argument0.state;
			return _state == 33 || (_state == 3 && argument0.movespeed >= 12) || _state == 89 || (_state == 90 && argument0.movespeed > 5) || _state == 53 || (_state == 12 && argument0.mach3Roll > 0) || _state == 61 || (_state == 81 && argument0.substate == 0);
			break;
		
		default:
			return true;
			break;
	}
};

hsp = 0;
