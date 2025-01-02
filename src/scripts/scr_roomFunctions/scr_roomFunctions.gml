global.NextRoom = rm_missing;

function room_goto_fixed(argument0)
{
	global.NextRoom = argument0;
	room_goto(argument0);
}
