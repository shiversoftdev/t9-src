#using scripts\core_common\system_shared.csc;
#using script_40114edfb27a2dd9;

#namespace hud;

/*
	Name: __init__system__
	Namespace: hud
	Checksum: 0xC82506BC
	Offset: 0x70
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
	Checksum: 0xD8D7B9C8
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	scavenger_icon::register();
}

