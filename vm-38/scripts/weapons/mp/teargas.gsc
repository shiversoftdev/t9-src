#using scripts\weapons\teargas.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;

#namespace teargas;

/*
	Name: function_19b7c482
	Namespace: teargas
	Checksum: 0x64CE049A
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_19b7c482()
{
	level notify(145157913);
}

/*
	Name: __init__system__
	Namespace: teargas
	Checksum: 0x6867D33C
	Offset: 0xA0
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
	Checksum: 0x936FA071
	Offset: 0xE8
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	level.var_c7b2d0ab = getweapon(#"tear_gas");
	globallogic_score::function_5a241bd8(level.var_c7b2d0ab, &function_8f5e1a77, 1);
	globallogic_score::function_c1e9b86b(level.var_c7b2d0ab, &function_6703177e);
}

/*
	Name: function_6703177e
	Namespace: teargas
	Checksum: 0x68F31480
	Offset: 0x190
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_6703177e(params)
{
	attacker = params.attacker;
	attacker stats::function_dad108fa(#"hash_38b93f97da20f2e1", 1);
	attacker stats::function_dad108fa(#"hash_38b93c97da20edc8", 1);
	attacker stats::function_dad108fa(#"hash_6e9f9d0d3ae59765", 1);
}

/*
	Name: function_8f5e1a77
	Namespace: teargas
	Checksum: 0x37EC78E4
	Offset: 0x230
	Size: 0x3C
	Parameters: 5
	Flags: Linked
*/
function function_8f5e1a77(attacker, victim, weapon, attackerweapon, meansofdeath)
{
	return meansofdeath === level.var_c7b2d0ab;
}

