#using script_4352ff1c564b5cda;
#using scripts\core_common\system_shared.csc;

#namespace teargas;

/*
	Name: function_89f2df9
	Namespace: teargas
	Checksum: 0xC7487448
	Offset: 0x70
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

