function gml_Room_rm_devroom_Create() {
    obj_parent_player.state = 1;
    
    if (live_call())
    	return live_result;
}