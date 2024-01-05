#using scripts\killstreaks\killstreak_vehicle.csc;
#using scripts\killstreaks\killstreak_detect.csc;
#using scripts\killstreaks\killstreaks_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace killstreaks;

/*
	Name: function_de3fe4af
	Namespace: killstreaks
	Checksum: 0xBCADC2AC
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_de3fe4af()
{
	level notify(2128548831);
}

/*
	Name: __init__system__
	Namespace: killstreaks
	Checksum: 0x9777BA56
	Offset: 0xF8
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
	Checksum: 0x37B4B3BA
	Offset: 0x148
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	killstreak_vehicle::init();
	killstreak_detect::init_shared();
	function_f1707039();
}

/*
	Name: function_f1707039
	Namespace: killstreaks
	Checksum: 0x52B6C88A
	Offset: 0x198
	Size: 0x2B4
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
	level.var_46b33f90 = [];
	level.var_ce69c3cb = [];
	level.var_a0d81b28 = max(8, 4);
	for(i = 0; i < level.var_a0d81b28; i++)
	{
		level.var_46b33f90[i] = ("killstreaks.killstreak" + i) + ".spaceFull";
		clientfield::register_clientuimodel(level.var_46b33f90[i], #"hash_38b7a28901866ae4", [1:#"hash_3bbe3fe57a438e3c", 0:#"killstreak" + (isdefined(i) ? "" + i : "")], 1, 1, "int", undefined, 0, 0);
		level.var_ce69c3cb[i] = ("killstreaks.killstreak" + i) + ".noTargets";
		clientfield::register_clientuimodel(level.var_ce69c3cb[i], #"hash_38b7a28901866ae4", [1:#"hash_361ce27ba0208918", 0:#"killstreak" + (isdefined(i) ? "" + i : "")], 1, 1, "int", undefined, 0, 0);
	}
}

