#using scripts\weapons\weaponobjects.csc;
#using scripts\core_common\system_shared.csc;

#namespace weaponobjects;

/*
	Name: function_3f075324
	Namespace: weaponobjects
	Checksum: 0x11B079C6
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3f075324()
{
	level notify(-1025957941);
}

/*
	Name: __init__system__
	Namespace: weaponobjects
	Checksum: 0xE7FF0B14
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"weaponobjects", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: weaponobjects
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

