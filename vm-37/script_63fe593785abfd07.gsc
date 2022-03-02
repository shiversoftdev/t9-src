#using script_4f58b9f4cd085079;
#using scripts\core_common\system_shared.csc;

#namespace trophy_system;

/*
	Name: function_89f2df9
	Namespace: trophy_system
	Checksum: 0x6C502F88
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"trophy_system", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: trophy_system
	Checksum: 0x9DAAD88B
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

