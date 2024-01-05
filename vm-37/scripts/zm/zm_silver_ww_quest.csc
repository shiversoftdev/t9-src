#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\audio_shared.csc;

#namespace namespace_c8c67699;

/*
	Name: init
	Namespace: namespace_c8c67699
	Checksum: 0xFCC24B25
	Offset: 0x1D8
	Size: 0x62C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	if(!getdvarint(#"hash_83c887746f9dfd", 1))
	{
		return false;
	}
	clientfield::register("scriptmover", "" + #"hash_7159facf785aad53", 1, 1, "int", &function_7bceb311, 0, 0);
	clientfield::register("toplayer", "" + #"hash_864ef374ea11ea7", 1, 1, "int", &function_37ba0961, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_18f64f139f905f76", 1, 1, "int", &function_f875612b, 0, 0);
	clientfield::register("scriptmover", "crystal_energy_fx", 1, 1, "int", &crystal_energy_fx, 0, 0);
	clientfield::register("allplayers", "ww_vacuum_crystal_fx", 1, 1, "int", &ww_vacuum_crystal_fx, 0, 0);
	clientfield::register("allplayers", "hold_crystal_energy", 1, 1, "int", &hold_crystal_energy, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_21ba194bb9030d0c", 1, 1, "int", &function_f0bc5344, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_5e31ed9954a7a58a", 1, 2, "int", &function_29b9f19b, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_5020565243fa510a", 1, 1, "int", &function_c4793fe5, 0, 0);
	clientfield::register("toplayer", "" + #"hash_4119827af45a4ba7", 1, 1, "int", &function_48124b82, 0, 0);
	clientfield::register("toplayer", "" + #"interact_rumble", 1, 1, "int", &interact_rumble, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_6a198759db0810a6", 1, 1, "int", &function_1534626e, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_7862b1e62306df36", 1, 1, "int", &function_408232a7, 0, 0);
	clientfield::register("allplayers", "" + #"hash_196eef041ba86f9a", 1, 1, "counter", &function_1385b26c, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_5a932b901b9a5d0d", 1, 2, "int", &function_167bea22, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_20066374c799cb61", 1, 1, "int", &function_4c8d91b3, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_7aeee79e85f9273c", 1, 3, "int", &function_cadc50d8, 0, 0);
	clientfield::register("world", "" + #"hash_31ddead700f0e24c", 1, 1, "int", &function_c35975ed, 0, 0);
}

/*
	Name: function_cadc50d8
	Namespace: namespace_c8c67699
	Checksum: 0xDF09817C
	Offset: 0x810
	Size: 0x19A
	Parameters: 7
	Flags: Linked
*/
function function_cadc50d8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	switch(bwasdemojump)
	{
		case 0:
		{
			if(isdefined(self.light_fx))
			{
				stopfx(fieldname, self.light_fx);
			}
			break;
		}
		case 1:
		{
			self.light_fx = util::playfxontag(fieldname, #"hash_d208acedd2518ae", self, "tag_tank");
			break;
		}
		case 2:
		{
			self.light_fx = util::playfxontag(fieldname, #"hash_7a6a8f045e6c6b7e", self, "tag_tank");
			break;
		}
		case 3:
		{
			self.light_fx = util::playfxontag(fieldname, #"hash_1119b81f77cb3c61", self, "tag_tank");
			break;
		}
		case 4:
		{
			self.light_fx = util::playfxontag(fieldname, #"hash_6154a93403194405", self, "tag_tank");
			break;
		}
	}
}

/*
	Name: function_4c8d91b3
	Namespace: namespace_c8c67699
	Checksum: 0x660F5419
	Offset: 0x9B8
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function function_4c8d91b3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		self.fx = util::playfxontag(fieldname, #"hash_23ae7ac84a5dafab", self, "tag_container_fx");
	}
	else
	{
		if(isdefined(self.fx))
		{
			stopfx(fieldname, self.fx);
		}
		util::playfxontag(fieldname, #"hash_6068643b9cfb1958", self, "tag_container_fx");
	}
}

/*
	Name: function_167bea22
	Namespace: namespace_c8c67699
	Checksum: 0xEF1B3640
	Offset: 0xA98
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_167bea22(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1 || bwasdemojump == 2 || bwasdemojump == 3)
	{
		util::playfxontag(fieldname, #"hash_7e300a1fb308ae67", self, ("tag_electric_0" + bwasdemojump) + "_fx");
	}
}

/*
	Name: function_c4793fe5
	Namespace: namespace_c8c67699
	Checksum: 0x3EF7E201
	Offset: 0xB48
	Size: 0x9C
	Parameters: 7
	Flags: Linked
*/
function function_c4793fe5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		util::playfxontag(fieldname, #"hash_2ddd7e581a184f88", self, "tag_origin");
		self playrenderoverridebundle(#"hash_6116131e6c28b26e", "tag_chain_cryo");
	}
}

/*
	Name: function_408232a7
	Namespace: namespace_c8c67699
	Checksum: 0x7AC469D6
	Offset: 0xBF0
	Size: 0x16C
	Parameters: 7
	Flags: Linked
*/
function function_408232a7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		self.smoke_fx = playfx(fieldname, #"zm_ai/fx9_hound_plague_dth_aoe", self.origin + vectorscale((0, 0, 1), 20));
		playsound(fieldname, #"hash_11a2fa9d6a695f96", self.origin + vectorscale((0, 0, 1), 20));
		audio::playloopat(#"hash_155791cb3cba6094", self.origin + vectorscale((0, 0, 1), 20));
		wait(2);
		if(isdefined(self.smoke_fx))
		{
			stopfx(fieldname, self.smoke_fx);
		}
		if(isdefined(self))
		{
			audio::stoploopat(#"hash_155791cb3cba6094", self.origin + vectorscale((0, 0, 1), 20));
		}
	}
}

/*
	Name: function_1534626e
	Namespace: namespace_c8c67699
	Checksum: 0x114EC169
	Offset: 0xD68
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function function_1534626e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		level waittill(#"power_on");
		util::playfxontag(fieldname, #"hash_286b9aef04023710", self, "tag_light");
	}
}

/*
	Name: function_48124b82
	Namespace: namespace_c8c67699
	Checksum: 0x97937475
	Offset: 0xE00
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function function_48124b82(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		earthquake(fieldname, 0.2, 2, self.origin, 100);
		self playrumbleonentity(fieldname, "damage_heavy");
	}
}

/*
	Name: interact_rumble
	Namespace: namespace_c8c67699
	Checksum: 0x39280B16
	Offset: 0xEA0
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function interact_rumble(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self playrumbleonentity(fieldname, "damage_light");
	}
}

/*
	Name: function_f0bc5344
	Namespace: namespace_c8c67699
	Checksum: 0x8E295E9F
	Offset: 0xF18
	Size: 0x104
	Parameters: 7
	Flags: Linked
*/
function function_f0bc5344(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		self playrenderoverridebundle(#"hash_7930c9f965b0357b");
		self playsound(fieldname, #"hash_7b43e72a8c1d3334");
	}
	else
	{
		self playsound(fieldname, #"hash_2edd62f08d4adbd4");
		self stoprenderoverridebundle(#"hash_7930c9f965b0357b");
		self playrenderoverridebundle(#"hash_3dd7407a7104870e");
	}
}

/*
	Name: function_29b9f19b
	Namespace: namespace_c8c67699
	Checksum: 0xEBB2DEEA
	Offset: 0x1028
	Size: 0x20A
	Parameters: 7
	Flags: Linked
*/
function function_29b9f19b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(self.var_29b9f19b))
	{
		stopfx(fieldname, self.var_29b9f19b);
		self.var_29b9f19b = undefined;
	}
	if(isdefined(self.var_949340cf))
	{
		stopfx(fieldname, self.var_949340cf);
		self.var_949340cf = undefined;
	}
	if(isdefined(self.var_c8661564))
	{
		self stoploopsound(self.var_c8661564);
		self.var_c8661564 = undefined;
	}
	if(bwasdemojump == 1)
	{
		self.var_29b9f19b = util::playfxontag(fieldname, #"hash_8887a20dd955a51", self, "tag_fungus_fx");
		self.var_949340cf = util::playfxontag(fieldname, #"hash_40a742cacdfc9a36", self, "tag_origin");
		self.var_c8661564 = self playloopsound(#"hash_6dff86c60e6200a9");
	}
	else if(bwasdemojump == 2)
	{
		self.var_29b9f19b = util::playfxontag(fieldname, #"hash_8887720dd955538", self, "tag_fungus_fx");
		self.var_949340cf = util::playfxontag(fieldname, #"hash_40a742cacdfc9a36", self, "tag_origin");
		self.var_c8661564 = self playloopsound(#"hash_31f17a119e8993e6");
	}
}

/*
	Name: function_7bceb311
	Namespace: namespace_c8c67699
	Checksum: 0xBC0F77BD
	Offset: 0x1240
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_7bceb311(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		util::playfxontag(fieldname, #"hash_2a8007b7010b4734", self, "tag_origin");
	}
}

/*
	Name: function_c35975ed
	Namespace: namespace_c8c67699
	Checksum: 0x994530F4
	Offset: 0x12C0
	Size: 0x18C
	Parameters: 7
	Flags: Linked
*/
function function_c35975ed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		playsound(fieldname, #"hash_69a9c234107d76f3", (-85, -408, 79));
		soundlineemitter(#"hash_7d00ba230936febe", (-85, -408, 79), (72, -413, 77));
		soundloopemitter(#"hash_1543c9e1aff0cf87", (-155, -410, 81));
	}
	else
	{
		playsound(fieldname, #"hash_541da0125d0a1261", (-85, -408, 79));
		soundstoplineemitter(#"hash_7d00ba230936febe", (-85, -408, 79), (72, -413, 77));
		soundstoploopemitter(#"hash_1543c9e1aff0cf87", (-155, -410, 81));
	}
}

/*
	Name: function_37ba0961
	Namespace: namespace_c8c67699
	Checksum: 0xFB5EC877
	Offset: 0x1458
	Size: 0x8E
	Parameters: 7
	Flags: Linked
*/
function function_37ba0961(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	self endon(#"disconnect");
	if(bwasdemojump == 1)
	{
		self thread player_continuous_rumble(fieldname);
	}
	else
	{
		self notify(#"stop_rumble_and_shake");
	}
}

/*
	Name: player_continuous_rumble
	Namespace: namespace_c8c67699
	Checksum: 0x391B5022
	Offset: 0x14F0
	Size: 0xAE
	Parameters: 1
	Flags: Linked
*/
function player_continuous_rumble(localclientnum)
{
	self notify(#"stop_rumble_and_shake");
	self endon(#"disconnect", #"stop_rumble_and_shake");
	while(true)
	{
		if(isdefined(self))
		{
			earthquake(localclientnum, 0.2, 1, self.origin, 100);
			self playrumbleonentity(localclientnum, "damage_light");
		}
		waitframe(1);
	}
}

/*
	Name: function_f875612b
	Namespace: namespace_c8c67699
	Checksum: 0xC48E7374
	Offset: 0x15A8
	Size: 0x144
	Parameters: 7
	Flags: Linked
*/
function function_f875612b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		mdl_fx = util::spawn_model(fieldname, "tag_origin", self.origin);
		playsound(fieldname, #"hash_58583b7b5bcacbbc", (-85, -408, 79));
		wait(1);
		mdl_fx moveto(mdl_fx.origin + vectorscale((1, 0, 0), 270), 0.5);
		util::playfxontag(fieldname, #"hash_47d98c0644ec2ecd", mdl_fx, "tag_origin");
		mdl_fx waittill(#"movedone");
		if(isdefined(mdl_fx))
		{
			mdl_fx delete();
		}
	}
}

/*
	Name: crystal_energy_fx
	Namespace: namespace_c8c67699
	Checksum: 0x8458D95
	Offset: 0x16F8
	Size: 0x11E
	Parameters: 7
	Flags: Linked
*/
function crystal_energy_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		self.var_358ffe83 = playfx(fieldname, #"hash_498785d4883daa1", self.origin);
		if(!isdefined(self.var_a15fac69))
		{
			self.var_a15fac69 = self playloopsound(#"hash_30ea6b0883f216fd");
		}
	}
	else
	{
		if(isdefined(self.var_358ffe83))
		{
			stopfx(fieldname, self.var_358ffe83);
			self.var_358ffe83 = undefined;
		}
		if(isdefined(self.var_a15fac69))
		{
			self stoploopsound(self.var_a15fac69);
			self.var_a15fac69 = undefined;
		}
	}
}

/*
	Name: ww_vacuum_crystal_fx
	Namespace: namespace_c8c67699
	Checksum: 0x980AF095
	Offset: 0x1820
	Size: 0x278
	Parameters: 7
	Flags: Linked
*/
function ww_vacuum_crystal_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(!isdefined(level.var_37d7e267))
	{
		level.var_37d7e267 = [];
	}
	if(!isdefined(level.var_cca24823))
	{
		level.var_cca24823 = [];
	}
	n_entity = self getentitynumber();
	if(isdefined(level.var_37d7e267[n_entity]))
	{
		if(bwasdemojump == 0)
		{
			stopfx(fieldname, level.var_37d7e267[n_entity]);
		}
		else
		{
			killfx(fieldname, level.var_37d7e267[n_entity]);
		}
		level.var_37d7e267[n_entity] = undefined;
	}
	if(isdefined(level.var_cca24823[n_entity]))
	{
		self stoploopsound(level.var_cca24823[n_entity]);
		level.var_cca24823[n_entity] = undefined;
	}
	if(bwasdemojump)
	{
		if(self zm_utility::function_f8796df3(fieldname))
		{
			if(viewmodelhastag(fieldname, "tag_flash"))
			{
				level.var_37d7e267[n_entity] = playviewmodelfx(fieldname, #"zombie/fx_shdw_floating_smk_zod_zmb", "tag_flash");
				level.var_cca24823[n_entity] = self playloopsound(#"hash_4f03b4341d714c53");
			}
		}
		else
		{
			level.var_37d7e267[n_entity] = util::playfxontag(fieldname, #"zombie/fx_shdw_floating_smk_zod_zmb", self, "tag_flash");
			level.var_cca24823[n_entity] = self playloopsound(#"hash_4f03b4341d714c53", undefined, vectorscale((0, 0, 1), 50));
		}
	}
}

/*
	Name: hold_crystal_energy
	Namespace: namespace_c8c67699
	Checksum: 0xE9C2C9E4
	Offset: 0x1AA0
	Size: 0x10E
	Parameters: 7
	Flags: Linked
*/
function hold_crystal_energy(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(!isdefined(level.var_23b807cf))
	{
		level.var_23b807cf = [];
	}
	if(!isdefined(level.var_23b807cf[fieldname]))
	{
		level.var_23b807cf[fieldname] = [];
	}
	n_entity = self getentitynumber();
	function_564a4c6(fieldname, n_entity, bwasdemojump > 0);
	if(bwasdemojump)
	{
		self thread function_a6b2453b(fieldname, n_entity, self zm_utility::function_f8796df3(fieldname));
	}
	else
	{
		self notify(#"hash_5b93168ba86f708a");
	}
}

/*
	Name: function_2a66952f
	Namespace: namespace_c8c67699
	Checksum: 0xA0978389
	Offset: 0x1BB8
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_2a66952f(localclientnum, var_9b6b8f9a)
{
	self notify("716f43f3d85a34bd");
	self endon("716f43f3d85a34bd");
	self endon(#"hash_5b93168ba86f708a");
	self waittill(#"death");
	function_564a4c6(localclientnum, var_9b6b8f9a, 1);
}

/*
	Name: function_a6b2453b
	Namespace: namespace_c8c67699
	Checksum: 0x66C212F7
	Offset: 0x1C30
	Size: 0x27E
	Parameters: 3
	Flags: Linked
*/
function function_a6b2453b(localclientnum, var_9b6b8f9a, var_a4f83274)
{
	self notify("10060f28e0b094b1");
	self endon("10060f28e0b094b1");
	self endon(#"death", #"hash_5b93168ba86f708a");
	self thread function_2a66952f(localclientnum, var_9b6b8f9a);
	w_current = self function_d2c2b168();
	function_9dd39fc8(localclientnum, var_9b6b8f9a, var_a4f83274);
	while(isdefined(self))
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_change");
		w_current = waitresult.weapon;
		w_previous = waitresult.last_weapon;
		if(w_current.name == #"hash_3fa91d1674123e09" || w_current.name == #"hash_655d944e437c3d5b" || w_current.name == #"hash_72796957033e2e4a" || w_current.name == #"hash_6e0b27b854e591a3" || w_current.name == #"hash_5dd5741f21fd680d")
		{
			function_9dd39fc8(localclientnum, var_9b6b8f9a, var_a4f83274);
		}
		else if(w_previous.name == #"hash_3fa91d1674123e09" || w_previous.name == #"hash_655d944e437c3d5b" || w_previous.name == #"hash_72796957033e2e4a" || w_previous.name == #"hash_6e0b27b854e591a3" || w_previous.name == #"hash_5dd5741f21fd680d")
		{
			function_564a4c6(localclientnum, var_9b6b8f9a, 1);
		}
		waitframe(1);
	}
}

/*
	Name: function_9dd39fc8
	Namespace: namespace_c8c67699
	Checksum: 0x19F00787
	Offset: 0x1EB8
	Size: 0xAA
	Parameters: 3
	Flags: Linked, Private
*/
function private function_9dd39fc8(localclientnum, var_9b6b8f9a, var_a4f83274)
{
	if(isdefined(level.var_23b807cf[localclientnum][var_9b6b8f9a]))
	{
		return;
	}
	if(var_a4f83274)
	{
		level.var_23b807cf[localclientnum][var_9b6b8f9a] = playviewmodelfx(localclientnum, #"hash_75819450c7721a28", "tag_flash");
	}
	else
	{
		level.var_23b807cf[localclientnum][var_9b6b8f9a] = util::playfxontag(localclientnum, #"hash_7588a050c7784d3a", self, "tag_flash");
	}
}

/*
	Name: function_564a4c6
	Namespace: namespace_c8c67699
	Checksum: 0x2583FEEB
	Offset: 0x1F70
	Size: 0xA6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_564a4c6(localclientnum, var_9b6b8f9a, var_d4ece4fd)
{
	if(isdefined(level.var_23b807cf[localclientnum][var_9b6b8f9a]))
	{
		if(var_d4ece4fd)
		{
			killfx(localclientnum, level.var_23b807cf[localclientnum][var_9b6b8f9a]);
		}
		else
		{
			stopfx(localclientnum, level.var_23b807cf[localclientnum][var_9b6b8f9a]);
		}
		level.var_23b807cf[localclientnum][var_9b6b8f9a] = undefined;
	}
}

/*
	Name: function_1385b26c
	Namespace: namespace_c8c67699
	Checksum: 0xBBF76120
	Offset: 0x2020
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function function_1385b26c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	self playrumbleonentity(bwasdemojump, #"hash_6fed0a32376b64b2");
}

