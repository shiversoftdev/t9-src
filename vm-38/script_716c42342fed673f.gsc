#using script_ac6a30f1991e105;
#using scripts\core_common\ai\archetype_secondary_animations.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace raz;

/*
	Name: function_1534c0e0
	Namespace: raz
	Checksum: 0x545AF5F7
	Offset: 0x538
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1534c0e0()
{
	level notify(1590229844);
}

/*
	Name: main
	Namespace: raz
	Checksum: 0xEEB1BCE5
	Offset: 0x558
	Size: 0x154
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	clientfield::register("scriptmover", "raz_detonate_ground_torpedo", 1, 1, "int", &razclientutils::razdetonategroundtorpedo, 0, 0);
	clientfield::register("scriptmover", "raz_torpedo_play_fx_on_self", 1, 1, "int", &razclientutils::razplayselffx, 0, 0);
	clientfield::register("scriptmover", "raz_torpedo_play_trail", 1, 1, "counter", &razclientutils::raztorpedoplaytrailfx, 0, 0);
	clientfield::register("actor", "raz_gun_weakpoint_hit", 1, 1, "counter", &razclientutils::razgunweakpointhitfx, 0, 0);
	ai::add_archetype_spawn_function(#"raz", &razclientutils::razspawn);
}

/*
	Name: precache
	Namespace: raz
	Checksum: 0xCB51E791
	Offset: 0x6B8
	Size: 0x810
	Parameters: 0
	Flags: AutoExec
*/
function autoexec precache()
{
	level._effect[#"hash_139afc42653bd345"] = "dlc1/castle/fx_mech_foot_step";
	level._effect[#"hash_c824652e58b5fdf"] = "zm_ai/fx9_raz_mc_shockwave_projectile_impact";
	level._effect[#"hash_4e7511e7b7f63d0a"] = "impacts/fx_bul_impact_concrete_xtreme";
	level._effect[#"hash_7d199c49ab77b780"] = "zm_ai/fx9_raz_mc_shockwave_projectile";
	level._effect[#"hash_494b459d33f13b6"] = "zm_ai/fx9_raz_dest_weak_point_exp";
	level._effect[#"hash_656c73c7e4336a47"] = "zm_ai/fx9_raz_dest_weak_point_sparking_loop";
	level._effect[#"hash_7badd093aab9e236"] = "zm_ai/fx9_raz_dmg_weak_point";
	level._effect[#"hash_4faeb86b1620aac4"] = "zm_ai/fx9_raz_dest_weak_point_exp_generic";
	level._raz_taunts = [];
	if(!isdefined(level._raz_taunts))
	{
		level._raz_taunts = [];
	}
	else if(!isarray(level._raz_taunts))
	{
		level._raz_taunts = array(level._raz_taunts);
	}
	level._raz_taunts[level._raz_taunts.size] = "vox_mang_mangler_taunt_0";
	if(!isdefined(level._raz_taunts))
	{
		level._raz_taunts = [];
	}
	else if(!isarray(level._raz_taunts))
	{
		level._raz_taunts = array(level._raz_taunts);
	}
	level._raz_taunts[level._raz_taunts.size] = "vox_mang_mangler_taunt_1";
	if(!isdefined(level._raz_taunts))
	{
		level._raz_taunts = [];
	}
	else if(!isarray(level._raz_taunts))
	{
		level._raz_taunts = array(level._raz_taunts);
	}
	level._raz_taunts[level._raz_taunts.size] = "vox_mang_mangler_taunt_2";
	if(!isdefined(level._raz_taunts))
	{
		level._raz_taunts = [];
	}
	else if(!isarray(level._raz_taunts))
	{
		level._raz_taunts = array(level._raz_taunts);
	}
	level._raz_taunts[level._raz_taunts.size] = "vox_mang_mangler_taunt_3";
	if(!isdefined(level._raz_taunts))
	{
		level._raz_taunts = [];
	}
	else if(!isarray(level._raz_taunts))
	{
		level._raz_taunts = array(level._raz_taunts);
	}
	level._raz_taunts[level._raz_taunts.size] = "vox_mang_mangler_taunt_4";
	if(!isdefined(level._raz_taunts))
	{
		level._raz_taunts = [];
	}
	else if(!isarray(level._raz_taunts))
	{
		level._raz_taunts = array(level._raz_taunts);
	}
	level._raz_taunts[level._raz_taunts.size] = "vox_mang_mangler_taunt_5";
	if(!isdefined(level._raz_taunts))
	{
		level._raz_taunts = [];
	}
	else if(!isarray(level._raz_taunts))
	{
		level._raz_taunts = array(level._raz_taunts);
	}
	level._raz_taunts[level._raz_taunts.size] = "vox_mang_mangler_taunt_6";
	if(!isdefined(level._raz_taunts))
	{
		level._raz_taunts = [];
	}
	else if(!isarray(level._raz_taunts))
	{
		level._raz_taunts = array(level._raz_taunts);
	}
	level._raz_taunts[level._raz_taunts.size] = "vox_mang_mangler_taunt_7";
	if(!isdefined(level._raz_taunts))
	{
		level._raz_taunts = [];
	}
	else if(!isarray(level._raz_taunts))
	{
		level._raz_taunts = array(level._raz_taunts);
	}
	level._raz_taunts[level._raz_taunts.size] = "vox_mang_mangler_taunt_8";
	if(!isdefined(level._raz_taunts))
	{
		level._raz_taunts = [];
	}
	else if(!isarray(level._raz_taunts))
	{
		level._raz_taunts = array(level._raz_taunts);
	}
	level._raz_taunts[level._raz_taunts.size] = "vox_mang_mangler_taunt_9";
	if(!isdefined(level._raz_taunts))
	{
		level._raz_taunts = [];
	}
	else if(!isarray(level._raz_taunts))
	{
		level._raz_taunts = array(level._raz_taunts);
	}
	level._raz_taunts[level._raz_taunts.size] = "vox_mang_mangler_taunt_10";
	if(!isdefined(level._raz_taunts))
	{
		level._raz_taunts = [];
	}
	else if(!isarray(level._raz_taunts))
	{
		level._raz_taunts = array(level._raz_taunts);
	}
	level._raz_taunts[level._raz_taunts.size] = "vox_mang_mangler_taunt_11";
	if(!isdefined(level._raz_taunts))
	{
		level._raz_taunts = [];
	}
	else if(!isarray(level._raz_taunts))
	{
		level._raz_taunts = array(level._raz_taunts);
	}
	level._raz_taunts[level._raz_taunts.size] = "vox_mang_mangler_taunt_12";
	if(!isdefined(level._raz_taunts))
	{
		level._raz_taunts = [];
	}
	else if(!isarray(level._raz_taunts))
	{
		level._raz_taunts = array(level._raz_taunts);
	}
	level._raz_taunts[level._raz_taunts.size] = "vox_mang_mangler_taunt_13";
}

#namespace razclientutils;

/*
	Name: razspawn
	Namespace: razclientutils
	Checksum: 0x2463546F
	Offset: 0xED0
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private razspawn(localclientnum)
{
	level._footstepcbfuncs[self.archetype] = &razprocessfootstep;
	self thread razplayfireemissiveshader(localclientnum);
	util::waittill_dobj(localclientnum);
	fxclientutils::playfxbundle(localclientnum, self, self.fxdef);
}

/*
	Name: razplayfireemissiveshader
	Namespace: razclientutils
	Checksum: 0x3448F740
	Offset: 0xF58
	Size: 0xA8
	Parameters: 1
	Flags: Linked, Private
*/
function private razplayfireemissiveshader(localclientnum)
{
	self endon(#"death");
	while(isdefined(self))
	{
		self waittill(#"lights_on");
		self mapshaderconstant(localclientnum, 0, "scriptVector3", 0, 1, 1);
		self waittill(#"lights_off");
		self mapshaderconstant(localclientnum, 0, "scriptVector3", 0, 0, 0);
	}
}

/*
	Name: razplayroarsound
	Namespace: razclientutils
	Checksum: 0xB1BBA114
	Offset: 0x1008
	Size: 0x80
	Parameters: 1
	Flags: Private
*/
function private razplayroarsound(localclientnum)
{
	self endon(#"death");
	while(isdefined(self))
	{
		self waittill(#"roar");
		self playsound(localclientnum, "vox_raz_exert_enrage", self gettagorigin("tag_eye"));
	}
}

/*
	Name: function_d0d17a03
	Namespace: razclientutils
	Checksum: 0x4A65CB2C
	Offset: 0x1090
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function function_d0d17a03(localclientnum)
{
	self endon(#"death");
	self endon(#"hash_44b53862eee262c9");
	while(isdefined(self))
	{
		wait(randomintrange(2, 9));
		self playsound(localclientnum, "vox_ai_raz_ambient_radio", self gettagorigin("tag_eye"));
		wait(5);
	}
}

/*
	Name: razprocessfootstep
	Namespace: razclientutils
	Checksum: 0xAA9EB63C
	Offset: 0x1138
	Size: 0x20E
	Parameters: 5
	Flags: Linked
*/
function razprocessfootstep(localclientnum, pos, surface, notetrack, bone)
{
	e_player = function_5c10bd79(surface);
	n_dist = distancesquared(notetrack, e_player.origin);
	n_raz_dist = 160000;
	if(n_raz_dist > 0)
	{
		n_scale = (n_raz_dist - n_dist) / n_raz_dist;
	}
	else
	{
		return;
	}
	if(n_scale > 1 || n_scale < 0)
	{
		return;
	}
	if(n_scale <= 0.01)
	{
		return;
	}
	earthquake_scale = n_scale * 0.1;
	if(earthquake_scale > 0.01)
	{
		earthquake(surface, earthquake_scale, 0.1, notetrack, n_dist);
	}
	if(n_scale <= 1 && n_scale > 0.8)
	{
		e_player playrumbleonentity(surface, "damage_heavy");
	}
	else
	{
		if(n_scale <= 0.8 && n_scale > 0.4)
		{
			e_player playrumbleonentity(surface, "damage_light");
		}
		else
		{
			e_player playrumbleonentity(surface, "reload_small");
		}
	}
	fx = util::playfxontag(surface, level._effect[#"hash_139afc42653bd345"], self, bone);
}

/*
	Name: razdetonategroundtorpedo
	Namespace: razclientutils
	Checksum: 0x27F84D8B
	Offset: 0x1350
	Size: 0x7E
	Parameters: 7
	Flags: Linked, Private
*/
function private razdetonategroundtorpedo(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	fx = playfx(wasdemojump, level._effect[#"hash_c824652e58b5fdf"], self.origin);
}

/*
	Name: raztorpedoplaytrailfx
	Namespace: razclientutils
	Checksum: 0x300BD494
	Offset: 0x13D8
	Size: 0x7E
	Parameters: 7
	Flags: Linked, Private
*/
function private raztorpedoplaytrailfx(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	fx = playfx(wasdemojump, level._effect[#"hash_4e7511e7b7f63d0a"], self.origin);
}

/*
	Name: razplayselffx
	Namespace: razclientutils
	Checksum: 0x462B4E58
	Offset: 0x1460
	Size: 0xDA
	Parameters: 7
	Flags: Linked, Private
*/
function private razplayselffx(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump == 0 && isdefined(self.raz_torpedo_self_fx))
	{
		stopfx(fieldname, self.raz_torpedo_self_fx);
		self.raz_torpedo_self_fx = undefined;
	}
	if(wasdemojump == 1 && !isdefined(self.raz_torpedo_self_fx))
	{
		self.raz_torpedo_self_fx = util::playfxontag(fieldname, level._effect[#"hash_7d199c49ab77b780"], self, "tag_origin");
	}
}

/*
	Name: razcreatedynentandlaunch
	Namespace: razclientutils
	Checksum: 0xCC90549C
	Offset: 0x1548
	Size: 0x1A4
	Parameters: 7
	Flags: Linked, Private
*/
function private razcreatedynentandlaunch(localclientnum, model, pos, angles, hitpos, vel_factor, direction)
{
	if(!isdefined(vel_factor))
	{
		vel_factor = 1;
	}
	if(!isdefined(angles) || !isdefined(hitpos))
	{
		return;
	}
	velocity = self getvelocity();
	velocity_normal = vectornormalize(velocity);
	velocity_length = length(velocity);
	if(isdefined(direction) && direction == "back")
	{
		launch_dir = anglestoforward(self.angles) * -1;
	}
	else
	{
		launch_dir = anglestoforward(self.angles);
	}
	velocity_length = velocity_length * 0.1;
	if(velocity_length < 10)
	{
		velocity_length = 10;
	}
	launch_dir = (launch_dir * 0.5) + (velocity_normal * 0.5);
	launch_dir = launch_dir * velocity_length;
	createdynentandlaunch(model, pos, angles, hitpos, self.origin, launch_dir * vel_factor);
}

/*
	Name: razdetachgunfx
	Namespace: razclientutils
	Checksum: 0x625048E5
	Offset: 0x16F8
	Size: 0x19C
	Parameters: 7
	Flags: Private
*/
function private razdetachgunfx(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	fx = util::playfxontag(wasdemojump, level._effect[#"hash_494b459d33f13b6"], self, "TAG_FX_Shoulder_RI_GIB");
	gun_pos = self gettagorigin("j_elbow_ri");
	gun_ang = self gettagangles("j_elbow_ri");
	gun_core_pos = self gettagorigin("j_shouldertwist_ri_attach");
	gun_core_ang = self gettagangles("j_shouldertwist_ri_attach");
	dynent = razcreatedynentandlaunch(wasdemojump, "c_zom_dlc3_raz_s_armcannon", gun_pos, gun_ang, self.origin, 1.3, "back");
	self playsound(wasdemojump, "zmb_raz_gun_explo", self gettagorigin("tag_eye"));
}

/*
	Name: razgunweakpointhitfx
	Namespace: razclientutils
	Checksum: 0x28A9C468
	Offset: 0x18A0
	Size: 0x7E
	Parameters: 7
	Flags: Linked, Private
*/
function private razgunweakpointhitfx(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	fx = util::playfxontag(wasdemojump, level._effect[#"hash_7badd093aab9e236"], self, "j_shoulder_ri");
}

/*
	Name: applynewfaceanim
	Namespace: razclientutils
	Checksum: 0x644330ED
	Offset: 0x1928
	Size: 0xAC
	Parameters: 2
	Flags: Private
*/
function private applynewfaceanim(localclientnum, animation)
{
	self endon(#"death");
	if(isdefined(animation))
	{
		self._currentfaceanim = animation;
		if(self hasdobj(localclientnum) && self hasanimtree())
		{
			self setflaggedanimknob("ai_secondary_facial_anim", animation, 1, 0.1, 1);
		}
	}
}

/*
	Name: clearcurrentfacialanim
	Namespace: razclientutils
	Checksum: 0x9C0BE7EA
	Offset: 0x19E0
	Size: 0x76
	Parameters: 1
	Flags: Private
*/
function private clearcurrentfacialanim(localclientnum)
{
	if(isdefined(self._currentfaceanim) && self hasdobj(localclientnum) && self hasanimtree())
	{
		self clearanim(self._currentfaceanim, 0.2);
	}
	self._currentfaceanim = undefined;
}

