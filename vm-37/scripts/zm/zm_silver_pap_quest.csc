#using script_17a9d06bf819b2d3;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_9f845210;

/*
	Name: function_842831cf
	Namespace: namespace_9f845210
	Checksum: 0x344BF7A9
	Offset: 0x1F8
	Size: 0x554
	Parameters: 0
	Flags: Linked
*/
function function_842831cf()
{
	clientfield::register("world", "" + #"hash_27895772c4825a7a", 1, 1, "int", &function_619cd4e5, 0, 0);
	clientfield::register("allplayers", "" + #"hash_63af42145e260fb5", 1, 2, "int", &function_4fd00e1f, 0, 0);
	clientfield::register("toplayer", "" + #"hash_14ba797c22b75dda", 1, 1, "counter", &function_483f3ae0, 0, 0);
	if(getgametypesetting(#"hash_19d48a0d4490b0a2") !== 1)
	{
		return;
	}
	clientfield::register("world", "" + #"hash_5cf186464ce9cdd6", 1, 1, "counter", &function_33082eb4, 0, 0);
	clientfield::register("world", "" + #"hash_7b3ada6e5b1cf81e", 1, 1, "int", &function_167fc35, 0, 0);
	clientfield::register("world", "" + #"hash_53c6d001e2faecab", 1, 1, "counter", &function_c4603212, 0, 0);
	clientfield::register("world", "" + #"hash_266f6fe481bab1bc", 1, 1, "int", &function_4dff5056, 0, 0);
	clientfield::register("toplayer", "" + #"hash_1fa45e1c3652d753", 1, 1, "int", &function_6902ffa4, 0, 0);
	clientfield::register("toplayer", "" + #"hash_c34d1c4bd1aa84a", 1, 1, "counter", &function_b56e6c7e, 0, 0);
	clientfield::register("toplayer", "" + #"particle_accelerator_rumble", 1, 1, "counter", &particle_accelerator_rumble, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_7ec80a02e9bb051a", 1, 1, "int", &function_760c94c, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_5a293ad1c677dc7e", 1, 1, "int", &function_2424f2ac, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_7919b736a767a0f5", 1, 2, "int", &function_e5ffabef, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_54d221181b1a11f", 1, 2, "int", &function_840cc260, 0, 0);
	clientfield::register("world", "" + #"hash_51ed1d1064cfb0e", 1, 1, "int", &function_32b2a189, 0, 0);
}

/*
	Name: particle_accelerator_rumble
	Namespace: namespace_9f845210
	Checksum: 0xBBE32A2A
	Offset: 0x758
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function particle_accelerator_rumble(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self playrumbleonentity(fieldname, #"hash_44eeee909d5a03fd");
	}
}

/*
	Name: function_b56e6c7e
	Namespace: namespace_9f845210
	Checksum: 0x72E7A9B7
	Offset: 0x7D0
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function function_b56e6c7e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self playrumbleonentity(fieldname, #"hash_6f2efd46e3afdbda");
	}
}

/*
	Name: function_483f3ae0
	Namespace: namespace_9f845210
	Checksum: 0x283996AA
	Offset: 0x848
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function function_483f3ae0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self playrumbleonentity(fieldname, #"hash_26108e3d29c29f8a");
	}
}

/*
	Name: function_840cc260
	Namespace: namespace_9f845210
	Checksum: 0xE4A4A581
	Offset: 0x8C0
	Size: 0x134
	Parameters: 7
	Flags: Linked
*/
function function_840cc260(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		util::playfxontag(fieldname, #"hash_1342d11d976068f7", self, "tag_top");
		util::playfxontag(fieldname, #"hash_1342d11d976068f7", self, "tag_mid");
		util::playfxontag(fieldname, #"hash_1342d11d976068f7", self, "tag_btm");
	}
	else
	{
		if(bwastimejump == 2)
		{
			self.var_5bc43247 = util::playfxontag(fieldname, #"hash_1342d11d976068f7", self, "tag_machine_fx");
		}
		else if(isdefined(self.var_5bc43247))
		{
			stopfx(fieldname, self.var_5bc43247);
		}
	}
}

/*
	Name: function_6902ffa4
	Namespace: namespace_9f845210
	Checksum: 0xDBEEBA14
	Offset: 0xA00
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function function_6902ffa4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		earthquake(fieldname, 0.2, 2, self.origin, 100);
		self playrumbleonentity(fieldname, "damage_light");
	}
}

/*
	Name: function_e5ffabef
	Namespace: namespace_9f845210
	Checksum: 0x87ED6E54
	Offset: 0xAA0
	Size: 0xE2
	Parameters: 7
	Flags: Linked
*/
function function_e5ffabef(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.var_46658967))
	{
		stopfx(fieldname, self.var_46658967);
	}
	if(bwastimejump == 1)
	{
		self.var_46658967 = util::playfxontag(fieldname, #"hash_6583defa5c93e609", self, "tag_origin");
	}
	else if(bwastimejump == 2)
	{
		self.var_46658967 = util::playfxontag(fieldname, #"hash_65063e9505bafd58", self, "tag_origin");
	}
}

/*
	Name: function_167fc35
	Namespace: namespace_9f845210
	Checksum: 0xFE3839AF
	Offset: 0xB90
	Size: 0x10C
	Parameters: 7
	Flags: Linked
*/
function function_167fc35(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		forcestreamxmodel(#"p9_fxp_zm_teleport_tunnel");
		forcestreamxmodel(#"p9_fxp_zm_teleport_tunnel_edge");
		function_3385d776(#"zombie/fx9_aether_tear_portal_tunnel_1p");
	}
	else
	{
		stopforcestreamingxmodel(#"p9_fxp_zm_teleport_tunnel");
		stopforcestreamingxmodel(#"p9_fxp_zm_teleport_tunnel_edge");
		function_c22a1ca2(#"zombie/fx9_aether_tear_portal_tunnel_1p");
	}
}

/*
	Name: function_33082eb4
	Namespace: namespace_9f845210
	Checksum: 0x9CFB3EC
	Offset: 0xCA8
	Size: 0xC4
	Parameters: 7
	Flags: Linked
*/
function function_33082eb4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	e_player = function_5c10bd79(bwastimejump);
	if(isdefined(e_player))
	{
		e_player postfx::playpostfxbundle(#"hash_7fbc9bc489aea188");
		e_player playsound(bwastimejump, #"hash_56a9d9da20064c3f");
		function_5ea2c6e3("zm_silver_darkaether_leadin", 7);
	}
}

/*
	Name: function_4dff5056
	Namespace: namespace_9f845210
	Checksum: 0x59A32506
	Offset: 0xD78
	Size: 0x150
	Parameters: 7
	Flags: Linked
*/
function function_4dff5056(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	e_player = function_5c10bd79(fieldname);
	if(bwastimejump)
	{
		if(isdefined(e_player))
		{
			e_player postfx::playpostfxbundle(#"hash_7f1cd473dc07762");
		}
	}
	else if(isdefined(e_player))
	{
		e_player postfx::stoppostfxbundle(#"hash_7f1cd473dc07762");
	}
	foreach(player in getplayers(fieldname))
	{
		player thread function_b28348c(fieldname);
	}
}

/*
	Name: function_b28348c
	Namespace: namespace_9f845210
	Checksum: 0x99EE60E3
	Offset: 0xED0
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_b28348c(localclientnum)
{
	self endon(#"death");
	wait(3.5);
	if(self zm_utility::function_f8796df3(localclientnum))
	{
		playviewmodelfx(localclientnum, #"hash_255cc054085bf4c4", "tag_torso");
	}
	else
	{
		util::playfxontag(localclientnum, #"hash_2563ac540861f176", self, "j_spine4");
	}
}

/*
	Name: function_c4603212
	Namespace: namespace_9f845210
	Checksum: 0xEE23485B
	Offset: 0xF70
	Size: 0x84
	Parameters: 7
	Flags: Linked
*/
function function_c4603212(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	e_player = function_5c10bd79(bwastimejump);
	if(isdefined(e_player))
	{
		e_player postfx::playpostfxbundle(#"hash_5260e981ac8cbbe7");
	}
}

/*
	Name: function_4fd00e1f
	Namespace: namespace_9f845210
	Checksum: 0x50A5A625
	Offset: 0x1000
	Size: 0x334
	Parameters: 7
	Flags: Linked
*/
function function_4fd00e1f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(!isdefined(level.var_3630f9c0))
	{
		level.var_3630f9c0 = [];
	}
	n_entity = self getentitynumber();
	var_e534cbe9 = 0;
	if(isdefined(level.var_3630f9c0[n_entity]))
	{
		killfx(fieldname, level.var_3630f9c0[n_entity]);
		level.var_3630f9c0[n_entity] = undefined;
		var_e534cbe9 = 1;
	}
	if(bwastimejump > 0)
	{
		if(!var_e534cbe9)
		{
			self playsound(fieldname, #"hash_79a78504d4dbaf3f");
		}
		if(self zm_utility::function_f8796df3(fieldname))
		{
			if(bwastimejump == 1)
			{
				str_fx = #"hash_679d39e5fd4eae19";
			}
			else if(bwastimejump == 2)
			{
				str_fx = #"hash_462352157053fa4a";
			}
			if(viewmodelhastag(fieldname, "tag_flashlight"))
			{
				level.var_3630f9c0[n_entity] = playviewmodelfx(fieldname, str_fx, "tag_flashlight");
			}
			/#
				if(!isdefined(level.var_3630f9c0[n_entity]))
				{
					level.var_3630f9c0[n_entity] = playviewmodelfx(fieldname, str_fx, "");
				}
			#/
		}
		else
		{
			if(bwastimejump == 1)
			{
				str_fx = #"hash_153f56ac9d13a399";
			}
			else if(bwastimejump == 2)
			{
				str_fx = #"hash_64e79a7456f58dec";
			}
			level.var_3630f9c0[n_entity] = util::playfxontag(fieldname, str_fx, self, "tag_flashlight");
		}
		if(self == function_5c10bd79(fieldname))
		{
			util::function_8eb5d4b0(3500, 0);
		}
	}
	else
	{
		if(var_e534cbe9)
		{
			self playsound(fieldname, #"hash_13715035b161a0c3");
		}
		if(self == function_5c10bd79(fieldname))
		{
			util::function_8eb5d4b0(3500, 2.5);
		}
	}
}

/*
	Name: function_760c94c
	Namespace: namespace_9f845210
	Checksum: 0x6A40D22
	Offset: 0x1340
	Size: 0x15E
	Parameters: 7
	Flags: Linked
*/
function function_760c94c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.portal_fx = util::playfxontag(fieldname, #"hash_6b812867a0d2dde5", self, "tag_origin");
		if(!isdefined(self.var_abc21e11))
		{
			self playsound(fieldname, #"hash_4a04fd9edb696634");
			self.var_abc21e11 = self playloopsound(#"hash_61bfd6cc3f47194");
		}
	}
	else if(isdefined(self.var_abc21e11))
	{
		killfx(fieldname, self.portal_fx);
		self playsound(fieldname, #"hash_257a16d125ce57ed");
		self stoploopsound(self.var_abc21e11);
		self.var_abc21e11 = undefined;
	}
}

/*
	Name: function_2424f2ac
	Namespace: namespace_9f845210
	Checksum: 0xA08ED533
	Offset: 0x14A8
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_2424f2ac(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		util::playfxontag(fieldname, #"maps/zm_escape/fx8_pap_lightning_near", self, "tag_origin");
	}
}

/*
	Name: function_32b2a189
	Namespace: namespace_9f845210
	Checksum: 0xCDD0C11B
	Offset: 0x1528
	Size: 0x194
	Parameters: 7
	Flags: Linked
*/
function function_32b2a189(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		setsoundcontext("dark_aether", "active");
		function_ed62c9c2("zm_silver_darkaether_leadin", 1.5);
		function_5ea2c6e3("lpf_pacc_opening_lp", 1);
		function_5ea2c6e3("lpf_pacc_lp", 1);
		audio::playloopat("zmb_darkaether_bg_loop", (0, 0, 0));
	}
	else
	{
		setsoundcontext("dark_aether", "inactive");
		function_ed62c9c2("zm_silver_darkaether_leadin", 1.5);
		function_ed62c9c2("lpf_pacc_opening_lp", 1);
		function_ed62c9c2("lpf_pacc_lp", 1);
		audio::stoploopat("zmb_darkaether_bg_loop", (0, 0, 0));
	}
}

/*
	Name: function_619cd4e5
	Namespace: namespace_9f845210
	Checksum: 0x12CB243A
	Offset: 0x16C8
	Size: 0x1B0
	Parameters: 7
	Flags: Linked
*/
function function_619cd4e5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.var_73aae81b))
	{
		level.var_73aae81b = getdynentarray("dark_aehter_loot_crystal", 1);
	}
	if(bwastimejump == 1)
	{
		foreach(crystal in level.var_73aae81b)
		{
			function_e2a06860(fieldname, crystal, 2);
			function_75d53026(crystal);
		}
	}
	else
	{
		foreach(crystal in level.var_73aae81b)
		{
			function_e2a06860(fieldname, crystal, 0);
		}
	}
}

