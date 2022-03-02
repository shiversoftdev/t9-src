#using script_7db26be178c873e2;
#using scripts\core_common\system_shared.csc;

#namespace smokegrenade;

/*
	Name: function_89f2df9
	Namespace: smokegrenade
	Checksum: 0x7DFB97F2
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"smokegrenade", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: smokegrenade
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

