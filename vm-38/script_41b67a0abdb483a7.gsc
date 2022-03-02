#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace flamethrower;

/*
	Name: function_d48b118b
	Namespace: flamethrower
	Checksum: 0x3B5C8AD8
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d48b118b()
{
	level notify(1214978345);
}

/*
	Name: function_89f2df9
	Namespace: flamethrower
	Checksum: 0x30B3B92E
	Offset: 0x98
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"flamethrower", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: flamethrower
	Checksum: 0x80F724D1
	Offset: 0xE8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
}

