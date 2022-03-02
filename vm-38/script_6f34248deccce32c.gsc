#using script_1ca35695cd4aeeea;
#using scripts\core_common\system_shared.csc;

#namespace weapons;

/*
	Name: function_c698e54a
	Namespace: weapons
	Checksum: 0x6799E5A8
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c698e54a()
{
	level notify(1127187016);
}

/*
	Name: function_89f2df9
	Namespace: weapons
	Checksum: 0xEFD5D898
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"weapons", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: weapons
	Checksum: 0x98B8C2B9
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

