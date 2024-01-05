#using script_3daa514e0b3cd5f4;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_9be1ab53;

/*
	Name: function_189b8835
	Namespace: namespace_9be1ab53
	Checksum: 0xF2AF85E4
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_189b8835()
{
	level notify(-1399723572);
}

/*
	Name: __init__system__
	Namespace: namespace_9be1ab53
	Checksum: 0x3F51E8AA
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_5aa4949e75ab9d9c", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_9be1ab53
	Checksum: 0x80F724D1
	Offset: 0xF0
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

