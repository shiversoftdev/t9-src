#using scripts\zm_common\zm_utility.csc;
#using script_d67878983e3d7c;
#using script_4e53735256f112ac;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_ce9594c1;

/*
	Name: function_3bb041c4
	Namespace: namespace_ce9594c1
	Checksum: 0x401EDC05
	Offset: 0x258
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3bb041c4()
{
	level notify(44391550);
}

/*
	Name: __init__system__
	Namespace: namespace_ce9594c1
	Checksum: 0x5FC7E9EF
	Offset: 0x278
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_49946b57ce6e712f", &function_70a657d8, undefined, undefined, #"hash_13a43d760497b54d");
}

/*
	Name: function_70a657d8
	Namespace: namespace_ce9594c1
	Checksum: 0x264C2CD9
	Offset: 0x2C8
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("allplayers", "fx_frenzied_guard_player_clientfield", 9000, 1, "int", &function_dfadfc0e, 1, 0);
	clientfield::register("actor", "fx_frenzied_guard_actor_clientfield", 9000, 1, "int", &function_d3b68b9b, 1, 0);
}

/*
	Name: function_dfadfc0e
	Namespace: namespace_ce9594c1
	Checksum: 0x16122823
	Offset: 0x368
	Size: 0x31E
	Parameters: 7
	Flags: Linked
*/
function function_dfadfc0e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwastimejump)
	{
		if(!zm_utility::function_f8796df3(fieldname))
		{
			self.var_7b61d94d = function_239993de(fieldname, "zm_weapons/fx9_fld_frenzied_guard_head_3p", self, "j_head");
			self.var_ac385caa = function_239993de(fieldname, "zm_weapons/fx9_fld_frenzied_guard_torso_3p", self, "j_spine4");
		}
		else
		{
			if(!self postfx::function_556665f2("pstfx_zm_dying_wish"))
			{
				self postfx::playpostfxbundle(#"pstfx_zm_dying_wish");
			}
			if(!isdefined(self.var_cc84f2f5) && self function_da43934d())
			{
				self.var_cc84f2f5 = playfxoncamera(fieldname, "zm_weapons/fx9_fld_frenzied_guard_head_1p", (0, 0, 0), (1, 0, 0), (0, 0, 1));
			}
		}
		if(!isdefined(self.var_5ceafd03))
		{
			self playsound(fieldname, #"hash_3c448f01c0cd7e64");
			self.var_5ceafd03 = self playloopsound(#"hash_53e2a6691a758304");
		}
	}
	else
	{
		if(zm_utility::function_f8796df3(fieldname))
		{
			if(self postfx::function_556665f2("pstfx_zm_dying_wish"))
			{
				self postfx::stoppostfxbundle(#"pstfx_zm_dying_wish");
			}
		}
		if(isdefined(self.var_7b61d94d) && isdefined(self.var_ac385caa))
		{
			stopfx(fieldname, self.var_7b61d94d);
			stopfx(fieldname, self.var_ac385caa);
		}
		if(isdefined(self.var_5ceafd03))
		{
			self playsound(fieldname, #"hash_4b49ab981fdefe5d");
			self stoploopsound(self.var_5ceafd03);
			self.var_5ceafd03 = undefined;
		}
		if(isdefined(self.var_cc84f2f5))
		{
			stopfx(fieldname, self.var_cc84f2f5);
			self.var_cc84f2f5 = undefined;
		}
	}
}

/*
	Name: function_d3b68b9b
	Namespace: namespace_ce9594c1
	Checksum: 0x45E3CBD4
	Offset: 0x690
	Size: 0x2C6
	Parameters: 7
	Flags: Linked
*/
function function_d3b68b9b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwastimejump)
	{
		if(isdefined(self.archetype))
		{
			switch(self.archetype)
			{
				case "zombie_dog":
				{
					self.var_d1ed81ee = function_239993de(fieldname, "zm_weapons/fx9_fld_frenzied_guard_lvl5_enemy_slow", self, "j_ball_mid_le");
					self.var_c4f4d1e5 = function_239993de(fieldname, "zm_weapons/fx9_fld_frenzied_guard_lvl5_enemy_slow", self, "j_ball_mid_ri");
					self.var_62025f88 = function_239993de(fieldname, "zm_weapons/fx9_fld_frenzied_guard_lvl5_enemy_slow", self, "j_palm_mid_le");
					self.var_3a23707d = function_239993de(fieldname, "zm_weapons/fx9_fld_frenzied_guard_lvl5_enemy_slow", self, "j_palm_mid_ri");
					break;
				}
				case "zombie":
				{
					self.var_d1ed81ee = function_239993de(fieldname, "zm_weapons/fx9_fld_frenzied_guard_lvl5_enemy_slow", self, "j_ball_le");
					self.var_c4f4d1e5 = function_239993de(fieldname, "zm_weapons/fx9_fld_frenzied_guard_lvl5_enemy_slow", self, "j_ball_ri");
					break;
				}
			}
		}
		self.var_cd26d88f = self playloopsound(#"hash_58ee9d9df63d0294", undefined, vectorscale((0, 0, 1), 30));
	}
	else
	{
		if(isdefined(self.var_d1ed81ee))
		{
			stopfx(fieldname, self.var_d1ed81ee);
		}
		if(isdefined(self.var_c4f4d1e5))
		{
			stopfx(fieldname, self.var_c4f4d1e5);
		}
		if(isdefined(self.var_62025f88))
		{
			stopfx(fieldname, self.var_62025f88);
		}
		if(isdefined(self.var_3a23707d))
		{
			stopfx(fieldname, self.var_3a23707d);
		}
		if(isdefined(self.var_cd26d88f))
		{
			self stoploopsound(self.var_cd26d88f);
			self.var_cd26d88f = undefined;
		}
	}
}

