#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace ray_gun;

/*
	Name: function_89f2df9
	Namespace: ray_gun
	Checksum: 0x377EB7F6
	Offset: 0x78
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"ray_gun", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: ray_gun
	Checksum: 0x80F724D1
	Offset: 0xC8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function __init__()
{
}

