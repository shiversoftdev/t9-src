#using scripts\weapons\trophy_system.csc;
#using scripts\core_common\system_shared.csc;

#namespace trophy_system;

/*
	Name: __init__system__
	Namespace: trophy_system
	Checksum: 0x6C502F88
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"trophy_system", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: trophy_system
	Checksum: 0x9DAAD88B
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

