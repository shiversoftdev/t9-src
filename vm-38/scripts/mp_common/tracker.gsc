#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\tracker_shared.gsc;
#using scripts\core_common\util_shared.gsc;

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
	level notify(671000432);
}

/*
	Name: function_89f2df9
	Namespace: tracker
	Checksum: 0x949A6FB2
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
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

