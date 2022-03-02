#using script_64ac23dbb2d7d587;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace electroball_grenade;

/*
	Name: function_6a5137cd
	Namespace: electroball_grenade
	Checksum: 0x6D0C9F0D
	Offset: 0x260
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6a5137cd()
{
	level notify(1864091508);
}

/*
	Name: function_89f2df9
	Namespace: electroball_grenade
	Checksum: 0x62FFB14B
	Offset: 0x280
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register("electroball_grenade", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: electroball_grenade
	Checksum: 0x1F6966E6
	Offset: 0x2C0
	Size: 0x1DC
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	clientfield::register("toplayer", "electroball_tazered", 1, 1, "int", undefined, 0, 0);
	clientfield::register("allplayers", "electroball_shock", 1, 1, "int", &function_7ec61d7a, 0, 0);
	clientfield::register("missile", "electroball_stop_trail", 1, 1, "int", &function_7b605b7b, 0, 0);
	clientfield::register("missile", "electroball_play_landed_fx", 1, 1, "int", &electroball_play_landed_fx, 0, 0);
	level._effect[#"hash_782d8b3c7cf0155a"] = "zm_ai/fx9_mech_wpn_115_blob";
	level._effect[#"hash_20d1b299e564ead7"] = "zm_ai/fx9_mech_wpn_115_bul_trail";
	level._effect[#"hash_6eac1e89faaa9560"] = "zm_ai/fx9_mech_wpn_115_canister";
	level._effect[#"electroball_grenade_player_shock"] = "weapon/fx_prox_grenade_impact_player_spwner";
	level._effect[#"electroball_grenade_sparky_conversion"] = "weapon/fx_prox_grenade_exp";
	callback::add_weapon_type("electroball_grenade", &proximity_spawned);
}

/*
	Name: proximity_spawned
	Namespace: electroball_grenade
	Checksum: 0x61F0BFF2
	Offset: 0x4A8
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function proximity_spawned(localclientnum)
{
	self util::waittill_dobj(localclientnum);
	if(self isgrenadedud())
	{
		return;
	}
	self.var_78b154ef = util::playfxontag(localclientnum, level._effect[#"hash_20d1b299e564ead7"], self, "j_grenade_front");
	self.var_de70e6e2 = util::playfxontag(localclientnum, level._effect[#"hash_6eac1e89faaa9560"], self, "j_grenade_back");
}

/*
	Name: function_7ec61d7a
	Namespace: electroball_grenade
	Checksum: 0x16761530
	Offset: 0x578
	Size: 0x7E
	Parameters: 7
	Flags: Linked
*/
function function_7ec61d7a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	fx = util::playfxontag(bwastimejump, level._effect[#"electroball_grenade_player_shock"], self, "J_SpineUpper");
}

/*
	Name: function_7b605b7b
	Namespace: electroball_grenade
	Checksum: 0x49189282
	Offset: 0x600
	Size: 0x134
	Parameters: 7
	Flags: Linked
*/
function function_7b605b7b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.a_electroball_grenades))
	{
		level.a_electroball_grenades = [];
	}
	array::add(level.a_electroball_grenades, self);
	self callback::on_shutdown(&function_76787bb);
	if(isdefined(self.var_78b154ef))
	{
		stopfx(bwastimejump, self.var_78b154ef);
	}
	if(isdefined(self.var_87f9f380))
	{
		stopfx(bwastimejump, self.var_87f9f380);
	}
	if(isdefined(self.var_d026ca4e))
	{
		stopfx(bwastimejump, self.var_d026ca4e);
	}
	if(isdefined(self.var_de70e6e2))
	{
		stopfx(bwastimejump, self.var_de70e6e2);
	}
}

/*
	Name: function_76787bb
	Namespace: electroball_grenade
	Checksum: 0xA99A4431
	Offset: 0x740
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_76787bb(params)
{
	arrayremovevalue(level.a_electroball_grenades, undefined);
}

/*
	Name: electroball_play_landed_fx
	Namespace: electroball_grenade
	Checksum: 0xC8598C3E
	Offset: 0x778
	Size: 0xBE
	Parameters: 7
	Flags: Linked
*/
function electroball_play_landed_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.var_ac6e3a4d = util::playfxontag(bwastimejump, level._effect[#"hash_782d8b3c7cf0155a"], self, "tag_origin");
	dynent = createdynentandlaunch(bwastimejump, "p7_zm_ctl_115_grenade_broken", self.origin, self.angles, self.origin, (0, 0, 0));
}

