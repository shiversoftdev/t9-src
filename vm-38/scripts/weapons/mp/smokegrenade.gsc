#using scripts\weapons\smokegrenade.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace smokegrenade;

/*
	Name: function_2806ad73
	Namespace: smokegrenade
	Checksum: 0x80D6EDA3
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2806ad73()
{
	level notify(1524294829);
}

/*
	Name: __init__system__
	Namespace: smokegrenade
	Checksum: 0xD2D43086
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"smokegrenade", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: smokegrenade
	Checksum: 0xDD2482F
	Offset: 0xD8
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	level.var_30c87520 = &function_4cc4db89;
}

