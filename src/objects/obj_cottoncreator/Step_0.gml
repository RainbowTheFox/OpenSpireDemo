var target_player = get_primaryPlayer();

if (global.freezeframe || instance_exists(obj_cutsceneManager) || target_player.state == 70)
	exit;

visible = !(target_player.sprite_index == target_player.spr_cottonIntroLeft || target_player.sprite_index == target_player.spr_cottonIntroRight);

if (target_player.state == 47 || target_player.state == 58 || target_player.state == 56 || target_player.state == 57)
	sprite_index = spr_cottonmakerzzz;
else
	sprite_index = spr_cottonmaker;
