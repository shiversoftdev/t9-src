#using script_4eecbd20dc9a462c;
#using scripts\core_common\system_shared.csc;

#namespace chopper_gunner;

/*
	Name: function_b5a5f550
	Namespace: chopper_gunner
	Checksum: 0xF6FE4FDB
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b5a5f550()
{
	level notify(-532967861);
}

/*
	Name: __init__system__
	Namespace: chopper_gunner
	Checksum: 0x2484391
	Offset: 0x90
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"chopper_gunner", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: chopper_gunner
	Checksum: 0x61672225
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	namespace_e8c18978::function_70a657d8();
}

