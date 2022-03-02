#using script_5ce3a97e77bb8a9f;
#using scripts\core_common\system_shared.csc;

#namespace remotemissile;

/*
	Name: function_89f2df9
	Namespace: remotemissile
	Checksum: 0x399FF803
	Offset: 0x70
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"remotemissile", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: remotemissile
	Checksum: 0x9DAAD88B
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

