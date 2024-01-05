#using scripts\core_common\battlechatter.gsc;
#using script_1cc417743d7c262d;
#using script_5312dbb58ee628a8;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace missile_turret;

/*
	Name: function_ac0bf704
	Namespace: missile_turret
	Checksum: 0xCC491C6D
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ac0bf704()
{
	level notify(-1926618763);
}

/*
	Name: __init__system__
	Namespace: missile_turret
	Checksum: 0x61C37470
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"missile_turret", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: missile_turret
	Checksum: 0xD817326A
	Offset: 0x110
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_1c5940ad = &function_4b645b3f;
	level.var_2958ac6c = &turret_destroyed;
	init_shared();
}

/*
	Name: function_4b645b3f
	Namespace: missile_turret
	Checksum: 0x20B05A35
	Offset: 0x160
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
	Namespace: missile_turret
	Checksum: 0x69DE5F88
	Offset: 0x198
	Size: 0x66
	Parameters: 2
	Flags: Linked
*/
function turret_destroyed(attacker, weapon)
{
	if(isdefined(attacker))
	{
		attacker battlechatter::function_eebf94f6("missile_turret", weapon);
		attacker stats::function_e24eec31(weapon, #"hash_3f3d8a93c372c67d", 1);
	}
}

