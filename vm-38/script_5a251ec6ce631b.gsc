#using script_3b78d6d26bf3ec83;
#using script_ac6a30f1991e105;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace archetype_avogadro;

/*
	Name: function_27720ae
	Namespace: archetype_avogadro
	Checksum: 0x4C2BB6B6
	Offset: 0x238
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_27720ae()
{
	level notify(531421741);
}

/*
	Name: function_89f2df9
	Namespace: archetype_avogadro
	Checksum: 0x21E2ED1E
	Offset: 0x258
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"archetype_avogadro", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: archetype_avogadro
	Checksum: 0x3096FD76
	Offset: 0x2B0
	Size: 0x1EC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("missile", "" + #"hash_699d5bb1a9339a93", 1, 2, "int", &function_9452b8f1, 0, 0);
	clientfield::register("actor", "" + #"hash_4466de6137f54b59", 1, 1, "int", &function_1d2d070c, 0, 0);
	clientfield::register("actor", "" + #"hash_2eec8fc21495a18c", 1, 2, "int", &function_ae4cd3d4, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_183ef3538fd62563", 1, 1, "int", &function_9beb815c, 0, 0);
	clientfield::register("scriptmover", "avogadro_phase_beam", 1, getminbitcountfornum(3), "int", &function_6ddf79a2, 0, 0);
	ai::add_archetype_spawn_function(#"avogadro", &initavogadro);
}

/*
	Name: function_8ac3bea9
	Namespace: archetype_avogadro
	Checksum: 0x80F724D1
	Offset: 0x4A8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: initavogadro
	Namespace: archetype_avogadro
	Checksum: 0xBB3D09CA
	Offset: 0x4B8
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function initavogadro(localclientnum)
{
	util::waittill_dobj(localclientnum);
	fxclientutils::playfxbundle(localclientnum, self, "fxd9_zm_char_avogadro_elec_unaware");
	self callback::on_shutdown(&on_entity_shutdown);
}

/*
	Name: on_entity_shutdown
	Namespace: archetype_avogadro
	Checksum: 0xA7AF30FD
	Offset: 0x528
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function on_entity_shutdown(localclientnum)
{
	if(isdefined(self) && isdefined(self.jammer_interface))
	{
		self.jammer_interface delete();
	}
	if(isdefined(self))
	{
		self function_5d482e78(#"hash_4a28179035ece31c");
	}
}

/*
	Name: function_8dede8a3
	Namespace: archetype_avogadro
	Checksum: 0x3AAED55D
	Offset: 0x598
	Size: 0x80
	Parameters: 1
	Flags: None
*/
function function_8dede8a3(localclientnum)
{
	self endon(#"shutdown", #"death");
	while(isdefined(self))
	{
		self playsound(localclientnum, #"hash_6f92148122930a");
		wait(randomintrange(3, 10));
	}
}

/*
	Name: function_9452b8f1
	Namespace: archetype_avogadro
	Checksum: 0xA5B5E103
	Offset: 0x620
	Size: 0x146
	Parameters: 7
	Flags: Linked
*/
function function_9452b8f1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump === 1)
	{
		self.var_b85f4206 = function_239993de(fieldname, "zm_ai/fx8_avo_elec_projectile", self, "tag_origin_animate");
		if(!isdefined(self.var_cb169d5f))
		{
			self.var_cb169d5f = self playloopsound(#"hash_64fad034010aebaa");
		}
	}
	else
	{
		if(isdefined(self.var_b85f4206))
		{
			stopfx(fieldname, self.var_b85f4206);
			self.var_b85f4206 = undefined;
		}
		if(isdefined(self.var_cb169d5f))
		{
			self stoploopsound(self.var_cb169d5f);
			self.var_cb169d5f = undefined;
		}
	}
}

/*
	Name: function_9beb815c
	Namespace: archetype_avogadro
	Checksum: 0xF9E0B4B2
	Offset: 0x770
	Size: 0xAC
	Parameters: 7
	Flags: Linked
*/
function function_9beb815c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::waittill_dobj(bwastimejump);
	if(!isdefined(self))
	{
		return;
	}
	function_239993de(bwastimejump, "zm_ai/fx9_avo_elec_projectile_dest", self, "tag_origin_animate");
	playsound(bwastimejump, #"hash_3f6164143de4427e", self.origin);
}

/*
	Name: function_1d2d070c
	Namespace: archetype_avogadro
	Checksum: 0xBC643C2E
	Offset: 0x828
	Size: 0xCE
	Parameters: 7
	Flags: Linked
*/
function function_1d2d070c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump)
	{
		self.phase_fx = function_239993de(fieldname, "zm_ai/fx8_cata_elec_aura", self, "j_spine4");
	}
	else if(isdefined(self.phase_fx))
	{
		stopfx(fieldname, self.phase_fx);
		self.phase_fx = undefined;
	}
}

/*
	Name: function_ae4cd3d4
	Namespace: archetype_avogadro
	Checksum: 0x12B8C678
	Offset: 0x900
	Size: 0x192
	Parameters: 7
	Flags: Linked, Private
*/
function private function_ae4cd3d4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump == 1 && self.health_state !== 1)
	{
		self function_df8ae699(fieldname);
		fxclientutils::playfxbundle(fieldname, self, "fxd9_zm_char_avogadro_elec_health_low");
		self.health_state = 1;
	}
	else
	{
		if(bwastimejump == 2 && self.health_state !== 2)
		{
			self function_df8ae699(fieldname);
			fxclientutils::playfxbundle(fieldname, self, "fxd9_zm_char_avogadro_elec_health_med");
			self.health_state = 2;
		}
		else if(bwastimejump == 3 && self.health_state !== 3)
		{
			self function_df8ae699(fieldname);
			fxclientutils::playfxbundle(fieldname, self, "fxd9_zm_char_avogadro_elec_health_high");
			self.health_state = 3;
		}
	}
}

/*
	Name: function_6ddf79a2
	Namespace: archetype_avogadro
	Checksum: 0xD0AC5A6F
	Offset: 0xAA0
	Size: 0x26A
	Parameters: 7
	Flags: Linked, Private
*/
function private function_6ddf79a2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::waittill_dobj(binitialsnap);
	if(!isdefined(self))
	{
		return;
	}
	timestamp = gettime();
	id = bwastimejump;
	if(bwastimejump == 0)
	{
		id = fieldname;
	}
	if(!isdefined(level.var_c42e1dca))
	{
		level.var_c42e1dca = [];
	}
	if(!isdefined(level.var_c42e1dca[id]))
	{
		level.var_c42e1dca[id] = spawnstruct();
	}
	if(bwastimejump == 0)
	{
		/#
			assert(isdefined(level.var_c42e1dca[id].beam_id));
		#/
		beamkill(binitialsnap, level.var_c42e1dca[id].beam_id);
	}
	else
	{
		if(level.var_c42e1dca[id].time !== timestamp)
		{
			level.var_c42e1dca[id].time = timestamp;
			level.var_c42e1dca[id].model = self;
		}
		else
		{
			var_905cc9f0 = level.var_c42e1dca[id].model;
			var_ecde63d5 = self;
			playsound(binitialsnap, #"hash_45cd897c902f8c6d", var_ecde63d5.origin);
			playsound(binitialsnap, #"zmb_avogadro_warp_in", var_905cc9f0.origin);
			level.var_c42e1dca[id].beam_id = beamlaunch(binitialsnap, var_ecde63d5, "tag_origin", var_905cc9f0, "tag_origin", "beam9_zm_avogadro_elec_teleport");
		}
	}
}

/*
	Name: function_df8ae699
	Namespace: archetype_avogadro
	Checksum: 0xFC040AAC
	Offset: 0xD18
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function function_df8ae699(localclientnum)
{
	fxclientutils::stopfxbundle(localclientnum, self, "fxd9_zm_char_avogadro_elec_health_low");
	fxclientutils::stopfxbundle(localclientnum, self, "fxd9_zm_char_avogadro_elec_health_med");
	fxclientutils::stopfxbundle(localclientnum, self, "fxd9_zm_char_avogadro_elec_health_high");
	fxclientutils::stopfxbundle(localclientnum, self, "fxd9_zm_char_avogadro_elec_unaware");
}

