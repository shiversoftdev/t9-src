#using scripts\core_common\serverfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_9b5aa273;

/*
	Name: function_5063bbf1
	Namespace: namespace_9b5aa273
	Checksum: 0x8CB77D61
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5063bbf1()
{
	level notify(752703424);
}

/*
	Name: function_89f2df9
	Namespace: namespace_9b5aa273
	Checksum: 0x81CE4803
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2b0f887705d6f3e", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_9b5aa273
	Checksum: 0xD1708F6C
	Offset: 0x100
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	serverfield::register("can_show_hold_breath_hint", 1, 1, "int");
}

