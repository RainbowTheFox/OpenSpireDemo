other.movespeed = sign(other.xscale) * abs(other.movespeed);
other.state = 41;

if (!instance_exists(global.CafeDrawer))
	global.CafeDrawer = instance_create(x, y, obj_cafedrawer);

instance_destroy();
