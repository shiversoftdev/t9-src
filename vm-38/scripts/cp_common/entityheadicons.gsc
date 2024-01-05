#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\entityheadicons_shared.gsc;

#namespace entityheadicons;

/*
	Name: function_59b38d01
	Namespace: entityheadicons
	Checksum: 0x3012D27
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_59b38d01()
{
	level notify(1042185172);
}

/*
	Name: __init__system__
	Namespace: entityheadicons
	Checksum: 0x4C5E4256
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"entityheadicons", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: entityheadicons
	Checksum: 0x98B8C2B9
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared();
}

