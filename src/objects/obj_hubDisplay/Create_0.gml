depth = 4;
font = global.smallfont;
image_speed = 0.35;
image_index = 0;
tvspr = spr_tvdisplay;
tvind = 1;
tvwidth = sprite_get_width(spr_tvdisplay);
tvheight = sprite_get_height(spr_tvdisplay);
screenCapture = undefined;
scanline = new subSprite(spr_tvdisplay_scan, 0, 0.35, true);
scanspeed = 20;
buffering = false;
showDisplay = false;
voice_cooldown = 0;
displaySurface = surface_create(tvwidth, tvheight);
offscreenY = -1.2 * tvheight;
offsetX = 192;
offsetY = offscreenY;
paddingX = -(tvwidth / 2);
paddingY = 16;
displayPages = [];
currentPage = 0;
targetPage = 0;
lastPage = 1;
script_UpArrow = -4;

displayPage = function(argument0 = []) constructor
{
	static draw = function()
	{
		var l = array_length(contentArr);
		var padX = obj_hubDisplay.tvwidth / l;
		
		for (var i = 0; i < l; i++)
		{
			var c = contentArr[i];
			var _x = padX * (i + 1);
			
			if (is_struct(c) && struct_exists(c, "draw"))
			{
				with (c)
					draw(_x, 32);
			}
		}
	};
	
	static getContent = function(argument0 = 0)
	{
		if (!(argument0 < array_length(contentArr)))
			return undefined;
		
		return contentArr[argument0];
	};
	
	contentArr = argument0 ?? [];
};

displayElement = function() constructor
{
	static step = function()
	{
	};
	
	static setIcon = function(argument0, argument1)
	{
		sprite_index = argument0;
		image_index = argument1;
	};
	
	properties = {};
	sprite_index = spr_null;
	image_index = 0;
	image_xscale = 1;
	image_yscale = 1;
	image_angle = 0;
	image_blend = c_white;
	image_alpha = 1;
	
	draw = function(argument0, argument1)
	{
	};
};

getPage = function(argument0)
{
	while (argument0 >= array_length(displayPages))
		array_push(displayPages, new displayPage());
	
	return displayPages[argument0];
};

addLevel = function(argument0, argument1, argument2 = true, argument3 = true, argument4 = true, argument5 = true)
{
	var pg = getPage(argument1);
	var l = new displayElement();
	l.properties = 
	{
		isLevel: true,
		hasConfecti: argument2,
		hasSecrets: argument3,
		hasTreasure: argument4,
		hasRank: argument5,
		confectiArr: [false, false, false, false, false],
		secretArr: [false, false, false],
		gotTreasure: 0,
		gotScore: 0
	};
	var p = l.properties;
	ini_open(global.SaveFileName);
	
	if (argument2)
	{
		for (var i = 0; i < array_length(p.confectiArr); i++)
			p.confectiArr[i] = ini_read_real("Confecti", string("{0}{1}", argument0, i + 1), false);
	}
	
	if (argument3)
	{
		for (var i = 0; i < array_length(p.secretArr); i++)
			p.secretArr[i] = ini_read_real("Secret", argument0 + string(i + 1), false);
	}
	
	if (argument4)
		p.gotTreasure = ini_read_real("Treasure", argument0, false);
	
	if (argument5)
	{
		p.gotRank = ini_read_string("Ranks", argument0, "");
		p.gotScore = ini_read_real("Highscore", argument0, 0);
	}
	
	ini_close();
	array_push(pg.contentArr, l);
	return l;
};

drawLevel = function(argument0)
{
	var p = struct_get(argument0, "properties");
	
	if (!is_undefined(p) && struct_get(p, "isLevel") == true)
	{
		draw_sprite(argument0.sprite_index, argument0.image_index, tvwidth / 2, 152);
		var r_arr = ["d", "c", "b", "a", "s", "p"];
		var ri = 6;
		
		for (var i = 0; i < array_length(r_arr); i++)
		{
			if (r_arr[i] == p.gotRank)
			{
				ri = i;
				break;
			}
		}
		
		draw_sprite(spr_tvdisplay_ranks, ri, tvwidth / 2, 175);
		
		if (p.hasConfecti)
		{
			var len = array_length(p.confectiArr);
			
			for (var i = 0; i < len; i++)
			{
				var ii = sprite_get_number(spr_tvdisplay_icon_conf) - 1;
				
				if (p.confectiArr[i] > 0)
				{
					ii = i + 1;
					ii = clamp(ii, 1, 5);
				}
				
				var mi = floor(len / 2);
				var yy = power(i - mi, 2) * -2;
				var xx = (i - mi) * 48;
				draw_sprite(spr_tvdisplay_icon_conf, ii, (tvwidth / 2) + xx, 276 + yy);
			}
		}
		
		if (p.hasSecrets)
		{
			var len = array_length(p.secretArr);
			
			for (var i = 0; i < len; i++)
			{
				var ii = sprite_get_number(spr_tvdisplay_icon_secret) - 1;
				
				if (p.secretArr[i] > 0)
				{
					ii = i + 1;
					ii = clamp(ii, 1, 3);
				}
				
				var mi = floor(len / 2);
				var yy = power(i - mi, 2) * -2;
				var xx = (i - mi) * 42;
				draw_sprite(spr_tvdisplay_icon_secret, ii, (tvwidth / 2) + xx, 316 + yy);
			}
		}
		
		if (p.hasTreasure)
		{
			var ii = p.gotTreasure ? 1 : 2;
			draw_sprite(spr_tvdisplay_icon_treasure, ii, tvwidth / 2, 358);
		}
	}
};
