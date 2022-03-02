#using script_64ac23dbb2d7d587;
#using scripts\core_common\system_shared.csc;

#namespace weaponobjects;

/*
	Name: function_89f2df9
	Namespace: weaponobjects
	Checksum: 0x48D0AC60
	Offset: 0x70
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
	Checksum: 0x9DAAD88B
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared();
}

