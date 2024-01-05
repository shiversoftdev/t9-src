#using scripts\weapons\smokegrenade.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace smokegrenade;

/*
	Name: __init__system__
	Namespace: smokegrenade
	Checksum: 0x7DFB97F2
	Offset: 0x70
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
	Checksum: 0x5633366B
	Offset: 0xB8
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	level.var_30c87520 = &function_4cc4db89;
}

