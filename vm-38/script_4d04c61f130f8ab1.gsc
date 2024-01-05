#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_a2fc8c70;

/*
	Name: function_b308cb70
	Namespace: namespace_a2fc8c70
	Checksum: 0x5B08A16F
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b308cb70()
{
	level notify(-1542063099);
}

/*
	Name: __init__system__
	Namespace: namespace_a2fc8c70
	Checksum: 0xFCAB64D4
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_35d5e49c19d9cf09", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_a2fc8c70
	Checksum: 0x80F724D1
	Offset: 0xE0
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

