#using scripts\core_common\serverfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace status_effect_suppress;

/*
	Name: function_751bb531
	Namespace: status_effect_suppress
	Checksum: 0x50136618
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_751bb531()
{
	level notify(1722986651);
}

/*
	Name: __init__system__
	Namespace: status_effect_suppress
	Checksum: 0x938EC4AD
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effect_suppress", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_suppress
	Checksum: 0x44CF26C7
	Offset: 0x100
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	serverfield::register("status_effect_suppress_field", 1, 5, "int");
}

