#using script_767fdceb6d7ef024;
#using script_1f38e4dd404966a1;
#using script_14cc8298d95c14a3;
#using script_53e6e796bb019ba1;
#using script_473313f86f37e854;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\aat_shared.csc;

#namespace zm_aat;

/*
	Name: __init__system__
	Namespace: zm_aat
	Checksum: 0x1E2596C3
	Offset: 0x2E0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_aat", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_aat
	Checksum: 0xF2884E62
	Offset: 0x328
	Size: 0x234
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
	clientfield::register("toplayer", "ammomod_cryofreeze_idle", 1, 3, "int", &function_c62bfdf2, 1, 0);
	clientfield::register("toplayer", "ammomod_napalmburst_idle", 1, 3, "int", &function_f745370f, 1, 0);
	clientfield::register("toplayer", "ammomod_brainrot_idle", 1, 3, "int", &function_7c325bd9, 1, 0);
	clientfield::register("toplayer", "ammomod_deadwire_idle", 1, 3, "int", &function_5cc517e6, 1, 0);
	level aat::function_2b3bcce0();
}

/*
	Name: function_74b823de
	Namespace: zm_aat
	Checksum: 0x47ECCA9
	Offset: 0x568
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
	Namespace: zm_aat
	Checksum: 0x47EB99D7
	Offset: 0x648
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_ac9a87aa()
{
	if(isplayer(self))
	{
		self stoprenderoverridebundle("rob_ammo_mod_level_1");
		self stoprenderoverridebundle("rob_ammo_mod_level_2");
		self stoprenderoverridebundle("rob_ammo_mod_level_3");
		self stoprenderoverridebundle("rob_ammo_mod_level_4");
		self stoprenderoverridebundle("rob_ammo_mod_level_5");
	}
}

/*
	Name: function_c059fde4
	Namespace: zm_aat
	Checksum: 0xF2C96C7C
	Offset: 0x710
	Size: 0xC4
	Parameters: 3
	Flags: Linked
*/
function function_c059fde4(localclientnum, fx, tier)
{
	if(!isdefined(tier))
	{
		tier = 0;
	}
	if(isplayer(self) && self hasdobj(localclientnum))
	{
		self function_ac9a87aa();
		self.var_8502e221 = playviewmodelfx(localclientnum, fx, "tag_fx1", 0);
		if(tier > 1)
		{
			self playrenderoverridebundle(function_74b823de(tier));
		}
	}
}

/*
	Name: function_c62bfdf2
	Namespace: zm_aat
	Checksum: 0x8ACCA32B
	Offset: 0x7E0
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
			stopfx(fieldname, self.var_8502e221);
		}
		self function_c059fde4(fieldname, "zm_weapons/fx9_aat_cryofreeze_attachment_amb_1p", bwastimejump);
	}
	else
	{
		if(isdefined(self.var_8502e221))
		{
			stopfx(fieldname, self.var_8502e221);
		}
		self function_ac9a87aa();
	}
}

/*
	Name: function_f745370f
	Namespace: zm_aat
	Checksum: 0x6ED24D63
	Offset: 0x8E0
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
			stopfx(fieldname, self.var_8502e221);
		}
		self function_c059fde4(fieldname, "zm_weapons/fx9_aat_burnination_attachment_amb_1p", bwastimejump);
	}
	else
	{
		if(isdefined(self.var_8502e221))
		{
			stopfx(fieldname, self.var_8502e221);
		}
		self function_ac9a87aa();
	}
}

/*
	Name: function_7c325bd9
	Namespace: zm_aat
	Checksum: 0x32DEC120
	Offset: 0x9E0
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
			stopfx(fieldname, self.var_8502e221);
		}
		self function_c059fde4(fieldname, "zm_weapons/fx9_aat_brain_rot_attachment_amb_1p", bwastimejump);
	}
	else
	{
		if(isdefined(self.var_8502e221))
		{
			stopfx(fieldname, self.var_8502e221);
		}
		self function_ac9a87aa();
	}
}

/*
	Name: function_5cc517e6
	Namespace: zm_aat
	Checksum: 0x252E876C
	Offset: 0xAE0
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
			stopfx(fieldname, self.var_8502e221);
		}
		self function_c059fde4(fieldname, "zm_weapons/fx9_aat_dead_wire_attachment_amb_1p", bwastimejump);
	}
	else
	{
		if(isdefined(self.var_8502e221))
		{
			stopfx(fieldname, self.var_8502e221);
		}
		self function_ac9a87aa();
	}
}

