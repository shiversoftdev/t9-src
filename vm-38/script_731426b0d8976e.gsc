#using script_5c69ef91bd5f2dbf;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_5665d8db;

/*
	Name: function_c6a4ddc8
	Namespace: namespace_5665d8db
	Checksum: 0xED12B1F5
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c6a4ddc8()
{
	level notify(-1085864138);
}

/*
	Name: __init__system__
	Namespace: namespace_5665d8db
	Checksum: 0x5198F53E
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_2bb3180ae90516b3", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_5665d8db
	Checksum: 0x80F724D1
	Offset: 0xE0
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

