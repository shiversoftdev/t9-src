#using scripts\weapons\grenades.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace grenades;

/*
	Name: function_ed1b768f
	Namespace: grenades
	Checksum: 0xFC406456
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ed1b768f()
{
	level notify(-805203940);
}

/*
	Name: __init__system__
	Namespace: grenades
	Checksum: 0xD2053946
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"grenades", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: grenades
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

