#using script_1cc417743d7c262d;
#using script_47fb62300ac0bd60;
#using script_56d425496a225a1b;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace ultimate_turret;

/*
	Name: function_7c301b3d
	Namespace: ultimate_turret
	Checksum: 0x7649652A
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7c301b3d()
{
	level notify(1788279973);
}

/*
	Name: function_89f2df9
	Namespace: ultimate_turret
	Checksum: 0x4AD92999
	Offset: 0xC8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"ultimate_turret", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: ultimate_turret
	Checksum: 0x54B07498
	Offset: 0x118
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
	Checksum: 0xB2935649
	Offset: 0x168
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
	Checksum: 0x14DDD74D
	Offset: 0x1A0
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

