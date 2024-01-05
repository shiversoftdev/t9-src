#using scripts\core_common\battlechatter.gsc;
#using script_1cc417743d7c262d;
#using scripts\killstreaks\ultimate_turret_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace ultimate_turret;

/*
	Name: __init__system__
	Namespace: ultimate_turret
	Checksum: 0x5B6FA14E
	Offset: 0xA8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"ultimate_turret", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: ultimate_turret
	Checksum: 0x76194FFE
	Offset: 0xF8
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_729a0937 = &function_4b645b3f;
	level.var_bbc796bf = &turret_destroyed;
	init_shared();
}

/*
	Name: function_4b645b3f
	Namespace: ultimate_turret
	Checksum: 0x309002D3
	Offset: 0x148
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_4b645b3f(killstreaktype)
{
	self globallogic_audio::play_taacom_dialog("timeout", killstreaktype);
}

/*
	Name: turret_destroyed
	Namespace: ultimate_turret
	Checksum: 0x1EDAB0B1
	Offset: 0x180
	Size: 0x7E
	Parameters: 2
	Flags: Linked
*/
function turret_destroyed(attacker, weapon)
{
	if(isdefined(attacker))
	{
		attacker battlechatter::function_eebf94f6("ultimate_turret");
		attacker stats::function_e24eec31(weapon, #"hash_3f3d8a93c372c67d", 1);
		attacker stats::function_a431be09(weapon);
	}
}

