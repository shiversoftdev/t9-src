#using script_7db26be178c873e2;
#using scripts\core_common\system_shared.csc;

#namespace smokegrenade;

/*
	Name: function_a156b102
	Namespace: smokegrenade
	Checksum: 0xE3C17DD1
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a156b102()
{
	level notify(1207137025);
}

/*
	Name: function_89f2df9
	Namespace: smokegrenade
	Checksum: 0xD2D43086
	Offset: 0x90
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

