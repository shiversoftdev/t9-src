#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_ac4c291d;

/*
	Name: function_7b10ec4a
	Namespace: namespace_ac4c291d
	Checksum: 0xDDECAD79
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7b10ec4a()
{
	level notify(1035250290);
}

/*
	Name: __init__system__
	Namespace: namespace_ac4c291d
	Checksum: 0x9BFA97EB
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_1c2f845f6ae4ceb2", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ac4c291d
	Checksum: 0x80F724D1
	Offset: 0xE8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
}

