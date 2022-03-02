#using script_32070ee59eefcc7f;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\zm_common\zm_powerups.csc;

#namespace zm_powerup_nuke;

/*
	Name: function_89f2df9
	Namespace: zm_powerup_nuke
	Checksum: 0x5F0ECAE1
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_powerup_nuke", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_nuke
	Checksum: 0xBFEAFEE5
	Offset: 0x100
	Size: 0xC4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::include_zombie_powerup("nuke");
	zm_powerups::add_zombie_powerup("nuke");
	clientfield::register("actor", "zm_nuked", 1, 1, "int", &zombie_nuked, 0, 0);
	clientfield::register("vehicle", "zm_nuked", 1, 1, "int", &zombie_nuked, 0, 0);
}

/*
	Name: zombie_nuked
	Namespace: zm_powerup_nuke
	Checksum: 0x7E1D6597
	Offset: 0x1D0
	Size: 0x54
	Parameters: 7
	Flags: Linked
*/
function zombie_nuked(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self zombie_death::flame_death_fx(bwastimejump);
}

