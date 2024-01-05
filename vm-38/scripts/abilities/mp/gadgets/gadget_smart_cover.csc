#using scripts\abilities\ability_util.csc;
#using scripts\abilities\ability_power.csc;
#using scripts\abilities\ability_player.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\abilities\gadgets\gadget_smart_cover.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace gadget_smart_cover;

/*
	Name: function_c962a5a3
	Namespace: gadget_smart_cover
	Checksum: 0x42FCD829
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c962a5a3()
{
	level notify(-291488291);
}

#namespace smart_cover;

/*
	Name: __init__system__
	Namespace: smart_cover
	Checksum: 0xA34D3656
	Offset: 0xC8
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
	Checksum: 0x98B8C2B9
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

