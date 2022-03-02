#using script_d116a14142e2250;
#using scripts\core_common\system_shared.csc;

#namespace killstreaks;

/*
	Name: function_89f2df9
	Namespace: killstreaks
	Checksum: 0x964824BE
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"killstreaks", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: killstreaks
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

