#using script_4e53735256f112ac;
#using script_d67878983e3d7c;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_9111e6ab;

/*
	Name: function_19fa9c12
	Namespace: namespace_9111e6ab
	Checksum: 0x79636A37
	Offset: 0x150
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_19fa9c12()
{
	level notify(1317792240);
}

/*
	Name: function_89f2df9
	Namespace: namespace_9111e6ab
	Checksum: 0x8EC15BF2
	Offset: 0x170
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_6c156e681484d01a", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_9111e6ab
	Checksum: 0x3985EE5D
	Offset: 0x1C0
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("allplayers", "" + #"hash_1668fcf85f7c231", 1, 2, "int", &function_1e0fa475, 0, 0);
	clientfield::register("actor", "" + #"hash_70a85ea8b0e1b09c", 1, 2, "int", &function_9db3514d, 0, 0);
}

/*
	Name: function_1e0fa475
	Namespace: namespace_9111e6ab
	Checksum: 0x44188369
	Offset: 0x280
	Size: 0x774
	Parameters: 7
	Flags: Linked
*/
function function_1e0fa475(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(!isdefined(level.var_9ec7691e))
	{
		level.var_9ec7691e = [];
	}
	if(!isdefined(level.var_9ec7691e))
	{
		level.var_9ec7691e = [0:fieldname];
	}
	n_entity = self getentitynumber();
	if(!isdefined(level.var_9ec7691e[fieldname][n_entity]))
	{
		level.var_9ec7691e[fieldname][n_entity] = spawnstruct();
	}
	if(bwastimejump)
	{
		if(bwastimejump == 1)
		{
			self.var_60b31640 = 1;
		}
		else if(bwastimejump == 2 || bwastimejump == 3)
		{
			self.var_23fa23a9 = 1;
		}
		if(zm_utility::function_f8796df3(fieldname))
		{
			if(!isdefined(level.var_9ec7691e[fieldname][n_entity].var_6476182a) && self function_da43934d())
			{
				level.var_9ec7691e[fieldname][n_entity].var_6476182a = playfxoncamera(fieldname, #"hash_1ff29a0f4b4d68d", (0, 0, 0), (1, 0, 0), (0, 0, 1));
				level.var_9ec7691e[fieldname][n_entity].var_b8492ef8 = util::playfxontag(fieldname, #"hash_654db3650b20ca65", self, "j_spine4");
			}
		}
		else
		{
			if(!isdefined(level.var_9ec7691e[fieldname][n_entity].var_23899ee1))
			{
				level.var_9ec7691e[fieldname][n_entity].var_23899ee1 = util::playfxontag(fieldname, #"hash_7ac55bdd9d21f779", self, "j_head");
			}
			if(!isdefined(level.var_9ec7691e[fieldname][n_entity].var_9a99751c))
			{
				level.var_9ec7691e[fieldname][n_entity].var_9a99751c = util::playfxontag(fieldname, #"hash_a54ef74ae1528ab", self, "j_spine4");
			}
		}
		if(!isdefined(level.var_9ec7691e[fieldname][n_entity].var_f3844d4d))
		{
			self playsound(fieldname, #"hash_4ae03761643454de", self.origin + vectorscale((0, 0, 1), 75));
			level.var_9ec7691e[fieldname][n_entity].var_f3844d4d = self playloopsound(#"hash_29e3629ab48d4062", undefined, vectorscale((0, 0, 1), 75));
		}
		if(is_true(self.var_23fa23a9))
		{
			a_players = getplayers(fieldname, self.team, self.origin, 400);
			foreach(var_12a907ec in a_players)
			{
				if(var_12a907ec === self)
				{
					continue;
				}
				if(is_true(var_12a907ec.var_60b31640))
				{
					if(zm_utility::function_f8796df3(fieldname))
					{
						var_606b3e1 = self.origin;
						var_a31b967a = self.angles;
						var_a6939bee = 1;
					}
					else if(self haspart(fieldname, "j_spineupper"))
					{
						var_98dfaf9d = "j_spineupper";
						var_606b3e1 = self gettagorigin("j_spineupper");
						var_a31b967a = self gettagangles("j_spineupper");
					}
					if(var_12a907ec haspart(fieldname, "j_spineupper"))
					{
						var_9d127d90 = "j_spineupper";
					}
					if(is_true(var_a6939bee) || isdefined(var_98dfaf9d) && isdefined(var_9d127d90))
					{
						if(!isdefined(self.var_a2820ebf))
						{
							self.var_a2820ebf = util::spawn_model(fieldname, "tag_origin", var_606b3e1, var_a31b967a);
							self.var_a2820ebf notsolid();
							if(is_true(var_a6939bee))
							{
								self.var_a2820ebf linktocamera(4, (16, 0, -10), (0, 0, 0), 1);
								self.var_a2820ebf.var_a6939bee = 1;
							}
							else
							{
								self.var_a2820ebf linkto(self, var_98dfaf9d);
							}
						}
						if(!isdefined(self.var_ae02f041[fieldname][n_entity]))
						{
							self playsound(fieldname, #"hash_2924768fc653f982", self.origin + vectorscale((0, 0, 1), 75));
							self.var_ae02f041[fieldname][n_entity] = beam::function_cfb2f62a(fieldname, self.var_a2820ebf, "tag_origin", var_12a907ec, var_9d127d90, "beam9_zm_tesla_storm");
						}
						if(!isdefined(self.var_512656d8[fieldname][n_entity]))
						{
							self.var_512656d8[fieldname][n_entity] = beam::function_cfb2f62a(fieldname, self.var_a2820ebf, "tag_origin", var_12a907ec, var_9d127d90, "beam9_zm_tesla_storm_elec");
						}
					}
				}
			}
		}
	}
	else
	{
		self function_15de0a8a(fieldname);
	}
}

/*
	Name: function_15de0a8a
	Namespace: namespace_9111e6ab
	Checksum: 0x31426D5
	Offset: 0xA00
	Size: 0x434
	Parameters: 1
	Flags: Linked
*/
function function_15de0a8a(localclientnum)
{
	n_entity = self getentitynumber();
	self.var_60b31640 = undefined;
	self.var_23fa23a9 = undefined;
	self notify(#"hash_1b8c8f7116f233f2");
	if(self postfx::function_556665f2(#"hash_58e9d4772527f71a") && self function_21c0fa55())
	{
		self postfx::exitpostfxbundle(#"hash_58e9d4772527f71a");
	}
	if(isdefined(level.var_9ec7691e[localclientnum][n_entity].var_6476182a))
	{
		stopfx(localclientnum, level.var_9ec7691e[localclientnum][n_entity].var_6476182a);
		level.var_9ec7691e[localclientnum][n_entity].var_6476182a = undefined;
	}
	if(isdefined(level.var_9ec7691e[localclientnum][n_entity].var_b8492ef8))
	{
		stopfx(localclientnum, level.var_9ec7691e[localclientnum][n_entity].var_b8492ef8);
		level.var_9ec7691e[localclientnum][n_entity].var_b8492ef8 = undefined;
	}
	if(isdefined(level.var_9ec7691e[localclientnum][n_entity].var_23899ee1))
	{
		stopfx(localclientnum, level.var_9ec7691e[localclientnum][n_entity].var_23899ee1);
		level.var_9ec7691e[localclientnum][n_entity].var_23899ee1 = undefined;
	}
	if(isdefined(level.var_9ec7691e[localclientnum][n_entity].var_9a99751c))
	{
		stopfx(localclientnum, level.var_9ec7691e[localclientnum][n_entity].var_9a99751c);
		level.var_9ec7691e[localclientnum][n_entity].var_9a99751c = undefined;
	}
	if(isdefined(level.var_9ec7691e[localclientnum][n_entity].var_f3844d4d))
	{
		self playsound(localclientnum, #"hash_a4211e0f9977ecb", self.origin + vectorscale((0, 0, 1), 75));
		self stoploopsound(level.var_9ec7691e[localclientnum][n_entity].var_f3844d4d);
		level.var_9ec7691e[localclientnum][n_entity].var_f3844d4d = undefined;
	}
	if(isdefined(self.var_ae02f041[localclientnum][n_entity]))
	{
		self playsound(localclientnum, #"hash_26cf0ef2cb60a802", self.origin + vectorscale((0, 0, 1), 75));
		beam::function_47deed80(localclientnum, self.var_ae02f041[localclientnum][n_entity], self);
		self.var_ae02f041[localclientnum][n_entity] = undefined;
	}
	if(isdefined(self.var_512656d8[localclientnum][n_entity]))
	{
		beam::function_47deed80(localclientnum, self.var_512656d8[localclientnum][n_entity], self);
		self.var_512656d8[localclientnum][n_entity] = undefined;
	}
	if(isdefined(self.var_a2820ebf))
	{
		if(is_true(self.var_a2820ebf.var_a6939bee))
		{
			self.var_a2820ebf unlinkfromcamera();
		}
		self.var_a2820ebf delete();
	}
}

/*
	Name: function_9db3514d
	Namespace: namespace_9111e6ab
	Checksum: 0x9B87F602
	Offset: 0xE40
	Size: 0x2BE
	Parameters: 7
	Flags: Linked
*/
function function_9db3514d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		var_9879245b = #"hash_1b7434074de37b57";
		if(isdefined(self.archetype))
		{
			switch(self.archetype)
			{
				case "hash_7c0d83ac1e845ac2":
				{
					var_9879245b = #"hash_1bdd3e074e3c755e";
					break;
				}
				case "mechz":
				{
					var_9879245b = #"hash_685b3b698ec70340";
					break;
				}
				case "raz":
				{
					var_9879245b = #"hash_1bda5f074e3a779a";
					break;
				}
				case "mimic":
				{
					var_9879245b = #"hash_32f09fc1f3674574";
					break;
				}
				case "zombie_dog":
				case "zombie":
				case "avogadro":
				default:
				{
					var_9879245b = #"hash_1b7434074de37b57";
					break;
				}
			}
		}
		str_fx_tag = (isdefined(self gettagorigin("j_spine4")) ? "j_spine4" : "tag_origin");
		self.var_d6f26e4 = util::playfxontag(fieldname, var_9879245b, self, str_fx_tag);
		if(!isdefined(self.var_7c085d47))
		{
			self playsound(0, #"hash_20d0ecdd50323b09", self.origin + vectorscale((0, 0, 1), 50));
			self.var_7c085d47 = self playloopsound("zmb_ammomod_deadwire_stunned_lp");
		}
	}
	else
	{
		if(isdefined(self.var_d6f26e4))
		{
			stopfx(fieldname, self.var_d6f26e4);
			self.var_d6f26e4 = undefined;
		}
		if(isdefined(self.var_7c085d47))
		{
			self stoploopsound(self.var_7c085d47);
			self.var_7c085d47 = undefined;
		}
	}
}

