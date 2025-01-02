debugText = [];
save_index = 0;
saveAlpha = 0;
depth = -200;

hudObject = function(argument0, argument1) constructor
{
	xstart = argument0;
	ystart = argument1;
	x = xstart;
	y = ystart;
	image_index = 0;
	image_speed = 0.35;
};

moveUpY = 0;
global.TooltipPrompt = "";
HUDObject_rankBubble = new hudObject(16, 16);

with (HUDObject_rankBubble)
{
	scale = 1;
	surface = undefined;
}

HUDObject_TV = new hudObject(845, 80);

with (HUDObject_TV)
{
	tvBG = spr_tvHUD_bg;
	tvBG_index = 0;
	hidden = false;
	sprite_index = spr_tvHUD_turningOn;
	queuedSprite = spr_tvHUD_turningOn;
	image_index = 0;
	sprite_image_number = 1;
	image_speed = 0.35;
	tvIdleAnimationBuffer = choose(500, 450, 400, 550);
	tvEscapeBuffer = irandom_range(300, 1000);
	tvExpressionSprite = undefined;
	tvExpressionBuffer = 0;
	tvNormalStates = false;
	tvPrevNormalStates = tvNormalStates;
	tvForceTransition = false;
	tvDoingExpression = false;
	tvPrevDoingExpression = tvDoingExpression;
	
	tvAnimations = function(argument0)
	{
		var player_state = global.freezeframe ? argument0.frozenState : argument0.state;
		
		if (sprite_index == spr_tvHUD_turningOn && !sprite_animation_end(undefined, undefined, sprite_image_number))
			exit;
		
		tvDoingExpression = false;
		
		if (!is_undefined(tvExpressionSprite) && tvExpressionBuffer > 0)
		{
			tvDoingExpression = true;
			queuedSprite = tvExpressionSprite;
			var _count = true;
			var _sprite_check = tvExpressionSprite;
			
			if (array_contains(global.TvSprPlayer_HurtExp, tvExpressionSprite))
				_sprite_check = global.TvSprPlayer_Hurt;
			
			switch (_sprite_check)
			{
				case global.TvSprPlayer_Hurt:
					_count = obj_parent_player.state != 36;
					break;
				
				case global.TvSprPlayer_KeyGot:
					_count = obj_parent_player.state != 55;
					break;
				
				case global.TvSprPlayer_Secret:
					_count = !obj_parent_player.isInSecretPortal;
					break;
			}
			
			if (_count && tvExpressionBuffer-- <= 0)
			{
				tvExpressionSprite = undefined;
				tvExpressionBuffer = 0;
			}
			
			exit;
		}
		
		tvNormalStates = false;
		
		switch (player_state)
		{
			default:
				var from_transition = [global.TvSprPlayer_Mach2, global.TvSprPlayer_Mach3, global.TvSprPlayer_Mach4];
				tvNormalStates = true;
				
				if ((queuedSprite == global.TvSprPlayer_IdleAnim1 || queuedSprite == global.TvSprPlayer_IdleAnim2) && !sprite_animation_end(undefined, undefined, sprite_image_number))
					exit;
				
				if (array_contains(from_transition, sprite_index))
					tvForceTransition = true;
				
				queuedSprite = get_panic() ? global.TvSprPlayer_EscapeIdle : global.TvSprPlayer_Idle;
				
				if (queuedSprite == global.TvSprPlayer_Idle && tvIdleAnimationBuffer-- <= 0 && global.Combo < 5)
				{
					tvIdleAnimationBuffer = choose(500, 450, 400, 550);
					queuedSprite = choose(global.TvSprPlayer_IdleAnim1, global.TvSprPlayer_IdleAnim2);
					image_index = 0;
				}
				
				if (global.Combo >= 10 && !get_panic())
					queuedSprite = global.TvSprPlayer_Combo;
				
				if (global.Combo >= 50 && !get_panic())
					queuedSprite = global.TvSprPlayer_HighCombo;
				
				break;
			
			case 31:
			case 32:
			case 33:
			case 7:
			case 34:
			case 6:
			case 12:
				tvNormalStates = true;
				var my_mvsp = global.freezeframe ? abs(argument0.frozenMoveSpeed) : abs(argument0.movespeed);
				
				if (player_state == 6)
					my_mvsp = global.freezeframe ? abs(argument0.frozenVerticalMovespeed) : abs(argument0.verticalMovespeed);
				
				var _oldQueue = queuedSprite;
				
				if (player_state == 33 || (player_state == 6 && my_mvsp >= 12) || (player_state == 34 && argument0.sprite_index == argument0.spr_machslideboost3) || (player_state == 12 && argument0.mach3Roll > 0))
					queuedSprite = global.TvSprPlayer_Mach3;
				
				if (argument0.sprite_index == argument0.spr_crazyrun || (player_state == 6 && my_mvsp >= 20) || (player_state == 12 && argument0.mach3Roll > 0 && my_mvsp >= 20))
					queuedSprite = global.TvSprPlayer_Mach4;
				
				if (player_state == 7)
					queuedSprite = global.TvSprPlayer_Mach2;
				
				if (queuedSprite != _oldQueue)
					tvForceTransition = true;
				
				break;
			
			case 54:
				queuedSprite = global.TvSprPlayer_Ball;
				break;
			
			case 53:
				queuedSprite = global.TvSprPlayer_Slipping;
				break;
			
			case 74:
				queuedSprite = global.TvSprPlayer_Hooked;
				
				if (argument0.sprite_index == spr_player_PZ_frostburn_hook)
					queuedSprite = global.TvSprPlayer_FrostBurn;
				
				break;
			
			case 61:
				queuedSprite = global.TvSprPlayer_Minecart;
				break;
			
			case 67:
			case 68:
				queuedSprite = global.TvSprPlayer_FireAss;
				break;
			
			case 47:
			case 56:
			case 57:
			case 58:
				queuedSprite = global.TvSprPlayer_WereCotton;
				break;
			
			case 90:
			case 88:
			case 89:
			case 91:
				queuedSprite = global.TvSprPlayer_FrostBurn;
				break;
			
			case 59:
				queuedSprite = global.TvSprPlayer_Croaked;
				break;
			
			case 41:
			case 42:
			case 44:
			case 45:
				queuedSprite = global.TvSprPlayer_MarshMount;
				break;
		}
	};
	
	muteIconAlpha = true;
	muteIconBufferMax = 400;
	muteIconBuffer = muteIconBufferMax;
	transition = 
	{
		image_index: 0,
		image_speed: 0.3,
		activated: false,
		sprite_index: spr_tvHUD_transitionStatic
	};
	weakSignal = 
	{
		signalBuffer: 0,
		image_index: 0,
		image_speed: 0.35,
		sprite_index: spr_tvHUD_weakSignal_small
	};
	propeller = 
	{
		image_index: 0,
		image_speed: 0.5,
		activated: true
	};
	idleScreenSaver = 
	{
		activated: false,
		keyPositions: [[-62, -15], [-9, 39], [34, -4], [18, -21], [-45, 43], [-63, 28], [-17, -20]],
		playBackSpeed: 1,
		playbackDirection: 1
	};
	
	with (idleScreenSaver)
	{
		x = keyPositions[0][0];
		y = keyPositions[0][1];
		keyframeIndex = 0;
		keyframeNumber = array_length(keyPositions);
	}
}

HUDObject_comboMeter = new hudObject(845, 165);

with (HUDObject_comboMeter)
{
	displayYMax = -300;
	displayY = displayYMax;
	displayVSP = 0;
	comboDisplay = 0;
	displayState = 0;
	comboTimeDisplay = 0;
	combofillDisplay = 0;
	comboSurface = -4;
	elm_meterFill = 
	{
		sprite_index: spr_tvHUD_comboMeter_fill,
		image_index: 0,
		image_speed: 0.35
	};
}

HUDObject_timer = new hudObject(480, 480);

with (HUDObject_timer)
{
	targetEscapeTime = 0;
	elm_coneBall = 
	{
		sprite_index: spr_bartimer_normalFront,
		image_index: 0,
		image_speed: 0.35
	};
	elm_clockTimer = 
	{
		image_index: 0,
		image_speed: 0.35
	};
}

HUDObject_tooltipPrompts = new hudObject(480, 500);

with (HUDObject_tooltipPrompts)
{
	image_alpha = 0;
	promptTimer = 0;
}
