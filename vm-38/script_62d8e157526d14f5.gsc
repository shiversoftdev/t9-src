#using scripts\zm_common\zm_powerups.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_e7b06f1b;

/*
	Name: function_fa62fe7a
	Namespace: namespace_e7b06f1b
	Checksum: 0xA8E9A36A
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fa62fe7a()
{
	level notify(885713261);
}

/*
	Name: __init__system__
	Namespace: namespace_e7b06f1b
	Checksum: 0xF02D6AA
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_6119ea2d427fdf8a", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_e7b06f1b
	Checksum: 0x80F724D1
	Offset: 0xE8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

