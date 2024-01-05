#using scripts\core_common\clientfield_shared.csc;

#namespace globallogic_score;

/*
	Name: __init__
	Namespace: globallogic_score
	Checksum: 0x12189CFF
	Offset: 0xF8
	Size: 0x1A4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	clientfield::register_clientuimodel("hudItems.scoreProtected", #"hud_items", #"hash_64bde2d3f01e676d", 1, 1, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.minorActions.action0", #"hud_items", [1:#"hash_2ab8edb6b281b81d", 0:#"hash_37c5d3c0d4212535"], 1, 1, "counter", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.minorActions.action1", #"hud_items", [1:#"action1", 0:#"hash_37c5d3c0d4212535"], 1, 1, "counter", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.hotStreak.level", #"hud_items", [1:#"level", 0:#"hotstreak"], 1, 3, "int", undefined, 0, 0);
}

