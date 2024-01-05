#using scripts\abilities\ability_util.csc;
#using scripts\abilities\ability_power.csc;
#using scripts\abilities\ability_player.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\abilities\gadgets\gadget_smart_cover.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace smart_cover;

/*
	Name: __init__system__
	Namespace: smart_cover
	Checksum: 0xC629122
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"gadget_smart_cover", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: smart_cover
	Checksum: 0x9DAAD88B
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

