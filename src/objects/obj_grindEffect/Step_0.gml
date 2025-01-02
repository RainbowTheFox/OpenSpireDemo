x = playerID.x;
y = playerID.y;

if ((playerID.state != 16 && playerID.state != 61) || !playerID.grounded)
	instance_destroy();
