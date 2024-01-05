#using scripts\core_common\ai\archetype_brutus.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_df4fbf0;

/*
	Name: init
	Namespace: namespace_df4fbf0
	Checksum: 0x5FA820BE
	Offset: 0x148
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
	Checksum: 0x73E47029
	Offset: 0x230
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
	Checksum: 0x5B8DFAC6
	Offset: 0x268
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
	Checksum: 0xBAE92408
	Offset: 0x2D0
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

