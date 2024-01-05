#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace status_effect_explosive_damage;

/*
	Name: function_69f2df12
	Namespace: status_effect_explosive_damage
	Checksum: 0x48CB6ACC
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_69f2df12()
{
	level notify(2030096587);
}

/*
	Name: __init__system__
	Namespace: status_effect_explosive_damage
	Checksum: 0x8154CCAD
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effect_explosive_damage", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_explosive_damage
	Checksum: 0x93A22431
	Offset: 0x100
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::function_6f4eaf88(getstatuseffect("explosive_damage"));
}

