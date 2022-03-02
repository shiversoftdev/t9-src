#using script_14d2d89964cae0b1;
#using scripts\core_common\aat_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace ammomod_napalmburst;

/*
	Name: function_4e4244c1
	Namespace: ammomod_napalmburst
	Checksum: 0xF8F8C342
	Offset: 0x628
	Size: 0x604
	Parameters: 0
	Flags: Linked
*/
function function_4e4244c1()
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	aat::register("ammomod_napalmburst", #"hash_4fa799a70f7f113d", "ui_icon_zombie_ammomod_napalmburst");
	aat::register("ammomod_napalmburst_1", #"hash_4fa799a70f7f113d", "ui_icon_zombie_ammomod_napalmburst");
	aat::register("ammomod_napalmburst_2", #"hash_4fa799a70f7f113d", "ui_icon_zombie_ammomod_napalmburst");
	aat::register("ammomod_napalmburst_3", #"hash_4fa799a70f7f113d", "ui_icon_zombie_ammomod_napalmburst");
	aat::register("ammomod_napalmburst_4", #"hash_4fa799a70f7f113d", "ui_icon_zombie_ammomod_napalmburst");
	aat::register("ammomod_napalmburst_5", #"hash_4fa799a70f7f113d", "ui_icon_zombie_ammomod_napalmburst");
	clientfield::register("actor", "zm_ammomod_napalmburst_explosion", 1, 1, "counter", &function_c8e3a0dc, 0, 0);
	clientfield::register("vehicle", "zm_ammomod_napalmburst_explosion", 1, 1, "counter", &function_c8e3a0dc, 0, 0);
	clientfield::register("actor", "zm_ammomod_napalmburst_burn", 1, 1, "int", &function_f3b43353, 0, 0);
	clientfield::register("vehicle", "zm_ammomod_napalmburst_burn", 1, 1, "int", &function_2d64f265, 0, 0);
	clientfield::register("toplayer", "ammomod_napalmburst_proc", 1, 1, "counter", &function_15482148, 1, 0);
	function_c487d6b1(#"zombie", "zm_weapons/fx9_aat_burnination_lvl1_fire_zmb_arm_left", "j_shoulder_le", 32);
	function_c487d6b1(#"zombie", "zm_weapons/fx9_aat_burnination_lvl1_fire_zmb_arm_right", "j_shoulder_ri", 16);
	function_c487d6b1(#"zombie", "zm_weapons/fx9_aat_burnination_lvl1_fire_zmb_head", "j_head", 8);
	function_c487d6b1(#"zombie", "zm_weapons/fx9_aat_burnination_lvl1_fire_zmb_hip_left", "j_hip_le", 256);
	function_c487d6b1(#"zombie", "zm_weapons/fx9_aat_burnination_lvl1_fire_zmb_hip_right", "j_hip_ri", 128);
	function_c487d6b1(#"zombie", "zm_weapons/fx9_aat_burnination_lvl1_fire_zmb_leg_left", "j_knee_le", 256);
	function_c487d6b1(#"zombie", "zm_weapons/fx9_aat_burnination_lvl1_fire_zmb_leg_right", "j_knee_ri", 128);
	function_c487d6b1(#"zombie", "zm_weapons/fx9_aat_burnination_lvl1_fire_zmb_waist", "j_spinelower", undefined);
	function_c487d6b1(#"zombie", "zm_weapons/fx9_aat_burnination_lvl1_fire_zmb_torso", "j_spine4", undefined);
	function_c487d6b1(#"zombie_dog", "zm_weapons/fx9_aat_burnination_lvl1_fire_hound_torso", "j_spine4", undefined);
	function_c487d6b1(#"raz", "zm_weapons/fx9_aat_burnination_lvl1_fire_raz_hip_left", "j_hip_le", 256);
	function_c487d6b1(#"raz", "zm_weapons/fx9_aat_burnination_lvl1_fire_raz_hip_right", "j_hip_ri", 128);
	function_c487d6b1(#"raz", "zm_weapons/fx9_aat_burnination_lvl1_fire_raz_leg_left", "j_knee_le", 256);
	function_c487d6b1(#"raz", "zm_weapons/fx9_aat_burnination_lvl1_fire_raz_leg_right", "j_knee_ri", 128);
	function_c487d6b1(#"raz", "zm_weapons/fx9_aat_burnination_lvl1_fire_raz_waist", "j_spinelower", undefined);
	function_c487d6b1(#"raz", "zm_weapons/fx9_aat_burnination_lvl1_fire_raz_torso", "j_spine4", undefined);
}

/*
	Name: function_15482148
	Namespace: ammomod_napalmburst
	Checksum: 0x4200450
	Offset: 0xC38
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function function_15482148(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	playviewmodelfx(bwastimejump, #"hash_308bd3bf83b35604", "tag_fx1", 0);
}

/*
	Name: function_c487d6b1
	Namespace: ammomod_napalmburst
	Checksum: 0xDDB21570
	Offset: 0xCA8
	Size: 0xC2
	Parameters: 4
	Flags: Linked
*/
function function_c487d6b1(archetype, fx, joint, gibflag)
{
	if(!isdefined(level.var_fd6cbce7))
	{
		level.var_fd6cbce7 = [];
	}
	if(!isdefined(level.var_fd6cbce7[archetype]))
	{
		level.var_fd6cbce7[archetype] = [];
	}
	level.var_fd6cbce7[archetype][fx] = spawnstruct();
	level.var_fd6cbce7[archetype][fx].joint = joint;
	level.var_fd6cbce7[archetype][fx].gibflag = gibflag;
}

/*
	Name: function_c8e3a0dc
	Namespace: ammomod_napalmburst
	Checksum: 0x5446D10B
	Offset: 0xD78
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function function_c8e3a0dc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self))
	{
		str_tag = (isdefined(self gettagorigin("j_spine4")) ? "j_spine4" : "tag_origin");
		self playsound(bwastimejump, #"hash_1b3441156c512173");
		self util::playfxontag(bwastimejump, "zm_weapons/fx9_aat_burnination_lvl5_aoe", self, str_tag);
	}
}

/*
	Name: function_f3b43353
	Namespace: ammomod_napalmburst
	Checksum: 0xFAF1CA39
	Offset: 0xE58
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_f3b43353(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self function_a681160a(fieldname);
	}
	else
	{
		self function_725a593f(fieldname);
	}
}

/*
	Name: function_2d64f265
	Namespace: ammomod_napalmburst
	Checksum: 0x9B9835C1
	Offset: 0xED8
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function function_2d64f265(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self function_a681160a(fieldname, 1);
	}
	else
	{
		self function_725a593f(fieldname);
	}
}

/*
	Name: function_a681160a
	Namespace: ammomod_napalmburst
	Checksum: 0x3ACFF223
	Offset: 0xF60
	Size: 0x382
	Parameters: 2
	Flags: Linked
*/
function function_a681160a(localclientnum, is_vehicle)
{
	if(!isdefined(is_vehicle))
	{
		is_vehicle = 0;
	}
	if(is_vehicle)
	{
		str_tag = (isdefined(self gettagorigin("tag_body")) ? "tag_body" : "tag_origin");
		self.var_b1312f24 = util::playfxontag(localclientnum, "zm_weapons/fx9_aat_burnination_lvl1_fire_zmb_torso", self, str_tag);
	}
	else
	{
		if(isdefined(self.var_9bdf44ae))
		{
			function_725a593f();
		}
		if(!isdefined(self.var_9bdf44ae))
		{
			self.var_9bdf44ae = [];
			if(isarray(level.var_fd6cbce7[self.archetype]))
			{
				foreach(fx in level.var_fd6cbce7[self.archetype])
				{
					if(isdefined(fx.gibflag))
					{
						if(isdefined(self gettagorigin(fx.joint)) && !gibclientutils::isgibbed(localclientnum, self, fx.gibflag))
						{
							fxid = util::playfxontag(localclientnum, i, self, fx.joint);
							if(!isdefined(self.var_9bdf44ae))
							{
								self.var_9bdf44ae = [];
							}
							else if(!isarray(self.var_9bdf44ae))
							{
								self.var_9bdf44ae = array(self.var_9bdf44ae);
							}
							self.var_9bdf44ae[self.var_9bdf44ae.size] = fxid;
						}
						continue;
					}
					if(isdefined(self gettagorigin(fx.joint)))
					{
						fxid = util::playfxontag(localclientnum, i, self, fx.joint);
						if(!isdefined(self.var_9bdf44ae))
						{
							self.var_9bdf44ae = [];
						}
						else if(!isarray(self.var_9bdf44ae))
						{
							self.var_9bdf44ae = array(self.var_9bdf44ae);
						}
						self.var_9bdf44ae[self.var_9bdf44ae.size] = fxid;
					}
				}
			}
		}
	}
	if(!isdefined(self.var_428ce87c))
	{
		self playsound(localclientnum, #"hash_60984c7920920c54", self.origin + vectorscale((0, 0, 1), 50));
		self.var_428ce87c = self playloopsound(#"hash_aed7c693cd1b7cd");
	}
}

/*
	Name: function_725a593f
	Namespace: ammomod_napalmburst
	Checksum: 0x2D959C30
	Offset: 0x12F0
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function function_725a593f(localclientnum)
{
	if(isdefined(self.var_428ce87c))
	{
		self stoploopsound(self.var_428ce87c);
	}
	if(isdefined(self.var_9bdf44ae))
	{
		foreach(fxid in self.var_9bdf44ae)
		{
			stopfx(localclientnum, fxid);
		}
		self.var_9bdf44ae = undefined;
	}
}

