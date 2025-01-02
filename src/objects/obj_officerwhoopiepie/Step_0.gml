if (state != 5)
	depth = 0;

if (state != 4 && state != 9)
	thrown = 0;

if (state == 4)
	hitboxcreate = 0;

if (x != obj_parent_player.x)
{
	movespeed = 3;
	image_xscale = sign(obj_parent_player.x - x);
}
