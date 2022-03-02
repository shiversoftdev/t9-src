#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_perks.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_9b007fc4;

/*
	Name: function_33e52cc2
	Namespace: namespace_9b007fc4
	Checksum: 0xB47F8D8C
	Offset: 0x188
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_33e52cc2()
{
	level notify(1768979284);
}

/*
	Name: function_89f2df9
	Namespace: namespace_9b007fc4
	Checksum: 0x2BDF54B2
	Offset: 0x1A8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_206e095d8825190d", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_9b007fc4
	Checksum: 0xD8A265E2
	Offset: 0x1F0
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	function_27473e44();
	clientfield::function_a8bbc967("hud_items.tombstonePerkAvailable", #"hud_items", #"hash_3031b17444967abf", 1, 2, "int", undefined, 0, 0);
}

/*
	Name: function_27473e44
	Namespace: namespace_9b007fc4
	Checksum: 0x81C40DE
	Offset: 0x260
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_27473e44()
{
	zm_perks::register_perk_clientfields(#"hash_38c08136902fd553", &function_37236662, &callback_func);
	zm_perks::register_perk_effects(#"hash_38c08136902fd553", "tombstone_light");
	zm_perks::register_perk_init_thread(#"hash_38c08136902fd553", &init_staminup);
	zm_perks::function_f3c80d73("zombie_perk_bottle_tombstone");
	callback::on_spawned(&on_spawned);
}

/*
	Name: init_staminup
	Namespace: namespace_9b007fc4
	Checksum: 0x9614B8FA
	Offset: 0x340
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function init_staminup()
{
	if(is_true(level.enable_magic))
	{
		level._effect[#"tombstone_light"] = "maps/zm_gold/fx9_sur_machine_tombstone_eye_smk";
	}
}

/*
	Name: function_37236662
	Namespace: namespace_9b007fc4
	Checksum: 0x8692FEC5
	Offset: 0x388
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_37236662()
{
	clientfield::register("allplayers", "" + #"hash_46072c670fdaf2fa", 8000, 1, "int", &function_e32c696e, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_2897f04212a28873", 8000, 1, "int", &function_2f3a5c2, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_5d96e4c9a397fa0", 8000, 1, "int", &function_e2f686a3, 0, 0);
}

/*
	Name: callback_func
	Namespace: namespace_9b007fc4
	Checksum: 0x80F724D1
	Offset: 0x4A0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function callback_func()
{
}

/*
	Name: function_e32c696e
	Namespace: namespace_9b007fc4
	Checksum: 0xA1C05414
	Offset: 0x4B0
	Size: 0x394
	Parameters: 7
	Flags: Linked
*/
function function_e32c696e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(!isdefined(level.var_929ed5c3))
	{
		level.var_929ed5c3 = [];
	}
	n_entity = self getentitynumber();
	if(!isdefined(level.var_929ed5c3[n_entity]))
	{
		level.var_929ed5c3[n_entity] = spawnstruct();
	}
	if(bwastimejump)
	{
		if(zm_utility::function_f8796df3(fieldname))
		{
			self function_bf9d3071(#"hash_280405958d740589");
			if(self postfx::function_556665f2(#"hash_3541c7bff1f76832"))
			{
				self postfx::stoppostfxbundle(#"hash_3541c7bff1f76832");
			}
			self postfx::playpostfxbundle(#"hash_3541c7bff1f76832");
			if(!isdefined(level.var_929ed5c3[n_entity].var_70064d7) && self function_da43934d())
			{
				level.var_929ed5c3[n_entity].var_70064d7 = playfxoncamera(fieldname, #"hash_12ee2927874461e5", (0, 0, 0), (1, 0, 0), (0, 0, 1));
			}
			self thread function_222efb26(fieldname);
		}
		else
		{
			self function_bf9d3071(#"hash_6b8215cb4fa935e4");
			if(!isdefined(level.var_929ed5c3[n_entity].var_ecb39b1e))
			{
				level.var_929ed5c3[n_entity].var_ecb39b1e = util::playfxontag(fieldname, #"hash_803ea6a2550a53a", self, "j_head");
			}
			if(!isdefined(level.var_929ed5c3[n_entity].var_7163a06c))
			{
				level.var_929ed5c3[n_entity].var_7163a06c = util::playfxontag(fieldname, #"hash_ee42b8ead6d79d1", self, "j_spine4");
			}
		}
		if(!isdefined(level.var_929ed5c3[n_entity].var_44c08b39))
		{
			self playsound(fieldname, #"hash_9439f12723cfe43", self.origin + vectorscale((0, 0, 1), 75));
			level.var_929ed5c3[n_entity].var_44c08b39 = self playloopsound(#"hash_239f90b280cde695", undefined, vectorscale((0, 0, 1), 75));
		}
	}
	else
	{
		self function_acf463c0(fieldname);
	}
}

/*
	Name: on_spawned
	Namespace: namespace_9b007fc4
	Checksum: 0xA88B8189
	Offset: 0x850
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function on_spawned(localclientnum)
{
	self function_acf463c0(localclientnum);
}

/*
	Name: function_acf463c0
	Namespace: namespace_9b007fc4
	Checksum: 0xBB0D5092
	Offset: 0x880
	Size: 0x2FE
	Parameters: 1
	Flags: Linked
*/
function function_acf463c0(localclientnum)
{
	n_entity = self getentitynumber();
	self notify(#"hash_3f0adb1cfeb5ef46");
	if(self function_d2503806(#"hash_280405958d740589") && self function_21c0fa55())
	{
		self function_5d482e78(#"hash_280405958d740589");
	}
	if(self function_d2503806(#"hash_6b8215cb4fa935e4"))
	{
		self function_5d482e78(#"hash_6b8215cb4fa935e4");
	}
	if(self postfx::function_556665f2(#"hash_3541c7bff1f76832") && self function_21c0fa55())
	{
		self postfx::exitpostfxbundle(#"hash_3541c7bff1f76832");
	}
	if(isdefined(level.var_929ed5c3[n_entity].var_70064d7))
	{
		stopfx(localclientnum, level.var_929ed5c3[n_entity].var_70064d7);
		level.var_929ed5c3[n_entity].var_70064d7 = undefined;
	}
	if(isdefined(level.var_929ed5c3[n_entity].var_ecb39b1e))
	{
		stopfx(localclientnum, level.var_929ed5c3[n_entity].var_ecb39b1e);
		level.var_929ed5c3[n_entity].var_ecb39b1e = undefined;
	}
	if(isdefined(level.var_929ed5c3[n_entity].var_7163a06c))
	{
		stopfx(localclientnum, level.var_929ed5c3[n_entity].var_7163a06c);
		level.var_929ed5c3[n_entity].var_7163a06c = undefined;
	}
	if(isdefined(level.var_929ed5c3[n_entity].var_44c08b39))
	{
		self playsound(localclientnum, #"hash_a486150b3965756", self.origin + vectorscale((0, 0, 1), 75));
		self stoploopsound(level.var_929ed5c3[n_entity].var_44c08b39);
		level.var_929ed5c3[n_entity].var_44c08b39 = undefined;
	}
}

/*
	Name: function_222efb26
	Namespace: namespace_9b007fc4
	Checksum: 0x762055B8
	Offset: 0xB88
	Size: 0x11E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_222efb26(localclientnum)
{
	self notify("12bc57d9915ab07a");
	self endon("12bc57d9915ab07a");
	self endon(#"death", #"hash_3f0adb1cfeb5ef46");
	while(true)
	{
		var_b1b72524 = self isplayerads();
		if(self function_d2503806(#"hash_280405958d740589") && var_b1b72524)
		{
			self function_5d482e78(#"hash_280405958d740589");
		}
		else if(!self function_d2503806(#"hash_280405958d740589") && !var_b1b72524)
		{
			self function_bf9d3071(#"hash_280405958d740589");
		}
		waitframe(1);
	}
}

/*
	Name: function_2f3a5c2
	Namespace: namespace_9b007fc4
	Checksum: 0xD12FF404
	Offset: 0xCB0
	Size: 0x24A
	Parameters: 7
	Flags: Linked
*/
function function_2f3a5c2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(isdefined(self.eye_fx))
	{
		deletefx(fieldname, self.eye_fx, 1);
		self.eye_fx = undefined;
	}
	if(isdefined(self.var_212f2fe0))
	{
		self stoploopsound(self.var_212f2fe0);
		self.var_212f2fe0 = undefined;
		self playsound(fieldname, #"hash_6ece13844ae6d9c4");
	}
	if(bwastimejump)
	{
		switch(self.model)
		{
			case "hash_4bee36a9434de051":
			default:
			{
				str_fx = #"hash_719c2cabe9153a26";
				break;
			}
			case "hash_4bee33a9434ddb38":
			{
				str_fx = #"hash_73c4fd152aecf624";
				break;
			}
			case "hash_4bee34a9434ddceb":
			{
				str_fx = #"hash_56b93c93cc14dacf";
				break;
			}
			case "hash_4bee39a9434de56a":
			{
				str_fx = #"hash_749676da3b26efc8";
				break;
			}
		}
		self.eye_fx = util::playfxontag(fieldname, str_fx, self, "tag_origin");
		self playsound(fieldname, #"hash_584010eeca733f75");
		self.var_212f2fe0 = self playloopsound(#"hash_4bf005ee9faa6c5a");
	}
}

/*
	Name: function_e2f686a3
	Namespace: namespace_9b007fc4
	Checksum: 0x741351B5
	Offset: 0xF08
	Size: 0x12A
	Parameters: 7
	Flags: Linked
*/
function function_e2f686a3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self util::waittill_dobj(fieldname);
	if(isdefined(self.smoke_fx))
	{
		deletefx(fieldname, self.smoke_fx, 0);
		self.smoke_fx = undefined;
	}
	if(isdefined(self.var_54cf4ad1))
	{
		self stoploopsound(self.var_54cf4ad1);
		self.var_54cf4ad1 = undefined;
	}
	if(bwastimejump && isdefined(self))
	{
		self.smoke_fx = util::playfxontag(fieldname, #"hash_75c8e387ce756315", self, "tag_origin");
		self.var_54cf4ad1 = self playloopsound(#"hash_3d5c6d04514fbbcd");
	}
}

