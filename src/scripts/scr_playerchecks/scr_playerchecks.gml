function scr_player_check_normal(argument0)
{
	var normalStates = [1, 24, 31, 32, 33, 34, 7, 10, 29, 30];
	return array_contains(normalStates, argument0.state);
}
