function gml_RoomCC_mineshaft_8_7_Create() {
    flags.do_once_per_save = true;
    
    condition = function()
    {
    	return ds_list_find_index(global.SaveRoom, 106078) != -1 && global.minesProgress == false;
    };
    
    output = function()
    {
    	global.minesProgress = true;
    };
}