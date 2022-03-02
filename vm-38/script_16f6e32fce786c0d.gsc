#using script_8988fdbc78d6c53;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\zm_common\util.gsc;

#namespace weaponobjects;

/*
	Name: function_6a97da44
	Namespace: weaponobjects
	Checksum: 0x392D4EF2
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6a97da44()
{
	level notify(1007068623);
}

/*
	Name: function_89f2df9
	Namespace: weaponobjects
	Checksum: 0xE7FF0B14
	Offset: 0xC8
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
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

