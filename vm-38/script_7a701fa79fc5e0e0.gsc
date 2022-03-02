#using script_4352ff1c564b5cda;
#using scripts\core_common\system_shared.csc;

#namespace teargas;

/*
	Name: function_b4f0a7d7
	Namespace: teargas
	Checksum: 0xD84E9AAC
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b4f0a7d7()
{
	level notify(274398989);
}

/*
	Name: function_89f2df9
	Namespace: teargas
	Checksum: 0x6867D33C
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"teargas", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: teargas
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

