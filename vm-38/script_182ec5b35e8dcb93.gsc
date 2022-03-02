#using script_14d2d89964cae0b1;
#using script_ac6a30f1991e105;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_19c99142;

/*
	Name: function_393edb48
	Namespace: namespace_19c99142
	Checksum: 0xF86226AB
	Offset: 0x4C8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_393edb48()
{
	level notify(750614296);
}

/*
	Name: function_89f2df9
	Namespace: namespace_19c99142
	Checksum: 0xA8E77D80
	Offset: 0x4E8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2f2eba883d5db256", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_19c99142
	Checksum: 0x72066877
	Offset: 0x530
	Size: 0x2DC
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!isarchetypeloaded(#"hash_24f9e195cf2de42"))
	{
		return;
	}
	clientfield::register("actor", "soaBindTurnCF", 14000, 1, "int", &function_2f78a02, 0, 0);
	clientfield::register("actor", "soaBindProcessCF", 14000, 1, "int", &function_5371f7c0, 0, 0);
	clientfield::register("actor", "soaHeadGlowCF", 14000, 2, "int", &function_5652dbd9, 0, 0);
	clientfield::register("actor", "soaSpawnCompleteCF", 14000, 2, "int", &function_eb1701af, 0, 0);
	clientfield::register("actor", "soaDeathDissolveCF", 14000, 2, "int", &function_911b2ccd, 0, 0);
	clientfield::register("actor", "soaHealthStateCF", 14000, 2, "int", &function_56f7804f, 0, 0);
	clientfield::register("actor", "soaLifeDrainBeamKillCF", 14000, 1, "counter", &function_e397a6bd, 0, 0);
	clientfield::register("toplayer", "soaLifeDrainPostFXCF", 13000, 1, "int", &function_4d8337d3, 0, 0);
	clientfield::register("scriptmover", "soaLifeDrainEntCF", 13000, 2, "int", &function_537e9ae2, 0, 0);
	ai::add_archetype_spawn_function(#"hash_24f9e195cf2de42", &function_ad30d4e8);
}

/*
	Name: function_ad30d4e8
	Namespace: namespace_19c99142
	Checksum: 0xF725597B
	Offset: 0x818
	Size: 0x26C
	Parameters: 1
	Flags: Linked
*/
function function_ad30d4e8(localclientnum)
{
	util::lock_model("c_t9_zmb_son_of_orda_body");
	util::lock_model("c_t9_zmb_son_of_orda_exposed_1");
	util::lock_model("c_t9_zmb_son_of_orda_exposed_2");
	util::lock_model("c_t9_zmb_son_of_orda_3_ww1");
	self callback::add_entity_callback(#"death", &function_1fb3829a);
	self function_e3c02e96(self);
	util::playfxontag(localclientnum, #"hash_770fa6ce7ea7aa9d", self, "j_elbow_le");
	util::playfxontag(localclientnum, #"hash_1bfa334f4aec5d6", self, "j_elbow_ri");
	util::playfxontag(localclientnum, #"hash_6a0de53a6edeffa1", self, "j_head");
	util::playfxontag(localclientnum, #"hash_3a4336d2b9df1d18", self, "j_hip_le");
	util::playfxontag(localclientnum, #"hash_309145b38054fcd", self, "j_hip_ri");
	util::playfxontag(localclientnum, #"hash_29a38a1359a23386", self, "j_spine4");
	util::playfxontag(localclientnum, #"hash_7b9d0af952543875", self, "j_spinelower");
	util::playfxontag(localclientnum, #"hash_2960ffd6d6e1574b", self, "j_knee_le");
	util::playfxontag(localclientnum, #"hash_7889993702834cd4", self, "j_knee_ri");
	util::playfxontag(localclientnum, #"hash_487d787325b816f1", self, "j_shoulder_le");
	util::playfxontag(localclientnum, #"hash_185191d316944452", self, "j_shoulder_ri");
}

/*
	Name: function_e3c02e96
	Namespace: namespace_19c99142
	Checksum: 0x9E9ECD0E
	Offset: 0xA90
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function function_e3c02e96(var_a6027132)
{
	var_a6027132.var_f2fd8d37 = self playloopsound(#"hash_dcd4267947eee6b", 0.5);
	var_a6027132.var_8ca8e6f6 = self playloopsound(#"hash_4c4b041e443c131e", 0.5);
}

/*
	Name: function_911f421
	Namespace: namespace_19c99142
	Checksum: 0x356F735B
	Offset: 0xB08
	Size: 0x132
	Parameters: 2
	Flags: Linked
*/
function function_911f421(localclientnum, entity)
{
	fx = "zm_ai/fx9_soo_amb_torso";
	if(!is_true(entity.turned))
	{
		if(entity.health_state === 1)
		{
			fx = "zm_ai/fx9_soo_amb_torso_health_md";
		}
		else if(entity.health_state === 2)
		{
			fx = "zm_ai/fx9_soo_amb_torso_health_low";
		}
	}
	else
	{
		fx = "zm_ai/fx9_soo_amb_torso_brain_rot";
		if(entity.health_state === 1)
		{
			fx = "zm_ai/fx9_soo_amb_torso_health_md_brain_rot";
		}
		else if(entity.health_state === 2)
		{
			fx = "zm_ai/fx9_soo_amb_torso_health_low_brain_rot";
		}
	}
	if(entity.var_e602ced3 !== fx)
	{
		if(isdefined(entity.var_e602ced3))
		{
			stopfx(localclientnum, entity.var_e602ced3);
		}
		entity.var_e602ced3 = util::playfxontag(localclientnum, fx, entity, "j_spine4");
	}
}

/*
	Name: function_1fb3829a
	Namespace: namespace_19c99142
	Checksum: 0x4CBB3B69
	Offset: 0xC48
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_1fb3829a(params)
{
	util::unlock_model("c_t9_zmb_son_of_orda_body");
	util::unlock_model("c_t9_zmb_son_of_orda_exposed_1");
	util::unlock_model("c_t9_zmb_son_of_orda_exposed_2");
	util::unlock_model("c_t9_zmb_son_of_orda_3_ww1");
	self callback::function_52ac9652(#"death", &function_1fb3829a);
}

/*
	Name: function_911b2ccd
	Namespace: namespace_19c99142
	Checksum: 0xA360335F
	Offset: 0xCF0
	Size: 0x16C
	Parameters: 7
	Flags: Linked
*/
function function_911b2ccd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.var_e54c053a))
	{
		self function_f6e99a8d(self.var_e54c053a);
		self.var_e54c053a = undefined;
	}
	if(isdefined(self.var_678bc6e2))
	{
		self function_f6e99a8d(self.var_678bc6e2);
		self.var_678bc6e2 = undefined;
	}
	if(bwastimejump == 1)
	{
		self function_bf9d3071(#"hash_7ea5a307c8e67de5");
		if(isdefined(self.var_e602ced3))
		{
			stopfx(fieldname, self.var_e602ced3);
		}
		if(isdefined(self.var_d85437d9))
		{
			stopfx(fieldname, self.var_d85437d9);
		}
		function_4df8409a(fieldname, self);
	}
	else if(bwastimejump == 2)
	{
		self function_5d482e78(#"hash_7ea5a307c8e67de5");
	}
}

/*
	Name: function_56f7804f
	Namespace: namespace_19c99142
	Checksum: 0x9FBA4693
	Offset: 0xE68
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function function_56f7804f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.health_state = bwastimejump;
		function_911f421(fieldname, self);
	}
}

/*
	Name: function_2f78a02
	Namespace: namespace_19c99142
	Checksum: 0x8C16E8B8
	Offset: 0xEE0
	Size: 0x206
	Parameters: 7
	Flags: Linked
*/
function function_2f78a02(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!gibclientutils::isgibbed(fieldname, self, 8))
		{
			if(isdefined(self.archetype))
			{
				if(isdefined(self gettagorigin("j_eyeball_le")))
				{
					self.var_73ef2da4 = util::playfxontag(fieldname, "zm_ai/fx9_soo_bound_zmb_amb", self, "j_eyeball_le");
					self.var_2902afa2 = util::playfxontag(fieldname, "zm_ai/fx9_soo_bound_zmb_amb_torso", self, "j_spine4");
					self function_bf9d3071("rob_zm_eyes_red", "j_head");
					self playsound(0, #"hash_1acd324b4672becf");
					self.var_abab51d = self playloopsound(#"hash_20db2e8e590b6ef1");
				}
			}
		}
	}
	else
	{
		if(isdefined(self.var_73ef2da4))
		{
			stopfx(fieldname, self.var_73ef2da4);
			self function_5d482e78("rob_zm_eyes_red", "j_head");
			self.var_73ef2da4 = undefined;
			self stoploopsound(self.var_abab51d);
		}
		if(isdefined(self.var_2902afa2))
		{
			stopfx(fieldname, self.var_2902afa2);
			self.var_2902afa2 = undefined;
		}
	}
}

/*
	Name: function_5371f7c0
	Namespace: namespace_19c99142
	Checksum: 0x2E097628
	Offset: 0x10F0
	Size: 0x126
	Parameters: 7
	Flags: Linked
*/
function function_5371f7c0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!gibclientutils::isgibbed(fieldname, self, 8))
		{
			if(isdefined(self.archetype))
			{
				if(isdefined(self gettagorigin("j_eyeball_le")))
				{
					self.var_a4bce1b8 = util::playfxontag(fieldname, #"hash_10cd81bd433479d3", self, "j_eyeball_le");
					self playsound(0, #"hash_7aee01e204808ac5");
				}
			}
		}
	}
	else if(isdefined(self.var_a4bce1b8))
	{
		stopfx(fieldname, self.var_a4bce1b8);
		self.var_a4bce1b8 = undefined;
	}
}

/*
	Name: function_5652dbd9
	Namespace: namespace_19c99142
	Checksum: 0xFAE019E8
	Offset: 0x1220
	Size: 0x194
	Parameters: 7
	Flags: Linked
*/
function function_5652dbd9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.var_e54c053a))
	{
		self function_5d482e78(self.var_e54c053a);
	}
	if(isdefined(self.var_678bc6e2))
	{
		self function_5d482e78(self.var_678bc6e2);
	}
	if(bwastimejump === 1)
	{
		self.var_e54c053a = #"hash_5dcba3b7909e1875";
		self function_bf9d3071(self.var_e54c053a);
		self.var_d85437d9 = util::playfxontag(fieldname, #"hash_45f8a66512a7a19", self, "tag_fx_head_weakspot");
	}
	else if(bwastimejump === 2)
	{
		self.var_e54c053a = #"hash_38230a889a981e29";
		self.turned = 1;
		self function_bf9d3071(self.var_e54c053a);
		self.var_d85437d9 = util::playfxontag(fieldname, #"hash_d740b2ea6034927", self, "tag_fx_head_weakspot");
		function_911f421(fieldname, self);
	}
}

/*
	Name: function_eb1701af
	Namespace: namespace_19c99142
	Checksum: 0xE5DD9DB3
	Offset: 0x13C0
	Size: 0xFC
	Parameters: 7
	Flags: Linked
*/
function function_eb1701af(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		function_911f421(fieldname, self);
		self.var_678bc6e2 = #"hash_7ea5a307c8e67de5";
		self playsound(0, #"hash_5e60a3bcdfbb4bfd");
		self function_bf9d3071(#"hash_1e377d2a6063925e");
	}
	else if(bwastimejump == 2)
	{
		if(isdefined(self.var_678bc6e2))
		{
			self function_f6e99a8d(self.var_678bc6e2);
		}
	}
}

/*
	Name: function_e397a6bd
	Namespace: namespace_19c99142
	Checksum: 0xAED36BF2
	Offset: 0x14C8
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_e397a6bd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		function_4df8409a(fieldname, self);
	}
}

/*
	Name: function_4d8337d3
	Namespace: namespace_19c99142
	Checksum: 0x7C8CE10C
	Offset: 0x1530
	Size: 0x1A4
	Parameters: 7
	Flags: Linked
*/
function function_4d8337d3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	postfx = #"hash_12a02eb276dac7ab";
	if(bwastimejump)
	{
		if(isdefined(self.var_51dd9721) && postfx::function_556665f2(self.var_51dd9721))
		{
			postfx::stoppostfxbundle(self.var_51dd9721);
		}
		self postfx::playpostfxbundle(postfx);
		self playsound(0, #"hash_52762fd483a6e3fa");
		self.var_e950e4a8 = self playloopsound(#"hash_48762d210569c49");
	}
	else
	{
		self postfx::stoppostfxbundle(postfx);
		if(isdefined(self.var_51dd9721) && !postfx::function_556665f2(self.var_51dd9721))
		{
			postfx::playpostfxbundle(self.var_51dd9721);
		}
		self playsound(0, #"hash_4a5adfe85c2cb7da");
		self stoploopsound(self.var_e950e4a8);
	}
}

/*
	Name: function_537e9ae2
	Namespace: namespace_19c99142
	Checksum: 0xDEFB6AF4
	Offset: 0x16E0
	Size: 0x2D6
	Parameters: 7
	Flags: Linked
*/
function function_537e9ae2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump === 1)
	{
		var_565fd007 = self getlinkedent();
		if(isdefined(var_565fd007))
		{
			level.var_65331992 = var_565fd007;
		}
	}
	else if(bwastimejump === 2)
	{
		var_ae236771 = self getlinkedent();
		if(isdefined(var_ae236771) && isdefined(level.var_65331992))
		{
			function_4df8409a(fieldname, level.var_65331992);
			if(!isdefined(var_ae236771.var_89b07175))
			{
				var_ae236771.var_89b07175 = [];
			}
			var_f63cd008 = "beam9_zm_soo_drain_health";
			var_b3c64082 = "beam9_zm_soo_drain_health_blood";
			if(function_27673a7(fieldname) === var_ae236771 && !isthirdperson(fieldname))
			{
				var_f63cd008 = "beam9_zm_soo_drain_health_1p";
				var_b3c64082 = "beam9_zm_soo_drain_health_blood_1p";
			}
			target_tag = "j_spine4";
			if(!var_ae236771 isplayer() && !var_ae236771 isai())
			{
				target_tag = "tag_origin";
			}
			var_8e463967 = level.var_65331992 beam::launch(level.var_65331992, "tag_fx_hand_ri_palm", var_ae236771, target_tag, var_f63cd008, 1);
			var_ca8291ac = level.var_65331992 beam::launch(level.var_65331992, "tag_fx_hand_ri_palm", var_ae236771, target_tag, var_b3c64082, 1);
			var_6a339072 = {#target_ent:var_ae236771, #source_ent:level.var_65331992, #secondary:var_ca8291ac, #primary:var_8e463967};
			var_ae236771.var_89b07175[var_ae236771.var_89b07175.size] = var_6a339072;
			level.var_65331992.var_74fefd81 = var_6a339072;
		}
	}
}

/*
	Name: function_4df8409a
	Namespace: namespace_19c99142
	Checksum: 0xE4E6E201
	Offset: 0x19C0
	Size: 0xC6
	Parameters: 2
	Flags: Linked
*/
function function_4df8409a(localclientnum, entity)
{
	if(isdefined(entity.var_74fefd81))
	{
		if(isdefined(entity.var_74fefd81.target_ent))
		{
			arrayremovevalue(entity.var_74fefd81.target_ent.var_89b07175, entity.var_74fefd81);
			beam::function_47deed80(localclientnum, entity.var_74fefd81.primary, entity);
			beam::function_47deed80(localclientnum, entity.var_74fefd81.secondary, entity);
		}
		entity.var_74fefd81 = undefined;
	}
}

