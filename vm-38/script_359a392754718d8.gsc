#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_d8608565;

/*
	Name: function_e8070124
	Namespace: namespace_d8608565
	Checksum: 0xEB136F8A
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e8070124()
{
	level notify(-436223825);
}

/*
	Name: __init__system__
	Namespace: namespace_d8608565
	Checksum: 0x9B4C1B3D
	Offset: 0xB0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_661f2553d5c4d2b4", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: namespace_d8608565
	Checksum: 0xB68F22B2
	Offset: 0x100
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(isdefined(level.killstreakrules[#"hero_weapons"]))
	{
		killstreakrules::addkillstreaktorule("planemortar", "hero_weapons", 0, 0);
	}
}

