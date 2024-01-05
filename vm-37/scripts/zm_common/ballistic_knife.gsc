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
	Name: __init__system__
	Namespace: ballistic_knife
	Checksum: 0x220271A7
	Offset: 0xB8
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
	Checksum: 0x9DAAD88B
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared();
}

