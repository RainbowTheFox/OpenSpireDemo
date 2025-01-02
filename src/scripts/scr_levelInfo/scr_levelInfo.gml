global.GameLevelMap = ds_map_create();
global.InternalLevelName = "none";

function scr_defineTitleCard(argument0, argument1 = "event:/music/w1/entryway_titlecard", argument2 = -4, argument3 = -4) constructor
{
	image_index = argument0;
	music = argument1;
	x = argument2;
	y = argument3;
}

function scr_defineLevel(argument0, argument1, argument2, argument3, argument4 = [], argument5 = 20000, argument6 = -4, argument7 = false)
{
	ds_map_add(global.GameLevelMap, argument1, 
	{
		internalName: argument1,
		levelWorld: argument0,
		visualName: argument2,
		groupArr: argument4,
		firstRoom: argument3,
		sRankRequirement: argument5,
		titleCardInfo: argument6,
		isBoss: argument7
	});
}

scr_defineLevel(0, "demohub", "Demo 2 Hub", hub_demohallway);
scr_defineLevel(0, "tutorial", "Tutorial", tutorial_1);
scr_defineLevel(0, "entryway", "Crunchy Construction", entryway_1, ["Entryway"], 16500, new scr_defineTitleCard(0, "event:/music/w1/entryway_titlecard", 37, 42));
scr_defineLevel(0, "steamy", "Cottontown", steamy_1, ["Cottontown"], 22500, new scr_defineTitleCard(1, "event:/music/w1/cottontown_titlecard", 37, 498));
scr_defineLevel(0, "molasses", "Molasses Swamp", molasses_1, ["Molasses", "geyserwaves"], 19000, new scr_defineTitleCard(2, "event:/music/w2/molasses_titlecard", 37, 498));
scr_defineLevel(0, "mineshaft", "Sugarshack Mines", mineshaft_1, ["Mines"], 21500, new scr_defineTitleCard(3, "event:/music/w1/mines_titlecard", 37, 498));
scr_defineLevel(0, "boss_pizzahead", "Boss 1", rm_missing, [], 20000, true);
scr_defineLevel(1, "fudge", "Mt. Fudgetop", mountain_intro, ["Fudgetop"]);
scr_defineLevel(1, "molasses", "Molasses Swamp", molasses_1, ["Molasses"]);
scr_defineLevel(1, "cafe", "Chocoa Cafe", cafe_1, ["Cafe"]);
scr_defineLevel(1, "boss_pizzabro", "Boss 2", rm_missing);

function scr_gotoLevel(argument0)
{
	var level_info = ds_map_find_value(global.GameLevelMap, argument0);
	var first_room = level_info.firstRoom;
	global.texturesToLoad = array_concat(global.texturesToLoad, level_info.groupArr);
	global.InternalLevelName = level_info.internalName;
	global.LevelFirstRoom = first_room;
	global.srank = level_info.sRankRequirement;
	global.arank = global.srank / 2;
	global.brank = global.arank / 2;
	global.crank = global.brank / 2;
}

function scr_defineLevelMenuTune(argument0)
{
	var note_array = [];
	
	switch (argument0)
	{
		default:
			note_array = [26, 33, 38, 26, 33, 38, 26, 33, 26, 33, 38, 26, 33, 38, 26, 33, 25, 32, 37, 25, 32, 37, 25, 32, 25, 32, 37, 25, 37, 32, 25, 32];
			break;
		
		case "tutorial":
			note_array = [15, 16, 17, 25, 17, 25, 17, 25, 25, 27, 28, 29, 25, 27, 29, 24, 27, 25, 15, 16, 17, 25, 17, 25, 17, 25, 22, 20, 19, 22, 25, 29, 27, 25, 22, 27];
			break;
		
		case "entryway":
			note_array = [19, 22, 24, 26, 24, 22, 19, 15, 22, 24, 26, 24, 29, 26, 19, 22, 24, 26, 29, 34, 36, 36, 34, 36, 38, 39, 38, 31];
			break;
		
		case "steamy":
			note_array = [27, 30, 34, 35, 33, 34, 33, 30, 27, 25, 30, 34, 35, 33, 34, 42, 41, 39, 23, 27, 30, 34, 30, 33, 32, 30, 23, 22, 26, 29, 32, 29, 34, 32, 30, 27];
			break;
		
		case "mineshaft":
			note_array = [25, 27, 28, 27, 24, 21, 20, 18, 16, 18, 21, 25, 28, 33, 32, 30, 28, 27, 28, 27, 25, 28, 27, 25, 28, 27, 20, 28, 27, 24, 20, 21, 20, 18, 20, 21, 16, 13, 21, 16, 13, 21, 16, 21, 21, 28, 27, 32];
			break;
		
		case "molasses":
			note_array = [14, 26, 24, 21, 19, 17, 17, 17, 19, 17, 21, 19, 14, 14, 17, 17, 19, 14, 21, 24, 26, 26, 21, 19, 21, 19, 17, 19, 21, 14, 14, 17, 17, 21, 26, 24, 26, 29];
			break;
	}
	
	return note_array;
}

global.MenuNoteArray = scr_defineLevelMenuTune("none");
global.MenuNoteArraySelect = 0;
