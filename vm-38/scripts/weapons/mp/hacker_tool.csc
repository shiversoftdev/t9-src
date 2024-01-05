#using scripts\weapons\hacker_tool.csc;
#using scripts\core_common\system_shared.csc;

#namespace hacker_tool;

/*
	Name: function_4858d7e6
	Namespace: hacker_tool
	Checksum: 0xD77ECED5
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4858d7e6()
{
	level notify(-470408088);
}

/*
	Name: __init__system__
	Namespace: hacker_tool
	Checksum: 0x5464AF37
	Offset: 0x90
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

