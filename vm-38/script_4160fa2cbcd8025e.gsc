#using script_7bafaa95bb1b427e;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;

#namespace weapons;

/*
	Name: function_5ac0d3db
	Namespace: weapons
	Checksum: 0x6F8A0FBD
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5ac0d3db()
{
	level notify(904400822);
}

/*
	Name: function_89f2df9
	Namespace: weapons
	Checksum: 0xEFD5D898
	Offset: 0x98
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
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

