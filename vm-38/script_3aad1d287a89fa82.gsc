#using scripts\zm_common\zm.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\struct.csc;
#using script_44c0e6a2f5660ef5;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_95c839d1;

/*
	Name: function_2b1f2eb3
	Namespace: namespace_95c839d1
	Checksum: 0x5371DAD3
	Offset: 0x320
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2b1f2eb3()
{
	level notify(-436290013);
}

/*
	Name: init
	Namespace: namespace_95c839d1
	Checksum: 0x28EAD5A0
	Offset: 0x340
	Size: 0x93C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("world", "" + #"hash_2d23097ea9cdf1ec", 28000, 1, "int", &function_99d4cf57, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_33b8059f5b3f18b1", 28000, 1, "int", &function_82b63a0e, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_d92501ab1efcdd", 28000, getminbitcountfornum(3), "int", &function_221e0766, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_2fc89133ccd7b0df", 28000, 1, "int", &function_45782681, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_399e2afd773621df", 28000, getminbitcountfornum(5), "int", &function_23cc7759, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_43c4039b38b89f56", 28000, 1, "int", &function_c4a40b25, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_4e6fb90b199f15be", 28000, 1, "int", &function_864952a1, 0, 0);
	clientfield::register("actor", "" + #"hash_30c23067d05386c1", 28000, 1, "int", &function_55e5e61, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_9ef13a567692f32", 28000, getminbitcountfornum(2), "int", &function_5a365a7e, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_25155d60768d46e4", 28000, 1, "int", &function_c2e88f3, 0, 0);
	clientfield::register("vehicle", "" + #"hash_469f6acd46f13b91", 28000, getminbitcountfornum(3), "int", &function_cd3073f5, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_1e031a294b1db7de", 28000, getminbitcountfornum(2), "int", &function_d8ef7c9f, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_4259da501d7deb09", 28000, getminbitcountfornum(2), "int", &function_c3f01a37, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_1c5cfe17e34e65aa", 28000, 1, "int", &function_a3a7b6, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_1875c2a7206c5167", 28000, 1, "int", &function_b4ab53c4, 0, 0);
	clientfield::register("toplayer", "" + #"hash_159dc2bca63111fc", 28000, 1, "int", &function_efa02c97, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_5c06c72dd28da75a", 28000, 1, "int", &function_7cf3c9dc, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_442272758f2bf947", 28000, 1, "int", &function_6a8fde9, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_5b501a097c44b478", 28000, 1, "int", &function_41d3f9ce, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_665a7e18e3f5f896", 28000, getminbitcountfornum(2), "int", &function_3d6afbe8, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_196f85a0e323cdeb", 28000, getminbitcountfornum(2), "int", &function_20193edf, 0, 0);
	clientfield::register("world", "" + #"hash_6c47531bdf01d52c", 28000, 1, "int", &function_7ebf8c0a, 0, 0);
	clientfield::register("world", "" + #"hash_78e149e0b7cb80e8", 28000, 1, "int", &function_381bdf6a, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_6cc7dece6cee40e1", 28000, 1, "int", &function_940af073, 0, 0);
	level.var_87a3c4d1 = zm_roots_health_bar::register();
	level.var_75a7d6 = struct::get(#"hash_5d6c93a20ed01a31");
	if(!zm_utility::is_ee_enabled())
	{
		return;
	}
	callback::on_vehicle_spawned(&function_b0e9f5e8);
}

/*
	Name: function_b0e9f5e8
	Namespace: namespace_95c839d1
	Checksum: 0x3ED60155
	Offset: 0xC88
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_b0e9f5e8(localclientnum)
{
	self endon(#"death");
	if(self.vehicletype === #"hash_46019d2c09858d9")
	{
		wait(1);
		self function_1f0c7136(0);
	}
}

/*
	Name: function_99d4cf57
	Namespace: namespace_95c839d1
	Checksum: 0x4C2F53DD
	Offset: 0xCE8
	Size: 0x14C
	Parameters: 7
	Flags: Linked
*/
function function_99d4cf57(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		forcestreamxmodel(#"hash_b7cea188cbd2e02");
		forcestreamxmodel(#"hash_49275da2ee5d6c3f");
		forcestreamxmodel(#"hash_65422453371a9a2b");
		forcestreamxmodel(#"hash_6e987ba675a815f9");
	}
	else
	{
		stopforcestreamingxmodel(#"hash_b7cea188cbd2e02");
		stopforcestreamingxmodel(#"hash_49275da2ee5d6c3f");
		stopforcestreamingxmodel(#"hash_65422453371a9a2b");
		stopforcestreamingxmodel(#"hash_6e987ba675a815f9");
	}
}

/*
	Name: function_82b63a0e
	Namespace: namespace_95c839d1
	Checksum: 0x2BF72DE0
	Offset: 0xE40
	Size: 0x3C4
	Parameters: 7
	Flags: Linked
*/
function function_82b63a0e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level.var_75a7d6.mdl_body = self;
	if(bwastimejump)
	{
		if(!isarray(self.var_59419da4))
		{
			if(!isdefined(self.var_59419da4))
			{
				self.var_59419da4 = [];
			}
			else if(!isarray(self.var_59419da4))
			{
				self.var_59419da4 = array(self.var_59419da4);
			}
			self.var_59419da4[self.var_59419da4.size] = util::playfxontag(fieldname, #"hash_2f7331a822240e7a", self, "j_neck2");
			if(!isdefined(self.var_59419da4))
			{
				self.var_59419da4 = [];
			}
			else if(!isarray(self.var_59419da4))
			{
				self.var_59419da4 = array(self.var_59419da4);
			}
			self.var_59419da4[self.var_59419da4.size] = util::playfxontag(fieldname, #"hash_2f3609a821f01c64", self, "j_neck2");
			if(!isdefined(self.var_59419da4))
			{
				self.var_59419da4 = [];
			}
			else if(!isarray(self.var_59419da4))
			{
				self.var_59419da4 = array(self.var_59419da4);
			}
			self.var_59419da4[self.var_59419da4.size] = util::playfxontag(fieldname, #"hash_23a33f8d8e73466d", self, "j_head");
			if(!isdefined(self.var_59419da4))
			{
				self.var_59419da4 = [];
			}
			else if(!isarray(self.var_59419da4))
			{
				self.var_59419da4 = array(self.var_59419da4);
			}
			self.var_59419da4[self.var_59419da4.size] = util::playfxontag(fieldname, #"hash_5340c6af5d451fad", self, "tag_origin");
		}
		soundloopemitter(#"hash_75e463968d66b62f", (8399, 1766, -387));
	}
	else
	{
		if(isarray(self.var_59419da4))
		{
			foreach(n_fx in self.var_59419da4)
			{
				stopfx(fieldname, n_fx);
			}
			self.var_59419da4 = undefined;
		}
		soundstoploopemitter(#"hash_75e463968d66b62f", (8399, 1766, -387));
	}
}

/*
	Name: function_221e0766
	Namespace: namespace_95c839d1
	Checksum: 0x94BF7C62
	Offset: 0x1210
	Size: 0x5FC
	Parameters: 7
	Flags: Linked
*/
function function_221e0766(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump <= 0)
	{
		if(isarray(self.var_40325ebf))
		{
			foreach(n_fx in self.var_40325ebf)
			{
				stopfx(fieldname, n_fx);
			}
			self.var_40325ebf = undefined;
		}
		if(isarray(self.var_3325226c))
		{
			foreach(n_fx in self.var_3325226c)
			{
				stopfx(fieldname, n_fx);
			}
			self.var_3325226c = undefined;
		}
	}
	else
	{
		if(bwastimejump <= 1)
		{
			if(!isarray(self.var_40325ebf))
			{
				if(!isdefined(self.var_40325ebf))
				{
					self.var_40325ebf = [];
				}
				else if(!isarray(self.var_40325ebf))
				{
					self.var_40325ebf = array(self.var_40325ebf);
				}
				self.var_40325ebf[self.var_40325ebf.size] = util::playfxontag(fieldname, #"hash_44ae2e8d7ea3bc31", self, "j_shouldercountertwist_le");
				if(!isdefined(self.var_40325ebf))
				{
					self.var_40325ebf = [];
				}
				else if(!isarray(self.var_40325ebf))
				{
					self.var_40325ebf = array(self.var_40325ebf);
				}
				self.var_40325ebf[self.var_40325ebf.size] = util::playfxontag(fieldname, #"hash_44ae2e8d7ea3bc31", self, "j_elbow_le");
			}
			if(!isarray(self.var_3325226c))
			{
				if(!isdefined(self.var_3325226c))
				{
					self.var_3325226c = [];
				}
				else if(!isarray(self.var_3325226c))
				{
					self.var_3325226c = array(self.var_3325226c);
				}
				self.var_3325226c[self.var_3325226c.size] = util::playfxontag(fieldname, #"hash_4464268d7e65761f", self, "j_shouldercountertwist_ri");
				if(!isdefined(self.var_3325226c))
				{
					self.var_3325226c = [];
				}
				else if(!isarray(self.var_3325226c))
				{
					self.var_3325226c = array(self.var_3325226c);
				}
				self.var_3325226c[self.var_3325226c.size] = util::playfxontag(fieldname, #"hash_4464268d7e65761f", self, "j_elbow_ri");
			}
		}
		else
		{
			if(bwastimejump <= 2)
			{
				if(isarray(self.var_40325ebf))
				{
					foreach(n_fx in self.var_40325ebf)
					{
						stopfx(fieldname, n_fx);
					}
					self.var_40325ebf = undefined;
				}
				soundloopemitter(#"hash_8e40dbec27a33fe", (7997, 1909, 197));
			}
			else
			{
				if(isarray(self.var_3325226c))
				{
					foreach(n_fx in self.var_3325226c)
					{
						stopfx(fieldname, n_fx);
					}
					self.var_3325226c = undefined;
				}
				soundloopemitter(#"hash_59bcffa6b4e44959", (8685, 1931, 193));
			}
		}
	}
}

/*
	Name: function_45782681
	Namespace: namespace_95c839d1
	Checksum: 0xFC502549
	Offset: 0x1818
	Size: 0x174
	Parameters: 7
	Flags: Linked
*/
function function_45782681(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		soundstoploopemitter(#"hash_8e40dbec27a33fe", (7997, 1909, 197));
		soundstoploopemitter(#"hash_59bcffa6b4e44959", (8685, 1931, 193));
		if(self.model === #"hash_b7cea188cbd2e02")
		{
			self playrenderoverridebundle(#"hash_715008a482133aa4");
		}
		else
		{
			self playrenderoverridebundle(#"hash_ab879c54384fbcf");
		}
	}
	else
	{
		if(self.model === #"hash_b7cea188cbd2e02")
		{
			self stoprenderoverridebundle(#"hash_715008a482133aa4");
		}
		else
		{
			self stoprenderoverridebundle(#"hash_ab879c54384fbcf");
		}
	}
}

/*
	Name: function_23cc7759
	Namespace: namespace_95c839d1
	Checksum: 0x2CB76DDF
	Offset: 0x1998
	Size: 0x8AA
	Parameters: 7
	Flags: Linked
*/
function function_23cc7759(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_d4015058 = self.model === #"hash_43a78e1e93887332" || self.model === #"hash_751ddafc83e9e429";
	if(var_d4015058)
	{
		if(bwastimejump <= 2 && isarray(self.var_f8161b9d))
		{
			foreach(var_4d5d0c75 in self.var_f8161b9d)
			{
				stopfx(fieldname, var_4d5d0c75);
			}
			self.var_f8161b9d = undefined;
		}
		if(isdefined(self.var_94569843))
		{
			stopfx(fieldname, self.var_94569843);
			self.var_94569843 = undefined;
		}
		if(bwastimejump <= 0)
		{
			if(isdefined(self.var_efc4ca7a))
			{
				self stoploopsound(self.var_efc4ca7a);
				self.var_efc4ca7a = undefined;
			}
			return;
		}
	}
	else if(bwastimejump <= 0)
	{
		if(isdefined(self.var_efc4ca7a))
		{
			self stoploopsound(self.var_efc4ca7a);
			self.var_efc4ca7a = undefined;
		}
		foreach(var_ee6bcd51 in [4:#"hash_74374f80d1d536d6", 3:#"hash_74375080d1d53889", 2:#"hash_74375180d1d53a3c", 1:#"hash_74375280d1d53bef", 0:#"hash_74375380d1d53da2"])
		{
			if(self function_d2503806(var_ee6bcd51))
			{
				self stoprenderoverridebundle(var_ee6bcd51);
			}
		}
		return;
	}
	var_95efebdf = #"hash_2086c56bf3fd0dbc";
	var_9d075e06 = #"hash_1c7d3c44e1f3f425";
	if(!var_d4015058 && !self function_d2503806(#"hash_74375380d1d53da2"))
	{
		self playrenderoverridebundle(#"hash_74375380d1d53da2");
	}
	if(bwastimejump >= 2)
	{
		var_95efebdf = #"hash_20dea26bf4474819";
		var_9d075e06 = #"hash_1c7d3944e1f3ef0c";
		if(!var_d4015058 && !self function_d2503806(#"hash_74375280d1d53bef"))
		{
			self playrenderoverridebundle(#"hash_74375280d1d53bef");
		}
		if(bwastimejump >= 3)
		{
			var_95efebdf = #"hash_20dbbf6bf4454389";
			var_65a206d2 = #"hash_39ed0f9d7fa3da83";
			var_9d075e06 = #"hash_1c7d3a44e1f3f0bf";
			if(!var_d4015058 && !self function_d2503806(#"hash_74375180d1d53a3c"))
			{
				self playrenderoverridebundle(#"hash_74375180d1d53a3c");
			}
			if(bwastimejump >= 4)
			{
				var_65a206d2 = #"hash_39ed109d7fa3dc36";
				var_9d075e06 = #"hash_1c7d3744e1f3eba6";
				if(!var_d4015058 && !self function_d2503806(#"hash_74375080d1d53889"))
				{
					self playrenderoverridebundle(#"hash_74375080d1d53889");
				}
				if(bwastimejump >= 5)
				{
					var_65a206d2 = #"hash_39ed119d7fa3dde9";
					if(!var_d4015058 && !self function_d2503806(#"hash_74374f80d1d536d6"))
					{
						self playrenderoverridebundle(#"hash_74374f80d1d536d6");
					}
				}
			}
		}
	}
	if(var_d4015058)
	{
		if(isdefined(self.var_efc4ca7a))
		{
			self stoploopsound(self.var_efc4ca7a);
		}
		if(!is_true(level.var_5ac1ae9c))
		{
			self.var_efc4ca7a = self playloopsound(var_9d075e06);
		}
		if(isdefined(var_95efebdf) && !isarray(self.var_f8161b9d))
		{
			if(!isdefined(self.var_f8161b9d))
			{
				self.var_f8161b9d = [];
			}
			else if(!isarray(self.var_f8161b9d))
			{
				self.var_f8161b9d = array(self.var_f8161b9d);
			}
			self.var_f8161b9d[self.var_f8161b9d.size] = util::playfxontag(fieldname, var_95efebdf, self, "tag_eye_fx");
			if(!isdefined(self.var_f8161b9d))
			{
				self.var_f8161b9d = [];
			}
			else if(!isarray(self.var_f8161b9d))
			{
				self.var_f8161b9d = array(self.var_f8161b9d);
			}
			self.var_f8161b9d[self.var_f8161b9d.size] = util::playfxontag(fieldname, var_95efebdf, self, "tag_eye_fx1");
			if(!isdefined(self.var_f8161b9d))
			{
				self.var_f8161b9d = [];
			}
			else if(!isarray(self.var_f8161b9d))
			{
				self.var_f8161b9d = array(self.var_f8161b9d);
			}
			self.var_f8161b9d[self.var_f8161b9d.size] = util::playfxontag(fieldname, var_95efebdf, self, "tag_eye_fx2");
			if(!isdefined(self.var_f8161b9d))
			{
				self.var_f8161b9d = [];
			}
			else if(!isarray(self.var_f8161b9d))
			{
				self.var_f8161b9d = array(self.var_f8161b9d);
			}
			self.var_f8161b9d[self.var_f8161b9d.size] = util::playfxontag(fieldname, var_95efebdf, self, "tag_eye_fx3");
		}
		if(isdefined(var_65a206d2) && !isdefined(self.var_94569843))
		{
			self.var_94569843 = util::playfxontag(fieldname, var_65a206d2, self, "tag_fx");
		}
	}
}

/*
	Name: function_c4a40b25
	Namespace: namespace_95c839d1
	Checksum: 0xCC61F780
	Offset: 0x2250
	Size: 0x17E
	Parameters: 7
	Flags: Linked
*/
function function_c4a40b25(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_228b046c))
		{
			self.var_228b046c = util::playfxontag(fieldname, #"hash_30f460c8cb7f0dfe", self, "tag_origin");
		}
		if(!isdefined(self.var_a347f004))
		{
			self playsound(fieldname, #"hash_192c9be670e61b02");
			self.var_a347f004 = self playloopsound(#"hash_270394a5de3d4e16");
		}
	}
	else
	{
		if(isdefined(self.var_228b046c))
		{
			stopfx(fieldname, self.var_228b046c);
			self.var_228b046c = undefined;
		}
		if(isdefined(self.var_a347f004))
		{
			self playsound(fieldname, #"hash_57b386d8cf79f627");
			self stoploopsound(self.var_a347f004);
			self.var_a347f004 = undefined;
		}
	}
}

/*
	Name: function_864952a1
	Namespace: namespace_95c839d1
	Checksum: 0xFC89EACD
	Offset: 0x23D8
	Size: 0x17E
	Parameters: 7
	Flags: Linked
*/
function function_864952a1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_cf2d69fa))
		{
			self.var_cf2d69fa = util::playfxontag(fieldname, #"hash_61e3c7a179d7cdfb", self, "tag_origin");
		}
		if(!isdefined(self.var_1fe1c04))
		{
			self playsound(fieldname, #"hash_380c713d04ca5ffc");
			self.var_1fe1c04 = self playloopsound(#"hash_2c9aea267802ab5c");
		}
	}
	else
	{
		if(isdefined(self.var_cf2d69fa))
		{
			stopfx(fieldname, self.var_cf2d69fa);
			self.var_cf2d69fa = undefined;
		}
		if(isdefined(self.var_1fe1c04))
		{
			self playsound(fieldname, #"hash_10dece5dc9da6845");
			self stoploopsound(self.var_1fe1c04);
			self.var_1fe1c04 = undefined;
		}
	}
}

/*
	Name: function_55e5e61
	Namespace: namespace_95c839d1
	Checksum: 0x9817C94D
	Offset: 0x2560
	Size: 0xE6
	Parameters: 7
	Flags: Linked
*/
function function_55e5e61(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_cf2d69fa) && self haspart(fieldname, "j_spine4"))
		{
			self.var_cf2d69fa = util::playfxontag(fieldname, #"hash_5a09c40118c2df6e", self, "j_spine4");
		}
	}
	else if(isdefined(self.var_cf2d69fa))
	{
		stopfx(fieldname, self.var_cf2d69fa);
		self.var_cf2d69fa = undefined;
	}
}

/*
	Name: function_5a365a7e
	Namespace: namespace_95c839d1
	Checksum: 0xFFD5AEAC
	Offset: 0x2650
	Size: 0x376
	Parameters: 7
	Flags: Linked
*/
function function_5a365a7e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		var_da6ca9ed = #"hash_1fc5f839dbf6fe03";
		var_a522d8e4 = #"hash_297425f93d56f4da";
		var_480d6377 = #"hash_3159753c0a4ffb6e";
		if(bwastimejump >= 2)
		{
			var_da6ca9ed = #"hash_5c3201d394572ef1";
			var_a522d8e4 = #"hash_32de721ed75da0cd";
			var_480d6377 = #"hash_448bead53253e313";
		}
		if(isdefined(self.var_89e0f17d))
		{
			stopfx(fieldname, self.var_89e0f17d);
			self.var_89e0f17d = undefined;
		}
		if(isdefined(self.var_f1c4246e))
		{
			self stoploopsound(self.var_f1c4246e);
			self.var_f1c4246e = undefined;
		}
		self.var_89e0f17d = util::playfxontag(fieldname, var_da6ca9ed, self, "tag_origin");
		self playsound(fieldname, var_a522d8e4);
		self.var_f1c4246e = self playloopsound(var_480d6377);
		if(!isdefined(self.var_8db53c6f))
		{
			self.var_8db53c6f = util::playfxontag(fieldname, #"hash_364fef1c8d3c69ab", self, "j_wrist_le");
		}
		if(!isdefined(self.var_aef19b67))
		{
			self.var_aef19b67 = util::playfxontag(fieldname, #"hash_422050480488f8e7", self, "j_wrist_ri");
		}
		if(!isdefined(self.var_ea38b423))
		{
			self.var_ea38b423 = util::playfxontag(fieldname, #"hash_42f7c23d5c16383", self, "j_eyeball_le");
		}
	}
	else
	{
		if(isdefined(self.var_89e0f17d))
		{
			stopfx(fieldname, self.var_89e0f17d);
			self.var_89e0f17d = undefined;
		}
		if(isdefined(self.var_8db53c6f))
		{
			stopfx(fieldname, self.var_8db53c6f);
			self.var_8db53c6f = undefined;
		}
		if(isdefined(self.var_aef19b67))
		{
			stopfx(fieldname, self.var_aef19b67);
			self.var_aef19b67 = undefined;
		}
		if(isdefined(self.var_ea38b423))
		{
			stopfx(fieldname, self.var_ea38b423);
			self.var_ea38b423 = undefined;
		}
		if(isdefined(self.var_f1c4246e))
		{
			self stoploopsound(self.var_f1c4246e);
			self.var_f1c4246e = undefined;
		}
	}
}

/*
	Name: function_c2e88f3
	Namespace: namespace_95c839d1
	Checksum: 0x650A07A4
	Offset: 0x29D0
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_c2e88f3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_74b9b03b = undefined;
	}
	else
	{
		self.var_74b9b03b = 1;
	}
	self zm::function_92f0c63(fieldname);
}

/*
	Name: function_cd3073f5
	Namespace: namespace_95c839d1
	Checksum: 0x8E6A29BB
	Offset: 0x2A50
	Size: 0x4D4
	Parameters: 7
	Flags: Linked
*/
function function_cd3073f5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump <= 0)
	{
		util::playfxontag(fieldname, #"hash_2d81c7ad95a9ccd7", self, "tag_muzzle_flash_le");
		util::playfxontag(fieldname, #"hash_2d81c7ad95a9ccd7", self, "tag_muzzle_flash_ri");
		level.var_75a7d6 notify(#"hash_39be4308f05abd9c");
		if(isdefined(self.var_d1c055ab))
		{
			self stoploopsound(self.var_d1c055ab);
			self.var_d1c055ab = undefined;
			self playsound(fieldname, #"hash_4f802261bc7a8805");
		}
		if(isarray(self.var_e5a9ba3))
		{
			foreach(var_8999a4bf in self.var_e5a9ba3)
			{
				if(isdefined(var_8999a4bf))
				{
					var_8999a4bf delete();
				}
			}
			self.var_e5a9ba3 = undefined;
		}
	}
	if(bwastimejump >= 1)
	{
		if(!isdefined(self.var_77fb6a30))
		{
			self.var_77fb6a30 = util::playfxontag(fieldname, #"hash_5b7f2fcb28b631d5", self, "tag_laser");
		}
		if(!self function_d2503806(#"hash_4837670e6a8aaa2c"))
		{
			self playrenderoverridebundle(#"hash_4837670e6a8aaa2c");
		}
	}
	else
	{
		if(isdefined(self.var_77fb6a30))
		{
			stopfx(fieldname, self.var_77fb6a30);
			self.var_77fb6a30 = undefined;
		}
		if(self function_d2503806(#"hash_4837670e6a8aaa2c"))
		{
			self stoprenderoverridebundle(#"hash_4837670e6a8aaa2c");
		}
	}
	if(bwastimejump == 2)
	{
		if(!isarray(self.var_3d894efb))
		{
			foreach(str_tag in [1:"tag_muzzle_flash_ri", 0:"tag_muzzle_flash_le"])
			{
				if(!isdefined(self.var_3d894efb))
				{
					self.var_3d894efb = [];
				}
				else if(!isarray(self.var_3d894efb))
				{
					self.var_3d894efb = array(self.var_3d894efb);
				}
				self.var_3d894efb[self.var_3d894efb.size] = util::playfxontag(fieldname, #"hash_11a2eda599372667", self, str_tag);
			}
		}
	}
	else if(isarray(self.var_3d894efb))
	{
		foreach(var_9ae7996c in self.var_3d894efb)
		{
			stopfx(fieldname, var_9ae7996c);
		}
		self.var_3d894efb = undefined;
	}
	if(bwastimejump >= 3)
	{
		level thread function_294b258e(fieldname, self);
	}
}

/*
	Name: function_294b258e
	Namespace: namespace_95c839d1
	Checksum: 0x7321BF5A
	Offset: 0x2F30
	Size: 0x34A
	Parameters: 2
	Flags: Linked
*/
function function_294b258e(localclientnum, vh_turret)
{
	if(!isdefined(vh_turret))
	{
		return;
	}
	level.var_75a7d6 notify(#"hash_39be4308f05abd9c");
	level.var_75a7d6 endon(#"hash_39be4308f05abd9c");
	vh_turret endon(#"death");
	foreach(str_tag in [1:"tag_muzzle_flash_ri", 0:"tag_muzzle_flash_le"])
	{
		var_969f45da = undefined;
		var_96ce3194 = undefined;
		for(i = 0; i < 2; i++)
		{
			var_8999a4bf = undefined;
			while(true)
			{
				v_angles = vh_turret gettagangles(str_tag);
				v_origin = vh_turret gettagorigin(str_tag);
				if(i > 0)
				{
					v_origin = v_origin + (anglestoforward(v_angles) * 2048);
				}
				var_8999a4bf = util::spawn_model(localclientnum, #"tag_origin", v_origin, v_angles);
				if(isdefined(var_8999a4bf))
				{
					break;
				}
				waitframe(1);
			}
			if(!isdefined(vh_turret.var_e5a9ba3))
			{
				vh_turret.var_e5a9ba3 = [];
			}
			else if(!isarray(vh_turret.var_e5a9ba3))
			{
				vh_turret.var_e5a9ba3 = array(vh_turret.var_e5a9ba3);
			}
			vh_turret.var_e5a9ba3[vh_turret.var_e5a9ba3.size] = var_8999a4bf;
			if(i <= 0)
			{
				var_969f45da = var_8999a4bf;
				var_969f45da linkto(vh_turret, str_tag);
				continue;
			}
			var_96ce3194 = var_8999a4bf;
			if(isdefined(var_969f45da))
			{
				var_96ce3194 linkto(var_969f45da, "tag_origin");
			}
		}
		level beam::launch(var_969f45da, "tag_origin", var_96ce3194, "tag_origin", "beam9_zm_laser_cannon_electrical", 1);
	}
	vh_turret playsound(localclientnum, #"hash_3aaa4313132aa95f");
	vh_turret.var_d1c055ab = vh_turret playloopsound(#"hash_71b2b4f6127ebf2b");
}

/*
	Name: function_d8ef7c9f
	Namespace: namespace_95c839d1
	Checksum: 0xFFE83F6F
	Offset: 0x3288
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_d8ef7c9f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	function_ec6e5c0f(self, fieldname, bwastimejump, #"hash_3384273e7ab9f004", #"hash_74a9fd9def4d3bce");
}

/*
	Name: function_c3f01a37
	Namespace: namespace_95c839d1
	Checksum: 0x64D8D48E
	Offset: 0x3308
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_c3f01a37(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	function_ec6e5c0f(self, fieldname, bwastimejump, #"hash_33fb861e329a415", #"hash_588a1fdd1d52be8");
}

/*
	Name: function_ec6e5c0f
	Namespace: namespace_95c839d1
	Checksum: 0xC8008C4F
	Offset: 0x3388
	Size: 0x16A
	Parameters: 5
	Flags: Linked
*/
function function_ec6e5c0f(var_ce34262e, localclientnum, newval, var_6613bb76, var_8fc86e2f)
{
	if(isdefined(var_ce34262e.var_1734c720))
	{
		stopfx(localclientnum, var_ce34262e.var_1734c720);
		var_ce34262e.var_1734c720 = undefined;
	}
	if(newval <= 0)
	{
		util::playfxontag(localclientnum, #"hash_6d871318982dbd15", var_ce34262e, "tag_origin");
		var_ce34262e playsound(localclientnum, #"hash_74835763c1be56ff");
	}
	else if(!isdefined(var_ce34262e.var_1734c720))
	{
		str_fx = var_6613bb76;
		if(newval >= 2)
		{
			str_fx = var_8fc86e2f;
			util::playfxontag(localclientnum, #"hash_6ebb188a3ac0122b", var_ce34262e, "tag_origin");
			var_ce34262e playsound(localclientnum, #"hash_19df6934105bd84");
		}
		var_ce34262e.var_1734c720 = util::playfxontag(localclientnum, str_fx, var_ce34262e, "tag_origin");
	}
}

/*
	Name: function_a3a7b6
	Namespace: namespace_95c839d1
	Checksum: 0xCDBA6185
	Offset: 0x3500
	Size: 0x17E
	Parameters: 7
	Flags: Linked
*/
function function_a3a7b6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_27d4f547))
		{
			self.var_27d4f547 = util::playfxontag(fieldname, #"hash_5c37291567e1f9de", self, "tag_origin");
		}
		if(!isdefined(self.var_b708bb77))
		{
			self playsound(fieldname, #"hash_1721ec78dd5f3ebb");
			self.var_b708bb77 = self playloopsound(#"hash_591d18b0548521ad");
		}
	}
	else
	{
		if(isdefined(self.var_27d4f547))
		{
			stopfx(fieldname, self.var_27d4f547);
			self.var_27d4f547 = undefined;
		}
		if(isdefined(self.var_b708bb77))
		{
			self playsound(fieldname, #"hash_2eecdd9fc12cb69e");
			self stoploopsound(self.var_b708bb77);
			self.var_b708bb77 = undefined;
		}
	}
}

/*
	Name: function_b4ab53c4
	Namespace: namespace_95c839d1
	Checksum: 0xEC744F9B
	Offset: 0x3688
	Size: 0x1A4
	Parameters: 7
	Flags: Linked
*/
function function_b4ab53c4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_565ef52d))
		{
			self.var_565ef52d = util::playfxontag(fieldname, #"hash_5c386b1cc87d7eae", self, "tag_origin");
		}
		self playrumblelooponentity(fieldname, #"hash_19c7208d55dcf3c6");
		if(!isdefined(self.var_1b11d1e))
		{
			self.var_1b11d1e = self playloopsound(#"hash_301902dfa6d13b54");
		}
		self playsound(fieldname, #"hash_16089b6c9b140600");
	}
	else
	{
		if(isdefined(self.var_565ef52d))
		{
			stopfx(fieldname, self.var_565ef52d);
			self.var_565ef52d = undefined;
		}
		if(isdefined(self.var_1b11d1e))
		{
			self stoploopsound(self.var_1b11d1e);
			self.var_1b11d1e = undefined;
		}
		self stoprumble(fieldname, #"hash_19c7208d55dcf3c6");
	}
}

/*
	Name: function_efa02c97
	Namespace: namespace_95c839d1
	Checksum: 0xB2E86B47
	Offset: 0x3838
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_efa02c97(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!function_148ccc79(fieldname, #"hash_1c4bae784c38419"))
		{
			function_a837926b(fieldname, #"hash_1c4bae784c38419");
		}
	}
	else if(function_148ccc79(fieldname, #"hash_1c4bae784c38419"))
	{
		function_24cd4cfb(fieldname, #"hash_1c4bae784c38419");
	}
}

/*
	Name: function_7cf3c9dc
	Namespace: namespace_95c839d1
	Checksum: 0x58DA727B
	Offset: 0x3910
	Size: 0x176
	Parameters: 7
	Flags: Linked
*/
function function_7cf3c9dc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_acdd1dfa))
		{
			self.var_acdd1dfa = util::playfxontag(fieldname, #"hash_74f24d25e1532c66", self, "tag_origin");
		}
		self playsound(fieldname, #"hash_e8f96e63bde897f");
		if(!isdefined(self.var_cc5c1b4e))
		{
			self.var_cc5c1b4e = self playloopsound(#"hash_209a647168427ce");
		}
	}
	else
	{
		if(isdefined(self.var_acdd1dfa))
		{
			stopfx(fieldname, self.var_acdd1dfa);
			self.var_acdd1dfa = undefined;
		}
		self playsound(fieldname, #"hash_2d413027e6e3b985");
		if(isdefined(self.var_cc5c1b4e))
		{
			self stoploopsound(self.var_cc5c1b4e);
			self.var_cc5c1b4e = undefined;
		}
	}
}

/*
	Name: function_6a8fde9
	Namespace: namespace_95c839d1
	Checksum: 0xBF1BD6B3
	Offset: 0x3A90
	Size: 0x1CE
	Parameters: 7
	Flags: Linked
*/
function function_6a8fde9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_b2aafb65))
		{
			playfx(fieldname, #"hash_380f0bd424656b20", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
			self.var_b2aafb65 = playfx(fieldname, #"hash_1b10bcd57cf5d1c3", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
			self playsound(fieldname, #"hash_6793481a4cd5a49a");
			self.var_c3df0b27 = self playloopsound(#"hash_7797e47cd5880d2e");
		}
	}
	else
	{
		if(isdefined(self.var_b2aafb65))
		{
			stopfx(fieldname, self.var_b2aafb65);
			self.var_b2aafb65 = undefined;
		}
		if(isdefined(self.var_c3df0b27))
		{
			self stoploopsound(self.var_c3df0b27);
			self.var_c3df0b27 = undefined;
		}
	}
}

/*
	Name: function_41d3f9ce
	Namespace: namespace_95c839d1
	Checksum: 0x7257A6F0
	Offset: 0x3C68
	Size: 0x1AC
	Parameters: 7
	Flags: Linked
*/
function function_41d3f9ce(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_31812c1e))
		{
			self.var_31812c1e = playfx(fieldname, #"hash_259a5fb9c51c82ef", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
		}
		if(!isdefined(self.var_19d7d303))
		{
			self playsound(fieldname, #"hash_3ad6d10ba9296d80");
			self.var_19d7d303 = self playloopsound(#"hash_77dd92330a93ab52");
		}
	}
	else
	{
		if(isdefined(self.var_31812c1e))
		{
			stopfx(fieldname, self.var_31812c1e);
			self.var_31812c1e = undefined;
		}
		if(isdefined(self.var_19d7d303))
		{
			self stoploopsound(self.var_19d7d303);
			self.var_19d7d303 = undefined;
			self playsound(fieldname, #"hash_3ef24e391c927084");
		}
	}
}

/*
	Name: function_3d6afbe8
	Namespace: namespace_95c839d1
	Checksum: 0x297E8E6C
	Offset: 0x3E20
	Size: 0x4A2
	Parameters: 7
	Flags: Linked
*/
function function_3d6afbe8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump <= 0)
	{
		level.var_75a7d6 notify(#"hash_308e76fae63e354c");
		if(isdefined(level.var_75a7d6.mdl_body))
		{
			foreach(str_tag in [1:"tag_eye_fx_ri", 0:"tag_eye_fx_le"])
			{
				level beam::kill(level.var_75a7d6.mdl_body, str_tag, self, "tag_origin", "beam9_zm_forsaken_eyes_electrical");
			}
		}
		if(isdefined(level.var_75a7d6.var_24a721a9))
		{
			stopfx(fieldname, level.var_75a7d6.var_24a721a9);
			level.var_75a7d6.var_24a721a9 = undefined;
		}
		if(isdefined(level.var_75a7d6.var_c37e5845))
		{
			stopfx(fieldname, level.var_75a7d6.var_c37e5845);
			level.var_75a7d6.var_c37e5845 = undefined;
		}
		if(isdefined(self.var_b0b9013f))
		{
			self stoploopsound(self.var_b0b9013f);
			self.var_b0b9013f = undefined;
			soundstoploopemitter("zmb_mq_boss_eyebeam_loop", level.var_75a7d6.mdl_body.origin + vectorscale((0, 0, 1), 200));
		}
		self stoprumble(fieldname, #"hash_4ae42716eaebc67e");
	}
	else
	{
		level.var_75a7d6 endon(#"hash_308e76fae63e354c");
		while(!isdefined(level.var_75a7d6.mdl_body))
		{
			waitframe(1);
		}
		var_c3d354b1 = "tag_eye_fx_le";
		if(bwastimejump >= 2)
		{
			var_c3d354b1 = "tag_eye_fx_ri";
		}
		if(isdefined(self))
		{
			if(bwastimejump <= 1)
			{
				level beam::launch(level.var_75a7d6.mdl_body, var_c3d354b1, self, "tag_origin", "beam9_zm_forsaken_eyes_electrical", 1);
				level.var_75a7d6.var_24a721a9 = util::playfxontag(fieldname, #"hash_2b283fc346517736", self, "tag_origin");
				self playrumblelooponentity(fieldname, #"hash_4ae42716eaebc67e");
				if(!isdefined(self.var_b0b9013f))
				{
					self.var_b0b9013f = self playloopsound(#"hash_288ef8a977bff14e");
					soundloopemitter("zmb_mq_boss_eyebeam_loop", level.var_75a7d6.mdl_body.origin + vectorscale((0, 0, 1), 200));
				}
			}
			else
			{
				level beam::launch(level.var_75a7d6.mdl_body, var_c3d354b1, self, "tag_origin", "beam9_zm_forsaken_eyes_electrical", 1);
				level.var_75a7d6.var_c37e5845 = util::playfxontag(fieldname, #"hash_2b283fc346517736", self, "tag_origin");
			}
		}
	}
}

/*
	Name: function_20193edf
	Namespace: namespace_95c839d1
	Checksum: 0x533E7CA
	Offset: 0x42D0
	Size: 0x302
	Parameters: 7
	Flags: Linked
*/
function function_20193edf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump <= 0)
	{
		if(isdefined(self.var_292dd2b3))
		{
			stopfx(fieldname, self.var_292dd2b3);
			self.var_292dd2b3 = undefined;
		}
		playfx(fieldname, #"maps/zm_tungsten/fx9_zm_dark_aether_crystals_exp", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
	}
	else
	{
		if(bwastimejump <= 1)
		{
			playfx(fieldname, #"hash_2373390097712815", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
			self.var_292dd2b3 = util::playfxontag(fieldname, #"hash_40c4fc518cef3c1d", self, "tag_origin");
			self playsound(fieldname, #"hash_99a6d7e8295562b");
			self playrumblelooponentity(fieldname, #"hash_6a557ef73676fea");
		}
		else
		{
			if(isdefined(self.var_292dd2b3))
			{
				stopfx(fieldname, self.var_292dd2b3);
				self.var_292dd2b3 = undefined;
			}
			self stoprumble(fieldname, #"hash_6a557ef73676fea");
			playfx(fieldname, #"hash_2452dd6eef500ad9", self.origin - vectorscale((0, 0, 1), 80), anglestoforward(vectorscale((1, 0, 0), 270)), anglestoup(vectorscale((1, 0, 0), 270)));
			self.var_292dd2b3 = playfx(fieldname, #"maps/zm_tungsten/fx9_zm_dark_crystals_ambient", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
		}
	}
}

/*
	Name: function_7ebf8c0a
	Namespace: namespace_95c839d1
	Checksum: 0x8EC5A2FA
	Offset: 0x45E0
	Size: 0x4DC
	Parameters: 7
	Flags: Linked
*/
function function_7ebf8c0a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	s_start = struct::get(#"hash_65273cab13b486d");
	var_c3f64d04 = struct::get_array(s_start.target);
	if(bwastimejump)
	{
		foreach(var_834347de in var_c3f64d04)
		{
			level thread function_d2fdf8e2(fieldname, s_start, var_834347de);
		}
		soundstoploopemitter(#"hash_8e40dbec27a33fe", (7997, 1909, 197));
		soundstoploopemitter(#"hash_59bcffa6b4e44959", (8685, 1931, 193));
	}
	else
	{
		if(isdefined(level.var_269acd85))
		{
			foreach(var_7b926b32 in level.var_269acd85)
			{
				soundstoplineemitter("zmb_mq_boss_endsequence_beam_lp", var_7b926b32[0], var_7b926b32[1]);
			}
		}
		if(isarray(s_start.var_3157d3f8))
		{
			foreach(var_3d539282 in s_start.var_3157d3f8)
			{
				beamkill(fieldname, var_3d539282);
			}
			s_start.var_3157d3f8 = undefined;
		}
		if(isdefined(s_start.var_8999a4bf))
		{
			s_start.var_8999a4bf delete();
		}
		foreach(var_834347de in var_c3f64d04)
		{
			s_start = var_834347de;
			while(isdefined(s_start.target))
			{
				s_end = struct::get(s_start.target);
				if(isdefined(s_start.var_9d15847d))
				{
					stopfx(fieldname, s_start.var_9d15847d);
					s_start.var_9d15847d = undefined;
				}
				if(isdefined(s_start.var_65dbe5b6))
				{
					beamkill(fieldname, s_start.var_65dbe5b6);
					s_start.var_65dbe5b6 = undefined;
				}
				if(isdefined(s_end.var_9d15847d))
				{
					stopfx(fieldname, s_end.var_9d15847d);
					s_end.var_9d15847d = undefined;
				}
				if(isdefined(s_end.var_65dbe5b6))
				{
					beamkill(fieldname, s_end.var_65dbe5b6);
					s_end.var_65dbe5b6 = undefined;
				}
				if(isdefined(s_start.var_8999a4bf))
				{
					s_start.var_8999a4bf delete();
				}
				if(isdefined(s_end.var_8999a4bf))
				{
					s_end.var_8999a4bf delete();
				}
				s_start = s_end;
			}
		}
	}
}

/*
	Name: function_d2fdf8e2
	Namespace: namespace_95c839d1
	Checksum: 0x68999EE5
	Offset: 0x4AC8
	Size: 0x4E6
	Parameters: 3
	Flags: Linked
*/
function function_d2fdf8e2(localclientnum, s_start, var_834347de)
{
	foreach(s_beam in [1:var_834347de, 0:s_start])
	{
		while(!isdefined(s_beam.var_8999a4bf))
		{
			s_beam.var_8999a4bf = util::spawn_model(localclientnum, #"tag_origin", s_beam.origin, s_beam.angles);
			if(isdefined(s_beam.var_8999a4bf))
			{
				break;
			}
			waitframe(1);
		}
		playrumbleonposition(localclientnum, #"hash_1f2e4536e90487f7", s_beam.origin);
	}
	var_f69c622b = beamlaunch(localclientnum, s_start.var_8999a4bf, "tag_origin", var_834347de.var_8999a4bf, "tag_origin", "beam9_zm_tungsten_pap_beam");
	if(!isdefined(s_start.var_3157d3f8))
	{
		s_start.var_3157d3f8 = [];
	}
	else if(!isarray(s_start.var_3157d3f8))
	{
		s_start.var_3157d3f8 = array(s_start.var_3157d3f8);
	}
	s_start.var_3157d3f8[s_start.var_3157d3f8.size] = var_f69c622b;
	level thread function_1b6ef5b3(localclientnum, s_start.var_8999a4bf.origin, var_834347de.var_8999a4bf.origin);
	var_834347de.var_9d15847d = playfx(localclientnum, #"hash_2f2a371f59e4de3b", var_834347de.origin, anglestoforward(var_834347de.angles), anglestoup(var_834347de.angles));
	wait(2);
	s_start = var_834347de;
	while(isdefined(s_start.target))
	{
		s_end = struct::get(s_start.target);
		foreach(s_beam in [1:s_end, 0:s_start])
		{
			while(!isdefined(s_beam.var_8999a4bf))
			{
				s_beam.var_8999a4bf = util::spawn_model(localclientnum, #"tag_origin", s_beam.origin, s_beam.angles);
				if(isdefined(s_beam.var_8999a4bf))
				{
					break;
				}
				waitframe(1);
			}
			if(!isdefined(s_beam.var_9d15847d))
			{
				s_beam.var_9d15847d = playfx(localclientnum, #"hash_2f2a371f59e4de3b", s_beam.origin, anglestoforward(s_beam.angles), anglestoup(s_beam.angles));
				playrumbleonposition(localclientnum, #"hash_1f2e4536e90487f7", s_beam.origin);
			}
		}
		if(!isdefined(s_start.var_65dbe5b6))
		{
			s_start.var_65dbe5b6 = beamlaunch(localclientnum, s_start.var_8999a4bf, "tag_origin", s_end.var_8999a4bf, "tag_origin", "beam9_zm_tungsten_pap_beam");
			level thread function_1b6ef5b3(localclientnum, s_start.var_8999a4bf.origin, s_end.var_8999a4bf.origin);
		}
		wait(2);
		s_start = s_end;
	}
}

/*
	Name: function_1b6ef5b3
	Namespace: namespace_95c839d1
	Checksum: 0x4DC70AA3
	Offset: 0x4FB8
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function function_1b6ef5b3(localclientnum, start_point, end_point)
{
	if(!isdefined(level.var_269acd85))
	{
		level.var_269acd85 = [];
	}
	array = level.var_269acd85;
	array[array.size] = [1:end_point, 0:start_point];
	var_41a0028b = array[array.size - 1];
	playsound(localclientnum, #"hash_48072d7004fcd081", var_41a0028b[0]);
	soundlineemitter("zmb_mq_boss_endsequence_beam_lp", var_41a0028b[0], var_41a0028b[1]);
}

/*
	Name: function_381bdf6a
	Namespace: namespace_95c839d1
	Checksum: 0xBB356B3F
	Offset: 0x50A0
	Size: 0x1DC
	Parameters: 7
	Flags: Linked
*/
function function_381bdf6a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_48c75d3e = struct::get(#"hash_4a3574ffa3470616");
	if(isstruct(var_48c75d3e))
	{
		if(bwastimejump)
		{
			if(!isdefined(var_48c75d3e.var_f356849d))
			{
				var_48c75d3e.var_f356849d = playfx(fieldname, #"sr/fx9_obj_holdout_env_signifier", var_48c75d3e.origin, anglestoforward(var_48c75d3e.angles), anglestoup(var_48c75d3e.angles));
			}
		}
		else if(isdefined(var_48c75d3e.var_f356849d))
		{
			stopfx(fieldname, var_48c75d3e.var_f356849d);
			var_48c75d3e.var_f356849d = undefined;
		}
	}
	if(bwastimejump)
	{
		playsound(fieldname, #"hash_2a56b00d8e86a0f4", (0, 0, 0));
		soundloopemitter("zmb_mq_boss_phase_player_lp", vectorscale((1, 1, 1), 7));
	}
	else
	{
		playsound(fieldname, #"hash_1ea3bc9a4a37d9a", (0, 0, 0));
		soundstoploopemitter("zmb_mq_boss_phase_player_lp", vectorscale((1, 1, 1), 7));
	}
}

/*
	Name: function_940af073
	Namespace: namespace_95c839d1
	Checksum: 0x41B1D574
	Offset: 0x5288
	Size: 0x2C2
	Parameters: 7
	Flags: Linked
*/
function function_940af073(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isarray(self.var_3283acff))
		{
			if(!isdefined(self.var_3283acff))
			{
				self.var_3283acff = [];
			}
			else if(!isarray(self.var_3283acff))
			{
				self.var_3283acff = array(self.var_3283acff);
			}
			self.var_3283acff[self.var_3283acff.size] = util::playfxontag(fieldname, #"hash_5a27bcd606f12d86", self, "j_spineupper_tentacle_root");
			if(!isdefined(self.var_3283acff))
			{
				self.var_3283acff = [];
			}
			else if(!isarray(self.var_3283acff))
			{
				self.var_3283acff = array(self.var_3283acff);
			}
			self.var_3283acff[self.var_3283acff.size] = util::playfxontag(fieldname, #"hash_16a0146ce7531da1", self, "j_head");
			if(!isdefined(self.var_3283acff))
			{
				self.var_3283acff = [];
			}
			else if(!isarray(self.var_3283acff))
			{
				self.var_3283acff = array(self.var_3283acff);
			}
			self.var_3283acff[self.var_3283acff.size] = util::playfxontag(fieldname, #"hash_ee0a1958c5aa57", self, "tag_origin");
		}
	}
	else if(isarray(self.var_3283acff))
	{
		foreach(n_fx in self.var_3283acff)
		{
			stopfx(fieldname, n_fx);
		}
		self.var_3283acff = undefined;
	}
}

