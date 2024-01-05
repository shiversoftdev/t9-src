#using scripts\zm_common\zm_utility.csc;
#using script_2c8fd33ddb45e78b;
#using script_d5fbb947291463c;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_f0b43eb5;

/*
	Name: function_cd3a1365
	Namespace: namespace_f0b43eb5
	Checksum: 0xDD0337D0
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cd3a1365()
{
	level notify(1319857722);
}

/*
	Name: __init__system__
	Namespace: namespace_f0b43eb5
	Checksum: 0xBEAE344C
	Offset: 0x128
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_1c32fc6c324d3e66", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_f0b43eb5
	Checksum: 0x83979B4B
	Offset: 0x170
	Size: 0x294
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::function_36e7b4a2())
	{
		return;
	}
	level.var_996e8a57 = zm_dac_challenges_hud::register();
	if(zm_utility::is_survival())
	{
		level.var_957b495e = 300;
	}
	else
	{
		level.var_957b495e = 90;
	}
	clientfield::register("scriptmover", "" + #"hash_653b5827e6fbe5f9", 1, 1, "int", &function_2d368ee, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_21f5fab6a3d22093", 1, 3, "int", &function_9ed71eeb, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_3dbe7851af541017", 1, 1, "int", &function_7cae1028, 0, 0);
	clientfield::register("toplayer", "" + #"hash_31bea9cf1e6f76a0", 1, getminbitcountfornum(level.var_957b495e), "int", &function_bb753058, 0, 1);
	clientfield::register("toplayer", "" + #"hash_216c75103f478671", 1, 4, "int", &function_b5557b14, 0, 0);
	if(zm_utility::is_survival())
	{
		clientfield::register("scriptmover", "" + #"hash_33c54759cc1e7a71", 1, 1, "int", &function_dd279aeb, 0, 0);
	}
}

/*
	Name: function_dbc7fe67
	Namespace: namespace_f0b43eb5
	Checksum: 0x555D683D
	Offset: 0x410
	Size: 0x80
	Parameters: 7
	Flags: None
*/
function function_dbc7fe67(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(!isdefined(level.var_806707ab))
	{
		level.var_806707ab = [];
	}
	self.var_e41b2a3f = bwasdemojump;
	level.var_806707ab[level.var_806707ab.size] = self;
}

/*
	Name: function_9ed71eeb
	Namespace: namespace_f0b43eb5
	Checksum: 0xF09B341C
	Offset: 0x498
	Size: 0x232
	Parameters: 7
	Flags: Linked
*/
function function_9ed71eeb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.var_9c32107c))
	{
		stopfx(fieldname, self.var_9c32107c);
		self.var_9c32107c = undefined;
	}
	if(!isdefined(self.v_pos))
	{
		self.v_pos = self.origin + (vectorscale((0, 0, -1), 20));
		self.v_up = (0, 0, 1);
		self.v_forward = anglestoforward(self.angles);
	}
	switch(bwastimejump)
	{
		case 0:
		{
			break;
		}
		case 1:
		{
			self.var_9c32107c = playfx(fieldname, #"hash_6872157c3765f00c", self.v_pos, self.v_up, self.v_forward);
			break;
		}
		case 2:
		{
			self.var_9c32107c = playfx(fieldname, #"hash_31e1237ef42f8fd", self.v_pos, self.v_up, self.v_forward);
			break;
		}
		case 3:
		{
			self.var_9c32107c = playfx(fieldname, #"hash_67b599a0909158ef", self.v_pos, self.v_up, self.v_forward);
			break;
		}
		case 4:
		{
			self.var_9c32107c = playfx(fieldname, #"hash_6df17892ee107cdb", self.v_pos, self.v_up, self.v_forward);
			break;
		}
	}
}

/*
	Name: function_2d368ee
	Namespace: namespace_f0b43eb5
	Checksum: 0x80BBE62F
	Offset: 0x6D8
	Size: 0xAE
	Parameters: 7
	Flags: Linked
*/
function function_2d368ee(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		self.var_2d368ee = playfx(fieldname, #"hash_5e119c0907721bc6", self.origin);
	}
	if(bwasdemojump == 0)
	{
		stopfx(fieldname, self.var_2d368ee);
		self.var_2d368ee = undefined;
	}
}

/*
	Name: function_7cae1028
	Namespace: namespace_f0b43eb5
	Checksum: 0x1AC892D2
	Offset: 0x790
	Size: 0x7A
	Parameters: 7
	Flags: Linked
*/
function function_7cae1028(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		self.var_7cae1028 = util::playfxontag(fieldname, #"hash_5e119c0907721bc6", self, "tag_origin");
	}
}

/*
	Name: function_bb753058
	Namespace: namespace_f0b43eb5
	Checksum: 0x720E6BA
	Offset: 0x818
	Size: 0x12C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_bb753058(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!function_65b9eb0f(binitialsnap))
	{
		timer_model = function_c8b7588d(binitialsnap);
		end_time = undefined;
		if(!bwastimejump && fieldname == 0 && isdefined(level.var_fba33a1b))
		{
			end_time = level.var_fba33a1b;
		}
		else
		{
			duration_msec = fieldname * 1000;
			level.var_fba33a1b = getservertime(binitialsnap, 1) + duration_msec;
			end_time = level.var_fba33a1b;
		}
		if(isdefined(end_time))
		{
			setuimodelvalue(timer_model, end_time);
		}
	}
}

/*
	Name: function_c8b7588d
	Namespace: namespace_f0b43eb5
	Checksum: 0xA371D8A5
	Offset: 0x950
	Size: 0x42
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c8b7588d(localclientnum)
{
	return createuimodel(function_1df4c3b0(localclientnum, #"zm_hud"), "zmRedChallengeTimer");
}

/*
	Name: function_dd279aeb
	Namespace: namespace_f0b43eb5
	Checksum: 0x863B294B
	Offset: 0x9A0
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_dd279aeb(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(level.var_e915a27))
		{
			level.var_e915a27 = util::spawn_model(fieldname, "tag_origin", self.origin, self.angles);
			level.var_e915a27.targetname = "trial_terminal_screen";
		}
	}
	else if(isdefined(level.var_e915a27))
	{
		level.var_e915a27 delete();
	}
}

/*
	Name: function_b5557b14
	Namespace: namespace_f0b43eb5
	Checksum: 0x63F81999
	Offset: 0xA78
	Size: 0x3CC
	Parameters: 7
	Flags: Linked
*/
function function_b5557b14(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(function_65b9eb0f(fieldname))
	{
		return;
	}
	var_e915a27 = getent(fieldname, "trial_terminal_screen", "targetname");
	if(!isdefined(var_e915a27))
	{
		return;
	}
	switch(bwastimejump)
	{
		case 0:
		{
			str_model = #"hash_c9bba46978e6d6e";
			break;
		}
		case 1:
		{
			str_model = #"hash_3408d07d4023960a";
			break;
		}
		case 2:
		{
			str_model = #"hash_22c3f2b14a8af39";
			break;
		}
		case 3:
		{
			str_model = #"hash_78d1631457df7faa";
			break;
		}
		case 4:
		{
			str_model = #"hash_51840445e2753066";
			break;
		}
		case 5:
		{
			var_d5fa8477 = self namespace_4abf1500::function_2bcfd899(fieldname, #"hash_71c51f24f7f3037d");
			str_model = namespace_4abf1500::function_12e3769(var_d5fa8477);
			str_model = (isdefined(str_model) ? str_model : #"hash_51840445e2753066");
			/#
				iprintlnbold("");
			#/
			break;
		}
		case 6:
		{
			str_model = #"hash_75170f904e96e8ef";
			break;
		}
		case 7:
		{
			var_d5fa8477 = self namespace_4abf1500::function_2bcfd899(fieldname, #"hash_71c51f24f7f3037d", #"audiolog");
			str_model = namespace_4abf1500::function_12e3769(var_d5fa8477);
			str_model = (isdefined(str_model) ? str_model : #"p9_sur_machine_computer_screen_no_play_prog");
			/#
				iprintlnbold("");
			#/
			break;
		}
		case 8:
		{
			str_model = #"hash_26ea0b5ffb8178c6";
			break;
		}
		case 9:
		{
			var_d5fa8477 = self namespace_4abf1500::function_2bcfd899(fieldname, #"hash_71c51f24f7f3037d");
			str_model = namespace_4abf1500::function_12e3769(var_d5fa8477);
			str_model = (isdefined(str_model) ? str_model : #"hash_30acea553928ba42");
			/#
				iprintlnbold("");
			#/
			break;
		}
	}
	if(isdefined(str_model))
	{
		var_e915a27 setmodel(str_model);
		zm_utility::function_ca960904(var_e915a27);
	}
}

