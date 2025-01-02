depth = -99;
scrollFactor = 0;
bgx = 0;
bgy = 0;
currentPage = 0;
maxPage = 1;
selectH = 0;
selectV = -1;
taskPadX = 200;
taskPadY = 200;
scr_input_varinit();
levelArr = ["demoEN", "entryway", "steamy", "mineshaft", "molasses"];
floorArr = ["demoEN"];
outfitArr = [];
outfitRows = 0;
taskIcons = {};

taskIcon = function(argument0, argument1 = false) constructor
{
	static get = function(argument0)
	{
		return struct_get(task, argument0);
	};
	
	x = 0;
	y = 0;
	task = argument0;
	isCompleted = argument1;
};

addTask = function(argument0, argument1)
{
	if (is_undefined(variable_struct_get(taskIcons, argument0)))
		variable_struct_set(taskIcons, argument0, []);
	
	var arr = variable_struct_get(taskIcons, argument0);
	array_push(arr, argument1);
	return arr;
};

addOutfit = function(argument0)
{
	array_push(outfitArr, argument0);
};

event_user(0);
