#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace heatseekingmissile;

/*
	Name: function_4dc5a9a6
	Namespace: heatseekingmissile
	Checksum: 0x33F42CC
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4dc5a9a6()
{
	level notify(-1604668061);
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
	Checksum: 0x65B6DF64
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.lockoncloserange = 330;
	level.lockoncloseradiusscaler = 3;
	init_shared();
}

