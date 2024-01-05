#using script_14d2d89964cae0b1;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\aat_shared.csc;

#namespace ammomod_brainrot;

/*
	Name: function_9384b521
	Namespace: ammomod_brainrot
	Checksum: 0x669A724D
	Offset: 0x2F0
	Size: 0x2AC
	Parameters: 0
	Flags: Linked
*/
function function_9384b521()
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	aat::register("ammomod_brainrot", #"hash_1376180f99aa80c1", "ui_icon_zombie_ammomod_brainrot");
	aat::register("ammomod_brainrot_1", #"hash_1376180f99aa80c1", "ui_icon_zombie_ammomod_brainrot");
	aat::register("ammomod_brainrot_2", #"hash_1376180f99aa80c1", "ui_icon_zombie_ammomod_brainrot");
	aat::register("ammomod_brainrot_3", #"hash_1376180f99aa80c1", "ui_icon_zombie_ammomod_brainrot");
	aat::register("ammomod_brainrot_4", #"hash_1376180f99aa80c1", "ui_icon_zombie_ammomod_brainrot");
	aat::register("ammomod_brainrot_5", #"hash_1376180f99aa80c1", "ui_icon_zombie_ammomod_brainrot");
	clientfield::register("actor", "ammomod_brainrot", 1, 1, "int", &function_d500905a, 0, 0);
	clientfield::register("vehicle", "ammomod_brainrot", 1, 1, "int", &function_d500905a, 0, 0);
	clientfield::register("actor", "zm_ammomod_brainrot_exp", 1, 1, "counter", &function_1d8434b9, 0, 0);
	clientfield::register("vehicle", "zm_ammomod_brainrot_exp", 1, 1, "counter", &function_1d8434b9, 0, 0);
	clientfield::register("toplayer", "ammomod_brainrot_proc", 1, 1, "counter", &function_e437bd26, 1, 0);
}

/*
	Name: function_e437bd26
	Namespace: ammomod_brainrot
	Checksum: 0x7B1D505C
	Offset: 0x5A8
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function function_e437bd26(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	playviewmodelfx(bwastimejump, #"hash_3538aa737ab364c7", "tag_fx1", 0);
}

/*
	Name: function_d500905a
	Namespace: ammomod_brainrot
	Checksum: 0xB72FBD1B
	Offset: 0x618
	Size: 0x3D4
	Parameters: 7
	Flags: Linked
*/
function function_d500905a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self renderoverridebundle::function_c8d97b8e(fieldname, #"zm_friendly", #"hash_4e9065fcc3da0f7f");
	if(bwastimejump)
	{
		self setdrawname(#"hash_3bbbc2abb11e8ec1", 1);
		if(!gibclientutils::isgibbed(fieldname, self, 8))
		{
			if(isdefined(self gettagorigin("j_eyeball_le")))
			{
				if(self.archetype === #"avogadro")
				{
					self.var_d59aa7bb = util::playfxontag(fieldname, "zm_weapons/fx9_aat_brain_rot_lvl1_mc_avo_eye", self, "j_eyeball_le");
				}
				else
				{
					if(self.archetype === #"zombie_dog")
					{
						if(self.var_9fde8624 == #"hash_28e36e7b7d5421f")
						{
							self.var_d59aa7bb = util::playfxontag(fieldname, "zm_weapons/fx9_aat_brain_rot_lvl1_mc_hound_hell_eye", self, "j_eyeball_le");
						}
						if(self.var_9fde8624 == #"hash_2a5479b83161cb35")
						{
							self.var_d59aa7bb = util::playfxontag(fieldname, "zm_weapons/fx9_aat_brain_rot_lvl1_mc_hound_plague_eye", self, "j_eyeball_le");
						}
					}
					else
					{
						self.var_d59aa7bb = util::playfxontag(fieldname, "zm_weapons/fx9_aat_brain_rot_lvl1_mc_eye", self, "j_eyeball_le");
					}
				}
			}
		}
		if(isdefined(self gettagorigin("j_spine4")))
		{
			self.var_6e431702 = util::playfxontag(fieldname, "zm_weapons/fx9_aat_brain_rot_lvl1_mc_torso", self, "j_spine4");
		}
		if(!isdefined(self.var_85f16cb5))
		{
			self playsound(fieldname, #"hash_2d155a1b76096d88");
			self.var_85f16cb5 = self playloopsound(#"hash_530331283b555ef9");
		}
		if(isdefined(self.var_5da36454))
		{
			self [[self.var_5da36454]](fieldname, bwastimejump);
		}
	}
	else
	{
		if(isdefined(self.var_d59aa7bb))
		{
			stopfx(fieldname, self.var_d59aa7bb);
			self.var_d59aa7bb = undefined;
		}
		if(isdefined(self.var_8a31e8f))
		{
			stopfx(fieldname, self.var_8a31e8f);
			self.var_8a31e8f = undefined;
		}
		if(isdefined(self.var_6e431702))
		{
			stopfx(fieldname, self.var_6e431702);
			self.var_6e431702 = undefined;
		}
		if(isdefined(self.var_85f16cb5))
		{
			self stoploopsound(self.var_85f16cb5);
			self.var_85f16cb5 = undefined;
		}
		if(isdefined(self.var_5da36454))
		{
			self [[self.var_5da36454]](fieldname, bwastimejump);
		}
	}
}

/*
	Name: function_b9c917cc
	Namespace: ammomod_brainrot
	Checksum: 0xF83504D4
	Offset: 0x9F8
	Size: 0x70
	Parameters: 2
	Flags: None
*/
function function_b9c917cc(localclientnum, str_bundle)
{
	if(!self function_ca024039() || is_true(level.var_dc60105c) || isigcactive(str_bundle))
	{
		return false;
	}
	return true;
}

/*
	Name: function_1d8434b9
	Namespace: ammomod_brainrot
	Checksum: 0x3EF97DFD
	Offset: 0xA70
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_1d8434b9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self gettagorigin("j_head")))
	{
		util::playfxontag(bwastimejump, "zm_weapons/fx9_aat_brain_rot_lvl5_aoe", self, "j_head");
	}
	self playsound(0, #"hash_70173e20912069e7");
}

