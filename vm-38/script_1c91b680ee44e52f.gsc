#using scripts\core_common\ai\archetype_brutus.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_df4fbf0;

/*
	Name: function_a83b99b
	Namespace: namespace_df4fbf0
	Checksum: 0x9C940890
	Offset: 0x148
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a83b99b()
{
	level notify(-434470493);
}

/*
	Name: init
	Namespace: namespace_df4fbf0
	Checksum: 0x10BADB92
	Offset: 0x168
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_cae618b4("spawner_zombietron_brutus");
	clientfield::register("toplayer", "brutus_shock_attack_player", 1, 1, "counter", &brutus_shock_attack_player, 0, 0);
	clientfield::register("actor", "brutus_shock_attack", 1, 1, "counter", &brutus_shock_attack_fx, 0, 0);
	footsteps::registeraitypefootstepcb(#"brutus", &function_6e2a738c);
}

/*
	Name: function_6e2a738c
	Namespace: namespace_df4fbf0
	Checksum: 0x853C20E3
	Offset: 0x250
	Size: 0x2C
	Parameters: 5
	Flags: Linked
*/
function function_6e2a738c(localclientnum, pos, surface, notetrack, bone)
{
}

/*
	Name: brutus_shock_attack_player
	Namespace: namespace_df4fbf0
	Checksum: 0x38A5627F
	Offset: 0x288
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function brutus_shock_attack_player(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	function_36e4ebd4(bwasdemojump, "damage_heavy");
}

/*
	Name: brutus_shock_attack_fx
	Namespace: namespace_df4fbf0
	Checksum: 0xD43C6C9A
	Offset: 0x2F0
	Size: 0xC4
	Parameters: 7
	Flags: Linked
*/
function brutus_shock_attack_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	self util::waittill_dobj(bwasdemojump);
	if(!isdefined(self))
	{
		return;
	}
	playfx(bwasdemojump, "maps/zm_escape/fx8_alcatraz_brut_shock", self.origin, anglestoup(self.angles));
	earthquake(bwasdemojump, 1, 1, self.origin, 512);
}

