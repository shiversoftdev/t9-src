#using scripts\weapons\trophy_system.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace trophy_system;

/*
	Name: function_6c88c4d
	Namespace: trophy_system
	Checksum: 0xD344D539
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6c88c4d()
{
	level notify(-621052193);
}

/*
	Name: __init__system__
	Namespace: trophy_system
	Checksum: 0xC37F88FC
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"trophy_system", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: trophy_system
	Checksum: 0x62577666
	Offset: 0xE8
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	function_720ddf7f(&function_ccfcde75);
}

/*
	Name: function_ccfcde75
	Namespace: trophy_system
	Checksum: 0xDF8BB71
	Offset: 0x128
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_ccfcde75(trophy, grenade)
{
	self battlechatter::function_fc82b10(trophy.weapon, grenade.origin, trophy);
	self contracts::increment_contract(#"hash_5d75f7e385889afa");
}

