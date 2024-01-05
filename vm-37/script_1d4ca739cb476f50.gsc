#using scripts\core_common\system_shared.csc;
#using scripts\core_common\serverfield_shared.csc;

#namespace minigame;

/*
	Name: __init__system__
	Namespace: minigame
	Checksum: 0x8D7D7549
	Offset: 0xA0
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register("minigames", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: minigame
	Checksum: 0xD06CC17
	Offset: 0xE0
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	serverfield::register("minigame_progress", 1, 3, "int");
}

/*
	Name: function_98fbeac1
	Namespace: minigame
	Checksum: 0x29EECF94
	Offset: 0x118
	Size: 0x84
	Parameters: 2
	Flags: None
*/
function function_98fbeac1(e_player, steps)
{
	/#
		assert((8 - 1) >= steps);
	#/
	var_4b635559 = int(steps * (8 - 1));
	e_player serverfield::set("minigame_progress", var_4b635559);
}

