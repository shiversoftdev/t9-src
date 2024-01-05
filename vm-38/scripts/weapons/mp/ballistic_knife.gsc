#using scripts\weapons\ballistic_knife.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace ballistic_knife;

/*
	Name: function_e9c2417f
	Namespace: ballistic_knife
	Checksum: 0xE1666841
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e9c2417f()
{
	level notify(-1102024545);
}

/*
	Name: __init__system__
	Namespace: ballistic_knife
	Checksum: 0x8D2DD6D3
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"ballistic_knife", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: ballistic_knife
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

