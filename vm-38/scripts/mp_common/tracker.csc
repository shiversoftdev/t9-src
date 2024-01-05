#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\tracker_shared.csc;

#namespace tracker;

/*
	Name: function_cde3b717
	Namespace: tracker
	Checksum: 0x332BB218
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cde3b717()
{
	level notify(-671000432);
}

/*
	Name: __init__system__
	Namespace: tracker
	Checksum: 0x949A6FB2
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"tracker", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: tracker
	Checksum: 0x98B8C2B9
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

