if ((obj_parent_player.x > (x - 200) && obj_parent_player.x < (x + 200)) && (y <= (obj_parent_player.y + 200) && y >= (obj_parent_player.y - 200)))
{
	if (timer != -2)
		timer -= 0.1;
	
	if (timer == -2 && obj_parent_player.state == 18)
		timer = 20;
	
	if (timer == -2 && obj_parent_player.state != 18)
	{
		with (obj_parent_player)
			scr_hurtplayer();
		
		if (obj_parent_player.state != 36)
			timer = 20;
	}
}
