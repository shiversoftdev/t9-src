#using scripts\cp_common\util.gsc;
#using script_7d0013bbc05623b9;
#using script_3626f1b2cf51a99c;
#using scripts\cp_common\gametypes\battlechatter.gsc;
#using scripts\abilities\gadgets\gadget_health_regen.gsc;
#using scripts\weapons\weapon_utils.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using script_6eea75edd4d830a;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\animation_shared.gsc;

#namespace namespace_594b67e;

/*
	Name: function_2482a0e4
	Namespace: namespace_594b67e
	Checksum: 0x4B9359D9
	Offset: 0x4E8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2482a0e4()
{
	level notify(-436601326);
}

/*
	Name: __init__system__
	Namespace: namespace_594b67e
	Checksum: 0xDC7A2C1
	Offset: 0x508
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_208cc96e397aed88", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_594b67e
	Checksum: 0x9C56D224
	Offset: 0x550
	Size: 0x94
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "link_to_camera", 1, 2, "int");
	clientfield::register("actor", "link_to_camera", 1, 2, "int");
	clientfield::register("toplayer", "fake_ads", 1, 1, "int");
}

/*
	Name: function_30b535ff
	Namespace: namespace_594b67e
	Checksum: 0xB96514EC
	Offset: 0x5F0
	Size: 0x82
	Parameters: 1
	Flags: Linked
*/
function function_30b535ff(inuse)
{
	if(!isdefined(self.var_30b535ff))
	{
		self.var_30b535ff = 0;
	}
	if(inuse)
	{
		self.var_30b535ff = max(1, self.var_30b535ff + 1);
	}
	else
	{
		self.var_30b535ff = max(0, self.var_30b535ff - 1);
	}
	return self.var_30b535ff;
}

/*
	Name: function_77af90aa
	Namespace: namespace_594b67e
	Checksum: 0x71CAC2E4
	Offset: 0x680
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_77af90aa(attach_model, attach_tag)
{
	self detachall();
	if(isdefined(attach_model))
	{
		/#
			assert(isdefined(attach_tag));
		#/
		/#
			assert(attach_model.size == attach_tag.size);
		#/
		for(i = 0; i < attach_model.size; i++)
		{
			self attach(attach_model[i], attach_tag[i], 1);
		}
	}
}

/*
	Name: function_865196a6
	Namespace: namespace_594b67e
	Checksum: 0xC7C1736D
	Offset: 0x740
	Size: 0x2B4
	Parameters: 2
	Flags: None
*/
function function_865196a6(link_ents, var_e4df1bec)
{
	/#
		assert(isplayer(self));
	#/
	pitch = abs(angleclamp180(self getplayerangles()[0]));
	if(pitch > 0)
	{
		prep = util::spawn_model("tag_origin", self.origin, self.angles);
		duration = pitch / 180;
		self playerlinktoblend(prep, "tag_player", duration, duration * 0.5, duration * 0.5);
		if(isdefined(link_ents))
		{
			foreach(var_2647a8e3 in link_ents)
			{
				var_2647a8e3 function_b82cae8f(1);
			}
		}
		if(is_true(var_e4df1bec))
		{
			self thread function_e4df1bec(duration);
		}
		wait(duration + (float(function_60d95f53()) / 1000));
		if(isdefined(link_ents))
		{
			foreach(var_2647a8e3 in link_ents)
			{
				var_2647a8e3 function_b82cae8f(0);
			}
		}
		self unlink();
		prep delete();
	}
}

/*
	Name: function_e4df1bec
	Namespace: namespace_594b67e
	Checksum: 0xD77F330E
	Offset: 0xA00
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function function_e4df1bec(duration)
{
	self thread easing::function_86ac55c5("bg_viewBobAmplitudeStanding", self.var_74c52b3d.var_c9e720e2, duration, "linear");
	self thread easing::function_86ac55c5("bg_bobMax", self.var_74c52b3d.var_14a70876, duration, "linear");
	self thread easing::function_86ac55c5("bg_bobTransTime", self.var_74c52b3d.var_945795a5, duration, "linear");
}

/*
	Name: become_corpse
	Namespace: namespace_594b67e
	Checksum: 0x7039091C
	Offset: 0xAC0
	Size: 0x14A
	Parameters: 0
	Flags: Linked
*/
function become_corpse()
{
	if(self clientfield::get("link_to_camera"))
	{
		self function_b82cae8f(0);
	}
	if(!iscorpse(self) && !is_true(getplayers()[0].var_9ebbaa46.var_7e5a6cf9))
	{
		aitype = self.ai_type;
		if(!isdefined(aitype))
		{
			aitype = self.aitype;
		}
		self solid();
		if(!isactor(self))
		{
			var_b9c0ade5 = self.var_b9c0ade5;
			corpse = self function_f5408e2c(aitype, getplayers()[0].velocity);
			corpse.var_b9c0ade5 = var_b9c0ade5;
		}
	}
}

/*
	Name: function_2e55c59e
	Namespace: namespace_594b67e
	Checksum: 0xDDB37E5D
	Offset: 0xC18
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_2e55c59e(var_f68ce314)
{
	/#
		assert(isdefined(var_f68ce314) && isfloat(var_f68ce314));
	#/
	level.var_f467e5b0.var_671420ae = var_f68ce314;
}

/*
	Name: function_e3b9f13
	Namespace: namespace_594b67e
	Checksum: 0xC8990BEE
	Offset: 0xC78
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function function_e3b9f13()
{
	level.var_f467e5b0.var_671420ae = 0.5;
}

/*
	Name: function_e46cbbf7
	Namespace: namespace_594b67e
	Checksum: 0x1F4D9AC3
	Offset: 0xCA0
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function function_e46cbbf7()
{
	if(!isdefined(level.var_f467e5b0.var_671420ae))
	{
		level.var_f467e5b0.var_671420ae = 0.5;
	}
	return level.var_f467e5b0.var_671420ae;
}

/*
	Name: function_31df4786
	Namespace: namespace_594b67e
	Checksum: 0x682CBE5C
	Offset: 0xCF0
	Size: 0x354
	Parameters: 2
	Flags: Linked
*/
function function_31df4786(allow_weapons, allow_ads)
{
	if(!isdefined(allow_weapons))
	{
		allow_weapons = 1;
	}
	if(!isdefined(allow_ads))
	{
		allow_ads = 1;
	}
	/#
		assert(!isdefined(self.var_31df4786));
	#/
	self.var_31df4786 = 1;
	self val::set(#"hash_681a4eb9df49482f", "disable_weapon_cycling", 1);
	self val::set(#"hash_681a4eb9df49482f", "disable_weapon_reload", 1);
	self val::set(#"hash_681a4eb9df49482f", "disable_weapon_pickup", 1);
	self val::set(#"hash_681a4eb9df49482f", "disable_offhand_weapons", 1);
	self val::set(#"hash_681a4eb9df49482f", "disable_offhand_special", 1);
	self val::set(#"hash_681a4eb9df49482f", "disable_aim_assist", 1);
	self val::set(#"hash_681a4eb9df49482f", "allow_crouch", 0);
	self val::set(#"hash_681a4eb9df49482f", "allow_prone", 0);
	self val::set(#"hash_681a4eb9df49482f", "allow_sprint", 0);
	self val::set(#"hash_681a4eb9df49482f", "allow_jump", 0);
	self val::set(#"hash_681a4eb9df49482f", "allow_climb", 0);
	self val::set(#"hash_681a4eb9df49482f", "allow_mantle", 0);
	self val::set(#"hash_681a4eb9df49482f", "allow_melee_victim", 0);
	if(!allow_weapons)
	{
		self val::set(#"hash_681a4eb9df49482f", "disable_weapons", 1);
	}
	if(!allow_ads)
	{
		self val::set(#"hash_681a4eb9df49482f", "allow_ads", 0);
	}
	if(!function_1fac6486(self getcurrentweapon()))
	{
		self val::set(#"hash_681a4eb9df49482f", "allow_melee", 0);
	}
}

/*
	Name: function_9123bbf0
	Namespace: namespace_594b67e
	Checksum: 0xFAF281E9
	Offset: 0x1050
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function function_9123bbf0()
{
	self val::reset_all(#"hash_681a4eb9df49482f");
	self.var_31df4786 = undefined;
}

/*
	Name: function_2795d678
	Namespace: namespace_594b67e
	Checksum: 0xB60F12FB
	Offset: 0x1088
	Size: 0x616
	Parameters: 5
	Flags: Linked
*/
function function_2795d678(encumbered, allow_weapons, var_37e68004, allow_ads, var_6a87e928)
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	pistol = undefined;
	if(!isdefined(allow_weapons))
	{
		allow_weapons = 1;
	}
	if(!isdefined(var_37e68004))
	{
		var_37e68004 = 0;
	}
	if(!isdefined(allow_ads))
	{
		allow_ads = 1;
	}
	if(encumbered)
	{
		if(!isdefined(player.var_74c52b3d))
		{
			self.var_74c52b3d = spawnstruct();
			self function_31df4786(allow_weapons, allow_ads);
			player.var_74c52b3d.movespeedscale = player getmovespeedscale();
			player.var_74c52b3d.var_c9e720e2 = getdvar(#"bg_viewbobamplitudestanding");
			player.var_74c52b3d.var_c9e720e2 = (string(player.var_74c52b3d.var_c9e720e2[0]) + " ") + string(player.var_74c52b3d.var_c9e720e2[1]);
			player.var_74c52b3d.var_14a70876 = getdvarfloat(#"bg_bobmax");
			player.var_74c52b3d.var_945795a5 = getdvarint(#"bg_bobtranstime");
			var_b56db8c = function_e46cbbf7();
			player setmovespeedscale(var_b56db8c);
			player thread function_854fc491(var_6a87e928);
			if(allow_weapons)
			{
				if(var_37e68004)
				{
					pistol = player function_d338e637();
					if(isdefined(pistol))
					{
						player.var_74c52b3d.weapon_list = player getweaponslist();
						player.var_74c52b3d.var_6535f2e6 = player getcurrentweapon();
						if(!isdefined(player.var_74c52b3d.var_6535f2e6) || player.var_74c52b3d.var_6535f2e6.basename == "none")
						{
							player.var_74c52b3d.var_6535f2e6 = level.player.last_weapon;
						}
						player switchtoweapon(pistol);
					}
				}
				if(isdefined(player.var_74c52b3d.weapon_list))
				{
					foreach(weap in player.var_74c52b3d.weapon_list)
					{
						if(isdefined(pistol) && weap != pistol)
						{
							player takeweapon(weap);
						}
					}
				}
			}
			self prompts::function_e79f51ec([2:#"body_carry", 1:#"doors", 0:#"actions"]);
			self flag::set("encumbered");
		}
	}
	else
	{
		if(isdefined(player.var_74c52b3d))
		{
			self function_9123bbf0();
			player setmovespeedscale(player.var_74c52b3d.movespeedscale);
			player thread function_854fc491();
			if(isdefined(player.var_74c52b3d.weapon_list))
			{
				foreach(weap in player.var_74c52b3d.weapon_list)
				{
					if(isdefined(pistol) && weap != pistol)
					{
						player giveweapon(weap);
					}
				}
			}
			if(isdefined(player.var_74c52b3d.var_6535f2e6))
			{
				player switchtoweapon(player.var_74c52b3d.var_6535f2e6);
			}
			self prompts::function_398ab9eb();
			self flag::clear("encumbered");
		}
		player.var_74c52b3d = undefined;
	}
}

/*
	Name: function_854fc491
	Namespace: namespace_594b67e
	Checksum: 0xA505180B
	Offset: 0x16A8
	Size: 0x184
	Parameters: 1
	Flags: Linked
*/
function function_854fc491(var_6a87e928)
{
	player = self;
	/#
		assert(isplayer(player));
	#/
	player endon(#"death");
	self notify("74e9614dd06b695a");
	self endon("74e9614dd06b695a");
	if(isdefined(var_6a87e928))
	{
		if(!isdefined(var_6a87e928))
		{
			var_6a87e928 = [];
		}
		else if(!isarray(var_6a87e928))
		{
			var_6a87e928 = array(var_6a87e928);
		}
	}
	if(isdefined(var_6a87e928))
	{
		var_cc48f591 = -1;
		while(true)
		{
			var_16dd02dc = var_cc48f591;
			if(player function_29fd0abd() && var_6a87e928.size > 1)
			{
				var_16dd02dc = 1;
			}
			else
			{
				var_16dd02dc = 0;
			}
			if(var_cc48f591 != var_16dd02dc)
			{
				player util::function_5f1df718(var_6a87e928[var_16dd02dc]);
			}
			var_cc48f591 = var_16dd02dc;
			waitframe(1);
		}
	}
	else
	{
		player util::function_5f1df718(undefined);
	}
}

/*
	Name: function_d338e637
	Namespace: namespace_594b67e
	Checksum: 0x8B68E8A1
	Offset: 0x1838
	Size: 0xA2
	Parameters: 0
	Flags: Linked
*/
function function_d338e637()
{
	foreach(weap in self getweaponslist())
	{
		if(weapons::ispistol(weap))
		{
			return weap;
		}
	}
	return undefined;
}

/*
	Name: function_c4e06b5a
	Namespace: namespace_594b67e
	Checksum: 0x6AA61AC2
	Offset: 0x18E8
	Size: 0xA
	Parameters: 0
	Flags: None
*/
function function_c4e06b5a()
{
	return "j_spinelower";
}

/*
	Name: function_eef2dca9
	Namespace: namespace_594b67e
	Checksum: 0x9DFCB0E2
	Offset: 0x1900
	Size: 0x184
	Parameters: 1
	Flags: None
*/
function function_eef2dca9(guys)
{
	/#
		assert(isplayer(self));
	#/
	scene_root = spawnstruct();
	scene_root.angles = self.angles;
	scene_root.origin = self.origin + (self getvelocity() * (float(function_60d95f53()) / 1000));
	if(!isdefined(guys))
	{
		guys = [];
	}
	else if(!isarray(guys))
	{
		guys = array(guys);
	}
	foreach(guy in guys)
	{
		if(isdefined(guy))
		{
			guy dontinterpolate();
		}
	}
	return scene_root;
}

/*
	Name: function_b82cae8f
	Namespace: namespace_594b67e
	Checksum: 0xB2F7C5AB
	Offset: 0x1A90
	Size: 0x266
	Parameters: 2
	Flags: Linked
*/
function function_b82cae8f(linktype, var_5596253c)
{
	if(!isdefined(var_5596253c))
	{
		var_5596253c = 1;
	}
	offset = vectorscale((0, 0, -1), 60);
	player = getplayers()[0];
	if(self.var_47f0a724 === 2)
	{
		offset = (0, 0, 0);
	}
	if(is_true(linktype) && self.var_47f0a724 !== linktype)
	{
		self clientfield::set("link_to_camera", linktype);
		self.var_47f0a724 = linktype;
	}
	else if(!is_true(linktype) && is_true(self.var_47f0a724))
	{
		self clientfield::set("link_to_camera", 0);
		if(is_true(var_5596253c))
		{
			origin = player getplayercamerapos();
			angles = player getplayerangles();
			axis = anglestoaxis(angles);
			origin = origin + (offset[0] * axis.forward);
			origin = origin + (offset[1] * axis.right);
			origin = origin + (offset[2] * axis.up);
			if(isactor(self))
			{
				self teleport(origin, angles);
			}
			else
			{
				self.origin = origin;
				self.angles = angles;
				self dontinterpolate();
			}
		}
		self.var_47f0a724 = undefined;
	}
}

/*
	Name: is_walking
	Namespace: namespace_594b67e
	Checksum: 0xDFC8FD10
	Offset: 0x1D00
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function is_walking()
{
	var_9d19b745 = 400;
	/#
		assert(isplayer(self));
	#/
	return lengthsquared(self getvelocity()) > var_9d19b745;
}

/*
	Name: function_3fbe0931
	Namespace: namespace_594b67e
	Checksum: 0x42B7919F
	Offset: 0x1D70
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_3fbe0931(action)
{
	self notify(#"hash_4dff86580406a1af");
	self function_2795d678(0);
	self allow_weapon(1);
	self val::reset_all(#"action");
}

/*
	Name: allow_weapon
	Namespace: namespace_594b67e
	Checksum: 0x1B69A50C
	Offset: 0x1DE8
	Size: 0x316
	Parameters: 4
	Flags: Linked
*/
function allow_weapon(allowed, forced, gesture, var_dfce6e2d)
{
	if(!allowed)
	{
		if(!isdefined(gesture))
		{
			gesture = "ges_body_shield_gundown_quick";
		}
		self.var_15c4009c = (isdefined(self.var_15c4009c) ? self.var_15c4009c : 0) + 1;
		if(self.var_15c4009c === 1)
		{
			self val::set(#"hash_1759513a118d68fd", "disable_weapon_fire", 1);
			self val::set(#"hash_1759513a118d68fd", "disable_weapon_reload", 1);
			self val::set(#"hash_1759513a118d68fd", "disable_weapon_pickup", 1);
			self val::set(#"hash_1759513a118d68fd", "disable_weapon_cycling", 1);
			self val::set(#"hash_1759513a118d68fd", "disable_offhand_weapons", 1);
			self val::set(#"hash_1759513a118d68fd", "disable_offhand_special", 1);
			self.var_621f8539 = gesture;
			if(!is_true(var_dfce6e2d) && !function_1c2cb657(self getcurrentweapon()))
			{
				self thread function_3ceda691(self.var_621f8539);
			}
		}
	}
	else if(isdefined(self.var_15c4009c))
	{
		self.var_15c4009c = self.var_15c4009c - 1;
		if(is_true(forced) || self.var_15c4009c <= 0)
		{
			self val::reset_all(#"hash_1759513a118d68fd");
			self val::reset_all(#"hash_58b9fd1cfcf4a27d");
			if(!function_1c2cb657(self getcurrentweapon()))
			{
				if(isdefined(gesture))
				{
					self thread function_3ceda691(gesture);
				}
				else if(isdefined(self.var_621f8539))
				{
					self thread gesture_stop(self.var_621f8539);
				}
			}
			self.var_15c4009c = undefined;
			self.var_621f8539 = undefined;
		}
	}
}

/*
	Name: function_1e9599a7
	Namespace: namespace_594b67e
	Checksum: 0x90CF8230
	Offset: 0x2108
	Size: 0xF2
	Parameters: 1
	Flags: None
*/
function function_1e9599a7(other)
{
	self.weapon = other.weapon;
	self.primaryweapon = other.primaryweapon;
	self.secondaryweapon = other.secondaryweapon;
	self.sidearm = other.sidearm;
	self.grenadeweapon = other.grenadeweapon;
	self.weaponinfo = other.weaponinfo;
	if(!isdefined(self.a))
	{
		self.a = spawnstruct();
		self.a.weaponpos = [];
		self.a.weaponposdropping = [];
	}
	if(isdefined(other.a))
	{
		self.a.weaponpos = other.a.weaponpos;
	}
	self.var_9d46265b = other.var_9d46265b;
}

/*
	Name: function_b5d8286c
	Namespace: namespace_594b67e
	Checksum: 0x2CA58706
	Offset: 0x2208
	Size: 0x2C2
	Parameters: 6
	Flags: None
*/
function function_b5d8286c(action, scene_root, anim_ents, anim_name, victim, phase)
{
	var_fc8116b2 = self function_462c34d0(action, scene_root, anim_name, victim, phase);
	if(isdefined(var_fc8116b2.scene_root) && isdefined(var_fc8116b2.scene_root.target))
	{
		anim_ents = arraycombine(anim_ents, getentarray(var_fc8116b2.scene_root.target, "targetname"));
	}
	if(isdefined(var_fc8116b2.scene_root) && isdefined(var_fc8116b2.scene_root.script_linkto))
	{
		anim_ents = arraycombine(anim_ents, getentarray(var_fc8116b2.scene_root.script_linkto, "script_linkname"));
	}
	var_3c131b96 = undefined;
	foreach(ent in anim_ents)
	{
		if(ent === self || !isdefined(var_3c131b96))
		{
			var_3c131b96 = ent;
		}
		ent.var_3f4de57b = level.var_f467e5b0.anims[ent.animname][var_fc8116b2.anim_name];
		ent notify(#"new_scripted_anim");
		ent thread function_3f4de57b(var_fc8116b2.anim_name);
	}
	if(isdefined(var_3c131b96))
	{
		wait(getanimlength(var_3c131b96.var_3f4de57b));
	}
	foreach(ent in anim_ents)
	{
		ent.var_3f4de57b = undefined;
	}
	return var_fc8116b2.overridden;
}

/*
	Name: function_aee5f6a6
	Namespace: namespace_594b67e
	Checksum: 0xAC0EF5E7
	Offset: 0x24D8
	Size: 0x194
	Parameters: 1
	Flags: Linked
*/
function function_aee5f6a6(var_b56433f8)
{
	self notify("55dd956a145bde6");
	self endon("55dd956a145bde6");
	index = randomintrange(1, 4);
	self playrumbleonentity(#"reload_small");
	pain_anim = (var_b56433f8 + "_pain_") + index;
	if(is_true(self.var_de5476af))
	{
		pain_anim = (var_b56433f8 + "_ads_pain_") + index;
	}
	if(isdefined(level.var_f467e5b0.anims[#"generic"][pain_anim]))
	{
		self.takedown.body thread function_3f4de57b(pain_anim, 0);
		self.var_6639d45b function_3f4de57b(pain_anim, 0);
		loop_anim = self function_47ffa6b8(var_b56433f8);
		self.takedown.body thread function_d621e6d6(loop_anim);
		self.var_6639d45b thread function_d621e6d6(loop_anim);
	}
}

/*
	Name: function_1e132b9f
	Namespace: namespace_594b67e
	Checksum: 0xB437C34C
	Offset: 0x2678
	Size: 0xD6
	Parameters: 2
	Flags: Linked
*/
function function_1e132b9f(blendtime, var_df65246e)
{
	self notify(#"hash_23e6132220ac0e4d");
	self notify(#"new_scripted_anim");
	if(!isdefined(blendtime))
	{
		blendtime = 0.2;
	}
	if(!isdefined(var_df65246e))
	{
		var_df65246e = 1;
	}
	if(isdefined(self.var_d621e6d6))
	{
		if(var_df65246e)
		{
			self clearanim(self.var_d621e6d6, blendtime);
		}
		self.var_d621e6d6 = undefined;
	}
	if(isdefined(self.var_3f4de57b))
	{
		if(var_df65246e)
		{
			self clearanim(self.var_3f4de57b, blendtime);
		}
		self.var_3f4de57b = undefined;
	}
}

/*
	Name: function_3f4de57b
	Namespace: namespace_594b67e
	Checksum: 0x364719C9
	Offset: 0x2758
	Size: 0x1A4
	Parameters: 3
	Flags: Linked
*/
function function_3f4de57b(var_d1b14335, blendtime, var_df65246e)
{
	if(!isdefined(blendtime))
	{
		blendtime = (isdefined(level.var_f467e5b0.blend[self.animname][var_d1b14335]) ? level.var_f467e5b0.blend[self.animname][var_d1b14335] : 0.2);
	}
	if(!isdefined(var_df65246e))
	{
		var_df65246e = 1;
	}
	self function_1e132b9f(blendtime, var_df65246e);
	self endon(#"death", #"entitydeleted", #"hash_23e6132220ac0e4d");
	animplay = level.var_f467e5b0.anims[self.animname][var_d1b14335];
	/#
		assert(isdefined(animplay));
	#/
	self thread animation::play(animplay, self.origin, self.angles, 1, blendtime, blendtime);
	self.var_3f4de57b = animplay;
	wait(getanimlength(animplay));
	self.var_3f4de57b = undefined;
	if(var_df65246e)
	{
		self clearanim(animplay, blendtime);
	}
}

/*
	Name: function_d621e6d6
	Namespace: namespace_594b67e
	Checksum: 0x85AF4953
	Offset: 0x2908
	Size: 0x1B8
	Parameters: 2
	Flags: Linked
*/
function function_d621e6d6(var_eea30707, blendtime)
{
	if(isdefined(self.var_d621e6d6) && self.var_d621e6d6 == level.var_f467e5b0.anims[self.animname][var_eea30707])
	{
		return;
	}
	if(!isdefined(blendtime))
	{
		blendtime = (isdefined(level.var_f467e5b0.blend[self.animname][var_eea30707]) ? level.var_f467e5b0.blend[self.animname][var_eea30707] : 0.2);
	}
	self function_1e132b9f(blendtime);
	self endon(#"death");
	self endon(#"entitydeleted");
	self endon(#"hash_23e6132220ac0e4d");
	animloop = level.var_f467e5b0.anims[self.animname][var_eea30707];
	self thread animation::play(animloop, self.origin, self.angles, 1, blendtime, blendtime);
	self.var_d621e6d6 = animloop;
	while(isdefined(animloop))
	{
		self setanimtime(animloop, 0);
		animlength = getanimlength(animloop);
		wait(animlength);
	}
}

/*
	Name: function_47ffa6b8
	Namespace: namespace_594b67e
	Checksum: 0xC38A38F
	Offset: 0x2AC8
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function function_47ffa6b8(var_b56433f8)
{
	suffix = "";
	if(is_true(self.var_de5476af))
	{
		suffix = suffix + "_ads";
	}
	suffix = suffix + "_loop";
	if(self is_walking())
	{
		suffix = suffix + "_walk";
	}
	return var_b56433f8 + suffix;
}

/*
	Name: function_462c34d0
	Namespace: namespace_594b67e
	Checksum: 0xF33EBA97
	Offset: 0x2B58
	Size: 0x27A
	Parameters: 5
	Flags: Linked
*/
function function_462c34d0(action, scene_root, anim_name, victim, phase)
{
	/#
		assert(isplayer(self));
	#/
	key = actions::function_4e61a046(action.name, phase);
	var_b3d30f5f = undefined;
	if(isdefined(victim) && isdefined(victim.var_9d46265b) && isdefined(victim.var_9d46265b[key]))
	{
		var_b3d30f5f = victim.var_9d46265b[key];
	}
	else
	{
		if(isdefined(self.var_9d46265b) && isdefined(self.var_9d46265b[key]))
		{
			var_b3d30f5f = self.var_9d46265b[key];
		}
		else if(isdefined(level.var_9d46265b) && isdefined(level.var_9d46265b[key]))
		{
			var_b3d30f5f = level.var_9d46265b[key];
		}
	}
	result = spawnstruct();
	result.anim_name = anim_name;
	result.scene_root = scene_root;
	result.overridden = 0;
	result.blend_time = 0.2;
	if(isdefined(var_b3d30f5f))
	{
		result.anim_name = var_b3d30f5f[0];
		if(isdefined(var_b3d30f5f[1]))
		{
			result.scene_root = var_b3d30f5f[1];
			result.var_5e5653b2 = 1;
		}
		result.overridden = 1;
	}
	var_386b7517 = self.var_6639d45b.animname;
	if(isdefined(level.var_f467e5b0.blend[var_386b7517]) && isdefined(level.var_f467e5b0.blend[var_386b7517][result.anim_name]))
	{
		result.blend_time = level.var_f467e5b0.blend[var_386b7517][result.anim_name];
		result.var_7d26075f = 1;
	}
	return result;
}

/*
	Name: function_4cbb6ca7
	Namespace: namespace_594b67e
	Checksum: 0x812B9011
	Offset: 0x2DE0
	Size: 0x1F4
	Parameters: 2
	Flags: None
*/
function function_4cbb6ca7(anim_name, var_f09f326c)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isdefined(self.var_6639d45b));
	#/
	var_4c384fa8 = self.var_6639d45b;
	if(!isarray(var_f09f326c))
	{
		var_d89d1589 = [];
		if(isdefined(level.var_f467e5b0.blend[#"generic"]))
		{
			var_d89d1589[#"generic"] = level.var_f467e5b0.blend[#"generic"][anim_name];
		}
		if(isdefined(level.var_f467e5b0.blend[var_4c384fa8.animname]))
		{
			var_d89d1589[var_4c384fa8.animname] = level.var_f467e5b0.blend[var_4c384fa8.animname][anim_name];
		}
		level.var_f467e5b0.blend[#"generic"][anim_name] = var_f09f326c;
		level.var_f467e5b0.blend[var_4c384fa8.animname][anim_name] = var_f09f326c;
		return var_d89d1589;
	}
	level.var_f467e5b0.blend[#"generic"][anim_name] = var_f09f326c[#"generic"];
	level.var_f467e5b0.blend[var_4c384fa8.animname][anim_name] = var_f09f326c[var_4c384fa8.animname];
	return undefined;
}

/*
	Name: function_1c2992ed
	Namespace: namespace_594b67e
	Checksum: 0x8A6BD338
	Offset: 0x2FE0
	Size: 0x194
	Parameters: 1
	Flags: Linked
*/
function function_1c2992ed(enabled)
{
	var_49b6c927 = is_true(self clientfield::get_to_player("fake_ads"));
	var_4f735d6e = is_true(enabled);
	if(var_4f735d6e && !var_49b6c927)
	{
		self clientfield::set_to_player("fake_ads", 1);
		self easing::function_86ac55c5("bg_aimSpreadScale", 1, 0.2, 0.2, #"sine");
		self capturnrate(45, 90);
	}
	else if(!var_4f735d6e && var_49b6c927)
	{
		self clientfield::set_to_player("fake_ads", 0);
		self easing::function_86ac55c5("bg_aimSpreadScale", 1, 1, 0.2, #"sine");
		self capturnrate(90, 260);
	}
}

/*
	Name: function_6e8e5902
	Namespace: namespace_594b67e
	Checksum: 0x1E522407
	Offset: 0x3180
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function function_6e8e5902(ender)
{
	self notify(#"hash_420f563c810c5f2c");
	self endon(#"hash_420f563c810c5f2c");
	result = undefined;
	result = self waittill(ender, #"hash_4a7c2a6c1d3c2382", #"level_restarting");
	if(result._notify !== "level_restarting")
	{
		self thread function_1c2992ed(0);
	}
	else
	{
		setsaveddvar(#"bg_aimspreadscale", 1);
	}
	self capturnrate(0, 0);
}

/*
	Name: function_7920d338
	Namespace: namespace_594b67e
	Checksum: 0x314D781B
	Offset: 0x3268
	Size: 0x9A
	Parameters: 1
	Flags: None
*/
function function_7920d338(var_75f54ae2)
{
	self endon(var_75f54ae2, #"disconnect");
	waitframe(1);
	while(self getcurrentweapon().basename == "none")
	{
		waitframe(1);
	}
	while(self getweaponammoclip(self getcurrentweapon()) > 0)
	{
		waitframe(1);
	}
	self notify(var_75f54ae2);
}

/*
	Name: function_98f117ad
	Namespace: namespace_594b67e
	Checksum: 0xAB1EB5A5
	Offset: 0x3310
	Size: 0xBA
	Parameters: 2
	Flags: Linked
*/
function function_98f117ad(var_36a368e3, type)
{
	if(!isdefined(type))
	{
		type = "";
	}
	if(type.size > 0)
	{
		type = "_" + type;
	}
	weap = self getcurrentweapon();
	suffix = "_rifle";
	if(weapons::islauncher(weap) && type == "_ads")
	{
		suffix = "_rpg";
	}
	return (var_36a368e3 + suffix) + type;
}

/*
	Name: function_35d0bd11
	Namespace: namespace_594b67e
	Checksum: 0x53E2967E
	Offset: 0x33D8
	Size: 0x20E
	Parameters: 1
	Flags: Linked
*/
function function_35d0bd11(var_4b5540a0)
{
	/#
		assert(isai(self));
	#/
	self flag::clear("stealth_enabled");
	if(is_true(var_4b5540a0))
	{
		self.ignoreall = 1;
		self.ignoreme = 1;
		self battlechatter::function_2ab9360b(0);
		self notsolid();
		self clearenemy();
		self setgoal(self.origin);
		self thread function_91639a4c(1);
		self animcustom(&function_e9aef609);
		self.var_4b5540a0 = 1;
	}
	else
	{
		self.ignoreme = 0;
		self battlechatter::function_2ab9360b(1);
		self util::delay(float(function_60d95f53()) / 1000, undefined, &solid);
		self setgoal(self.origin);
		self thread function_91639a4c(0);
		if(isdefined(self.magic_bullet_shield))
		{
			self util::stop_magic_bullet_shield();
		}
		self.var_4b5540a0 = undefined;
	}
}

/*
	Name: function_e9aef609
	Namespace: namespace_594b67e
	Checksum: 0x65D46702
	Offset: 0x35F0
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_e9aef609()
{
	self endon(#"killanimscript");
	self animmode("nogravity");
	self waittill(#"never");
}

/*
	Name: function_c0f7b46e
	Namespace: namespace_594b67e
	Checksum: 0x234F1E54
	Offset: 0x3648
	Size: 0x2C2
	Parameters: 3
	Flags: Linked
*/
function function_c0f7b46e(fullbody, var_df65246e, linktype)
{
	if(!isdefined(linktype))
	{
		linktype = 1;
	}
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self.var_6639d45b))
	{
		self.var_6639d45b = spawn("script_model", self.origin);
		if(isdefined(self.var_6639d45b))
		{
			self.var_6639d45b.angles = self.angles;
			self.var_6639d45b useanimtree("generic");
			self.var_6639d45b.animname = "player";
			self.var_6639d45b notsolid();
			self.var_6639d45b hide();
			self.var_6639d45b.health = 100;
			self.var_6639d45b setowner(self);
			self.var_6639d45b.team = self.team;
		}
	}
	var_41206ae3 = self function_5d23af5b();
	if(isdefined(var_41206ae3))
	{
		self.var_6639d45b setmodel(var_41206ae3);
	}
	var_b4d88433 = self function_cde23658();
	if(isdefined(self.var_6639d45b.var_b4d88433))
	{
		self.var_6639d45b detach(self.var_6639d45b.var_b4d88433);
		self.var_6639d45b.var_b4d88433 = undefined;
	}
	if(is_true(var_df65246e) && isdefined(var_b4d88433))
	{
		self.var_6639d45b attach(var_b4d88433);
		self.var_6639d45b.var_b4d88433 = var_b4d88433;
	}
	self.var_6639d45b function_b82cae8f(linktype);
	self.var_6639d45b function_1fac41e4(self function_19124308());
	self.var_6639d45b hide();
	return self.var_6639d45b;
}

/*
	Name: function_464d0412
	Namespace: namespace_594b67e
	Checksum: 0xCC8ED727
	Offset: 0x3918
	Size: 0x94
	Parameters: 4
	Flags: Linked
*/
function function_464d0412(fullbody, var_4c384fa8, var_df65246e, linktype)
{
	/#
		assert(isplayer(self));
	#/
	self function_c0f7b46e(fullbody, var_df65246e, linktype);
	if(!isdefined(var_4c384fa8))
	{
		var_4c384fa8 = self.var_6639d45b;
	}
	if(isdefined(var_4c384fa8))
	{
		var_4c384fa8 show();
	}
}

/*
	Name: function_76e2ec80
	Namespace: namespace_594b67e
	Checksum: 0xD91C5CF4
	Offset: 0x39B8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_76e2ec80(var_4c384fa8)
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(var_4c384fa8))
	{
		var_4c384fa8 = self.var_6639d45b;
	}
	if(isdefined(var_4c384fa8))
	{
		var_4c384fa8 hide();
		var_4c384fa8 function_1e132b9f();
	}
}

/*
	Name: function_b0190b65
	Namespace: namespace_594b67e
	Checksum: 0x2E3B4DC2
	Offset: 0x3A40
	Size: 0x174
	Parameters: 1
	Flags: Linked
*/
function function_b0190b65(action)
{
	/#
		assert(isplayer(self));
	#/
	self.takedown.var_84ade654 = 1;
	curweap = self getcurrentweapon();
	if(isdefined(curweap) && curweap.name !== #"none")
	{
		self.last_weapon = curweap;
	}
	self.takedown.stance[action.name] = self getstance();
	self setstance("stand");
	self val::set(#"hash_16b14161e87e9ac4", "allow_crouch", 0);
	self val::set(#"hash_16b14161e87e9ac4", "allow_prone", 0);
	self function_3ceda691("ges_body_shield_gundown_quick");
	self function_9d7828b0(0.5);
}

/*
	Name: function_9d7828b0
	Namespace: namespace_594b67e
	Checksum: 0x1F16D5ED
	Offset: 0x3BC0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_9d7828b0(delay)
{
	self util::delay(delay, "stop_disable_weapons_offscreen", &function_5faaaecd);
}

/*
	Name: function_5faaaecd
	Namespace: namespace_594b67e
	Checksum: 0xA0D40AF2
	Offset: 0x3C08
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_5faaaecd()
{
	self function_6179ffe7(self getcurrentweapon());
	self val::set(#"hash_58b9fd1cfcf4a27d", "disable_weapons", 2);
	wait(0.5);
	if(isdefined(self.var_621f8539))
	{
		self thread gesture_stop(self.var_621f8539);
	}
}

/*
	Name: function_44a46209
	Namespace: namespace_594b67e
	Checksum: 0x71E54E9E
	Offset: 0x3CA0
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function function_44a46209(var_d8ba335a)
{
	/#
		assert(isplayer(self));
	#/
	self val::reset_all(#"hash_16b14161e87e9ac4");
	if(!is_true(self.takedown.var_84ade654))
	{
		return;
	}
	if(!self.var_6639d45b function_30b535ff(0))
	{
		self function_76e2ec80();
	}
	if(isdefined(var_d8ba335a))
	{
		self setstance(var_d8ba335a);
	}
	self.takedown.var_84ade654 = undefined;
	self val::reset_all(#"hash_58b9fd1cfcf4a27d");
}

/*
	Name: function_3ceda691
	Namespace: namespace_594b67e
	Checksum: 0x46A5908E
	Offset: 0x3DA8
	Size: 0xBC
	Parameters: 7
	Flags: Linked
*/
function function_3ceda691(gesture, target, var_584fcd3e, blendtime, starttime, var_8021ec1b, stopall)
{
	if(!isdefined(gesture))
	{
		gesture = "";
	}
	if(isgesture(gesture))
	{
		self thread function_6f3e9127(gesture, target, var_584fcd3e, blendtime, starttime, var_8021ec1b, stopall);
	}
	else
	{
		/#
			iprintln(("" + gesture) + "");
		#/
	}
}

/*
	Name: function_b56ad054
	Namespace: namespace_594b67e
	Checksum: 0xD0FD302C
	Offset: 0x3E70
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function function_b56ad054()
{
	self.takedown.var_adad6efa = 1;
}

/*
	Name: function_6f3e9127
	Namespace: namespace_594b67e
	Checksum: 0xFBD20BBC
	Offset: 0x3E90
	Size: 0x15C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_6f3e9127(gesture, target, var_584fcd3e, blendtime, starttime, var_8021ec1b, stopall)
{
	self notify("39ccfd1ac8ddccb");
	self endon("39ccfd1ac8ddccb");
	/#
		assert(isgesture(target));
	#/
	self endon(target + "_stop");
	var_66f0ae81 = undefined;
	if(is_true(self.takedown.var_adad6efa))
	{
		self.takedown.var_adad6efa = undefined;
		self function_44a46209();
	}
	while(self function_b2ec14ab())
	{
		waitframe(1);
		var_66f0ae81 = 1;
	}
	if(is_true(var_66f0ae81))
	{
		waitframe(1);
	}
	self playgestureviewmodel(target, var_584fcd3e, blendtime, 0, starttime, var_8021ec1b, stopall);
}

/*
	Name: gesture_stop
	Namespace: namespace_594b67e
	Checksum: 0xE3B4A057
	Offset: 0x3FF8
	Size: 0xAC
	Parameters: 3
	Flags: Linked
*/
function gesture_stop(gesture, outtime, var_8021ec1b)
{
	if(!isdefined(outtime))
	{
		return;
	}
	if(isdefined(outtime) && isgesture(outtime))
	{
		self notify(outtime + "_stop");
		self stopgestureviewmodel(outtime, 0, var_8021ec1b);
	}
	else if(isdefined(outtime))
	{
		/#
			iprintln(("" + outtime) + "");
		#/
	}
}

/*
	Name: scene_play
	Namespace: namespace_594b67e
	Checksum: 0xC7A27353
	Offset: 0x40B0
	Size: 0xAC
	Parameters: 3
	Flags: Linked
*/
function scene_play(scene, player, victim)
{
	a_ents = [];
	a_ents[#"player"] = player;
	a_ents[#"victim"] = victim;
	if(isdefined(level.var_c8b4a78a))
	{
		level.var_c8b4a78a.scene = scene;
		level.var_c8b4a78a.scene_root = self;
	}
	self scene::play(scene, a_ents);
}

/*
	Name: scene_stop
	Namespace: namespace_594b67e
	Checksum: 0x4B6C5D9
	Offset: 0x4168
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function scene_stop()
{
	if(isdefined(level.var_c8b4a78a.scene) && isdefined(level.var_c8b4a78a.scene_root))
	{
		level.var_c8b4a78a.scene_root scene::stop(level.var_c8b4a78a.scene);
	}
}

/*
	Name: function_91639a4c
	Namespace: namespace_594b67e
	Checksum: 0x7057F38C
	Offset: 0x41D8
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function function_91639a4c(var_ee1fe147)
{
	self notify("2cb5a47e02c20ef");
	self endon("2cb5a47e02c20ef");
	self function_a17b179f(var_ee1fe147);
	if(is_true(var_ee1fe147))
	{
		self endon(#"death");
		self waittill(#"hash_7884feb21ff33557");
		self.var_d5bd339b = 1;
	}
	else
	{
		self.var_d5bd339b = undefined;
	}
}

/*
	Name: function_71180c30
	Namespace: namespace_594b67e
	Checksum: 0x7EBA60EE
	Offset: 0x4278
	Size: 0x4E4
	Parameters: 1
	Flags: Linked
*/
function function_71180c30(isolated)
{
	if(!isdefined(self))
	{
		return;
	}
	/#
		assert(isactor(self));
	#/
	victim = self;
	if(is_true(isolated) && !isdefined(victim.var_419b4b2))
	{
		victim flag::set("in_action");
		victim.var_419b4b2 = spawnstruct();
		victim.var_419b4b2.ignoreall = victim.ignoreall;
		victim.var_419b4b2.ignoreme = victim.ignoreme;
		victim.var_419b4b2.var_6eed8aea = victim.var_6eed8aea;
		victim.var_419b4b2.magic_bullet_shield = victim.magic_bullet_shield;
		victim.var_419b4b2.dontattackme = victim.dontattackme;
		victim.var_419b4b2.diequietly = victim.diequietly;
		victim.var_419b4b2.var_e9c62827 = victim.var_e9c62827;
		victim.var_419b4b2.var_3544dda3 = victim flag::get("scripted_lookat_disable");
		victim thread function_91639a4c(1);
		victim flag::set("scripted_lookat_disable");
		victim.ignoreall = 1;
		victim.ignoreme = 1;
		victim.syncedmeleetarget = undefined;
		victim.var_6eed8aea = 0;
		victim.dontattackme = 1;
		victim.diequietly = 1;
		if(isdefined(victim.var_d26a48de))
		{
			victim [[victim.var_d26a48de]]();
		}
		victim.var_419b4b2.goto_node = victim spawner::function_461ce3e9();
		victim notify(#"killanimscript");
		if(!is_true(victim.delayeddeath))
		{
			victim thread util::magic_bullet_shield();
		}
		victim lookatpos(undefined);
		victim notsolid();
		victim setforcenocull();
		victim.var_e9c62827 = 1;
	}
	else if(isdefined(victim.var_419b4b2))
	{
		victim thread function_91639a4c(0);
		victim.ignoreall = victim.var_419b4b2.ignoreall;
		victim.ignoreme = victim.var_419b4b2.ignoreme;
		victim.var_6eed8aea = victim.var_419b4b2.var_6eed8aea;
		victim.in_melee_death = undefined;
		victim solid();
		victim removeforcenocull();
		victim.var_e9c62827 = victim.var_419b4b2.var_e9c62827;
		victim.dontattackme = victim.var_419b4b2.dontattackme;
		victim.diequietly = victim.var_419b4b2.diequietly;
		if(!is_true(victim.var_419b4b2.var_3544dda3))
		{
			victim flag::clear("scripted_lookat_disable");
		}
		if(!is_true(victim.var_419b4b2.magic_bullet_shield))
		{
			victim thread util::stop_magic_bullet_shield();
		}
		if(isdefined(victim.var_419b4b2.goto_node))
		{
			victim spawner::go_to_node(victim.var_419b4b2.goto_node);
		}
		victim.var_419b4b2 = undefined;
		victim flag::clear("in_action");
		getplayers()[0] actions::function_942d9213();
	}
}

/*
	Name: function_1a2a3654
	Namespace: namespace_594b67e
	Checksum: 0x44250224
	Offset: 0x4768
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function function_1a2a3654()
{
	/#
		assert(isplayer(self));
	#/
	currentweapon = self getcurrentweapon();
	if(!function_a06867b0(currentweapon))
	{
		return currentweapon;
	}
	result = undefined;
	var_b0e9905e = -1;
	foreach(weapon in self getweaponslist())
	{
		if(weapon !== currentweapon && !function_a06867b0(weapon))
		{
			weaponammo = self getweaponammoclip(weapon);
			if(!isdefined(result) || weaponammo > var_b0e9905e)
			{
				result = weapon;
				var_b0e9905e = weaponammo;
			}
		}
	}
	return result;
}

/*
	Name: function_a06867b0
	Namespace: namespace_594b67e
	Checksum: 0xE65B7F87
	Offset: 0x48E8
	Size: 0x12A
	Parameters: 1
	Flags: Linked
*/
function function_a06867b0(weapon)
{
	if(!isweapon(weapon))
	{
		return true;
	}
	if(is_true(weapon.isboltaction))
	{
		return true;
	}
	if(is_true(weapon.isgrenadeweapon))
	{
		return true;
	}
	if(isdefined(level.var_e3f5eafc) && weapon === level.var_e3f5eafc)
	{
		return true;
	}
	if(isdefined(level.var_42db149f) && weapon === level.var_42db149f)
	{
		return true;
	}
	if(weapon.name == #"launcher_freefire_t9" || weapon.name == #"hash_1e25706a023b5e09" || weapon.name == #"hash_1a377db5bfa579f3")
	{
		return true;
	}
	return false;
}

/*
	Name: function_1c2cb657
	Namespace: namespace_594b67e
	Checksum: 0x1939FDAF
	Offset: 0x4A20
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function function_1c2cb657(weapon)
{
	if(!isweapon(weapon))
	{
		return false;
	}
	if(!is_true(weapon.ismeleeweapon) && (!is_true(weapon.isbulletweapon) || is_true(weapon.issniperweapon)))
	{
		return true;
	}
	return false;
}

/*
	Name: function_1fac6486
	Namespace: namespace_594b67e
	Checksum: 0xFCA8E8CA
	Offset: 0x4AC0
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_1fac6486(weapon)
{
	if(!isweapon(weapon))
	{
		return false;
	}
	if(is_true(weapon.ismeleeweapon) && !is_true(weapon.isbulletweapon))
	{
		return true;
	}
	return false;
}

/*
	Name: function_396e2076
	Namespace: namespace_594b67e
	Checksum: 0xBCB1DC98
	Offset: 0x4B40
	Size: 0x1B8
	Parameters: 3
	Flags: None
*/
function function_396e2076(var_860605de, var_4170b151, do_wait)
{
	if(!isdefined(var_860605de))
	{
		var_860605de = 1;
	}
	if(!isdefined(var_4170b151))
	{
		var_4170b151 = 1;
	}
	if(!isdefined(do_wait))
	{
		do_wait = 0;
	}
	result = 0;
	e_player = getplayers()[0];
	if(is_true(var_860605de) && e_player flag::get("body_shield_active"))
	{
		result = 1;
		/#
			assert(isdefined(e_player.takedown.body_shield.actor) && isai(e_player.takedown.body_shield.actor), "");
		#/
		e_player.takedown.body_shield.actor delete();
		if(do_wait)
		{
			wait(2.75);
		}
	}
	else if(is_true(var_4170b151))
	{
		result = isdefined(e_player.takedown.body);
		level notify(#"drop_corpse");
		if(do_wait && result)
		{
			wait(1.25);
		}
	}
	return result;
}

/*
	Name: function_e2fcacb2
	Namespace: namespace_594b67e
	Checksum: 0xD8C85BCE
	Offset: 0x4D00
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_e2fcacb2(time)
{
	if(!isdefined(time))
	{
		time = 3;
	}
	self thread function_cc15d11(time);
}

/*
	Name: function_cc15d11
	Namespace: namespace_594b67e
	Checksum: 0x8A20DDBA
	Offset: 0x4D40
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cc15d11(time)
{
	self notify("9aa41f49060e5fb");
	self endon("9aa41f49060e5fb");
	/#
		assert(isplayer(self));
	#/
	self endon(#"death");
	if(time > 0)
	{
		self val::set(#"hash_1ac08695042a6154", "disablegadgets", 1);
		wait(time);
	}
	self val::reset_all(#"hash_1ac08695042a6154");
}

/*
	Name: function_29fd0abd
	Namespace: namespace_594b67e
	Checksum: 0x96B422C3
	Offset: 0x4E10
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function function_29fd0abd()
{
	/#
		assert(isplayer(self));
	#/
	curweap = self getcurrentweapon();
	if(!is_true(curweap.aimdownsight))
	{
		return 0;
	}
	return self adsbuttonpressed();
}

/*
	Name: function_d76eed10
	Namespace: namespace_594b67e
	Checksum: 0x809CBF74
	Offset: 0x4EA0
	Size: 0x274
	Parameters: 1
	Flags: Linked
*/
function function_d76eed10(action)
{
	/#
		assert(isplayer(self));
	#/
	step = 10;
	trace_pos = playerphysicstrace(self.origin + (0, 0, 1), self.origin);
	if(trace_pos != self.origin)
	{
		trace_pos = playerphysicstrace(self.takedown.start_origin + (0, 0, step), self.origin + (0, 0, step));
		if(trace_pos[0] != self.origin[0] || trace_pos[1] != self.origin[1])
		{
			trace_pos = trace_pos + (vectornormalize(self.takedown.start_origin - self.origin));
		}
		trace_pos = playerphysicstrace(trace_pos, trace_pos - (0, 0, step));
		var_f5aab51b = playerphysicstrace(trace_pos + (0, 0, 1), trace_pos);
		if(trace_pos != var_f5aab51b)
		{
			/#
				msg = ((((((("" + action.name) + "") + self.takedown.start_origin[0]) + "") + self.takedown.start_origin[1]) + "") + self.takedown.start_origin[2]) + "";
				iprintlnbold(msg);
				println(msg + "");
			#/
			trace_pos = self.takedown.start_origin;
		}
		self setorigin(trace_pos);
	}
}

/*
	Name: function_fdff1cf3
	Namespace: namespace_594b67e
	Checksum: 0xD39BF7B4
	Offset: 0x5120
	Size: 0x228
	Parameters: 1
	Flags: Linked
*/
function function_fdff1cf3(forwarddist)
{
	if(!isdefined(forwarddist))
	{
		forwarddist = 30;
	}
	/#
		assert(isdefined(self.takedown));
	#/
	if(!isdefined(self.takedown.var_b44d4135))
	{
		self.takedown.var_b44d4135 = [];
	}
	if(!isdefined(self.takedown.var_b187389a))
	{
		self.takedown.var_b187389a = [];
	}
	if(isdefined(self.takedown.var_b44d4135[forwarddist]) && gettime() == self.takedown.var_b44d4135[forwarddist])
	{
		return self.takedown.var_b187389a[forwarddist];
	}
	zoffset = vectorscale((0, 0, 1), 8);
	start = self.origin + zoffset;
	end = (start + (anglestoforward(self.angles) * forwarddist)) + zoffset;
	self.takedown.var_b187389a[forwarddist] = 0;
	radius = 15;
	trace = physicstrace(start, end, (radius * -1, radius * -1, 0), (radius, radius, 70), undefined, 32 | 1, 32768 | 8388608);
	if(trace[#"fraction"] == 1)
	{
		self.takedown.var_b187389a[forwarddist] = 1;
	}
	self.takedown.var_b44d4135[forwarddist] = gettime();
	return self.takedown.var_b187389a[forwarddist];
}

