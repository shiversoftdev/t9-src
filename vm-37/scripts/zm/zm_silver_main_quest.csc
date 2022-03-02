#using script_17a9d06bf819b2d3;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_d769652e;

/*
	Name: init
	Namespace: namespace_d769652e
	Checksum: 0x79044E07
	Offset: 0x4D8
	Size: 0x6D4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	namespace_5b1144e::function_5ae4a10c(#"p9_fxanim_zm_gp_crafting_variant_xmodel", "workbench", #"hash_d670b6f3d8c2841", undefined, undefined, 1);
	namespace_5b1144e::function_5ae4a10c(#"p9_rus_computer_02", "medbay_computer", undefined, #"hash_5b20033c44a4321f", undefined, 1);
	if(!zm_utility::function_e51dc2d8())
	{
		return;
	}
	clientfield::register("scriptmover", "" + #"hash_8358a32177aa60e", 1, 1, "int", &function_f03e2a9, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_654274a0648df21d", 1, 1, "int", &function_779a8e5b, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_6dc2bf4e960f0495", 1, 1, "int", &function_c3ed4d53, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_77df0b1fb17c3a18", 1, 1, "int", &function_c2ba61dd, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_17ea9211637fa6cf", 1, 1, "int", &function_bfce814a, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_2f17676fe2c8e396", 1, 1, "int", &function_f8d671e1, 0, 0);
	clientfield::register("toplayer", "" + #"hash_3f49ce049c9da7d", 1, 1, "int", &function_be9e97b1, 0, 0);
	clientfield::register("toplayer", "" + #"hash_404a977ff0098cf", 1, 1, "counter", &function_d23b3778, 0, 0);
	clientfield::register("toplayer", "" + #"hash_3cc984f9a32f1508", 1, 1, "int", &function_11e1fa9a, 0, 0);
	clientfield::register("toplayer", "" + #"hash_41658211f38c2b02", 1, 1, "int", &function_2929e754, 0, 0);
	clientfield::register("world", "" + #"hash_5c2cc65ae866b3f4", 1, 1, "int", &function_52eda57a, 0, 0);
	clientfield::register("world", "" + #"hash_48df238a087c684e", 1, 1, "int", &function_fdc7d35f, 0, 1);
	clientfield::register("world", "" + #"hash_17466a1bb2380af6", 1, getminbitcountfornum(4), "int", &function_fdd966d7, 0, 1);
	clientfield::register("world", "" + #"hash_6f13307bc53f2de5", 1, 1, "int", &function_6f615c6d, 0, 0);
	clientfield::register("world", "" + #"hash_570bb58b50e9db2e", 1, 1, "int", &function_20c688ff, 0, 1);
	clientfield::register("world", "" + #"hash_718b0f4fd6db0bb4", 1, 1, "int", &function_46350cca, 0, 1);
	clientfield::register("world", "" + #"hash_575a337754ccd980", 1, 1, "int", &function_85d502d3, 0, 0);
	clientfield::register("world", "" + #"hash_3fd05810b220d13a", 1, 1, "int", &function_7593da3, 0, 0);
}

/*
	Name: function_85d502d3
	Namespace: namespace_d769652e
	Checksum: 0x797DBF54
	Offset: 0xBB8
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function function_85d502d3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		function_5ea2c6e3("mq_8", 5, 1);
	}
	else
	{
		function_ed62c9c2("mq_8", 5);
	}
}

/*
	Name: function_7593da3
	Namespace: namespace_d769652e
	Checksum: 0x3323E56E
	Offset: 0xC50
	Size: 0x574
	Parameters: 7
	Flags: Linked
*/
function function_7593da3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	var_53b8bdd6 = array((-174, -714, -278), (533, 1017, -297), (984, -656, -138), (43, 633, 258), (171, 564, 111), (-673, 1368, -176), (-308, 1674, -165), (-161, 605, -133));
	var_a2e6f77c = array((1055, 307, -227), (-570, -60, -298), (-1054, -26, -260), (-1255, 725, -181), (-913, 1125, -176), (534, 1347, -303), (-1798, 1454, 72), (939, -604, -123));
	var_3d58039f = array((1613, -686, 137), (887, 193, 416), (240, -906, 263), (-673, -35, 384), (-1973, 863, 144), (-2274, -418, 253), (-234, 1127, 576), (1480, 2409, 647), (-913, 2280, 257), (-1295, 1741, 16));
	if(bwasdemojump === 1)
	{
		foreach(loc in var_53b8bdd6)
		{
			soundloopemitter("zmb_silver_mq_8_alarm_1_lp", loc);
		}
		foreach(loc in var_a2e6f77c)
		{
			soundloopemitter("zmb_silver_mq_8_alarm_2_lp", loc);
		}
		foreach(loc in var_3d58039f)
		{
			soundloopemitter("zmb_silver_mq_8_alarm_exit_lp", loc);
		}
		soundloopemitter("zmb_silver_mq_8_alarm_big_lp", (582, -103, -293));
	}
	else
	{
		audio::snd_set_snapshot("mute_milestone_guitar");
		foreach(loc in var_53b8bdd6)
		{
			soundstoploopemitter("zmb_silver_mq_8_alarm_1_lp", loc);
		}
		foreach(loc in var_a2e6f77c)
		{
			soundstoploopemitter("zmb_silver_mq_8_alarm_2_lp", loc);
		}
		foreach(loc in var_3d58039f)
		{
			soundstoploopemitter("zmb_silver_mq_8_alarm_exit_lp", loc);
		}
		soundstoploopemitter("zmb_silver_mq_8_alarm_big_lp", (582, -103, -293));
	}
}

/*
	Name: function_f8d671e1
	Namespace: namespace_d769652e
	Checksum: 0x6C4AA644
	Offset: 0x11D0
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function function_f8d671e1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		util::playfxontag(fieldname, #"hash_6472f03fb85c98a9", self, "tag_gold_container_top_fx");
		self playloopsound(#"hash_52564c7ae0120bdb");
	}
}

/*
	Name: function_11e1fa9a
	Namespace: namespace_d769652e
	Checksum: 0x86E57154
	Offset: 0x1270
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_11e1fa9a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		self playrumblelooponentity(fieldname, #"hash_3ee98a89cb99582b");
	}
	else
	{
		self stoprumble(fieldname, #"hash_3ee98a89cb99582b");
	}
}

/*
	Name: function_2929e754
	Namespace: namespace_d769652e
	Checksum: 0x3B8BA698
	Offset: 0x1320
	Size: 0x9C
	Parameters: 7
	Flags: Linked
*/
function function_2929e754(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		util::playfxontag(fieldname, #"hash_46c19b70a3135f71", self, "tag_origin");
		self playrumbleonentity(fieldname, #"hash_24058bbba58fef26");
	}
}

/*
	Name: function_f03e2a9
	Namespace: namespace_d769652e
	Checksum: 0x8564807C
	Offset: 0x13C8
	Size: 0x16E
	Parameters: 7
	Flags: Linked
*/
function function_f03e2a9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		self.var_ea21645e = util::playfxontag(fieldname, #"hash_4f7c197a3d994243", self, "tag_origin");
		if(!isdefined(self.var_be8fe07))
		{
			self playsound(fieldname, #"hash_65063fa76a794723");
			self.var_be8fe07 = self playloopsound(#"hash_59d1c21c4c117ddb");
		}
	}
	else
	{
		if(isdefined(self.var_ea21645e))
		{
			stopfx(fieldname, self.var_ea21645e);
		}
		if(isdefined(self.var_be8fe07))
		{
			self playsound(fieldname, #"hash_4038da4b57d71069");
			self stoploopsound(self.var_be8fe07);
			self.var_be8fe07 = undefined;
		}
	}
}

/*
	Name: function_779a8e5b
	Namespace: namespace_d769652e
	Checksum: 0x8B1DAFE6
	Offset: 0x1540
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_779a8e5b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		util::playfxontag(fieldname, #"hash_b7f3ee30d88e1bc", self, "tag_origin");
	}
}

/*
	Name: function_c2ba61dd
	Namespace: namespace_d769652e
	Checksum: 0xD0C6D7A5
	Offset: 0x15C0
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_c2ba61dd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		util::playfxontag(fieldname, #"hash_4ffcfc0737d9a65d", self, "tag_origin");
	}
}

/*
	Name: function_c3ed4d53
	Namespace: namespace_d769652e
	Checksum: 0x2D1B8EA5
	Offset: 0x1640
	Size: 0xAC
	Parameters: 7
	Flags: Linked
*/
function function_c3ed4d53(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		playfx(fieldname, #"hash_c4e9d4360d7d918", self gettagorigin("tag_origin"), anglestoforward(self.angles + vectorscale((0, 1, 0), 130)));
	}
}

/*
	Name: function_bfce814a
	Namespace: namespace_d769652e
	Checksum: 0x5421C5BA
	Offset: 0x16F8
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function function_bfce814a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		self.var_d46f026d = util::playfxontag(fieldname, #"hash_32ae54d4f1e8007e", self, "tag_origin");
	}
	else if(bwasdemojump == 0)
	{
		if(isdefined(self.var_d46f026d))
		{
			stopfx(fieldname, self.var_d46f026d);
		}
	}
}

/*
	Name: function_be9e97b1
	Namespace: namespace_d769652e
	Checksum: 0x75E83598
	Offset: 0x17B8
	Size: 0x9C
	Parameters: 7
	Flags: Linked
*/
function function_be9e97b1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self playrumblelooponentity(fieldname, #"hash_6334e3af01decded");
	}
	else
	{
		self stoprumble(fieldname, #"hash_6334e3af01decded");
	}
}

/*
	Name: function_d23b3778
	Namespace: namespace_d769652e
	Checksum: 0x5AE730A9
	Offset: 0x1860
	Size: 0x9C
	Parameters: 7
	Flags: Linked
*/
function function_d23b3778(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		earthquake(fieldname, 0.5, 4, self.origin, 10000);
		self playrumbleonentity(fieldname, #"hash_1b4cf825c3b2cc7f");
	}
}

/*
	Name: function_46350cca
	Namespace: namespace_d769652e
	Checksum: 0x4C5705F6
	Offset: 0x1908
	Size: 0x2E0
	Parameters: 7
	Flags: Linked
*/
function function_46350cca(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.var_536ac4bb))
	{
		level.var_536ac4bb = [];
	}
	else if(!isarray(level.var_536ac4bb))
	{
		level.var_536ac4bb = array(level.var_536ac4bb);
	}
	if(bwastimejump == 1)
	{
		var_4b5cb559 = struct::get_array("mq_br_dr_fx_loc", "targetname");
		foreach(loc in var_4b5cb559)
		{
			fx = playfx(fieldname, #"hash_3c35f2b980313a63", loc.origin + (vectorscale((0, 0, -1), 50)), anglestoforward(loc.angles));
			if(!isdefined(level.var_536ac4bb))
			{
				level.var_536ac4bb = [];
			}
			else if(!isarray(level.var_536ac4bb))
			{
				level.var_536ac4bb = array(level.var_536ac4bb);
			}
			level.var_536ac4bb[level.var_536ac4bb.size] = fx;
		}
	}
	else if(isdefined(level.var_536ac4bb.size > 0))
	{
		foreach(fx in level.var_536ac4bb)
		{
			if(isdefined(fx))
			{
				stopfx(fieldname, fx);
				arrayremovevalue(level.var_536ac4bb, fx);
			}
		}
	}
}

/*
	Name: function_20c688ff
	Namespace: namespace_d769652e
	Checksum: 0xD69F47DE
	Offset: 0x1BF0
	Size: 0x2C8
	Parameters: 7
	Flags: Linked
*/
function function_20c688ff(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.var_996d0044))
	{
		level.var_996d0044 = [];
	}
	else if(!isarray(level.var_996d0044))
	{
		level.var_996d0044 = array(level.var_996d0044);
	}
	if(bwastimejump == 1)
	{
		var_1bdb88f5 = struct::get_array("mq_cokrt_fal_loc", "targetname");
		foreach(loc in var_1bdb88f5)
		{
			fx = playfx(fieldname, #"hash_30ac0f1d77d41f3d", loc.origin);
			if(!isdefined(level.var_996d0044))
			{
				level.var_996d0044 = [];
			}
			else if(!isarray(level.var_996d0044))
			{
				level.var_996d0044 = array(level.var_996d0044);
			}
			level.var_996d0044[level.var_996d0044.size] = fx;
		}
		playsound(fieldname, #"hash_105825c91942325c", (0, 0, 0));
	}
	else
	{
		foreach(fx in level.var_996d0044)
		{
			if(isdefined(fx))
			{
				stopfx(fieldname, fx);
				arrayremovevalue(level.var_996d0044, fx);
			}
		}
	}
}

/*
	Name: function_52eda57a
	Namespace: namespace_d769652e
	Checksum: 0xEF154920
	Offset: 0x1EC0
	Size: 0x18C
	Parameters: 7
	Flags: Linked
*/
function function_52eda57a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		util::lock_model(#"hash_1d36b9bc18b6f8");
		util::lock_model(#"hash_110c841953691a8b");
		util::lock_model(#"hash_45f4868c92c218a3");
		util::lock_model(#"p9_foliage_tree_scots_pine_02_med_snow_melting");
		util::lock_model(#"hash_58b838fd0a3a99aa");
	}
	else
	{
		util::unlock_model(#"hash_1d36b9bc18b6f8");
		util::unlock_model(#"hash_110c841953691a8b");
		util::unlock_model(#"hash_45f4868c92c218a3");
		util::unlock_model(#"p9_foliage_tree_scots_pine_02_med_snow_melting");
		util::unlock_model(#"hash_58b838fd0a3a99aa");
	}
}

/*
	Name: function_fdc7d35f
	Namespace: namespace_d769652e
	Checksum: 0x2706A31D
	Offset: 0x2058
	Size: 0x2CC
	Parameters: 7
	Flags: Linked
*/
function function_fdc7d35f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		var_1ef29771 = struct::get("pa_bm_starting", "script_noteworthy");
		var_537617d7 = struct::get("pa_bm_ending_01", "script_noteworthy");
		var_44bcfa65 = struct::get("pa_bm_ending_02", "script_noteworthy");
		var_36d65e98 = struct::get("pa_bm_ending_03", "script_noteworthy");
		var_8d0aee0c = util::spawn_model(fieldname, "tag_origin", var_1ef29771.origin);
		var_6e7931d = util::spawn_model(fieldname, "tag_origin", var_537617d7.origin);
		var_37b574b8 = util::spawn_model(fieldname, "tag_origin", var_44bcfa65.origin);
		var_6a92da72 = util::spawn_model(fieldname, "tag_origin", var_36d65e98.origin);
		level beam::function_cfb2f62a(fieldname, var_8d0aee0c, "tag_origin", var_6e7931d, "tag_origin", "beam9_zm_ndu_particle_accelerator_overload_elec");
		level beam::function_cfb2f62a(fieldname, var_8d0aee0c, "tag_origin", var_37b574b8, "tag_origin", "beam9_zm_ndu_particle_accelerator_overload_elec");
		level beam::function_cfb2f62a(fieldname, var_8d0aee0c, "tag_origin", var_6a92da72, "tag_origin", "beam9_zm_ndu_particle_accelerator_overload_elec");
		soundloopemitter("zmb_silver_mq_9_elec_lp", var_8d0aee0c.origin);
		soundloopemitter("zmb_silver_mq_9_elec_lp", var_6e7931d.origin);
		soundloopemitter("zmb_silver_mq_9_elec_lp", var_37b574b8.origin);
		soundloopemitter("zmb_silver_mq_9_elec_lp", var_6a92da72.origin);
	}
}

/*
	Name: function_fdd966d7
	Namespace: namespace_d769652e
	Checksum: 0x6B3AC7A0
	Offset: 0x2330
	Size: 0xD5C
	Parameters: 7
	Flags: Linked
*/
function function_fdd966d7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1 || bwastimejump == 4)
	{
		var_afdac269 = struct::get("consl_spk_01_01", "script_noteworthy");
		var_e223a6fa = struct::get("consl_spk_01_02", "script_noteworthy");
		var_94410b36 = struct::get("consl_spk_01_03", "script_noteworthy");
		var_c67eefb1 = struct::get("consl_spk_01_04", "script_noteworthy");
		var_87a771fb = struct::get("consl_spk_01_05", "script_noteworthy");
		var_ae07a47b = struct::get("pa_tp_spk_01_01", "script_noteworthy");
		var_61270ab7 = struct::get("pa_tp_spk_01_02", "script_noteworthy");
		var_d27a6d60 = struct::get("pa_tp_spk_01_03", "script_noteworthy");
		var_8592d38e = struct::get("pa_tp_spk_01_04", "script_noteworthy");
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_afdac269.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_e223a6fa.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_94410b36.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_c67eefb1.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_87a771fb.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_afdac269.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_e223a6fa.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_94410b36.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_c67eefb1.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_87a771fb.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_ae07a47b.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_ae07a47b.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_61270ab7.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_61270ab7.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_d27a6d60.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_d27a6d60.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_8592d38e.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_8592d38e.origin);
	}
	if(bwastimejump == 2 || bwastimejump == 4)
	{
		var_b136e568 = struct::get("consl_spk_02_01", "script_noteworthy");
		var_cac6187e = struct::get("consl_spk_02_02", "script_noteworthy");
		var_dd15bd1d = struct::get("consl_spk_02_03", "script_noteworthy");
		var_9f6441bb = struct::get("consl_spk_02_04", "script_noteworthy");
		var_b190e614 = struct::get("consl_spk_02_05", "script_noteworthy");
		var_27881a78 = struct::get("pa_tp_spk_02_01", "script_noteworthy");
		var_4dc366ee = struct::get("pa_tp_spk_02_02", "script_noteworthy");
		var_b312b18b = struct::get("pa_tp_spk_02_03", "script_noteworthy");
		var_a7889a77 = struct::get("pa_tp_spk_02_04", "script_noteworthy");
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_b136e568.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_cac6187e.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_dd15bd1d.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_9f6441bb.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_b190e614.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_b136e568.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_cac6187e.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_dd15bd1d.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_9f6441bb.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_b190e614.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_27881a78.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_27881a78.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_4dc366ee.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_4dc366ee.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_b312b18b.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_b312b18b.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_a7889a77.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_a7889a77.origin);
	}
	if(bwastimejump == 3 || bwastimejump == 4)
	{
		var_f9f0101 = struct::get("consl_spk_03_01", "script_noteworthy");
		var_2596676 = struct::get("consl_spk_03_02", "script_noteworthy");
		var_f5134bea = struct::get("consl_spk_03_03", "script_noteworthy");
		var_e6beaf41 = struct::get("consl_spk_03_04", "script_noteworthy");
		var_d97594af = struct::get("consl_spk_03_05", "script_noteworthy");
		var_621fa37a = struct::get("pa_tp_spk_03_01", "script_noteworthy");
		var_53df06f9 = struct::get("pa_tp_spk_03_02", "script_noteworthy");
		var_4598ea6d = struct::get("pa_tp_spk_03_03", "script_noteworthy");
		var_374b4dd2 = struct::get("pa_tp_spk_03_04", "script_noteworthy");
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_f9f0101.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_2596676.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_f5134bea.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_e6beaf41.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_d97594af.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_f9f0101.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_2596676.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_f5134bea.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_e6beaf41.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_d97594af.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_621fa37a.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_621fa37a.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_53df06f9.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_53df06f9.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_4598ea6d.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_4598ea6d.origin);
		playfx(fieldname, #"hash_4ac46d77cd79c282", var_374b4dd2.origin);
		playfx(fieldname, #"hash_3084b23e2d611280", var_374b4dd2.origin);
	}
}

/*
	Name: function_6f615c6d
	Namespace: namespace_d769652e
	Checksum: 0x593BF2C5
	Offset: 0x3098
	Size: 0x104
	Parameters: 7
	Flags: Linked
*/
function function_6f615c6d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level thread function_9d39f661(fieldname);
	}
	else
	{
		level notify(#"hash_3bbf8d3383f43cdf");
		audio::stoploopat(#"hash_b2bcc3355f1b804", (-144, 2019, -170));
		playsound(fieldname, #"hash_3d7e471c91f5482c", (-144, 2019, -170));
		playsound(fieldname, #"hash_3d7e471c91f5482c", (565, 2137, -178));
	}
}

/*
	Name: function_9d39f661
	Namespace: namespace_d769652e
	Checksum: 0x917A0020
	Offset: 0x31A8
	Size: 0xAE
	Parameters: 1
	Flags: Linked
*/
function function_9d39f661(localclientnum)
{
	self notify("34e704ca2c3b358d");
	self endon("34e704ca2c3b358d");
	level endon(#"hash_3bbf8d3383f43cdf");
	audio::playloopat("zmb_silver_mq_6_alarm_2_lp", (-144, 2019, -170));
	wait(0.75);
	while(true)
	{
		playsound(localclientnum, #"hash_1a12eda2416ca0a", (565, 2137, -178));
		wait(2);
	}
}

