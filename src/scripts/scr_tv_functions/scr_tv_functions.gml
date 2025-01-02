function scr_queueTVAnimation(argument0, argument1 = 150)
{
	with (obj_hudManager.HUDObject_TV)
	{
		var roomname = room_get_name(room);
		
		if (argument0 == global.TvSprPlayer_Secret && instance_exists(obj_secretfound))
			exit;
		
		if (tvExpressionSprite != argument0)
			tvForceTransition = true;
		
		tvExpressionSprite = argument0;
		tvExpressionBuffer = argument1;
		var vocal_collectables = [spr_tvHUD_confecti1, spr_tvHUD_confecti2, spr_tvHUD_confecti3, spr_tvHUD_confecti4, spr_tvHUD_confecti5, spr_tvHUD_janitorLap, spr_tvHUD_janitorTreasure, global.TvSprPlayer_KeyGot, global.TvSprPlayer_Happy];
		
		if (chance(50) && array_contains(vocal_collectables, argument0))
			fmod_studio_event_instance_start(get_primaryPlayer().voiceCollect);
	}
}

function scr_queueToolTipPrompt(argument0 = "", argument1 = 220)
{
	with (obj_hudManager)
	{
		global.TooltipPrompt = argument0;
		HUDObject_tooltipPrompts.promptTimer = argument1;
	}
	
	return argument1;
}
