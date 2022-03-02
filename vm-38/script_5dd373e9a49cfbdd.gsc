#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_ac1193d0;

/*
	Name: function_4a9fd469
	Namespace: namespace_ac1193d0
	Checksum: 0xC90C2E19
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4a9fd469()
{
	level notify(2074260262);
}

/*
	Name: function_89f2df9
	Namespace: namespace_ac1193d0
	Checksum: 0x70785597
	Offset: 0x98
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_ddd96714b2ba3e5", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: namespace_ac1193d0
	Checksum: 0x80F724D1
	Offset: 0xE8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function __init__()
{
}

