#using script_1cc417743d7c262d;
#using script_47fb62300ac0bd60;
#using script_5312dbb58ee628a8;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace missile_turret;

/*
	Name: function_89f2df9
	Namespace: missile_turret
	Checksum: 0x58AE6368
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"missile_turret", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: missile_turret
	Checksum: 0x66D38BE3
	Offset: 0xF0
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
	Checksum: 0x7EF34A52
	Offset: 0x140
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
	Checksum: 0x25929432
	Offset: 0x178
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

