if (other.state == 10)
{
	other.vsp = -2;
	other.hsp = -6 * other.xscale;
	other.state = 35;
	instance_destroy();
}
