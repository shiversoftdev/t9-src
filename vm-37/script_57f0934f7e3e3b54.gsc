#using scripts\killstreaks\killstreak_detect.csc;
#using scripts\killstreaks\killstreaks_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace killstreaks;

/*
	Name: __init__system__
	Namespace: killstreaks
	Checksum: 0xE3B1213D
	Offset: 0xC0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"killstreaks", &function_70a657d8, undefined, undefined, #"renderoverridebundle");
}

/*
	Name: function_70a657d8
	Namespace: killstreaks
	Checksum: 0x4069378D
	Offset: 0x110
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	killstreak_detect::init_shared();
	function_f1707039();
}

/*
	Name: function_f1707039
	Namespace: killstreaks
	Checksum: 0x6316CF8E
	Offset: 0x150
	Size: 0x1F4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f1707039()
{
	level.var_4b42d599 = [];
	for(i = 0; i < 4; i++)
	{
		level.var_4b42d599[i] = ("killstreaks.killstreak" + i) + ".inUse";
		clientfield::register_clientuimodel(level.var_4b42d599[i], #"hash_38b7a28901866ae4", [1:#"inuse", 0:#"killstreak" + (isdefined(i) ? "" + i : "")], 1, 1, "int", undefined, 0, 0);
	}
	level.var_46b33f90[i] = [];
	level.var_173b8ed7 = max(8, 4);
	for(i = 0; i < level.var_173b8ed7; i++)
	{
		level.var_46b33f90[i] = ("killstreaks.killstreak" + i) + ".spaceFull";
		clientfield::register_clientuimodel(level.var_46b33f90[i], #"hash_38b7a28901866ae4", [1:#"hash_3bbe3fe57a438e3c", 0:#"killstreak" + (isdefined(i) ? "" + i : "")], 1, 1, "int", undefined, 0, 0);
	}
}

