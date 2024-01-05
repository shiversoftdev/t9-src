#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace heatseekingmissile;

/*
	Name: function_c7d7162c
	Namespace: heatseekingmissile
	Checksum: 0x6FD6DE2D
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c7d7162c()
{
	level notify(204179856);
}

/*
	Name: __init__system__
	Namespace: heatseekingmissile
	Checksum: 0x373C835E
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"heatseekingmissile", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: heatseekingmissile
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

