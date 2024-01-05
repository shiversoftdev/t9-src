#using scripts\weapons\trophy_system.csc;
#using scripts\core_common\system_shared.csc;

#namespace trophy_system;

/*
	Name: function_ee3d2bf4
	Namespace: trophy_system
	Checksum: 0x3C68A361
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ee3d2bf4()
{
	level notify(1049365519);
}

/*
	Name: __init__system__
	Namespace: trophy_system
	Checksum: 0xC37F88FC
	Offset: 0x90
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

