function scr_setTransfoTip(argument0)
{
	switch (argument0)
	{
		case 47:
		case 56:
		case 57:
		case 58:
			global.TransfoPrompt = "prompt_werecotton";
			break;
		
		case 61:
		case 63:
		case 62:
			global.TransfoPrompt = "prompt_minecart";
			break;
		
		case 59:
			global.TransfoPrompt = "prompt_fling";
			break;
		
		case 67:
		case 68:
			global.TransfoPrompt = "prompt_fireass";
			break;
		
		default:
			global.TransfoPrompt = "";
			break;
	}
	
	global.TransfoState = argument0;
	return global.TransfoPrompt;
}

function scr_transformationCheck(argument0)
{
	var transfo = undefined;
	
	if (argument0 == 74)
		argument0 = tauntStored.state;
	
	switch (argument0)
	{
		default:
			transfo = undefined;
			break;
		
		case 54:
			transfo = "Ball";
			break;
		
		case 47:
		case 56:
		case 57:
		case 58:
			transfo = "Werecotton";
			break;
		
		case 59:
		case 93:
			transfo = "Fling";
			break;
		
		case 61:
		case 63:
		case 62:
			transfo = "Minecart";
			break;
		
		case 88:
		case 90:
		case 89:
		case 91:
			transfo = "Frostburn";
			break;
		
		case 41:
		case 42:
		case 43:
		case 44:
			transfo = "Marshdog";
			break;
		
		case 81:
			transfo = "Rocket";
			break;
	}
	
	return transfo;
}
