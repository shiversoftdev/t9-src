#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace frag_grenade;

/*
	Name: __init__system__
	Namespace: frag_grenade
	Checksum: 0x453E5264
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"frag_grenade", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: frag_grenade
	Checksum: 0x80F724D1
	Offset: 0xE0
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

