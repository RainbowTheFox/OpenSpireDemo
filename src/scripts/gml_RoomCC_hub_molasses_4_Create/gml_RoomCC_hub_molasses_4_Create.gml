function gml_RoomCC_hub_molasses_4_Create() {
    text = scr_painterdemodialogue();
    mybubble = spr_npcbubblepainter;
    myrope = spr_npcropepainter;
    bubblesubimg = -1;
    bubblesubimg2 = -1;
    ropetype = 1;
    ini_open(global.SaveFileName);
    
    if (ini_read_string("Game", "Judgment", "none") != "none")
    	instance_destroy();
    
    ini_close();
}