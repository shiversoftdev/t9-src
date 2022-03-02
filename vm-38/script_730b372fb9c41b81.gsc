#using script_64ac23dbb2d7d587;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace weaponobjects;

/*
	Name: function_e58fd20
	Namespace: weaponobjects
	Checksum: 0x3CA152A0
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e58fd20()
{
	level notify(357325473);
}

/*
	Name: function_89f2df9
	Namespace: weaponobjects
	Checksum: 0xE7FF0B14
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"weaponobjects", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: weaponobjects
	Checksum: 0x98B8C2B9
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

