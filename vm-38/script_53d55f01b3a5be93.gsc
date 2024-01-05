#using scripts\zm\ai\zm_ai_hulk.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace namespace_45b55437;

/*
	Name: function_6ad7e667
	Namespace: namespace_45b55437
	Checksum: 0xDFC2CCE2
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6ad7e667()
{
	level notify(-54842839);
}

/*
	Name: __init__system__
	Namespace: namespace_45b55437
	Checksum: 0x86040F00
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7d755ebddd333af6", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_45b55437
	Checksum: 0xEBC8C328
	Offset: 0xE0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	ai::add_archetype_spawn_function(#"hulk", &function_6f88ed29);
}

/*
	Name: function_6f88ed29
	Namespace: namespace_45b55437
	Checksum: 0xF99CEEF9
	Offset: 0x120
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6f88ed29(localclientnum)
{
}

