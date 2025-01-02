function scr_getDialogIcon(argument0, argument1 = "c_white", argument2 = "c_black")
{
	argument0 = string_upper(argument0);
	var spr = "spr_null";
	var ind = "0";
	
	switch (argument0)
	{
		case "HARRY":
			spr = "spr_icon_dialog";
			ind = "1";
			break;
		
		case "PIZZELLE":
			spr = "spr_icon_dialog";
			ind = "0";
			break;
		
		case "LAPLAD":
		case "LAP LAD":
		case "POLKA":
			spr = "spr_icon_dialog";
			ind = "2";
			break;
		
		case "INK":
			spr = "spr_icon_dialog";
			ind = "3";
			break;
		
		case "RUDY":
			spr = "spr_icon_dialog";
			ind = "4";
			break;
		
		case "SLUGGY":
			spr = "spr_icon_dialog";
			ind = "5";
			break;
		
		case "COTTONWITCH":
			spr = "spr_icon_dialog";
			ind = "6";
			break;
	}
	
	return string("[{0}][{1}, {2}][{3}]", argument1, spr, ind, argument2);
}
