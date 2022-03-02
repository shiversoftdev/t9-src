#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\oob.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\vehicle_shared.csc;

#namespace hoverjet;

/*
	Name: function_437f3999
	Namespace: hoverjet
	Checksum: 0xA8AE7F99
	Offset: 0x158
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_437f3999()
{
	level notify(681842190);
}

/*
	Name: function_89f2df9
	Namespace: hoverjet
	Checksum: 0x90C3E8D7
	Offset: 0x178
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hoverjet", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: hoverjet
	Checksum: 0x7A062220
	Offset: 0x1C8
	Size: 0x2C4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "" + #"hash_312f8015c2d5dff", 1, 1, "int", &function_84c254b5, 0, 1);
	clientfield::register("toplayer", "" + #"hash_1a4b729551097abf", 1, 1, "int", &function_274341d, 0, 1);
	clientfield::register("vehicle", "" + #"hoverjet_crash", 1, 1, "int", &function_14ba47a8, 0, 0);
	clientfield::register("vehicle", "" + #"hash_623d35a1d3211bdb", 1, 2, "int", &function_bccb03b1, 0, 0);
	clientfield::register("vehicle", "" + #"hash_48b649c323ba0f95", 1, 1, "int", &function_ef49742c, 0, 1);
	clientfield::register("vehicle", "" + #"hash_228ec5a218e1d2f1", 1, 1, "int", &function_dd10e132, 0, 1);
	clientfield::register("vehicle", "" + #"hash_3a74d4ba3c54d57b", 1, 1, "int", &function_c73e5b73, 0, 0);
	level.var_1c0f10a2 = getscriptbundle("killstreak_hoverjet");
	if(!getdvarint(#"hash_4aad305a4a7f93db", 0))
	{
		level thread function_c2464efa();
	}
}

/*
	Name: function_c2464efa
	Namespace: hoverjet
	Checksum: 0x4A01095A
	Offset: 0x498
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_c2464efa()
{
	level endon(#"game_ended");
	wait(10);
	forcestreamxmodel(#"veh_t9_mil_ru_air_vtol_forger_cockpit", 8, 1);
}

/*
	Name: function_84c254b5
	Namespace: hoverjet
	Checksum: 0x920D8638
	Offset: 0x4F0
	Size: 0x1CE
	Parameters: 7
	Flags: Linked
*/
function function_84c254b5(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		forceambientroom("killstreak_hoverjet");
		self oob::function_93bd17f6("hoverjet", 10);
		level.var_b895ecc7 = self;
	}
	else
	{
		forceambientroom("");
		self oob::function_e2d18c01("hoverjet");
		if(isdefined(level.var_1c0f10a2.var_ee967929))
		{
			self stoprumble(fieldname, level.var_1c0f10a2.var_ee967929);
		}
		if(isdefined(level.var_1c0f10a2.var_6d078ad9))
		{
			self stoprumble(fieldname, level.var_1c0f10a2.var_6d078ad9);
		}
		if(isdefined(level.var_1c0f10a2.var_8af9fe2e))
		{
			self stoprumble(fieldname, level.var_1c0f10a2.var_8af9fe2e);
		}
		if(isdefined(level.var_1c0f10a2.var_936631a2))
		{
			self stoprumble(fieldname, level.var_1c0f10a2.var_936631a2);
		}
		level.var_b895ecc7 = undefined;
	}
}

/*
	Name: function_274341d
	Namespace: hoverjet
	Checksum: 0xA7683D13
	Offset: 0x6C8
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function function_274341d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(isdefined(level.var_1c0f10a2.var_936631a2))
		{
			self playrumblelooponentity(fieldname, level.var_1c0f10a2.var_936631a2);
		}
	}
	else if(isdefined(level.var_1c0f10a2.var_936631a2))
	{
		self stoprumble(fieldname, level.var_1c0f10a2.var_936631a2);
	}
}

/*
	Name: function_c73e5b73
	Namespace: hoverjet
	Checksum: 0x467AB5AE
	Offset: 0x7A8
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_c73e5b73(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self vehicle::play_boost(fieldname, 0, 10);
	}
}

/*
	Name: function_14ba47a8
	Namespace: hoverjet
	Checksum: 0x149FCBDE
	Offset: 0x828
	Size: 0x1F4
	Parameters: 7
	Flags: Linked
*/
function function_14ba47a8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(isdefined(level.var_b895ecc7))
		{
			util::playfxontag(fieldname, level.var_1c0f10a2.var_2d46d6c0, self, (isdefined(level.var_1c0f10a2.var_e9e2126d) ? level.var_1c0f10a2.var_e9e2126d : "tag_origin"));
			self playsound(fieldname, #"hash_af0ab88d6a59e01");
			if(isdefined(level.var_1c0f10a2.var_8af9fe2e))
			{
				if(isdefined(level.var_1c0f10a2.var_ee967929))
				{
					self stoprumble(fieldname, level.var_1c0f10a2.var_ee967929);
				}
				if(isdefined(level.var_1c0f10a2.var_6d078ad9))
				{
					self stoprumble(fieldname, level.var_1c0f10a2.var_6d078ad9);
				}
				level.var_b895ecc7 playrumblelooponentity(fieldname, level.var_1c0f10a2.var_8af9fe2e);
			}
		}
		else if(isdefined(level.var_1c0f10a2.var_2a77dc37))
		{
			util::playfxontag(fieldname, level.var_1c0f10a2.var_2a77dc37, self, "tag_origin");
		}
	}
}

/*
	Name: function_bccb03b1
	Namespace: hoverjet
	Checksum: 0x996B6817
	Offset: 0xA28
	Size: 0x254
	Parameters: 7
	Flags: Linked
*/
function function_bccb03b1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(isdefined(level.var_b895ecc7))
		{
			util::playfxontag(fieldname, level.var_1c0f10a2.var_d12d8a52, self, (isdefined(level.var_1c0f10a2.var_8d671961) ? level.var_1c0f10a2.var_8d671961 : "tag_origin"));
			util::playfxontag(fieldname, #"hash_722cac26eb755783", self, "tag_fx_cockpit_light_red_02");
			if(isdefined(level.var_1c0f10a2.var_ee967929))
			{
				level.var_b895ecc7 playrumblelooponentity(fieldname, level.var_1c0f10a2.var_ee967929);
			}
		}
	}
	else if(bwastimejump == 2)
	{
		if(isdefined(level.var_b895ecc7))
		{
			util::playfxontag(fieldname, level.var_1c0f10a2.var_cd76f3e4, self, (isdefined(level.var_1c0f10a2.var_f19af650) ? level.var_1c0f10a2.var_f19af650 : "tag_origin"));
			util::playfxontag(fieldname, #"hash_14b9625120f46bea", self, "tag_fx_cockpit_light_red_01");
			if(isdefined(level.var_1c0f10a2.var_6d078ad9))
			{
				if(isdefined(level.var_1c0f10a2.var_ee967929))
				{
					self stoprumble(fieldname, level.var_1c0f10a2.var_ee967929);
				}
				level.var_b895ecc7 playrumblelooponentity(fieldname, level.var_1c0f10a2.var_6d078ad9);
			}
		}
	}
}

/*
	Name: function_ef49742c
	Namespace: hoverjet
	Checksum: 0x6CFC0680
	Offset: 0xC88
	Size: 0xDE
	Parameters: 7
	Flags: Linked
*/
function function_ef49742c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump)
	{
		if(!isdefined(self.var_673cf7c4))
		{
			self.var_673cf7c4 = function_239993de(fieldname, #"hash_74f45a8f31432826", self, "tag_fx_cockpit_lockon_light");
		}
	}
	else if(isdefined(self.var_673cf7c4))
	{
		stopfx(fieldname, self.var_673cf7c4);
		self.var_673cf7c4 = undefined;
	}
}

/*
	Name: function_dd10e132
	Namespace: hoverjet
	Checksum: 0x70A60EA3
	Offset: 0xD70
	Size: 0xDE
	Parameters: 7
	Flags: Linked
*/
function function_dd10e132(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump)
	{
		if(!isdefined(self.var_faf1dc90))
		{
			self.var_faf1dc90 = function_239993de(fieldname, #"hash_1a0a27e117c4ccae", self, "tag_fx_cockpit_enemy_lock");
		}
	}
	else if(isdefined(self.var_faf1dc90))
	{
		stopfx(fieldname, self.var_faf1dc90);
		self.var_faf1dc90 = undefined;
	}
}

