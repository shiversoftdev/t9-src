#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_cb308359;

/*
	Name: function_e5262159
	Namespace: namespace_cb308359
	Checksum: 0x4E93C853
	Offset: 0x350
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e5262159()
{
	level notify(1378841877);
}

#namespace namespace_bff7ce85;

/*
	Name: main
	Namespace: namespace_bff7ce85
	Checksum: 0x62DBEE82
	Offset: 0x370
	Size: 0x33C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::register("scriptmover", "" + #"hash_cd445ad9f4974c7", 1, 1, "int", &function_471ae845, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_3c6d30dcb24fbef8", 1, 1, "int", &function_fb755c48, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_51c88d2d00905c2d", 1, 1, "int", &function_6115628b, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_225aa48dd3b91fe7", 1, 1, "int", &function_9fdbcf3f, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_5244004f911badae", 1, 1, "int", &function_5c922fb8, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_3eeee7f3f5bdb9ff", 1, 1, "counter", &function_7b661739, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_18bcf106c476dfeb", 1, 1, "counter", &function_32398bfc, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_186c35405f4624bc", 1, 2, "int", &function_968ccb74, 0, 0);
	clientfield::register("vehicle", "" + #"vehicle_teleport", 1, 1, "counter", &function_b0e818e8, 0, 0);
	util::waitforclient(0);
}

/*
	Name: function_6115628b
	Namespace: namespace_bff7ce85
	Checksum: 0x6AC277CC
	Offset: 0x6B8
	Size: 0xFE
	Parameters: 7
	Flags: Linked
*/
function function_6115628b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(!is_true(self.var_4839a4f1))
		{
			self.var_3310aa30 = util::playfxontag(fieldname, "sr/fx9_obj_console_defend_light_top_red", self, "tag_origin");
			self.var_4839a4f1 = 1;
		}
		else
		{
			util::playfxontag(fieldname, "sr/fx9_obj_console_defend_light_top_green", self, "tag_origin");
		}
	}
	else if(isdefined(self.var_3310aa30))
	{
		stopfx(fieldname, self.var_3310aa30);
		self.var_3310aa30 = undefined;
	}
}

/*
	Name: function_fb755c48
	Namespace: namespace_bff7ce85
	Checksum: 0x62743687
	Offset: 0x7C0
	Size: 0x132
	Parameters: 7
	Flags: Linked
*/
function function_fb755c48(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(isdefined(self.var_52b34507))
		{
			stopfx(fieldname, self.var_52b34507);
			self.var_52b34507 = undefined;
		}
		if(!is_true(self.var_71751fa0))
		{
			self.var_715359c = util::playfxontag(fieldname, "sr/fx9_obj_console_defend_screen_ri_on", self, "tag_origin");
			self.var_71751fa0 = 1;
		}
	}
	else
	{
		if(isdefined(self.var_715359c))
		{
			stopfx(fieldname, self.var_715359c);
			self.var_715359c = undefined;
		}
		self.var_52b34507 = util::playfxontag(fieldname, "sr/fx9_obj_console_defend_screen_ri_flicker", self, "tag_origin");
	}
}

/*
	Name: function_471ae845
	Namespace: namespace_bff7ce85
	Checksum: 0x1F4D4662
	Offset: 0x900
	Size: 0x132
	Parameters: 7
	Flags: Linked
*/
function function_471ae845(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(isdefined(self.var_c387008e))
		{
			stopfx(fieldname, self.var_c387008e);
			self.var_c387008e = undefined;
		}
		if(!is_true(self.var_5e062dbb))
		{
			self.var_188a7737 = util::playfxontag(fieldname, "sr/fx9_obj_console_defend_screen_le_on", self, "tag_origin");
			self.var_5e062dbb = 1;
		}
	}
	else
	{
		if(isdefined(self.var_188a7737))
		{
			stopfx(fieldname, self.var_188a7737);
			self.var_188a7737 = undefined;
		}
		self.var_c387008e = util::playfxontag(fieldname, "sr/fx9_obj_console_defend_screen_le_flicker", self, "tag_origin");
	}
}

/*
	Name: function_9fdbcf3f
	Namespace: namespace_bff7ce85
	Checksum: 0x366559ED
	Offset: 0xA40
	Size: 0x224
	Parameters: 7
	Flags: Linked
*/
function function_9fdbcf3f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_2a38de43 = util::playfxontag(fieldname, "sr/fx9_obj_console_defend_vat_amb", self, "tag_origin");
		playsound(fieldname, #"hash_4c3810ceaa5ffc33", self.origin + vectorscale((0, 0, 1), 50));
		self.var_847c4a7c = self playloopsound(#"hash_17bbbc791e17bbc5", undefined, vectorscale((0, 0, 1), 50));
	}
	else
	{
		if(isdefined(self.var_2a38de43))
		{
			stopfx(fieldname, self.var_2a38de43);
			self.var_2a38de43 = undefined;
		}
		if(isdefined(self.var_847c4a7c))
		{
			self stoploopsound(self.var_847c4a7c);
			self.var_847c4a7c = undefined;
		}
		self.var_dc761849 = self playloopsound(#"hash_6510ab3b31555de5", undefined, vectorscale((0, 0, 1), 50));
		playsound(fieldname, #"hash_789c0cb38cd0abb0", self.origin + vectorscale((0, 0, 1), 50));
		playsound(fieldname, #"hash_61887905bfa93f51", self.origin + vectorscale((0, 0, 1), 50));
		util::playfxontag(fieldname, "sr/fx9_obj_console_defend_head_gib", self, "tag_origin");
	}
}

/*
	Name: function_5c922fb8
	Namespace: namespace_bff7ce85
	Checksum: 0xD3E8588F
	Offset: 0xC70
	Size: 0x1B6
	Parameters: 7
	Flags: Linked
*/
function function_5c922fb8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self endon(#"death");
		self function_bf9d3071(#"hash_5e09fb8e239d3dd3");
		self function_78233d29(#"hash_5e09fb8e239d3dd3", "", "Brightness", 1);
		self function_78233d29(#"hash_5e09fb8e239d3dd3", "", "Tint", 1);
		self.var_7cf04bb1 = util::playfxontag(fieldname, "sr/fx9_obj_console_defend_vat_lights", self, "tag_tank_lights_d0");
		playsound(fieldname, #"hash_7907685913534e0", self.origin + vectorscale((0, 0, 1), 50));
	}
	else
	{
		self function_5d482e78(#"hash_5e09fb8e239d3dd3");
		if(isdefined(self.var_7cf04bb1))
		{
			stopfx(fieldname, self.var_7cf04bb1);
			self.var_7cf04bb1 = undefined;
		}
	}
}

/*
	Name: function_b0e818e8
	Namespace: namespace_bff7ce85
	Checksum: 0x715DB570
	Offset: 0xE30
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function function_b0e818e8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, "sr/fx9_obj_exploitative_teleporting", self, "tag_origin");
}

/*
	Name: function_7b661739
	Namespace: namespace_bff7ce85
	Checksum: 0xC94D94B0
	Offset: 0xEA0
	Size: 0x106
	Parameters: 7
	Flags: Linked
*/
function function_7b661739(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	playfx(bwastimejump, "explosions/fx8_exp_elec_killstreak", self.origin + vectorscale((0, 0, 1), 32), anglestoforward(self.angles), anglestoup(self.angles));
	if(isdefined(self.var_6631a14f))
	{
		self stoploopsound(self.var_6631a14f);
		self.var_6631a14f = undefined;
	}
	if(isdefined(self.var_6711e9c2))
	{
		self stoploopsound(self.var_6711e9c2);
		self.var_6711e9c2 = undefined;
	}
}

/*
	Name: function_e15dd642
	Namespace: namespace_bff7ce85
	Checksum: 0x4F9A88D3
	Offset: 0xFB0
	Size: 0x106
	Parameters: 7
	Flags: None
*/
function function_e15dd642(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, "explosions/fx9_exp_generic_lg", self, "tag_origin");
	playsound(bwastimejump, #"hash_37863fcbc135faa0", self.origin + vectorscale((0, 0, 1), 50));
	if(isdefined(self.var_6631a14f))
	{
		self stoploopsound(self.var_6631a14f);
		self.var_6631a14f = undefined;
	}
	if(isdefined(self.var_6711e9c2))
	{
		self stoploopsound(self.var_6711e9c2);
		self.var_6711e9c2 = undefined;
	}
}

/*
	Name: function_32398bfc
	Namespace: namespace_bff7ce85
	Checksum: 0xCF96AFEF
	Offset: 0x10C0
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function function_32398bfc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, "sr/fx9_obj_console_defend_dmg_os", self, "tag_origin");
	playsound(bwastimejump, #"hash_1ddeb8af5a217a6e", self.origin + vectorscale((0, 0, 1), 50));
	self thread function_356a7b78();
}

/*
	Name: function_356a7b78
	Namespace: namespace_bff7ce85
	Checksum: 0xB2CC6935
	Offset: 0x1180
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function function_356a7b78()
{
	self notify("1ecded79cbe06af5");
	self endon("1ecded79cbe06af5");
	if(!isdefined(self.var_6631a14f))
	{
		self.var_6631a14f = self playloopsound(#"hash_13e3f89e22beb505", undefined, vectorscale((0, 0, 1), 50));
	}
	wait(5);
	if(isdefined(self.var_6631a14f))
	{
		self stoploopsound(self.var_6631a14f);
		self.var_6631a14f = undefined;
	}
}

/*
	Name: function_968ccb74
	Namespace: namespace_bff7ce85
	Checksum: 0xD6AD731B
	Offset: 0x1228
	Size: 0x122
	Parameters: 7
	Flags: Linked
*/
function function_968ccb74(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_bccdae1e = util::playfxontag(fieldname, "sr/fx9_obj_console_defend_dmg_state_1", self, "tag_origin");
	}
	else if(bwastimejump == 2)
	{
		if(isdefined(self.var_bccdae1e))
		{
			stopfx(fieldname, self.var_bccdae1e);
		}
		self.var_f3fe9c83 = util::playfxontag(fieldname, "sr/fx9_obj_console_defend_dmg_state_2", self, "tag_origin");
		if(!isdefined(self.var_6711e9c2))
		{
			self.var_6711e9c2 = self playloopsound(#"hash_f32639ea79bff56", undefined, vectorscale((0, 0, 1), 50));
		}
	}
}

