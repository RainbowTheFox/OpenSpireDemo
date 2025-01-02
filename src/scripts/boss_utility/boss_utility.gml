function face_obj(argument0)
{
	var dir = sign(argument0.x - x);
	
	if (dir == 0)
		dir = 1;
	
	return dir;
}
