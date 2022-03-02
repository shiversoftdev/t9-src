#using script_4ca6f7cb266af7fe;
#using scripts\core_common\system_shared.csc;

#namespace hacker_tool;

/*
	Name: function_89f2df9
	Namespace: hacker_tool
	Checksum: 0xFB4B0843
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hacker_tool", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: hacker_tool
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

