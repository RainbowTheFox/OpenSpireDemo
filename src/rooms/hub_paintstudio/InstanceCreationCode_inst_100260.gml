text = scr_painterdemodialogue();
mybubble = spr_npcbubblepainter;
myrope = spr_npcropepainter;
bubblesubimg = -1;
bubblesubimg2 = -1;
ropetype = 1;
ini_open(global.SaveFileName);
var has_judgment = ini_read_string("Game", "Judgment", "none") != "none";
ini_close();

if (scr_check_completion() && !has_judgment)
	instance_destroy();
