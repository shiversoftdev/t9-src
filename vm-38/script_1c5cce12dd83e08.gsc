#using script_7f9d1ec3c0aa68b8;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_662ff671;

/*
	Name: function_12f0ed68
	Namespace: namespace_662ff671
	Checksum: 0x905A727C
	Offset: 0x1B8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_12f0ed68()
{
	level notify(616985252);
}

/*
	Name: main
	Namespace: namespace_662ff671
	Checksum: 0x274AAC5
	Offset: 0x1D8
	Size: 0x2DC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("actor", "" + #"hash_74382f598f4de051", 1, getminbitcountfornum(4), "counter", &function_9f72eb8b, 0, 0);
	clientfield::register("actor", "" + #"hash_b74182bd1e44a44", 1, 1, "int", &function_cdc867b2, 0, 0);
	clientfield::register("actor", "" + #"hash_435db79c304e12a5", 1, 1, "counter", &function_f15a1018, 0, 0);
	clientfield::register("actor", "" + #"hash_3049a409503be8a0", 1, 1, "int", &function_f471577a, 0, 0);
	clientfield::register("actor", "" + #"hash_4460e5ee368004ed", 1, 1, "int", &function_dea39d5a, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_60e4230d63925ac1", 1, 1, "int", &function_60886116, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_6d05bbcab1912e5a", 1, 1, "int", &function_691412b4, 0, 0);
	clientfield::register("world", "" + #"hash_7d92d99179091a4f", 1, 1, "int", &function_a2e43552, 0, 0);
}

/*
	Name: function_a2e43552
	Namespace: namespace_662ff671
	Checksum: 0x4DFEF8B4
	Offset: 0x4C0
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function function_a2e43552(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		forcestreamxmodel(#"hash_94e8f2a5fcab18e");
		forcestreamxmodel(#"hash_1d66d4b8b20c9572");
	}
	else
	{
		stopforcestreamingxmodel(#"hash_94e8f2a5fcab18e");
		stopforcestreamingxmodel(#"hash_1d66d4b8b20c9572");
	}
}

/*
	Name: function_dea39d5a
	Namespace: namespace_662ff671
	Checksum: 0x1B23CD72
	Offset: 0x5A0
	Size: 0xD6
	Parameters: 7
	Flags: Linked
*/
function function_dea39d5a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwastimejump == 1)
	{
		self.var_3af8abd3 = util::playfxontag(fieldname, "sr/fx9_hvt_zombie_summon", self, "j_spine4");
	}
	else if(isdefined(self.var_3af8abd3))
	{
		stopfx(fieldname, self.var_3af8abd3);
		self.var_3af8abd3 = undefined;
	}
}

/*
	Name: function_f471577a
	Namespace: namespace_662ff671
	Checksum: 0xCDBF1F2E
	Offset: 0x680
	Size: 0xD6
	Parameters: 7
	Flags: Linked
*/
function function_f471577a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwastimejump == 1)
	{
		self.var_27b51434 = util::playfxontag(fieldname, "sr/fx9_hvt_aether_beam_distant", self, "tag_origin");
	}
	else if(isdefined(self.var_27b51434))
	{
		stopfx(fieldname, self.var_27b51434);
		self.var_27b51434 = undefined;
	}
}

/*
	Name: function_691412b4
	Namespace: namespace_662ff671
	Checksum: 0x521A6A2F
	Offset: 0x760
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_691412b4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwastimejump == 1)
	{
		self.var_942f8233 = util::playfxontag(fieldname, "sr/fx9_hvt_aether_move_trail", self, "tag_origin");
	}
	else if(isdefined(self.var_942f8233))
	{
		stopfx(fieldname, self.var_942f8233);
	}
}

/*
	Name: function_60886116
	Namespace: namespace_662ff671
	Checksum: 0x115C442D
	Offset: 0x838
	Size: 0x2DE
	Parameters: 7
	Flags: Linked
*/
function function_60886116(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwastimejump == 1)
	{
		self.var_3e3964d7 = playfx(fieldname, "sr/fx9_hvt_aether_beam", self.origin, anglestoup(self.angles));
		if(!isdefined(self.var_7f6cb624))
		{
			self playsound(fieldname, #"hash_62101ae824e3101a");
			self.var_7f6cb624 = self playloopsound(#"hash_234e4f385aba4fae");
		}
		wait(2.5);
		self.var_ae8b25ed = playfx(fieldname, "sr/fx9_hvt_aether_portal_spawn", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
	}
	else
	{
		self.var_1c6eb712 = playfx(fieldname, "sr/fx9_hvt_aether_portal_close", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
		if(isdefined(self.var_3e3964d7))
		{
			stopfx(fieldname, self.var_3e3964d7);
			self.var_3e3964d7 = undefined;
		}
		if(isdefined(self.var_ae8b25ed))
		{
			stopfx(fieldname, self.var_ae8b25ed);
			self.var_ae8b25ed = undefined;
		}
		if(isdefined(self.var_7f6cb624))
		{
			self playsound(fieldname, #"hash_7e2855c20a4abd8f");
			self stoploopsound(self.var_7f6cb624);
			self.var_7f6cb624 = undefined;
		}
		wait(2);
		if(isdefined(self.var_1c6eb712))
		{
			stopfx(fieldname, self.var_1c6eb712);
			self.var_1c6eb712 = undefined;
		}
	}
}

/*
	Name: function_f15a1018
	Namespace: namespace_662ff671
	Checksum: 0x2AD85167
	Offset: 0xB20
	Size: 0xEC
	Parameters: 7
	Flags: Linked
*/
function function_f15a1018(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(bwastimejump);
	playfx(bwastimejump, "sr/fx9_hvt_aether_portal_exp", self.origin + vectorscale((0, 0, 1), 32), anglestoforward(self.angles), anglestoup(self.angles));
	self playsound(bwastimejump, #"hash_591b69e6e55b5eb1");
}

/*
	Name: function_9f72eb8b
	Namespace: namespace_662ff671
	Checksum: 0x84AEDA8B
	Offset: 0xC18
	Size: 0x23C
	Parameters: 7
	Flags: Linked
*/
function function_9f72eb8b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	earthquake(fieldname, 0.3, 2, self.origin, 2500);
	function_36e4ebd4(fieldname, #"hash_28f3f7b037cdb4bc");
	switch(bwastimejump)
	{
		case 1:
		{
			var_8ae0b6c7 = #"hash_6916591c817c7bf8";
			break;
		}
		case 2:
		{
			var_8ae0b6c7 = #"hash_6916591c817c7bf8";
			break;
		}
		case 3:
		{
			var_8ae0b6c7 = #"hash_6916591c817c7bf8";
			break;
		}
		case 4:
		{
			var_8ae0b6c7 = #"hash_6916591c817c7bf8";
			break;
		}
	}
	self playsound(fieldname, var_8ae0b6c7);
	a_players = getplayers(fieldname, undefined, self.origin, 2500);
	array::thread_all(a_players, &postfx::playpostfxbundle, #"hash_4bce2bc0fe1ee966");
	wait(1);
	arrayremovevalue(a_players, undefined);
	array::thread_all(a_players, &postfx::exitpostfxbundle, #"hash_4bce2bc0fe1ee966");
}

/*
	Name: function_cdc867b2
	Namespace: namespace_662ff671
	Checksum: 0xE1932C8A
	Offset: 0xE60
	Size: 0x1A6
	Parameters: 7
	Flags: Linked
*/
function function_cdc867b2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwastimejump)
	{
		if(!isdefined(self.var_bb6d69f0))
		{
			self.var_bb6d69f0 = playfx(fieldname, "sr/fx9_hvt_aether_portal_spawn", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
		}
	}
	else
	{
		if(isdefined(self.var_bb6d69f0))
		{
			stopfx(fieldname, self.var_bb6d69f0);
			self.var_bb6d69f0 = undefined;
		}
		self.var_4776f2b8 = playfx(fieldname, "sr/fx9_hvt_aether_portal_close", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
		wait(2);
		if(isdefined(self.var_4776f2b8))
		{
			stopfx(fieldname, self.var_4776f2b8);
			self.var_4776f2b8 = undefined;
		}
	}
}

