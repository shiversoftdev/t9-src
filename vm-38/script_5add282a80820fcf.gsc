#using scripts\core_common\system_shared.csc;
#using script_ac6a30f1991e105;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace mechz;

/*
	Name: function_4bd5da5
	Namespace: mechz
	Checksum: 0x59D49C43
	Offset: 0x598
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4bd5da5()
{
	level notify(-1718873326);
}

/*
	Name: __init__system__
	Namespace: mechz
	Checksum: 0x83E0F8D8
	Offset: 0x5B8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"mechz", &init, undefined, undefined, undefined);
}

/*
	Name: init
	Namespace: mechz
	Checksum: 0x613D4F92
	Offset: 0x600
	Size: 0x328
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("actor", "mechz_ft", 1, 1, "int", &mechzclientutils::mechzflamethrowercallback, 0, 0);
	clientfield::register("actor", "mechz_faceplate_detached", 1, 1, "int", &mechzclientutils::mechz_detach_faceplate, 0, 0);
	clientfield::register("actor", "mechz_powercap_detached", 1, 1, "int", &mechzclientutils::mechz_detach_powercap, 0, 0);
	clientfield::register("actor", "mechz_claw_detached", 1, 1, "int", &mechzclientutils::mechz_detach_claw, 0, 0);
	clientfield::register("actor", "mechz_115_gun_firing", 1, 1, "int", &mechzclientutils::mechz_115_gun_muzzle_flash, 0, 0);
	clientfield::register("actor", "mechz_headlamp_off", 1, 2, "int", &mechzclientutils::mechz_headlamp_off, 0, 0);
	clientfield::register("actor", "mechz_long_jump", 1, 1, "counter", &mechzclientutils::function_d6762475, 0, 0);
	clientfield::register("actor", "mechz_jetpack_explosion", 1, 1, "int", &mechzclientutils::function_f0664979, 0, 0);
	clientfield::register("actor", "mechz_face", 1, 3, "int", &mechzclientutils::mechzfacecallback, 0, 0);
	ai::add_archetype_spawn_function(#"mechz", &mechzclientutils::mechzspawn);
	precache();
	level._mechz_face = [];
	level._mechz_face[1] = "ai_face_zombie_generic_attack_1";
	level._mechz_face[2] = "ai_face_zombie_generic_death_1";
	level._mechz_face[3] = "ai_face_zombie_generic_idle_1";
	level._mechz_face[4] = "ai_face_zombie_generic_pain_1";
}

/*
	Name: precache
	Namespace: mechz
	Checksum: 0x8BE5E065
	Offset: 0x930
	Size: 0x284
	Parameters: 0
	Flags: Linked
*/
function precache()
{
	level._effect[#"hash_1e6936398caedb41"] = "zm_ai/fx9_mech_wpn_flamethrower";
	level._effect[#"hash_32801ddd989327df"] = "zm_ai/fx9_mech_dmg_armor_face";
	level._effect[#"hash_7ce82c82604705ed"] = "zm_ai/fx9_mech_dmg_armor";
	level._effect[#"hash_7ce82c82604705ed"] = "zm_ai/fx9_mech_dmg_armor";
	level._effect[#"hash_3e338ce8948f836b"] = "zm_ai/fx9_mech_wpn_mltv_muz";
	level._effect[#"hash_7ce82c82604705ed"] = "zm_ai/fx9_mech_dmg_armor";
	level._effect[#"hash_7ce82c82604705ed"] = "zm_ai/fx9_mech_dmg_armor";
	level._effect[#"hash_7ce82c82604705ed"] = "zm_ai/fx9_mech_dmg_armor";
	level._effect[#"hash_7ce82c82604705ed"] = "zm_ai/fx9_mech_dmg_armor";
	level._effect[#"hash_34deead728cd2cbe"] = "zm_ai/fx9_mech_head_light";
	level._effect[#"hash_17c29f528fb7ca60"] = "zm_ai/fx9_mech_dmg_sparks";
	level._effect[#"hash_34bb84802c99ce70"] = "zm_ai/fx9_mech_dmg_knee_sparks";
	level._effect[#"hash_17c29f528fb7ca60"] = "zm_ai/fx9_mech_dmg_sparks";
	level._effect[#"hash_3d292f6ede2dac76"] = "zm_ai/fx9_mech_foot_step";
	level._effect[#"hash_76d9f51aeca015ea"] = "zm_ai/fx9_mech_light_dmg";
	level._effect[#"hash_500cb52978dcca71"] = "zm_ai/fx9_mech_foot_step_steam";
	level._effect[#"hash_3df306b1a5119041"] = "zm_ai/fx9_mech_dmg_body_light";
	level._effect[#"hash_2b72eba2856c6e18"] = "zm_ai/fx9_mech_jetpack_dest";
	level._effect[#"hash_58d2b96e346def74"] = "zm_ai/fx9_mech_power_core_exposed_destroy";
	level._effect[#"hash_4f3864d9fbcff8e1"] = "zm_ai/fx9_mech_power_core_exposed";
}

#namespace mechzclientutils;

/*
	Name: mechzspawn
	Namespace: mechzclientutils
	Checksum: 0x1C358702
	Offset: 0xBC0
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzspawn(localclientnum)
{
	level._footstepcbfuncs[self.archetype] = &mechzprocessfootstep;
	self.headlight_fx = util::playfxontag(localclientnum, level._effect[#"hash_34deead728cd2cbe"], self, "tag_headlamp_FX");
	self.headlamp_on = 1;
	fxclientutils::playfxbundle(localclientnum, self, self.fxdef);
}

/*
	Name: mechzprocessfootstep
	Namespace: mechzclientutils
	Checksum: 0x13DC63F
	Offset: 0xC60
	Size: 0x26E
	Parameters: 5
	Flags: Linked
*/
function mechzprocessfootstep(localclientnum, pos, surface, notetrack, bone)
{
	e_player = function_5c10bd79(surface);
	n_dist = distancesquared(notetrack, e_player.origin);
	n_mechz_dist = 1000000;
	if(n_mechz_dist > 0)
	{
		n_scale = n_dist / n_mechz_dist;
	}
	else
	{
		return;
	}
	if(n_scale > 1 || n_scale <= 0)
	{
		return;
	}
	earthquake_scale = (1 - n_scale) * 0.15;
	if(earthquake_scale > 0.01)
	{
		earthquake(surface, earthquake_scale, 0.1, notetrack, 1000);
	}
	if(n_scale <= 1 && n_scale > 0.8)
	{
		e_player playrumbleonentity(surface, "mechz_footstep_heavy");
	}
	else
	{
		if(n_scale <= 0.8 && n_scale > 0.4)
		{
			e_player playrumbleonentity(surface, "mechz_footstep_medium");
		}
		else
		{
			e_player playrumbleonentity(surface, "mechz_footstep_light");
		}
	}
	fx = util::playfxontag(surface, level._effect[#"hash_3d292f6ede2dac76"], self, bone);
	if(bone == "j_ball_le")
	{
		steam_bone = "tag_foot_steam_le";
	}
	else
	{
		steam_bone = "tag_foot_steam_ri";
	}
	steam_fx = util::playfxontag(surface, level._effect[#"hash_500cb52978dcca71"], self, steam_bone);
}

/*
	Name: mechzflamethrowercallback
	Namespace: mechzclientutils
	Checksum: 0x28304A95
	Offset: 0xED8
	Size: 0x16A
	Parameters: 7
	Flags: Linked, Private
*/
function private mechzflamethrowercallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	switch(wasdemojump)
	{
		case 1:
		{
			self.fire_beam_id = beamlaunch(fieldname, self, "tag_flamethrower_fx", undefined, "none", "flamethrower_beam_3p_zm_mechz");
			self playsound(0, "zmb_ai_mechz_flame_start");
			self.sndloopid = self playloopsound("zmb_ai_mechz_flame_loop");
			break;
		}
		case 0:
		{
			self notify(#"stopflamethrower");
			if(isdefined(self.fire_beam_id))
			{
				beamkill(fieldname, self.fire_beam_id);
				self playsound(0, "zmb_ai_mechz_flame_stop");
				self stoploopsound(self.sndloopid);
			}
			break;
		}
	}
}

/*
	Name: mechz_detach_faceplate
	Namespace: mechzclientutils
	Checksum: 0x6425DD98
	Offset: 0x1050
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function mechz_detach_faceplate(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	util::playfxontag(wasdemojump, level._effect[#"hash_32801ddd989327df"], self, "j_spine4");
	self playsound(0, "zmb_ai_mechz_faceplate");
}

/*
	Name: mechz_detach_powercap
	Namespace: mechzclientutils
	Checksum: 0x46702BA7
	Offset: 0x10F0
	Size: 0x112
	Parameters: 7
	Flags: Linked
*/
function mechz_detach_powercap(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	util::playfxontag(wasdemojump, level._effect[#"hash_7ce82c82604705ed"], self, "tag_powersupply");
	self playsound(0, "zmb_ai_mechz_destruction");
	self.mechz_powercore_fx = util::playfxontag(wasdemojump, level._effect[#"hash_3df306b1a5119041"], self, "tag_powersupply");
	self.var_7280af02 = util::playfxontag(wasdemojump, level._effect[#"hash_4f3864d9fbcff8e1"], self, "j_spine4");
}

/*
	Name: mechz_detach_claw
	Namespace: mechzclientutils
	Checksum: 0xAE74F05
	Offset: 0x1210
	Size: 0x184
	Parameters: 7
	Flags: Linked
*/
function mechz_detach_claw(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(isdefined(level.mechz_detach_claw_override))
	{
		self [[level.mechz_detach_claw_override]](localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump);
		return;
	}
	util::playfxontag(localclientnum, level._effect[#"hash_7ce82c82604705ed"], self, "tag_gun_spin");
	self playsound(0, "zmb_ai_mechz_destruction");
	util::playfxontag(localclientnum, level._effect[#"hash_17c29f528fb7ca60"], self, "tag_gun_spin");
	if(isdefined(self.mechz_powercore_fx))
	{
		stopfx(localclientnum, self.mechz_powercore_fx);
	}
	if(isdefined(self.var_7280af02))
	{
		stopfx(localclientnum, self.var_7280af02);
	}
	util::playfxontag(localclientnum, level._effect[#"hash_58d2b96e346def74"], self, "j_spine4");
}

/*
	Name: mechz_115_gun_muzzle_flash
	Namespace: mechzclientutils
	Checksum: 0x948D9136
	Offset: 0x13A0
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function mechz_115_gun_muzzle_flash(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	util::playfxontag(wasdemojump, level._effect[#"hash_3e338ce8948f836b"], self, "tag_gun_barrel2");
}

/*
	Name: function_f0664979
	Namespace: mechzclientutils
	Checksum: 0xF4752AC8
	Offset: 0x1420
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function function_f0664979(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	util::playfxontag(wasdemojump, level._effect[#"hash_2b72eba2856c6e18"], self, "j_spine4");
	self playsound(0, "zmb_ai_mechz_destroy_jetpack");
}

/*
	Name: mechz_headlamp_off
	Namespace: mechzclientutils
	Checksum: 0x99EBEC67
	Offset: 0x14C0
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function mechz_headlamp_off(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(self.headlamp_on === 1 && wasdemojump != 0 && isdefined(self.headlight_fx))
	{
		stopfx(fieldname, self.headlight_fx);
		self.headlamp_on = 0;
		if(wasdemojump == 2)
		{
			util::playfxontag(fieldname, level._effect[#"hash_3d292f6ede2dac76"], self, "tag_headlamp_fx");
		}
	}
}

/*
	Name: function_d6762475
	Namespace: mechzclientutils
	Checksum: 0x21456F57
	Offset: 0x15A0
	Size: 0x74
	Parameters: 7
	Flags: Linked, Private
*/
function private function_d6762475(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	earthquake(wasdemojump, 0.5, 1, self.origin, 600, 1);
}

/*
	Name: mechzfacecallback
	Namespace: mechzclientutils
	Checksum: 0xF9D404FE
	Offset: 0x1620
	Size: 0xFA
	Parameters: 7
	Flags: Linked, Private
*/
function private mechzfacecallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	util::waittill_dobj(fieldname);
	if(wasdemojump && isdefined(self))
	{
		if(isdefined(self.prevfaceanim))
		{
			self clearanim(self.prevfaceanim, 0.2);
		}
		faceanim = level._mechz_face[wasdemojump];
		self setanim(faceanim, 1, 0.2, 1);
		self.prevfaceanim = faceanim;
	}
}

