#using scripts\core_common\system_shared.csc;
#using script_40114edfb27a2dd9;

#namespace hud_shared;

/*
	Name: function_1aff2cd0
	Namespace: hud_shared
	Checksum: 0xC78908F8
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1aff2cd0()
{
	level notify(57572824);
}

#namespace hud;

/*
	Name: __init__system__
	Namespace: hud
	Checksum: 0x670AA1C8
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hud", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: hud
	Checksum: 0xDDC5A3FA
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	scavenger_icon::register();
}

