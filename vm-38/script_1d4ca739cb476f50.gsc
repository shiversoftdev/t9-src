#using scripts\core_common\system_shared.csc;
#using scripts\core_common\serverfield_shared.csc;

#namespace namespace_435e13ec;

/*
	Name: function_c812248f
	Namespace: namespace_435e13ec
	Checksum: 0xFF6E7E8C
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c812248f()
{
	level notify(495814860);
}

#namespace minigame;

/*
	Name: __init__system__
	Namespace: minigame
	Checksum: 0xBFA6031F
	Offset: 0xC0
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
	Checksum: 0x25248A9C
	Offset: 0x100
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	serverfield::register("minigame_progress", 1, 3, "int");
}

/*
	Name: function_98fbeac1
	Namespace: minigame
	Checksum: 0x8C74CF3
	Offset: 0x138
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

