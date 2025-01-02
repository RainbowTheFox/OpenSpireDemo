function gml_RoomCC_steamy_1_14_Create() {
    flags.do_save = true;
    flags.do_once_per_save = false;
    
    condition = function()
    {
    	var _check = false;
    	
    	with (obj_parent_player)
    	{
    		if (place_meeting(roomStartX, roomStartY, other) && global.panic)
    			_check = true;
    	}
    	
    	return _check;
    };
    
    output = function()
    {
    	var lay_id = layer_get_id("Assets_2");
    	var sprite_id = layer_sprite_get_id(lay_id, "graphic_75257AE2");
    	layer_sprite_change(sprite_id, spr_cottondecovandalized);
    };
}