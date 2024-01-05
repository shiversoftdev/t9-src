#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\animation_shared.csc;

#namespace namespace_af1ba366;

/*
	Name: function_bd011d8f
	Namespace: namespace_af1ba366
	Checksum: 0x257B0FCD
	Offset: 0x338
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bd011d8f()
{
	level notify(-1705312307);
}

/*
	Name: __init__system__
	Namespace: namespace_af1ba366
	Checksum: 0x97319921
	Offset: 0x358
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_779f30bffb82a50e", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_af1ba366
	Checksum: 0x6ABD0CF3
	Offset: 0x3A0
	Size: 0x55C
	Parameters: 0
	Flags: None
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	var_39539c05 = zm_utility::is_ee_enabled();
	var_95613111 = #"hash_50cc93a10c9d2175";
	var_a0ab1f0d = getgametypesetting(var_95613111);
	/#
		var_39539c05 = getdvarint(#"zm_ee_enabled", 0);
		var_a0ab1f0d = 1;
	#/
	if(!var_39539c05 || !var_a0ab1f0d)
	{
		return;
	}
	level.var_89331302 = findvolumedecalindexarray("mq4_choppercrash");
	level.var_45ee6e2d = findvolumedecalindexarray("end_of_level_corpses");
	level.var_95d07441 = findvolumedecalindexarray("end_of_level_exfil_outro_igc_props");
	clientfield::register("toplayer", "" + #"hash_5ef33fc92614c211", 1, 1, "int", &function_29a047dc, 0, 0);
	clientfield::register("toplayer", "" + #"hash_34af381c063f6611", 1, 1, "int", &function_1b52db57, 0, 0);
	clientfield::register("scriptmover", "" + #"ambient_fx", 1, 1, "int", &ambient_fx, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_705c1eb33e79522b", 1, 1, "int", &function_f33e1112, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_4bedc093642e28f6", 1, 1, "int", &function_1b83f2b2, 0, 0);
	clientfield::register("vehicle", "" + #"hash_7d17014634879c10", 1, 1, "counter", &function_eb56183c, 0, 0);
	clientfield::register("vehicle", "" + #"hash_1e59af4706036a79", 1, 1, "int", &function_858fe85a, 0, 0);
	clientfield::register("vehicle", "" + #"hash_3178e1dcaee33fd3", 1, 1, "int", &laser_fx, 0, 0);
	clientfield::register("world", "" + #"chopper_crash", 1, 1, "int", &function_3ec12c82, 0, 0);
	clientfield::register("world", "" + #"end_of_level_corpses", 1, 1, "int", &function_1c47acdc, 0, 0);
	clientfield::register("world", "" + #"end_of_level_exfil_outro_igc_props", 1, 1, "int", &function_e4145df1, 0, 0);
	clientfield::register("world", "" + #"hash_46265c2ce587e427", 1, 1, "int", &function_62b0987f, 0, 0);
	animation::add_notetrack_func("play_outro_music", &function_fdbfd57f);
}

/*
	Name: function_3ec12c82
	Namespace: namespace_af1ba366
	Checksum: 0xEA7C76A0
	Offset: 0x908
	Size: 0x16C
	Parameters: 7
	Flags: Private
*/
function private function_3ec12c82(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(level.var_89331302))
	{
		foreach(n_decal in level.var_89331302)
		{
			unhidevolumedecal(n_decal);
		}
	}
	level.var_89331302 = undefined;
	soundloopemitter(#"hash_dc1b05d057812db", (-20634, -21646, 214));
	soundloopemitter(#"hash_509f2110470d7d9d", (-20444, -21594, 164));
	soundloopemitter(#"hash_dc1b05d057812db", (-20363, -21453, 199));
}

/*
	Name: function_1c47acdc
	Namespace: namespace_af1ba366
	Checksum: 0xABAF3AE1
	Offset: 0xA80
	Size: 0xDA
	Parameters: 7
	Flags: Private
*/
function private function_1c47acdc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(level.var_45ee6e2d))
	{
		foreach(n_decal in level.var_45ee6e2d)
		{
			unhidevolumedecal(n_decal);
		}
	}
	level.var_45ee6e2d = undefined;
}

/*
	Name: function_62b0987f
	Namespace: namespace_af1ba366
	Checksum: 0x1FFCB75C
	Offset: 0xB68
	Size: 0x8C
	Parameters: 7
	Flags: Private
*/
function private function_62b0987f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		function_cdbcba12(fieldname, 2, 1);
	}
	else
	{
		function_cdbcba12(fieldname, 1, 1);
	}
}

/*
	Name: function_e4145df1
	Namespace: namespace_af1ba366
	Checksum: 0xEEDB09DA
	Offset: 0xC00
	Size: 0x158
	Parameters: 7
	Flags: Private
*/
function private function_e4145df1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(level.var_95d07441))
	{
		if(bwastimejump)
		{
			foreach(n_decal in level.var_95d07441)
			{
				unhidevolumedecal(n_decal);
			}
		}
		else
		{
			foreach(n_decal in level.var_95d07441)
			{
				hidevolumedecal(n_decal);
			}
		}
	}
}

/*
	Name: function_f33e1112
	Namespace: namespace_af1ba366
	Checksum: 0x5418D5DE
	Offset: 0xD60
	Size: 0x11C
	Parameters: 7
	Flags: Private
*/
function private function_f33e1112(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self))
	{
		return;
	}
	self util::waittill_dobj(fieldname);
	if(bwastimejump == 1)
	{
		if(self.model === #"hash_30876ea41ba82413")
		{
			self.n_fx_id = function_239993de(fieldname, #"hash_10e51613cc775f48", self, "tag_origin");
		}
		else
		{
			self.n_fx_id = function_239993de(fieldname, #"hash_709af4fd54580701", self, "tag_origin");
		}
	}
	else if(isdefined(self.n_fx_id))
	{
		stopfx(fieldname, self.n_fx_id);
	}
}

/*
	Name: function_29a047dc
	Namespace: namespace_af1ba366
	Checksum: 0xB6494FF
	Offset: 0xE88
	Size: 0x2D4
	Parameters: 7
	Flags: Private
*/
function private function_29a047dc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(function_65b9eb0f(fieldname))
		{
			return;
		}
		if(self isplayer())
		{
			self.var_726a59ef = playfxoncamera(fieldname, #"hash_7cf34b65b9bc9fd2", (0, 0, 0), (1, 0, 0), (0, 0, 1));
			self postfx::playpostfxbundle(#"hash_115e4463473180bc");
			self function_116b95e5(#"hash_115e4463473180bc", #"hash_77259d33b3998de9", 0.3);
			self function_116b95e5(#"hash_115e4463473180bc", #"hash_1a3ba6e8a0732aac", 0.8);
			if(!isdefined(self.var_e53a5eb7))
			{
				self playsound(fieldname, #"hash_111968343d12c070");
				self.var_e53a5eb7 = self playloopsound(#"hash_9bce8b212a307a0");
			}
		}
	}
	else
	{
		if(function_65b9eb0f(fieldname))
		{
			return;
		}
		if(self isplayer())
		{
			if(isdefined(self.var_726a59ef))
			{
				stopfx(fieldname, self.var_726a59ef);
				self.var_726a59ef = undefined;
			}
			if(isdefined(self.var_fbd5f7c8))
			{
				stopfx(fieldname, self.var_fbd5f7c8);
				self.var_fbd5f7c8 = undefined;
			}
			if(isdefined(self.var_e53a5eb7))
			{
				self playsound(fieldname, #"hash_7b6bb195d5d9d051");
				self stoploopsound(self.var_e53a5eb7);
				self.var_e53a5eb7 = undefined;
			}
			wait(0.25);
			self postfx::exitpostfxbundle(#"hash_115e4463473180bc");
		}
	}
}

/*
	Name: laser_fx
	Namespace: namespace_af1ba366
	Checksum: 0x73523F6B
	Offset: 0x1168
	Size: 0x204
	Parameters: 7
	Flags: Private
*/
function private laser_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		var_4c010185 = self gettagorigin("tag_fx_laser_fire");
		if(isdefined(var_4c010185) && isdefined(self))
		{
			self.var_d38834a4 = util::spawn_model(fieldname, "tag_origin", var_4c010185);
			self.var_895dc68e = util::spawn_model(fieldname, "tag_origin", var_4c010185 + (vectorscale((0, 0, -1), 24)));
		}
		if(isdefined(self.var_d38834a4) && isdefined(self.var_895dc68e))
		{
			level beam::launch(self.var_d38834a4, "tag_origin", self.var_895dc68e, "tag_origin", "beam9_sr_mq_phase_neutralizer_laser", 1);
			self.var_d38834a4 playloopsound(#"hash_54563f902f48ea32");
		}
	}
	else
	{
		if(isdefined(self.var_d38834a4) && isdefined(self.var_895dc68e))
		{
			level beam::kill(self.var_d38834a4, "tag_origin", self.var_895dc68e, "tag_origin", "beam9_sr_mq_phase_neutralizer_laser");
		}
		if(isdefined(self.var_d38834a4))
		{
			self.var_d38834a4 delete();
		}
		if(isdefined(self.var_895dc68e))
		{
			self.var_895dc68e delete();
		}
	}
}

/*
	Name: function_858fe85a
	Namespace: namespace_af1ba366
	Checksum: 0xF1E80184
	Offset: 0x1378
	Size: 0xD6
	Parameters: 7
	Flags: Private
*/
function private function_858fe85a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_b235555f = util::playfxontag(fieldname, "sr/fx9_mq_phase_neutralizer_shield", self, "tag_origin");
		self playsound(fieldname, #"hash_40591e2e978901f7");
	}
	else if(isdefined(self.var_b235555f))
	{
		stopfx(fieldname, self.var_b235555f);
		self.var_b235555f = undefined;
	}
}

/*
	Name: function_eb56183c
	Namespace: namespace_af1ba366
	Checksum: 0x1D25B0F5
	Offset: 0x1458
	Size: 0xDC
	Parameters: 7
	Flags: Private
*/
function private function_eb56183c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self setanim("p9_fxanim_sv_payload_atv_cage_open_anim");
	wait(getanimlength("p9_fxanim_sv_payload_atv_cage_open_anim") + 0.5);
	if(isalive(self))
	{
		self clearanim("p9_fxanim_sv_payload_atv_cage_open_anim", 0.2);
	}
	self setanim("p9_fxanim_sv_payload_atv_cage_close_anim");
}

/*
	Name: function_1b83f2b2
	Namespace: namespace_af1ba366
	Checksum: 0x9BDF3AF4
	Offset: 0x1540
	Size: 0xAE
	Parameters: 7
	Flags: Private
*/
function private function_1b83f2b2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_cce6a246 = util::playfxontag(fieldname, "sr/fx9_mq_aether_orb_follow_agitate", self, "tag_origin");
	}
	else if(isdefined(self.var_cce6a246))
	{
		stopfx(fieldname, self.var_cce6a246);
		self.var_cce6a246 = undefined;
	}
}

/*
	Name: ambient_fx
	Namespace: namespace_af1ba366
	Checksum: 0xE647E4F2
	Offset: 0x15F8
	Size: 0x3DE
	Parameters: 7
	Flags: Private
*/
function private ambient_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(self.model === #"p9_fxanim_zm_silver_jellyfish_large_xmodel")
		{
			self thread animation::play_siege("p9_fxanim_zm_silver_jellyfish_large_sanim", undefined, 1, 1);
			self.n_fx_id = util::playfxontag(fieldname, "sr/fx9_aether_jellyfish_self_large", self, "tag_origin");
			self.var_b3673abf = self playloopsound(#"hash_2d10d0d2c9e2258d");
			self thread function_816573ad(fieldname);
		}
		else
		{
			if(self.model === #"hash_46cb6387fd2006a7")
			{
				util::playfxontag(fieldname, "sr/fx9_boss_avo_amb_torso", self, "j_spine4");
				util::playfxontag(fieldname, "sr/fx9_boss_avo_amb_wrist_le", self, "j_wrist_le");
				util::playfxontag(fieldname, "sr/fx9_boss_avo_amb_wrist_ri", self, "j_wrist_ri");
			}
			else
			{
				self playrenderoverridebundle("rob_orda_dissolve_sr");
			}
		}
	}
	else
	{
		if(isdefined(self.n_fx_id))
		{
			stopfx(fieldname, self.n_fx_id);
			self.n_fx_id = undefined;
		}
		else if(self.model === #"hash_46cb6387fd2006a7")
		{
			self.var_51d78901 = playfx(fieldname, #"zm_ai/fx9_orda_spawn_portal_c", self.origin + vectorscale((0, 0, 1), 7000), anglestoforward(self.angles), anglestoup(self.angles + vectorscale((1, 0, 0), 90)));
			self.var_d63b9eb9 = playfx(fieldname, #"sr/fx9_orda_aether_portal_beam", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
			if(!isdefined(self.var_e1cd0eb7))
			{
				self.var_e1cd0eb7 = self.origin + vectorscale((0, 0, 1), 500);
				playsound(fieldname, #"hash_46461ba72b8ab7a2", self.var_e1cd0eb7);
			}
			wait(2.9);
			if(isdefined(self))
			{
				if(isdefined(self.var_51d78901))
				{
					stopfx(fieldname, self.var_51d78901);
				}
				if(isdefined(self.var_d63b9eb9))
				{
					stopfx(fieldname, self.var_d63b9eb9);
				}
			}
		}
		if(isdefined(self.var_b3673abf))
		{
			self stoploopsound(self.var_b3673abf);
			self.var_b3673abf = undefined;
			self notify(#"hash_313373f8db592395");
		}
	}
}

/*
	Name: function_816573ad
	Namespace: namespace_af1ba366
	Checksum: 0x147D17AE
	Offset: 0x19E0
	Size: 0x98
	Parameters: 1
	Flags: None
*/
function function_816573ad(localclientnum)
{
	self endon(#"death");
	self endon(#"hash_313373f8db592395");
	wait(randomfloatrange(0.75, 2));
	while(isdefined(self))
	{
		self playsound(localclientnum, #"hash_f84e55f053717f9");
		wait(randomintrange(3, 7));
	}
}

/*
	Name: function_fdbfd57f
	Namespace: namespace_af1ba366
	Checksum: 0x26247793
	Offset: 0x1A80
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_fdbfd57f(params)
{
	soundsetmusicstate("bad_jellyfish");
}

/*
	Name: function_1b52db57
	Namespace: namespace_af1ba366
	Checksum: 0xA60832BA
	Offset: 0x1AB0
	Size: 0xB4
	Parameters: 7
	Flags: None
*/
function function_1b52db57(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self setenemyglobalscrambler(1);
	}
	else if(!is_true(getgametypesetting(#"hash_1e8998fd7f271bb7")))
	{
		self setenemyglobalscrambler(0);
	}
}

