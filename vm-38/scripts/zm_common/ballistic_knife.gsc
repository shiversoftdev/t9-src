#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\weapons\ballistic_knife.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace ballistic_knife;

/*
	Name: function_5c4cf873
	Namespace: ballistic_knife
	Checksum: 0x8763366
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5c4cf873()
{
	level notify(-148163740);
}

/*
	Name: __init__system__
	Namespace: ballistic_knife
	Checksum: 0x8D2DD6D3
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"ballistic_knife", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: ballistic_knife
	Checksum: 0x98B8C2B9
	Offset: 0x120
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

