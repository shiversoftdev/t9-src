#using scripts\weapons\hacker_tool.csc;
#using scripts\core_common\system_shared.csc;

#namespace hacker_tool;

/*
	Name: __init__system__
	Namespace: hacker_tool
	Checksum: 0xFB4B0843
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
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

