#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_7be16dd9;

/*
	Name: function_172c2acd
	Namespace: namespace_7be16dd9
	Checksum: 0x398474DB
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_172c2acd()
{
	level notify(785058897);
}

/*
	Name: function_89f2df9
	Namespace: namespace_7be16dd9
	Checksum: 0x33BD7D32
	Offset: 0x98
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_25181c4d7525232e", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: namespace_7be16dd9
	Checksum: 0x80F724D1
	Offset: 0xE8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function __init__()
{
}

