#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\animation_shared.csc;

#namespace namespace_4db53432;

/*
	Name: function_ca5d9e1d
	Namespace: namespace_4db53432
	Checksum: 0xD4F982A4
	Offset: 0x380
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ca5d9e1d()
{
	level notify(-1687770509);
}

/*
	Name: main
	Namespace: namespace_4db53432
	Checksum: 0x8FD5B20D
	Offset: 0x3A0
	Size: 0x3EC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("allplayers", "" + #"hash_63af42145e260fb5", 1, 2, "int", &function_4fd00e1f, 0, 0);
	clientfield::register("toplayer", "" + #"hash_bd79b6ca5ca6bc0", 1, 2, "int", &function_f002c513, 0, 0);
	clientfield::register("toplayer", "" + #"dark_aether", 1, 1, "int", &function_98c5cac0, 0, 0);
	clientfield::register("toplayer", "" + #"hash_69409daf95eb8ffe", 1, 1, "int", &function_bd4ba224, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_37895eb34ae6a3b0", 1, 1, "counter", &function_9609c8b9, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_2a3141c1214d6eaa", 1, 1, "counter", &function_6a4e64d1, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_6e591596c3da1af6", 1, 1, "int", &function_94fa6eb5, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_bd6060c10031f98", 1, 1, "int", &function_7999ed44, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_32fff3d828ff2e0b", 1, 1, "int", &function_bd2b40f5, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_442f708f2ae92ef6", 1, 1, "counter", &function_20a79dc5, 0, 0);
	clientfield::register("world", "" + #"hash_77ba2c603a746873", 1, 1, "int", &function_eac49163, 0, 0);
	util::waitforclient(0);
}

/*
	Name: function_94fa6eb5
	Namespace: namespace_4db53432
	Checksum: 0xBD39AD1B
	Offset: 0x798
	Size: 0x33C
	Parameters: 7
	Flags: Linked
*/
function function_94fa6eb5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_40433812 = playfx(fieldname, "sr/fx9_obj_orda_spawn_portal", self.origin + vectorscale((0, 0, 1), 7500), anglestoforward(self.angles), anglestoup(self.angles));
		self.var_3e3964d7 = playfx(fieldname, "sr/fx9_orda_aether_portal_beam", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
		if(!isdefined(self.var_d416b1e7))
		{
			playsound(fieldname, #"hash_70ed741814a290fd", self.origin + vectorscale((0, 0, 1), 3000));
			self.var_d416b1e7 = self playloopsound(#"hash_53739f99da95c943", undefined, vectorscale((0, 0, 1), 3000));
		}
		if(!isdefined(self.var_1f2ef20a))
		{
			self.var_1f2ef20a = self playloopsound(#"hash_48fab12b9bb60979", undefined, vectorscale((0, 0, 1), 500));
		}
	}
	else
	{
		if(isdefined(self.var_40433812))
		{
			stopfx(fieldname, self.var_40433812);
			self.var_40433812 = undefined;
		}
		if(isdefined(self.var_3e3964d7))
		{
			stopfx(fieldname, self.var_3e3964d7);
			self.var_3e3964d7 = undefined;
		}
		if(isdefined(self.var_d416b1e7))
		{
			playsound(fieldname, #"hash_1442f26e3f7ba2c4", self.origin + vectorscale((0, 0, 1), 3000));
			self stoploopsound(self.var_d416b1e7);
			self.var_d416b1e7 = undefined;
		}
		if(isdefined(self.var_1f2ef20a))
		{
			self stoploopsound(self.var_1f2ef20a);
			self.var_1f2ef20a = undefined;
		}
		self playrumbleonentity(fieldname, "sr_payload_portal_final_rumble");
		earthquake(fieldname, 0.25, 1, self.origin, 4000);
	}
}

/*
	Name: function_7999ed44
	Namespace: namespace_4db53432
	Checksum: 0x3718E2FC
	Offset: 0xAE0
	Size: 0x1C6
	Parameters: 7
	Flags: Linked
*/
function function_7999ed44(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_a5ded638 = playfx(fieldname, "zombie/fx9_aether_crystal_lg_obj_holdout", self.origin + vectorscale((0, 0, 1), 32), anglestoforward(self.angles), anglestoup(self.angles));
		self.var_1181af89 = playfx(fieldname, "sr/fx9_obj_holdout_env_signifier", self.origin + vectorscale((0, 0, 1), 32), anglestoforward(self.angles), anglestoup(self.angles));
	}
	else
	{
		if(isdefined(self.var_a5ded638))
		{
			killfx(fieldname, self.var_a5ded638);
			self.var_a5ded638 = undefined;
		}
		if(isdefined(self.var_1181af89))
		{
			killfx(fieldname, self.var_1181af89);
			self.var_1181af89 = undefined;
		}
		if(isdefined(self.var_fec2778b))
		{
			killfx(fieldname, self.var_fec2778b);
			self.var_fec2778b = undefined;
		}
	}
}

/*
	Name: function_98c5cac0
	Namespace: namespace_4db53432
	Checksum: 0x1E0A7D19
	Offset: 0xCB0
	Size: 0x126
	Parameters: 7
	Flags: Linked
*/
function function_98c5cac0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump == 1)
	{
		if(!function_65b9eb0f(fieldname))
		{
			self postfx::playpostfxbundle(#"hash_7f1cd473dc07762");
		}
		if(!isdefined(self.var_5bd4db29))
		{
			self.var_5bd4db29 = self playloopsound(#"hash_7244e9d74d7ada8a");
		}
	}
	else
	{
		if(function_65b9eb0f(fieldname))
		{
			return;
		}
		self postfx::stoppostfxbundle(#"hash_7f1cd473dc07762");
		if(isdefined(self.var_5bd4db29))
		{
			self stoploopsound(self.var_5bd4db29);
			self.var_5bd4db29 = undefined;
		}
	}
}

/*
	Name: function_f002c513
	Namespace: namespace_4db53432
	Checksum: 0xAE323180
	Offset: 0xDE0
	Size: 0x3D4
	Parameters: 7
	Flags: Linked
*/
function function_f002c513(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump)
{
	self endon(#"death");
	if(wasdemojump == 1)
	{
		if(function_65b9eb0f(fieldname))
		{
			return;
		}
		if(!isdefined(self.var_706728bf))
		{
			self.var_706728bf = playfxoncamera(fieldname, "sr/fx9_obj_holdout_camera_signifier", (0, 0, 0), (1, 0, 0), (0, 0, 1));
		}
		self playrumbleonentity(fieldname, "sr_transmitter_clear");
		earthquake(fieldname, 0.25, 0.5, self.origin, 80);
		self postfx::playpostfxbundle(#"pstfx_speedblur");
		self function_116b95e5(#"pstfx_speedblur", #"hash_77259d33b3998de9", 0.2);
		self function_116b95e5(#"pstfx_speedblur", #"hash_1a3ba6e8a0732aac", 0.4);
		if(!isdefined(self.var_3e1f31af))
		{
			self playsound(fieldname, #"hash_423712ee67e9a7df");
			self.var_3e1f31af = self playloopsound(#"hash_3abb737de31477c1");
		}
		self thread paintjob_stickers_s3_rokkr_majormaniak_base_ms(fieldname);
	}
	else
	{
		if(wasdemojump == 2)
		{
			if(!isdefined(self.var_87368464))
			{
				self.var_87368464 = playfxoncamera(fieldname, "sr/fx9_obj_holdout_camera_signifier_start", (0, 0, 0), (1, 0, 0), (0, 0, 1));
			}
		}
		else
		{
			self notify(#"hash_639f680ae2bb2ff");
			if(isdefined(self.var_706728bf))
			{
				stopfx(fieldname, self.var_706728bf);
				self.var_706728bf = undefined;
				self playrumbleonentity(fieldname, "sr_transmitter_clear");
				earthquake(fieldname, 0.25, 0.5, self.origin, 80);
			}
			if(isdefined(self.var_3e1f31af))
			{
				self playsound(fieldname, #"hash_14b384e8b10abaca");
				self stoploopsound(self.var_3e1f31af);
				self.var_3e1f31af = undefined;
			}
			waitframe(1);
			if(function_65b9eb0f(fieldname))
			{
				return;
			}
			self function_116b95e5(#"pstfx_speedblur", #"blur", 0);
			self postfx::exitpostfxbundle(#"pstfx_speedblur");
		}
	}
}

/*
	Name: paintjob_stickers_s3_rokkr_majormaniak_base_ms
	Namespace: namespace_4db53432
	Checksum: 0xAF244881
	Offset: 0x11C0
	Size: 0x1A0
	Parameters: 1
	Flags: Linked
*/
function paintjob_stickers_s3_rokkr_majormaniak_base_ms(localclientnum)
{
	self endon(#"death", #"disconnect", #"hash_639f680ae2bb2ff");
	n_blur = 0.01;
	self playsound(localclientnum, #"hash_20493da3bbf6cbbe");
	while(true)
	{
		self function_116b95e5(#"pstfx_speedblur", #"blur", n_blur);
		wait(0.08);
		n_blur = n_blur + 0.01;
		if(n_blur == 0.1)
		{
			self playrumbleonentity(localclientnum, "damage_light");
		}
		if(n_blur > 0.1)
		{
			while(n_blur > 0)
			{
				n_blur = n_blur - 0.01;
				self function_116b95e5(#"pstfx_speedblur", #"blur", n_blur);
				wait(0.08);
			}
			self playsound(localclientnum, #"hash_20493da3bbf6cbbe");
		}
	}
}

/*
	Name: function_eac49163
	Namespace: namespace_4db53432
	Checksum: 0x55854CED
	Offset: 0x1368
	Size: 0x368
	Parameters: 7
	Flags: Linked
*/
function function_eac49163(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump == 1)
	{
		function_be93487f(fieldname, 2, 1, 1, 0, 0);
		setexposureactivebank(fieldname, 2);
		var_90a50598 = struct::get_array("jellyfish_large", "targetname");
		foreach(var_b6e76b65 in var_90a50598)
		{
			var_b6e76b65.var_b965b5e5 = util::spawn_model(fieldname, var_b6e76b65.model, var_b6e76b65.origin);
		}
		waitframe(1);
		foreach(var_b6e76b65 in var_90a50598)
		{
			if(isdefined(var_b6e76b65.var_b965b5e5))
			{
				var_b6e76b65.var_b965b5e5 thread animation::play_siege("p9_fxanim_zm_silver_jellyfish_large_sanim", undefined, 1, 1);
				util::playfxontag(fieldname, "sr/fx9_aether_jellyfish_self_large", var_b6e76b65.var_b965b5e5, "tag_origin");
			}
		}
	}
	else
	{
		function_be93487f(fieldname, 0, 0.5, 0, 0, 0);
		setexposureactivebank(fieldname, 0);
		forcestreamxmodel(#"p9_fxanim_sv_holdout_crystal_mod");
		var_90a50598 = struct::get_array("jellyfish_large", "targetname");
		foreach(var_b6e76b65 in var_90a50598)
		{
			if(isdefined(var_b6e76b65.var_b965b5e5))
			{
				var_b6e76b65.var_b965b5e5 delete();
				var_b6e76b65 struct::delete();
			}
		}
	}
}

/*
	Name: function_4fd00e1f
	Namespace: namespace_4db53432
	Checksum: 0xD5147B3A
	Offset: 0x16D8
	Size: 0x324
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
	if(isdefined(level.var_3630f9c0[n_entity][fieldname]))
	{
		killfx(fieldname, level.var_3630f9c0[n_entity][fieldname]);
		level.var_3630f9c0[n_entity][fieldname] = undefined;
		var_e534cbe9 = 1;
	}
	if(bwastimejump > 0)
	{
		if(function_65b9eb0f(fieldname))
		{
			return;
		}
		if(!var_e534cbe9)
		{
			self playsound(fieldname, #"hash_79a78504d4dbaf3f");
		}
		if(self zm_utility::function_f8796df3(fieldname))
		{
			if(bwastimejump == 2)
			{
				str_fx = #"hash_679d39e5fd4eae19";
			}
			else if(bwastimejump == 1)
			{
				str_fx = #"hash_462352157053fa4a";
			}
			if(viewmodelhastag(fieldname, "tag_flashlight"))
			{
				level.var_3630f9c0[n_entity][fieldname] = playviewmodelfx(fieldname, str_fx, "tag_flashlight");
			}
		}
		else
		{
			if(bwastimejump == 2)
			{
				str_fx = #"hash_153f56ac9d13a399";
			}
			else if(bwastimejump == 1)
			{
				str_fx = #"hash_64e79a7456f58dec";
			}
			level.var_3630f9c0[n_entity][fieldname] = util::playfxontag(fieldname, str_fx, self, "tag_flashlight");
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
	Name: function_bd2b40f5
	Namespace: namespace_4db53432
	Checksum: 0xA5FE9A67
	Offset: 0x1A08
	Size: 0x16E
	Parameters: 7
	Flags: Linked
*/
function function_bd2b40f5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.n_fx_id = playfx(fieldname, "sr/fx9_obj_holdout_barrier_window", self.origin + (vectornormalize(anglestoright(self.angles)) * 6), anglestoright(self.angles), anglestoup(self.angles));
		self.var_b3673abf = self playloopsound(#"hash_3cf13a0072fc0aae");
	}
	else
	{
		if(isdefined(self.n_fx_id))
		{
			stopfx(fieldname, self.n_fx_id);
			self.n_fx_id = undefined;
		}
		if(isdefined(self.var_b3673abf))
		{
			self stoploopsound(self.var_b3673abf);
			self.var_b3673abf = undefined;
		}
	}
}

/*
	Name: function_9609c8b9
	Namespace: namespace_4db53432
	Checksum: 0x9C53D6B9
	Offset: 0x1B80
	Size: 0x1C4
	Parameters: 7
	Flags: Linked
*/
function function_9609c8b9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	playfx(bwastimejump, "sr/fx9_obj_holdout_crystal_bomb", self.origin + vectorscale((0, 0, 1), 128), anglestoforward(self.angles), anglestoup(self.angles));
	playsound(bwastimejump, #"hash_219637e3c93b9531", self.origin);
	wait(2.5);
	playfx(bwastimejump, "sr/fx9_obj_holdout_crystal_shockwave_blast", self.origin + vectorscale((0, 0, 1), 128), anglestoforward(self.angles), anglestoup(self.angles));
	playsound(bwastimejump, #"hash_716354440fd93185", self.origin + vectorscale((0, 0, 1), 128));
	self playrumbleonentity(bwastimejump, "sr_payload_portal_final_rumble");
	earthquake(bwastimejump, 0.25, 1.5, self.origin + vectorscale((0, 0, 1), 128), 4000);
}

/*
	Name: function_6a4e64d1
	Namespace: namespace_4db53432
	Checksum: 0x9577AAF4
	Offset: 0x1D50
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_6a4e64d1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.var_fec2778b = playfx(bwastimejump, "sr/fx9_obj_holdout_crystal_pulse", self.origin + vectorscale((0, 0, 1), 32), anglestoforward(self.angles), anglestoup(self.angles));
	self playsound(bwastimejump, #"hash_39e7c67ba77ef8cc");
}

/*
	Name: function_20a79dc5
	Namespace: namespace_4db53432
	Checksum: 0x56B91BD1
	Offset: 0x1E28
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function function_20a79dc5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, "sr/fx9_aether_jellyfish_trail", self, "tag_origin");
	util::playfxontag(bwastimejump, "sr/fx9_aether_jellyfish_d_light", self, "tag_origin");
}

/*
	Name: function_bd4ba224
	Namespace: namespace_4db53432
	Checksum: 0xDBC01D92
	Offset: 0x1EC0
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_bd4ba224(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	if(bwastimejump == 1)
	{
		self postfx::playpostfxbundle(#"hash_7fbc9bc489aea188");
	}
	else
	{
		self postfx::exitpostfxbundle(#"hash_7fbc9bc489aea188");
	}
}

