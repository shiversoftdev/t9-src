#using script_31816d064a53f516;
#using script_7d6dc1eb458198d1;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_f7b3ed9;

/*
	Name: function_cd25a68
	Namespace: namespace_f7b3ed9
	Checksum: 0x7335C56A
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cd25a68()
{
	level notify(1795003319);
}

/*
	Name: init
	Namespace: namespace_f7b3ed9
	Checksum: 0x61E93629
	Offset: 0x130
	Size: 0x32C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("scriptmover", "" + #"hash_4824b5ad2c6adfcf", 16000, 1, "int", &function_d6c6e6a4, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_33fa936b763918a", 16000, 1, "int", &function_81dcb526, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_4cf52ac8c941f331", 16000, 1, "int", &function_38a9e5d1, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_20b22d2242b107cc", 16000, 1, "int", &function_33827fb9, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_354f2f0ca110088b", 16000, 1, "counter", &function_773683a7, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_221e597b28199323", 16000, 1, "int", &function_a229f8c1, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_48cdaba6cfee3ee8", 16000, 1, "int", &function_4c4184dd, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_11d9c3835adcaece", 16000, 1, "int", &function_6909812d, 0, 0);
	clientfield::register("actor", "" + #"zombie_soul", 16000, 1, "int", &function_bb5d646a, 0, 0);
	namespace_72133e5::register();
}

/*
	Name: function_d6c6e6a4
	Namespace: namespace_f7b3ed9
	Checksum: 0x451D71F7
	Offset: 0x468
	Size: 0xE2
	Parameters: 7
	Flags: Linked
*/
function function_d6c6e6a4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(self.var_d6c6e6a4) && bwasdemojump == 0)
	{
		stopfx(fieldname, self.var_d6c6e6a4);
		self.var_d6c6e6a4 = undefined;
	}
	if(bwasdemojump == 1)
	{
		self.var_d6c6e6a4 = playfx(fieldname, #"hash_244ac8229348af01", self.origin + vectorscale((1, 0, 0), 10), (0, 0, 1), anglestoforward(self.angles));
	}
}

/*
	Name: function_81dcb526
	Namespace: namespace_f7b3ed9
	Checksum: 0xBF08A560
	Offset: 0x558
	Size: 0x142
	Parameters: 7
	Flags: Linked
*/
function function_81dcb526(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(self.var_d6c6e6a4) && bwasdemojump == 0)
	{
		stopfx(fieldname, self.var_81dcb526);
		self.var_d6c6e6a4 = undefined;
		if(isdefined(self.var_52f9dfc0))
		{
			self stoploopsound(self.var_52f9dfc0);
			self.var_52f9dfc0 = undefined;
		}
	}
	if(bwasdemojump == 1)
	{
		self.var_81dcb526 = playfx(fieldname, #"hash_7c6ddeef1245e0ea", self.origin + vectorscale((0, 0, 1), 30), (0, 0, 1), anglestoforward(self.angles));
		self.var_52f9dfc0 = self playloopsound(#"hash_184650f042012414");
	}
}

/*
	Name: function_a229f8c1
	Namespace: namespace_f7b3ed9
	Checksum: 0xC784F902
	Offset: 0x6A8
	Size: 0xEA
	Parameters: 7
	Flags: Linked
*/
function function_a229f8c1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(self.var_cd0913df) && bwasdemojump == 0)
	{
		stopfx(fieldname, self.var_cd0913df);
		self.var_cd0913df = undefined;
	}
	if(bwasdemojump == 1)
	{
		self.var_cd0913df = playfx(fieldname, #"hash_701ecdfd821cd48a", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
	}
}

/*
	Name: function_4c4184dd
	Namespace: namespace_f7b3ed9
	Checksum: 0xD37A11A8
	Offset: 0x7A0
	Size: 0xEA
	Parameters: 7
	Flags: Linked
*/
function function_4c4184dd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(self.var_f97e6b12) && bwasdemojump == 0)
	{
		stopfx(fieldname, self.var_f97e6b12);
		self.var_f97e6b12 = undefined;
	}
	if(bwasdemojump == 1)
	{
		self.var_f97e6b12 = playfx(fieldname, #"hash_775bd63fb3bba6d9", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
	}
}

/*
	Name: function_38a9e5d1
	Namespace: namespace_f7b3ed9
	Checksum: 0x66A03275
	Offset: 0x898
	Size: 0xEA
	Parameters: 7
	Flags: Linked
*/
function function_38a9e5d1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(self.var_f97e6b12) && bwasdemojump == 0)
	{
		stopfx(fieldname, self.var_f97e6b12);
		self.var_f97e6b12 = undefined;
	}
	if(bwasdemojump == 1)
	{
		self.var_f97e6b12 = playfx(fieldname, #"hash_7cdce0f11e01ab9e", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
	}
}

/*
	Name: function_33827fb9
	Namespace: namespace_f7b3ed9
	Checksum: 0x9170CA64
	Offset: 0x990
	Size: 0xEA
	Parameters: 7
	Flags: Linked
*/
function function_33827fb9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(self.var_cd0913df) && bwasdemojump == 0)
	{
		stopfx(fieldname, self.var_cd0913df);
		self.var_cd0913df = undefined;
	}
	if(bwasdemojump == 1)
	{
		self.var_cd0913df = playfx(fieldname, #"hash_7639dfd37e054d6b", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
	}
}

/*
	Name: function_773683a7
	Namespace: namespace_f7b3ed9
	Checksum: 0x377FCB9E
	Offset: 0xA88
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_773683a7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	playfx(bwasdemojump, #"hash_2fc05993f58131bf", self.origin + vectorscale((0, 0, 1), 32), anglestoforward(self.angles), anglestoup(self.angles));
}

/*
	Name: function_bb5d646a
	Namespace: namespace_f7b3ed9
	Checksum: 0x5362E73D
	Offset: 0xB38
	Size: 0x2E4
	Parameters: 7
	Flags: Linked
*/
function function_bb5d646a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	level endon(#"end_game");
	self util::waittill_dobj(bwasdemojump);
	if(!isdefined(self) || !isdefined(self.origin))
	{
		return;
	}
	self zombie_eye_glow::good_barricade_damaged(bwasdemojump);
	self function_bf9d3071(#"hash_9f31d2c3b11a51c");
	e_fx = util::spawn_model(bwasdemojump, "tag_origin", self gettagorigin("J_Spine4"));
	playsound(bwasdemojump, #"hash_61be08677fe8683", e_fx.origin);
	var_5e7d1e09 = struct::get_array("satellite_pos", "script_noteworthy");
	var_3edac3b4 = arraygetclosest(self.origin, var_5e7d1e09);
	util::playfxontag(bwasdemojump, #"zombie/fx9_onslaught_orb_soul", e_fx, "tag_origin");
	e_fx moveto(e_fx.origin + vectorscale((0, 0, 1), 40), 0.8);
	wait(0.75);
	n_time = distance(e_fx.origin, var_3edac3b4.origin) / 400;
	e_fx moveto(var_3edac3b4.origin + vectorscale((0, 0, 1), 50), n_time);
	e_fx waittill(#"movedone");
	util::playfxontag(bwasdemojump, #"maps/zm_red/fx8_soul_charge_purple", e_fx, "tag_origin");
	playsound(bwasdemojump, #"hash_77a638eb74142796", e_fx.origin);
	wait(0.3);
	e_fx delete();
}

/*
	Name: function_6909812d
	Namespace: namespace_f7b3ed9
	Checksum: 0x7C51C247
	Offset: 0xE28
	Size: 0xDC
	Parameters: 7
	Flags: Linked
*/
function function_6909812d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	self notify(#"hash_64be90d89f0d9c8b");
	if(isdefined(self.var_1caaf1f5))
	{
		stopfx(fieldname, self.var_1caaf1f5);
		self.var_1caaf1f5 = undefined;
	}
	if(isdefined(self.var_8666a1a7))
	{
		stopfx(fieldname, self.var_8666a1a7);
		self.var_8666a1a7 = undefined;
	}
	if(bwasdemojump)
	{
		self thread function_a93c81b4(fieldname);
	}
}

/*
	Name: function_a93c81b4
	Namespace: namespace_f7b3ed9
	Checksum: 0xF1FBFB1E
	Offset: 0xF10
	Size: 0x17A
	Parameters: 1
	Flags: Linked
*/
function function_a93c81b4(localclientnum)
{
	self notify("44eb4119b22c44f3");
	self endon("44eb4119b22c44f3");
	self endon(#"hash_64be90d89f0d9c8b");
	self.var_1caaf1f5 = playfx(localclientnum, #"hash_55dab9c7bb0687fa", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
	wait(0.3);
	playfx(localclientnum, #"sr/fx9_safehouse_orb_activate", self.origin + vectorscale((0, 0, 1), 30));
	wait(3 - 0.3);
	stopfx(localclientnum, self.var_1caaf1f5);
	self.var_1caaf1f5 = undefined;
	self.var_8666a1a7 = playfx(localclientnum, #"hash_6239842e77f124b4", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
}

