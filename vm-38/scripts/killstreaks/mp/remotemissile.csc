#using scripts\core_common\system_shared.csc;
#using scripts\killstreaks\remotemissile_shared.csc;

#namespace remotemissile;

/*
	Name: function_7bb4995f
	Namespace: remotemissile
	Checksum: 0xDC193405
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7bb4995f()
{
	level notify(-1711904996);
}

/*
	Name: __init__system__
	Namespace: remotemissile
	Checksum: 0x81C2DE74
	Offset: 0x90
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
	Checksum: 0x98B8C2B9
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

