#using script_6ad3fda349f49bf9;
#using script_d116a14142e2250;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace killstreaks;

/*
	Name: function_38936795
	Namespace: killstreaks
	Checksum: 0x4C5EF58B
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_38936795()
{
	level notify(642594457);
}

/*
	Name: function_89f2df9
	Namespace: killstreaks
	Checksum: 0x14185F67
	Offset: 0xE0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"killstreaks", &function_70a657d8, undefined, undefined, #"renderoverridebundle");
}

/*
	Name: function_70a657d8
	Namespace: killstreaks
	Checksum: 0x74F9A01A
	Offset: 0x130
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
	Checksum: 0x2A5AA6E
	Offset: 0x170
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
		clientfield::function_a8bbc967(level.var_4b42d599[i], #"hash_38b7a28901866ae4", [1:#"inuse", 0:#"killstreak" + (isdefined(i) ? "" + i : "")], 1, 1, "int", undefined, 0, 0);
	}
	level.var_46b33f90[i] = [];
	level.var_173b8ed7 = max(8, 4);
	for(i = 0; i < level.var_173b8ed7; i++)
	{
		level.var_46b33f90[i] = ("killstreaks.killstreak" + i) + ".spaceFull";
		clientfield::function_a8bbc967(level.var_46b33f90[i], #"hash_38b7a28901866ae4", [1:#"hash_3bbe3fe57a438e3c", 0:#"killstreak" + (isdefined(i) ? "" + i : "")], 1, 1, "int", undefined, 0, 0);
	}
}

/*
	Name: function_d79281c4
	Namespace: killstreaks
	Checksum: 0xACC9963F
	Offset: 0x370
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_d79281c4(off)
{
	if(off)
	{
		setdvar(#"hash_c4d58c161f407a2", 0);
	}
	else
	{
		setdvar(#"hash_c4d58c161f407a2", 1);
	}
}

