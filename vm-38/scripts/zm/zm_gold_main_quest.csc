#using script_1a6b18d8e5bf3274;
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\audio_shared.csc;

#namespace namespace_af171776;

/*
	Name: function_201f49dc
	Namespace: namespace_af171776
	Checksum: 0xBDDE656D
	Offset: 0x1D0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_201f49dc()
{
	level notify(266940590);
}

/*
	Name: init
	Namespace: namespace_af171776
	Checksum: 0x97BA3474
	Offset: 0x1F0
	Size: 0x62C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "" + #"hash_6f292901e2fcaeb3", 16000, 1, "int", &function_48f7c5e6, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_5eccf9a3ab802cf7", 16000, 1, "int", &function_568ae388, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_571f15e1b82b6e1e", 16000, 1, "int", &function_78d36eb1, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_13b42b800d7ddc38", 16000, 1, "counter", &function_e959dd37, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_4e18b4bbb52e74bb", 16000, 2, "int", &function_db002447, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_a3ff7de846a027f", 16000, 1, "counter", &function_3131e413, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_3ee70ebc06c36969", 16000, 1, "int", &function_e7b6b97f, 0, 0);
	clientfield::register("world", "" + #"hash_493518ca957daaea", 16000, 2, "int", &function_49331ac6, 0, 0);
	clientfield::register("actor", "" + #"hash_7dc2e40e04fdfbad", 16000, 1, "counter", &function_807a046, 0, 0);
	clientfield::register("toplayer", "" + #"hash_5120ca20225a7324", 16000, 1, "counter", &function_95631678, 0, 0);
	clientfield::register("world", "" + #"hash_2e532832d80e7afb", 16000, 1, "int", &function_db150da1, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_33a2a9faed4bf8d9", 16000, 1, "int", &function_9f3ff6fa, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_5db889fa88fbbe02", 16000, getminbitcountfornum(4), "int", &function_d3dcbd21, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_46bf4cc1eea0741a", 16000, 1, "int", &function_e56be134, 0, 0);
	clientfield::register("toplayer", "" + #"hash_d4826b65faa9efb", 16000, 1, "int", &function_996f5d0f, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_6ab08e0e1cffcd35", 16000, 1, "int", &function_b66e99f1, 0, 0);
	clientfield::register("world", "" + #"hash_6c7ee343dab35f07", 16000, 1, "int", &function_789ec6a8, 0, 0);
	if(!zm_utility::is_ee_enabled())
	{
		return;
	}
	audio::playloopat(#"hash_5486b66cc8fd5daf", (1185, -14801, 7544));
}

/*
	Name: function_48f7c5e6
	Namespace: namespace_af171776
	Checksum: 0x6EC4856A
	Offset: 0x828
	Size: 0x4CC
	Parameters: 7
	Flags: Linked
*/
function function_48f7c5e6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	var_eb1526b6 = getentarray(fieldname, "sub_satellite_fx_pos", "targetname");
	if(isdefined(self.var_358ffe83) && bwasdemojump == 0)
	{
		stopfx(fieldname, self.var_358ffe83);
		self.var_358ffe83 = undefined;
		if(isdefined(var_eb1526b6) && isarray(var_eb1526b6))
		{
			foreach(var_912570af in var_eb1526b6)
			{
				if(isdefined(var_912570af.fx))
				{
					stopfx(fieldname, var_912570af.fx);
					if(isdefined(var_912570af.tag_fx))
					{
						var_912570af.tag_fx delete();
					}
					var_912570af.fx = undefined;
				}
			}
		}
		soundstoplineemitter(#"hash_243e8130bf816d5a", (478, -15202, 7913), (-2140, -15285, 8125));
		soundstoplineemitter(#"hash_243e8130bf816d5a", (-1414, -12858, 7953), (-2629, -14667, 8124));
		soundstoploopemitter(#"hash_243e8030bf816ba7", (-2420, -15288, 8946));
	}
	if(bwasdemojump == 1)
	{
		self.var_358ffe83 = playfx(fieldname, #"hash_4b0034bfed0b13a0", self.origin, anglestoup(self.angles), anglestoforward(self.angles));
		foreach(var_912570af in var_eb1526b6)
		{
			var_912570af.tag_fx = var_912570af util::spawn_model(fieldname, "tag_origin", var_912570af.origin, var_912570af.angles);
			if(var_912570af.script_noteworthy === "a")
			{
				var_912570af.fx = util::playfxontag(fieldname, #"hash_4142f503f17f18c4", var_912570af.tag_fx, "tag_origin");
				continue;
			}
			if(var_912570af.script_noteworthy === "b")
			{
				var_912570af.fx = util::playfxontag(fieldname, #"hash_4142f803f17f1ddd", var_912570af.tag_fx, "tag_origin");
			}
		}
		soundlineemitter(#"hash_243e8130bf816d5a", (478, -15202, 7913), (-2140, -15285, 8125));
		soundlineemitter(#"hash_243e8130bf816d5a", (-1414, -12858, 7953), (-2629, -14667, 8124));
		soundloopemitter(#"hash_243e8030bf816ba7", (-2420, -15288, 8946));
		playsound(fieldname, #"hash_4df142dbfba464a5", (-2420, -15288, 8946));
	}
}

/*
	Name: function_568ae388
	Namespace: namespace_af171776
	Checksum: 0x9D39440A
	Offset: 0xD00
	Size: 0x122
	Parameters: 7
	Flags: Linked
*/
function function_568ae388(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(self.var_26744ea3) && bwasdemojump == 0)
	{
		stopfx(fieldname, self.var_26744ea3);
		self.var_26744ea3 = undefined;
	}
	if(isdefined(self.var_9c6901af) && bwasdemojump == 0)
	{
		self stoploopsound(self.var_9c6901af);
		self.var_9c6901af = undefined;
	}
	if(bwasdemojump == 1)
	{
		self.var_26744ea3 = util::playfxontag(fieldname, #"hash_2a9626fe3370478a", self, "tag_origin");
		self.var_9c6901af = self playloopsound(#"hash_119a5143df1f68a3");
	}
}

/*
	Name: function_e959dd37
	Namespace: namespace_af171776
	Checksum: 0x76FC4AF8
	Offset: 0xE30
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_e959dd37(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		self.var_c0bb3c24 = util::playfxontag(fieldname, #"hash_2d3f8010b76159ce", self, "tag_origin");
		playsound(fieldname, #"hash_70b219027e1ccc25", self.origin);
	}
}

/*
	Name: function_78d36eb1
	Namespace: namespace_af171776
	Checksum: 0x74B78690
	Offset: 0xEE0
	Size: 0x1F4
	Parameters: 7
	Flags: Linked
*/
function function_78d36eb1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	self notify(#"hash_3a4fef0fcbf96242");
	if(bwasdemojump == 1)
	{
		util::playfxontag(fieldname, #"wz/fx9_dirtybomb_radiation_zone", self, "tag_origin");
		util::playfxontag(fieldname, #"wz/fx9_dirtybomb_radiation_zone_spawn", self, "tag_origin");
		self setcompassicon("ui_icon_minimap_collapse_ring");
		self function_811196d1(0);
		self function_95bc465d(1);
		self function_5e00861(0, 1);
		self function_60212003(1);
		self function_a5edb367(#"death_ring");
		self.var_2c8e49d2 = util::spawn_model(fieldname, #"p8_big_cylinder", self.origin);
		self.var_2c8e49d2 playrenderoverridebundle(#"hash_75168376918f5ab7");
		self.var_2c8e49d2 linkto(self);
		self thread function_1fd7d1f6();
	}
	else
	{
		self function_811196d1(1);
	}
}

/*
	Name: function_1fd7d1f6
	Namespace: namespace_af171776
	Checksum: 0x9C312496
	Offset: 0x10E0
	Size: 0xCE
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1fd7d1f6()
{
	self endoncallback(&function_ea1d7a10, #"death", #"hash_3a4fef0fcbf96242");
	while(isdefined(self.scale))
	{
		if(isdefined(self.var_2c8e49d2))
		{
			self.var_2c8e49d2 function_78233d29(#"hash_75168376918f5ab7", "", "Scale", self.scale / 10);
		}
		self function_5e00861((self.scale * 15000) * 2, 1);
		waitframe(1);
	}
}

/*
	Name: function_ea1d7a10
	Namespace: namespace_af171776
	Checksum: 0xE3DD6E6
	Offset: 0x11B8
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ea1d7a10(str_notify)
{
	if(isdefined(self.var_2c8e49d2))
	{
		self.var_2c8e49d2 stoprenderoverridebundle(#"hash_75168376918f5ab7");
		self.var_2c8e49d2 delete();
	}
}

/*
	Name: function_db002447
	Namespace: namespace_af171776
	Checksum: 0x5EFE7F63
	Offset: 0x1220
	Size: 0x162
	Parameters: 7
	Flags: Linked
*/
function function_db002447(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		if(isdefined(self.light_fx))
		{
			stopfx(fieldname, self.light_fx);
			self.light_fx = undefined;
		}
		self.light_fx = util::playfxontag(fieldname, #"hash_633f2df6ae6816e0", self, "tag_light_green");
		playsound(fieldname, #"hash_20bed6eda7747275", self gettagorigin("tag_light_green"));
	}
	else if(bwasdemojump == 2)
	{
		if(isdefined(self.light_fx))
		{
			stopfx(fieldname, self.light_fx);
			self.light_fx = undefined;
		}
		self.light_fx = util::playfxontag(fieldname, #"hash_59733e6d889d820", self, "tag_light_brown");
	}
}

/*
	Name: function_3131e413
	Namespace: namespace_af171776
	Checksum: 0x814DFD9
	Offset: 0x1390
	Size: 0xF4
	Parameters: 7
	Flags: Linked
*/
function function_3131e413(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		self.fx = playfx(fieldname, #"zm_ai/fx9_mimic_prop_spawn_out", self.origin + vectorscale((0, 0, 1), 15), anglestoforward(self.angles), anglestoup(self.angles));
		playsound(fieldname, #"hash_41dc3cf755c57009", self.origin + vectorscale((0, 0, 1), 15));
	}
}

/*
	Name: function_49331ac6
	Namespace: namespace_af171776
	Checksum: 0xEAE93059
	Offset: 0x1490
	Size: 0x224
	Parameters: 7
	Flags: Linked, Private
*/
function private function_49331ac6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	fx_pos = struct::get("ac_pink_fog_pos", "targetname");
	if(bwasdemojump == 1)
	{
		if(isdefined(level.var_d7691d5b[fieldname]))
		{
			stopfx(fieldname, level.var_d7691d5b[fieldname]);
			level.var_d7691d5b[fieldname] = undefined;
		}
		level.var_7c32c8a2[fieldname] = playfx(fieldname, #"hash_104349ebfbff1850", fx_pos.origin, fx_pos.angles);
	}
	else
	{
		if(bwasdemojump == 2)
		{
			if(isdefined(level.var_7c32c8a2[fieldname]))
			{
				stopfx(fieldname, level.var_7c32c8a2[fieldname]);
				level.var_7c32c8a2[fieldname] = undefined;
			}
			level.var_d7691d5b[fieldname] = playfx(fieldname, #"hash_44eda83cbe4d8294", fx_pos.origin, fx_pos.angles);
		}
		else
		{
			if(isdefined(level.var_7c32c8a2[fieldname]))
			{
				stopfx(fieldname, level.var_7c32c8a2[fieldname]);
				level.var_7c32c8a2[fieldname] = undefined;
			}
			if(isdefined(level.var_d7691d5b[fieldname]))
			{
				stopfx(fieldname, level.var_d7691d5b[fieldname]);
				level.var_d7691d5b[fieldname] = undefined;
			}
		}
	}
}

/*
	Name: function_e7b6b97f
	Namespace: namespace_af171776
	Checksum: 0x7A72D1B8
	Offset: 0x16C0
	Size: 0x172
	Parameters: 7
	Flags: Linked
*/
function function_e7b6b97f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 0)
	{
		if(isdefined(self.var_f6517ec8))
		{
			stopfx(fieldname, self.var_f6517ec8);
			self.var_f6517ec8 = undefined;
		}
		if(isdefined(self.var_7aebf849))
		{
			self stoploopsound(self.var_7aebf849);
			self.var_7aebf849 = undefined;
		}
	}
	else if(bwasdemojump == 1)
	{
		self.var_f6517ec8 = playfx(fieldname, #"hash_f84006d38f5f724", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
		if(!isdefined(self.var_7aebf849))
		{
			self.var_7aebf849 = self playloopsound(#"hash_616630af61302134", undefined, vectorscale((0, 0, 1), 25));
		}
	}
}

/*
	Name: function_807a046
	Namespace: namespace_af171776
	Checksum: 0xA094689F
	Offset: 0x1840
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_807a046(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		util::playfxontag(fieldname, #"zm_ai/fx9_mimic_prop_spawn_out", self, "j_spinelower");
	}
}

/*
	Name: function_95631678
	Namespace: namespace_af171776
	Checksum: 0x810EC16B
	Offset: 0x18C0
	Size: 0xC4
	Parameters: 7
	Flags: Linked
*/
function function_95631678(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		playsound(fieldname, #"hash_7b48ab684f546cde", (0, 0, 0));
		earthquake(fieldname, 0.25, 4, self.origin, 10000);
		self playrumbleonentity(fieldname, #"hash_7a5e120ae2a2d457");
	}
}

/*
	Name: function_db150da1
	Namespace: namespace_af171776
	Checksum: 0x11B8F3AC
	Offset: 0x1990
	Size: 0x16A
	Parameters: 7
	Flags: Linked
*/
function function_db150da1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	var_3c563df1 = struct::get("projector_pos", "targetname");
	if(bwasdemojump == 0 && isdefined(var_3c563df1.var_85d0a40f))
	{
		function_c22a1ca2(#"hash_52628b1a34838199");
		stopfx(fieldname, var_3c563df1.var_85d0a40f);
		var_3c563df1.var_85d0a40f = undefined;
	}
	else if(bwasdemojump == 1)
	{
		function_3385d776(#"hash_52628b1a34838199");
		var_3c563df1.var_85d0a40f = playfx(fieldname, #"hash_52628b1a34838199", var_3c563df1.origin, anglestoforward(var_3c563df1.angles), anglestoup(var_3c563df1.angles));
	}
}

/*
	Name: function_9f3ff6fa
	Namespace: namespace_af171776
	Checksum: 0x309BC9F1
	Offset: 0x1B08
	Size: 0x10E
	Parameters: 7
	Flags: Linked
*/
function function_9f3ff6fa(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		var_78defe05 = self gettagorigin("tag_light");
		var_99387adc = (0, 90, 23);
		self.var_d743d165 = playfx(fieldname, #"hash_3099197b59290f24", var_78defe05, anglestoforward(var_99387adc), anglestoup(var_99387adc));
	}
	else if(isdefined(self.var_d743d165))
	{
		stopfx(fieldname, self.var_d743d165);
		self.var_d743d165 = undefined;
	}
}

/*
	Name: function_d3dcbd21
	Namespace: namespace_af171776
	Checksum: 0x6D760FD5
	Offset: 0x1C20
	Size: 0x22A
	Parameters: 7
	Flags: Linked
*/
function function_d3dcbd21(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	switch(bwasdemojump)
	{
		case 0:
		{
			if(isdefined(self.var_799cf4f))
			{
				stopfx(fieldname, self.var_799cf4f);
				self.var_799cf4f = undefined;
			}
			if(isdefined(self.var_614e859))
			{
				playsound(fieldname, #"hash_3d369627caa2ec0e", self.origin + vectorscale((0, 0, 1), 10));
				self stoploopsound(self.var_614e859);
				self.var_614e859 = undefined;
			}
			return;
		}
		case 1:
		{
			str_fx = #"hash_583109873d692b3d";
			break;
		}
		case 2:
		{
			str_fx = #"hash_3e89c687f8e00739";
			break;
		}
		case 3:
		{
			str_fx = #"hash_7178b6fbac52be02";
			break;
		}
		case 4:
		{
			str_fx = #"hash_bdf528c41738ef5";
			break;
		}
	}
	if(!isdefined(self.var_799cf4f))
	{
		self.var_799cf4f = util::playfxontag(fieldname, str_fx, self, "tag_origin");
	}
	if(!isdefined(self.var_614e859))
	{
		self.var_614e859 = self playloopsound(#"hash_53037a2c92d808ce", undefined, vectorscale((0, 0, 1), 10));
	}
}

/*
	Name: function_e56be134
	Namespace: namespace_af171776
	Checksum: 0xEAE3E5FD
	Offset: 0x1E58
	Size: 0xDC
	Parameters: 7
	Flags: Linked
*/
function function_e56be134(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		self playrenderoverridebundle(#"hash_33472031c8a872cd");
		self playsound(fieldname, #"hash_1bf3ee4eb2a58e82");
	}
	else
	{
		self stoprenderoverridebundle(#"hash_33472031c8a872cd");
		self playsound(fieldname, #"hash_3a07d2cfdb8bbda7");
	}
}

/*
	Name: function_996f5d0f
	Namespace: namespace_af171776
	Checksum: 0xD2816E47
	Offset: 0x1F40
	Size: 0x26E
	Parameters: 7
	Flags: Linked
*/
function function_996f5d0f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwasdemojump)
	{
		if(!isdefined(self.var_ca8b5a42))
		{
			self.var_ca8b5a42 = playtagfxset(fieldname, #"hash_3fecf62fe603c35e", self);
		}
		if(!isdefined(self.var_79abcb8a))
		{
			self.var_79abcb8a = playfxoncamera(fieldname, #"hash_4c2a73ebbc177abd");
		}
		if(!isdefined(self.var_38a54dff))
		{
			self playsound(fieldname, #"hash_2769cc33e55105ad");
			self.var_38a54dff = self playloopsound(#"hash_1bcf487baf93b873");
		}
	}
	else
	{
		if(isdefined(self.var_ca8b5a42))
		{
			foreach(n_fx in self.var_ca8b5a42)
			{
				stopfx(fieldname, n_fx);
			}
			self.var_ca8b5a42 = undefined;
		}
		if(isdefined(self.var_79abcb8a))
		{
			stopfx(fieldname, self.var_79abcb8a);
			self.var_79abcb8a = undefined;
		}
		if(isdefined(self.var_38a54dff))
		{
			self playsound(fieldname, #"hash_585da2b2a9d85b4");
			self stoploopsound(self.var_38a54dff);
			self.var_38a54dff = undefined;
		}
	}
}

/*
	Name: function_b66e99f1
	Namespace: namespace_af171776
	Checksum: 0x77A1B06C
	Offset: 0x21B8
	Size: 0x406
	Parameters: 7
	Flags: Linked
*/
function function_b66e99f1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	a_s_fx = struct::get_array(#"hash_70b3330384335c42");
	if(bwasdemojump)
	{
		if(!isdefined(self.var_63f32da))
		{
			self.var_63f32da = playfx(fieldname, #"hash_1a40f9087395c9d7", self.origin + vectorscale((0, 0, 1), 12));
		}
		if(!isdefined(self.var_5eec2cf6))
		{
			self.var_5eec2cf6 = playfx(fieldname, #"zm_ai/fx9_steiner_rad_bomb_circle_128", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
		}
		foreach(s_fx in a_s_fx)
		{
			if(!isdefined(s_fx.var_bdfdbc4d))
			{
				switch(s_fx.str_fx)
				{
					case "sm":
					{
						str_fx = #"zm_ai/fx9_steiner_rad_bomb_spot_sm_loop";
						break;
					}
					case "md":
					{
						str_fx = #"zm_ai/fx9_steiner_rad_bomb_spot_md_loop";
						break;
					}
					case "lg":
					{
						str_fx = #"zm_ai/fx9_steiner_rad_bomb_spot_lg_loop";
						break;
					}
				}
				s_fx.var_bdfdbc4d = playfx(fieldname, str_fx, s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
			}
		}
		if(!isdefined(self.var_636b7150))
		{
			self.var_636b7150 = self playloopsound(#"hash_619b977bec2f141b");
		}
	}
	else
	{
		if(isdefined(self.var_63f32da))
		{
			stopfx(fieldname, self.var_63f32da);
			self.var_63f32da = undefined;
		}
		if(isdefined(self.var_5eec2cf6))
		{
			stopfx(fieldname, self.var_5eec2cf6);
			self.var_5eec2cf6 = undefined;
		}
		foreach(s_fx in a_s_fx)
		{
			if(isdefined(s_fx.var_bdfdbc4d))
			{
				stopfx(fieldname, s_fx.var_bdfdbc4d);
				s_fx.var_bdfdbc4d = undefined;
			}
		}
		if(isdefined(self.var_636b7150))
		{
			self stoploopsound(self.var_636b7150);
			self.var_636b7150 = undefined;
		}
	}
}

/*
	Name: function_789ec6a8
	Namespace: namespace_af171776
	Checksum: 0xB6C6B5F7
	Offset: 0x25C8
	Size: 0x2E0
	Parameters: 7
	Flags: Linked
*/
function function_789ec6a8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	var_f1dac484 = struct::get_array("sfx_alarm_exterior", "targetname");
	var_553477e6 = struct::get_array("sfx_alarm_interior", "targetname");
	if(bwasdemojump)
	{
		foreach(struct in var_f1dac484)
		{
			soundloopemitter(#"hash_76fa33e1cfb612e0", struct.origin);
		}
		foreach(struct in var_553477e6)
		{
			soundloopemitter(#"hash_79477ec16ce75a", struct.origin);
		}
	}
	else
	{
		foreach(struct in var_f1dac484)
		{
			soundstoploopemitter(#"hash_76fa33e1cfb612e0", struct.origin);
		}
		foreach(struct in var_553477e6)
		{
			soundstoploopemitter(#"hash_79477ec16ce75a", struct.origin);
		}
	}
}

