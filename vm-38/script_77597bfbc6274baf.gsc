#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_cc6c4729;

/*
	Name: function_da410efd
	Namespace: namespace_cc6c4729
	Checksum: 0xD68CB7BC
	Offset: 0x190
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_da410efd()
{
	level notify(-541595440);
}

#namespace namespace_8a08914c;

/*
	Name: init
	Namespace: namespace_8a08914c
	Checksum: 0x4DF19BD
	Offset: 0x1B0
	Size: 0x28C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "" + #"hash_76ffee0aa9eae3ce", 28000, 1, "int", &function_d4759f99, 0, 0);
	clientfield::register("world", "" + #"hash_45b04d88564a1cd", 28000, 1, "int", &function_e6332b8c, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_4fcb640ca703e121", 28000, 1, "int", &function_b6d451e2, 0, 0);
	clientfield::register("world", "" + #"hash_22d24ba0bcf94c3f", 28000, getminbitcountfornum(2), "int", &function_c8ff2bab, 0, 0);
	clientfield::register("world", "" + #"hash_2d4fdf69e826bcc4", 28000, getminbitcountfornum(2), "int", &function_761411a9, 0, 0);
	clientfield::register("actor", "" + #"zombie_soul", 28000, 1, "int", &function_bb5d646a, 0, 0);
	clientfield::register("world", "" + #"ww_crystalaxe_glow", 28000, 1, "int", &ww_crystalaxe_glow, 0, 0);
}

/*
	Name: function_d4759f99
	Namespace: namespace_8a08914c
	Checksum: 0xE5E38DE9
	Offset: 0x448
	Size: 0x196
	Parameters: 7
	Flags: Linked
*/
function function_d4759f99(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_b27c799f))
		{
			self.var_b27c799f = util::playfxontag(fieldname, #"hash_340e40e72cbf9f17", self, "tag_origin");
		}
		if(!isdefined(self.var_ad212c56))
		{
			self playsound(fieldname, #"hash_34d9289717b4d789");
			self.var_ad212c56 = self playloopsound(#"hash_9a217c27058e4f");
			self util::delay(1.9, "death", &playsound, fieldname, #"hash_39ff15d295d0e59a");
		}
	}
	else
	{
		if(isdefined(self.var_b27c799f))
		{
			stopfx(fieldname, self.var_b27c799f);
			self.var_b27c799f = undefined;
		}
		if(isdefined(self.var_ad212c56))
		{
			self stoploopsound(self.var_ad212c56);
			self.var_ad212c56 = undefined;
		}
	}
}

/*
	Name: function_e6332b8c
	Namespace: namespace_8a08914c
	Checksum: 0x315791F9
	Offset: 0x5E8
	Size: 0x346
	Parameters: 7
	Flags: Linked
*/
function function_e6332b8c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_fe4fabfe = struct::get("s_ww_crash_fx");
	var_a3e02171 = struct::get("s_ww_crash_smoke_fx");
	var_d43a3082 = struct::get("s_ww_crash_spark_fx_01");
	var_c20e0c2a = struct::get("s_ww_crash_spark_fx_02");
	if(bwastimejump)
	{
		playfx(fieldname, #"hash_1660826e7149ccd", var_fe4fabfe.origin, anglestoforward(var_fe4fabfe.angles), anglestoup(var_fe4fabfe.angles));
		playfx(fieldname, #"hash_47d914e30256ec55", var_d43a3082.origin, anglestoforward(var_d43a3082.angles), anglestoup(var_d43a3082.angles));
		playfx(fieldname, #"hash_1bf61912b7014c8c", var_c20e0c2a.origin, anglestoforward(var_c20e0c2a.angles), anglestoup(var_c20e0c2a.angles));
		playsound(fieldname, #"hash_7cc77efdafc8a796", var_fe4fabfe.origin);
		var_a3e02171.var_583cc3ae = playfx(fieldname, #"hash_12b11413e7a3a0bc", var_a3e02171.origin, anglestoforward(var_a3e02171.angles), anglestoup(var_a3e02171.angles));
		var_a3e02171.var_26e342ce = playfx(fieldname, #"hash_3b983e4005db1049", var_a3e02171.origin, anglestoforward(var_a3e02171.angles), anglestoup(var_a3e02171.angles));
		wait(4);
		if(isdefined(var_a3e02171.var_583cc3ae))
		{
			stopfx(fieldname, var_a3e02171.var_583cc3ae);
			var_a3e02171.var_583cc3ae = undefined;
		}
	}
	else if(isdefined(var_a3e02171.var_26e342ce))
	{
		stopfx(fieldname, var_a3e02171.var_26e342ce);
		var_a3e02171.var_26e342ce = undefined;
	}
}

/*
	Name: function_b6d451e2
	Namespace: namespace_8a08914c
	Checksum: 0xC7BA02DB
	Offset: 0x938
	Size: 0x17E
	Parameters: 7
	Flags: Linked
*/
function function_b6d451e2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		if(!isdefined(self.var_4b781374))
		{
			self.var_4b781374 = util::playfxontag(fieldname, #"hash_14ee953af2cefc4d", self, "tag_origin");
		}
		if(!isdefined(self.var_e7574d0a))
		{
			self playsound(fieldname, #"hash_2753c183cb8a16f2");
			self.var_e7574d0a = self playloopsound(#"hash_273bb783cb757413");
		}
	}
	else
	{
		if(isdefined(self.var_4b781374))
		{
			stopfx(fieldname, self.var_4b781374);
			self.var_4b781374 = undefined;
		}
		if(isdefined(self.var_e7574d0a))
		{
			self playsound(fieldname, #"hash_6f9bed2e6c8eab33");
			self stoploopsound(self.var_e7574d0a);
			self.var_e7574d0a = undefined;
		}
	}
}

/*
	Name: function_c8ff2bab
	Namespace: namespace_8a08914c
	Checksum: 0xF3321A38
	Offset: 0xAC0
	Size: 0x1CC
	Parameters: 7
	Flags: Linked
*/
function function_c8ff2bab(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		s_fx = struct::get("s_crash_location", "script_noteworthy");
		playfx(fieldname, #"hash_778b66c2a0ed984d", s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
		playsound(fieldname, #"hash_69796081163eb8b6", s_fx.origin + vectorscale((0, 0, 1), 25));
	}
	else if(bwasdemojump == 2)
	{
		s_fx = struct::get("ww_soul_charge");
		playfx(fieldname, #"hash_7270f564ba9f808a", s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
		playsound(fieldname, #"hash_69796081163eb8b6", s_fx.origin + vectorscale((0, 0, 1), 25));
	}
}

/*
	Name: function_761411a9
	Namespace: namespace_8a08914c
	Checksum: 0xC75008C
	Offset: 0xC98
	Size: 0x324
	Parameters: 7
	Flags: Linked
*/
function function_761411a9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	s_fx = struct::get("ww_pool_aether_glow");
	if(bwasdemojump == 1)
	{
		if(!isdefined(s_fx.fx_glow))
		{
			s_fx.fx_glow = playfx(fieldname, #"hash_7da6f3fc6d80eb91", s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
		}
		if(!isdefined(s_fx.var_64d7f29a))
		{
			s_fx.var_64d7f29a = 1;
			playsound(fieldname, #"hash_50189ee8aad50903", s_fx.origin);
			soundloopemitter(#"hash_1a22f6a6cf997055", s_fx.origin + vectorscale((0, 0, 1), 20));
		}
	}
	else
	{
		if(bwasdemojump == 2)
		{
			if(isdefined(s_fx.fx_glow))
			{
				stopfx(fieldname, s_fx.fx_glow);
			}
			s_fx.fx_glow = playfx(fieldname, #"hash_5150e1897ee75f5", s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
		}
		else
		{
			if(isdefined(s_fx.fx_glow))
			{
				stopfx(fieldname, s_fx.fx_glow);
				s_fx.fx_glow = undefined;
			}
			playfx(fieldname, #"hash_32912ae259d923be", s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
			if(isdefined(s_fx.var_64d7f29a))
			{
				s_fx.var_64d7f29a = undefined;
				playsound(fieldname, #"hash_63ac991cc8808fb1", s_fx.origin);
				soundstoploopemitter(#"hash_1a22f6a6cf997055", s_fx.origin + vectorscale((0, 0, 1), 20));
			}
		}
	}
}

/*
	Name: function_bb5d646a
	Namespace: namespace_8a08914c
	Checksum: 0xEF6CEEA5
	Offset: 0xFC8
	Size: 0x2B4
	Parameters: 7
	Flags: Linked
*/
function function_bb5d646a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	level endon(#"end_game");
	self util::waittill_dobj(bwasdemojump);
	if(!isdefined(self) || !isdefined(self.origin))
	{
		return;
	}
	e_fx = util::spawn_model(bwasdemojump, "tag_origin", self gettagorigin("J_Spine4"));
	playsound(bwasdemojump, #"hash_14182939d9e547b2", e_fx.origin);
	e_fx.var_94450cf4 = e_fx playloopsound(#"hash_20b1d2b1a7ca4646");
	var_29eb5284 = struct::get("ww_soul_charge");
	util::playfxontag(bwasdemojump, #"hash_61e3c7a179d7cdfb", e_fx, "tag_origin");
	e_fx moveto(e_fx.origin + vectorscale((0, 0, 1), 40), 0.8);
	wait(0.75);
	n_time = distance(e_fx.origin, var_29eb5284.origin) / 400;
	e_fx moveto(var_29eb5284.origin, n_time);
	e_fx waittill(#"movedone");
	util::playfxontag(bwasdemojump, #"hash_4d1d38d5da4d929b", e_fx, "tag_origin");
	e_fx stoploopsound(e_fx.var_94450cf4);
	playsound(bwasdemojump, #"hash_282ba4e04a5fa817", e_fx.origin);
	wait(0.3);
	e_fx delete();
}

/*
	Name: ww_crystalaxe_glow
	Namespace: namespace_8a08914c
	Checksum: 0x5A279271
	Offset: 0x1288
	Size: 0x1D2
	Parameters: 7
	Flags: Linked
*/
function ww_crystalaxe_glow(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	a_s_fx = struct::get_array("ww_crystalaxe_glow");
	if(bwasdemojump)
	{
		foreach(s_fx in a_s_fx)
		{
			s_fx.fx_glow = playfx(fieldname, #"hash_1d70ef314b48ea80", s_fx.origin, anglestoforward(s_fx.angles), anglestoup(s_fx.angles));
		}
	}
	else
	{
		foreach(s_fx in a_s_fx)
		{
			if(isdefined(s_fx.fx_glow))
			{
				stopfx(fieldname, s_fx.fx_glow);
				s_fx.fx_glow = undefined;
			}
		}
	}
}

