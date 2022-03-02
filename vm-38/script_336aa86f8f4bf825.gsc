#using script_14cc8298d95c14a3;
#using script_1f38e4dd404966a1;
#using script_473313f86f37e854;
#using script_53e6e796bb019ba1;
#using script_66a886d540066b5b;
#using script_767fdceb6d7ef024;
#using scripts\core_common\aat_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_3e3637fc;

/*
	Name: function_328e90c2
	Namespace: namespace_3e3637fc
	Checksum: 0xECA0159F
	Offset: 0x340
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_328e90c2()
{
	level notify(1822925615);
}

/*
	Name: function_89f2df9
	Namespace: namespace_3e3637fc
	Checksum: 0xD29B0939
	Offset: 0x360
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_be582d88a77b1", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_3e3637fc
	Checksum: 0xF987C257
	Offset: 0x3A8
	Size: 0x2B4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	level.aat_initializing = 1;
	level aat::function_571fceb("ammomod_brainrot", &ammomod_brainrot::function_9384b521);
	level aat::function_571fceb("ammomod_cryofreeze", &ammomod_cryofreeze::function_ab6c8a0b);
	level aat::function_571fceb("ammomod_deadwire", &ammomod_deadwire::function_af1f180);
	level aat::function_571fceb("ammomod_napalmburst", &ammomod_napalmburst::function_4e4244c1);
	level aat::function_571fceb("ammomod_electriccherry", &ammomod_electriccherry::function_4b66248d);
	level aat::function_571fceb("ammomod_shatterblast", &namespace_8652b0d1::function_4e14a881);
	clientfield::register("toplayer", "" + #"hash_10f9eacd143d57ae", 1, 3, "int", &function_6ab142a9, 1, 0);
	clientfield::register("toplayer", "ammomod_cryofreeze_idle", 1, 3, "int", &function_c62bfdf2, 1, 0);
	clientfield::register("toplayer", "ammomod_napalmburst_idle", 1, 3, "int", &function_f745370f, 1, 0);
	clientfield::register("toplayer", "ammomod_brainrot_idle", 1, 3, "int", &function_7c325bd9, 1, 0);
	clientfield::register("toplayer", "ammomod_deadwire_idle", 1, 3, "int", &function_5cc517e6, 1, 0);
	level aat::function_2b3bcce0();
}

/*
	Name: function_74b823de
	Namespace: namespace_3e3637fc
	Checksum: 0xE22DB54
	Offset: 0x668
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function function_74b823de(tier)
{
	if(!isdefined(tier))
	{
		tier = 1;
	}
	switch(tier)
	{
		case 1:
		case 2:
		{
			return "rob_ammo_mod_level_1";
			break;
		}
		case 3:
		{
			return "rob_ammo_mod_level_2";
			break;
		}
		case 4:
		{
			return "rob_ammo_mod_level_3";
			break;
		}
		case 5:
		{
			return "rob_ammo_mod_level_4";
			break;
		}
		case 6:
		{
			return "rob_ammo_mod_level_5";
			break;
		}
	}
	return "rob_ammo_mod_level_1";
}

/*
	Name: function_ac9a87aa
	Namespace: namespace_3e3637fc
	Checksum: 0x42B4E326
	Offset: 0x748
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_ac9a87aa()
{
	if(isplayer(self))
	{
		self function_5d482e78("rob_ammo_mod_level_1");
		self function_5d482e78("rob_ammo_mod_level_2");
		self function_5d482e78("rob_ammo_mod_level_3");
		self function_5d482e78("rob_ammo_mod_level_4");
		self function_5d482e78("rob_ammo_mod_level_5");
	}
}

/*
	Name: function_c059fde4
	Namespace: namespace_3e3637fc
	Checksum: 0x6C9AF23
	Offset: 0x810
	Size: 0xE4
	Parameters: 3
	Flags: Linked
*/
function function_c059fde4(localclientnum, fx, tier)
{
	if(!isdefined(tier))
	{
		tier = 0;
	}
	self util::waittill_dobj(localclientnum);
	if(isplayer(self) && self hasdobj(localclientnum))
	{
		self function_ac9a87aa();
		self.var_8502e221 = playviewmodelfx(localclientnum, fx, "tag_fx1", 0);
		if(tier > 1)
		{
			self function_bf9d3071(function_74b823de(tier));
		}
	}
}

/*
	Name: function_c62bfdf2
	Namespace: namespace_3e3637fc
	Checksum: 0xF6601E84
	Offset: 0x900
	Size: 0xF4
	Parameters: 7
	Flags: Linked
*/
function function_c62bfdf2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump > 0)
	{
		self endon(#"death");
		waitframe(1);
		if(isdefined(self.var_8502e221))
		{
			killfx(fieldname, self.var_8502e221);
		}
		self function_c059fde4(fieldname, "zm_weapons/fx9_aat_cryofreeze_attachment_amb_1p", bwastimejump);
	}
	else
	{
		if(isdefined(self.var_8502e221))
		{
			killfx(fieldname, self.var_8502e221);
		}
		self function_ac9a87aa();
	}
}

/*
	Name: function_f745370f
	Namespace: namespace_3e3637fc
	Checksum: 0x57AF100A
	Offset: 0xA00
	Size: 0xF4
	Parameters: 7
	Flags: Linked
*/
function function_f745370f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump > 0)
	{
		self endon(#"death");
		waitframe(1);
		if(isdefined(self.var_8502e221))
		{
			killfx(fieldname, self.var_8502e221);
		}
		self function_c059fde4(fieldname, "zm_weapons/fx9_aat_burnination_attachment_amb_1p", bwastimejump);
	}
	else
	{
		if(isdefined(self.var_8502e221))
		{
			killfx(fieldname, self.var_8502e221);
		}
		self function_ac9a87aa();
	}
}

/*
	Name: function_7c325bd9
	Namespace: namespace_3e3637fc
	Checksum: 0x96A004E0
	Offset: 0xB00
	Size: 0xF4
	Parameters: 7
	Flags: Linked
*/
function function_7c325bd9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump > 0)
	{
		self endon(#"death");
		waitframe(1);
		if(isdefined(self.var_8502e221))
		{
			killfx(fieldname, self.var_8502e221);
		}
		self function_c059fde4(fieldname, "zm_weapons/fx9_aat_brain_rot_attachment_amb_1p", bwastimejump);
	}
	else
	{
		if(isdefined(self.var_8502e221))
		{
			killfx(fieldname, self.var_8502e221);
		}
		self function_ac9a87aa();
	}
}

/*
	Name: function_5cc517e6
	Namespace: namespace_3e3637fc
	Checksum: 0xF1BC3D04
	Offset: 0xC00
	Size: 0xF4
	Parameters: 7
	Flags: Linked
*/
function function_5cc517e6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump > 0)
	{
		self endon(#"death");
		waitframe(1);
		if(isdefined(self.var_8502e221))
		{
			killfx(fieldname, self.var_8502e221);
		}
		self function_c059fde4(fieldname, "zm_weapons/fx9_aat_dead_wire_attachment_amb_1p", bwastimejump);
	}
	else
	{
		if(isdefined(self.var_8502e221))
		{
			killfx(fieldname, self.var_8502e221);
		}
		self function_ac9a87aa();
	}
}

/*
	Name: function_6ab142a9
	Namespace: namespace_3e3637fc
	Checksum: 0xF354EE8F
	Offset: 0xD00
	Size: 0xF4
	Parameters: 7
	Flags: Linked
*/
function function_6ab142a9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump > 0)
	{
		self endon(#"death");
		waitframe(1);
		if(isdefined(self.var_8502e221))
		{
			killfx(fieldname, self.var_8502e221);
		}
		self function_c059fde4(fieldname, "zm_weapons/fx9_aat_shatterblast_attachment_amb_1p", bwastimejump);
	}
	else
	{
		if(isdefined(self.var_8502e221))
		{
			killfx(fieldname, self.var_8502e221);
		}
		self function_ac9a87aa();
	}
}

