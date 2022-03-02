#using script_6d9aa3cb389aa46a;
#using scripts\core_common\system_shared.gsc;

#namespace hacker_tool;

/*
	Name: function_eda784d8
	Namespace: hacker_tool
	Checksum: 0x743B307B
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eda784d8()
{
	level notify(49419124);
}

/*
	Name: function_89f2df9
	Namespace: hacker_tool
	Checksum: 0x5464AF37
	Offset: 0x90
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

