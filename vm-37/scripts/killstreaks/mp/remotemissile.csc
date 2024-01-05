#using scripts\core_common\system_shared.csc;
#using scripts\killstreaks\remotemissile_shared.csc;

#namespace remotemissile;

/*
	Name: __init__system__
	Namespace: remotemissile
	Checksum: 0x399FF803
	Offset: 0x70
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"remotemissile", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: remotemissile
	Checksum: 0x9DAAD88B
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

