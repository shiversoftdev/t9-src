#using scripts\core_common\system_shared.csc;
#using scripts\killstreaks\killstreaks_shared.csc;

#namespace killstreaks;

/*
	Name: function_46764ce8
	Namespace: killstreaks
	Checksum: 0xABCE8A4D
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_46764ce8()
{
	level notify(-1766741833);
}

/*
	Name: __init__system__
	Namespace: killstreaks
	Checksum: 0x396783CA
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"killstreaks", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: killstreaks
	Checksum: 0x98B8C2B9
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

