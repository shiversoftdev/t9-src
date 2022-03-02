#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_b7964db5;

/*
	Name: function_29dc466b
	Namespace: namespace_b7964db5
	Checksum: 0xCE7CA842
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_29dc466b()
{
	level notify(1015168178);
}

#namespace ray_gun;

/*
	Name: function_89f2df9
	Namespace: ray_gun
	Checksum: 0x8F239181
	Offset: 0x98
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
	Offset: 0xE8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function __init__()
{
}

