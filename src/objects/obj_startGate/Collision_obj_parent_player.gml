if (instance_exists(obj_titlecard))
	exit;

var enter_gate = false;

with (obj_parent_player)
{
	var other_id = other.id;
	
	if (key_up && grounded && (state == 1 || state == 31 || state == 32 || state == 33) && !instance_exists(obj_fadeoutTransition) && state != 25 && state != 26)
		enter_gate = true;
}

if (enter_gate)
{
	hasInteracted = true;
	stop_music(false);
	gotoLevel(level);
}

if (!secretcanspit && array_contains(secrets, true) && level != "tutorial")
{
	secretcanspit = true;
	
	repeat (5)
		instance_create(x, y - 128, obj_secretpoof);
}
