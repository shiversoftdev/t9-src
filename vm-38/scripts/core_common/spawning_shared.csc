#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\math_shared.csc;

#namespace spawning_shared;

/*
	Name: function_3a33da0c
	Namespace: spawning_shared
	Checksum: 0xFB968C96
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3a33da0c()
{
	level notify(-607535371);
}

#namespace spawning;

/*
	Name: __init__system__
	Namespace: spawning
	Checksum: 0xD62BAF49
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"spawning_shared", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: spawning
	Checksum: 0x80F724D1
	Offset: 0xE0
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

