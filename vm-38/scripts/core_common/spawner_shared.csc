#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace spawner_shared;

/*
	Name: function_c14479b6
	Namespace: spawner_shared
	Checksum: 0x3BF0113D
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c14479b6()
{
	level notify(-1868168299);
}

#namespace spawner;

/*
	Name: __init__system__
	Namespace: spawner
	Checksum: 0xE32639BE
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"spawner", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: spawner
	Checksum: 0x80F724D1
	Offset: 0xD8
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

