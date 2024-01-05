#using scripts\weapons\teargas.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace teargas;

/*
	Name: __init__system__
	Namespace: teargas
	Checksum: 0xC7487448
	Offset: 0x78
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"teargas", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: teargas
	Checksum: 0x3D9B286F
	Offset: 0xC0
	Size: 0xC4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	level.var_c7b2d0ab = getweapon(#"tear_gas");
	globallogic_score::function_5a241bd8(level.var_c7b2d0ab, &function_8f5e1a77, 1);
	globallogic_score::function_31bde79e(level.var_c7b2d0ab, #"hash_38b93f97da20f2e1");
	globallogic_score::function_889c9d13(level.var_c7b2d0ab, #"hash_6e9f9d0d3ae59765");
}

/*
	Name: function_8f5e1a77
	Namespace: teargas
	Checksum: 0x83C822AF
	Offset: 0x190
	Size: 0x3C
	Parameters: 5
	Flags: Linked
*/
function function_8f5e1a77(attacker, victim, weapon, attackerweapon, meansofdeath)
{
	return meansofdeath === level.var_c7b2d0ab;
}

