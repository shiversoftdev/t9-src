#using scripts\zm_common\trials\zm_trial_headshots_only.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using script_62caa307a394c18c;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_35598499769dbb3d;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace ammomod_brainrot;

/*
	Name: function_9384b521
	Namespace: ammomod_brainrot
	Checksum: 0x287B5636
	Offset: 0x248
	Size: 0x3C4
	Parameters: 0
	Flags: Linked
*/
function function_9384b521()
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_7ead02dd6721f46a")))
	{
		level.var_564312b5 = 1;
	}
	aat::register("ammomod_brainrot", 0.15, 0, 55, 5, 0, &result, "t7_hud_zm_aat_turned", "wpn_aat_turned_plr", &function_6f735de0, undefined, undefined, #"hash_284e1e340e2541f0");
	aat::register("ammomod_brainrot_1", 0.15, 0, 55, 5, 0, &result, "t7_hud_zm_aat_turned", "wpn_aat_turned_plr", &function_6f735de0, undefined, undefined, #"hash_284e1e340e2541f0");
	aat::register("ammomod_brainrot_2", 0.15, 0, 55, 5, 0, &result, "t7_hud_zm_aat_turned", "wpn_aat_turned_plr", &function_6f735de0, undefined, undefined, #"hash_284e1e340e2541f0");
	aat::register("ammomod_brainrot_3", 0.15, 0, 55, 5, 0, &result, "t7_hud_zm_aat_turned", "wpn_aat_turned_plr", &function_6f735de0, undefined, undefined, #"hash_284e1e340e2541f0");
	aat::register("ammomod_brainrot_4", 0.15, 0, 55, 5, 0, &result, "t7_hud_zm_aat_turned", "wpn_aat_turned_plr", &function_6f735de0, undefined, undefined, #"hash_284e1e340e2541f0");
	aat::register("ammomod_brainrot_5", 0.15, 0, 55, 5, 0, &result, "t7_hud_zm_aat_turned", "wpn_aat_turned_plr", &function_6f735de0, undefined, undefined, #"hash_284e1e340e2541f0");
	clientfield::register("actor", "ammomod_brainrot", 1, 1, "int");
	clientfield::register("vehicle", "ammomod_brainrot", 1, 1, "int");
	clientfield::register("actor", "zm_ammomod_brainrot_exp", 1, 1, "counter");
	clientfield::register("vehicle", "zm_ammomod_brainrot_exp", 1, 1, "counter");
	clientfield::register("toplayer", "ammomod_brainrot_proc", 1, 1, "counter");
}

/*
	Name: function_76ade8b5
	Namespace: ammomod_brainrot
	Checksum: 0xEDA09741
	Offset: 0x618
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_76ade8b5(aat_name)
{
	switch(aat_name)
	{
		case "ammomod_brainrot":
		default:
		{
			return 0;
			break;
		}
		case "ammomod_brainrot_1":
		{
			return 1;
			break;
		}
		case "ammomod_brainrot_2":
		{
			return 2;
			break;
		}
		case "ammomod_brainrot_3":
		{
			return 3;
			break;
		}
		case "ammomod_brainrot_4":
		{
			return 4;
			break;
		}
		case "ammomod_brainrot_5":
		{
			return 5;
			break;
		}
	}
	return 0;
}

/*
	Name: result
	Namespace: ammomod_brainrot
	Checksum: 0x8015ADD1
	Offset: 0x6F0
	Size: 0x244
	Parameters: 6
	Flags: Linked
*/
function result(death, attacker, mod, weapon, var_fd90b0bb, vpoint)
{
	if(!isdefined(vpoint))
	{
		vpoint = self.origin;
	}
	if(is_true(level.var_564312b5))
	{
		return;
	}
	if(!isactor(self) && !isvehicle(self))
	{
		return;
	}
	if(is_true(self.aat_turned))
	{
		return;
	}
	if(!isplayer(mod))
	{
		return;
	}
	if(self.var_6f84b820 === #"elite" || self.var_18bdc30 === #"boss")
	{
		return;
	}
	aat_name = mod aat::getaatonweapon(weapon, 1);
	tier = function_76ade8b5(aat_name);
	if(tier < 4 && self.var_6f84b820 === #"special")
	{
		return;
	}
	mod clientfield::increment_to_player("ammomod_brainrot_proc", 1);
	playfx("zm_weapons/fx9_aat_bul_impact_corrosive", vpoint);
	mod zm_utility::function_5d356609(aat_name, tier);
	if(self.var_6f84b820 === #"special")
	{
		if(tier >= 3)
		{
			self thread function_c81ac3e5(mod, weapon, var_fd90b0bb, tier);
		}
	}
	else if(self.var_6f84b820 === #"normal")
	{
		self thread function_c81ac3e5(mod, weapon, var_fd90b0bb, tier);
	}
}

/*
	Name: function_c81ac3e5
	Namespace: ammomod_brainrot
	Checksum: 0x872DFE7D
	Offset: 0x940
	Size: 0x350
	Parameters: 4
	Flags: Linked
*/
function function_c81ac3e5(attacker, weapon, var_fd90b0bb, tier)
{
	if(self.var_6f84b820 === #"elite" || self.var_6f84b820 === #"boss" || self.var_6f84b820 === #"inanimate")
	{
		return;
	}
	self thread clientfield::set("ammomod_brainrot", 1);
	self thread zombie_death_time_limit(attacker, weapon, var_fd90b0bb, tier);
	self callback::callback(#"hash_7cdd5b06f3e281c6");
	self.team = #"allies";
	self.aat_turned = 1;
	self.n_aat_turned_zombie_kills = 0;
	self thread function_589926fd();
	max_health = self.maxhealth;
	if(self.archetype == #"zombie_dog")
	{
		if(isdefined(level.var_41dd92fd[#"zombie"]))
		{
			max_health = level.var_41dd92fd[#"zombie"].health;
		}
	}
	n_damage = max_health / 2;
	self.var_16d0eb06 = n_damage;
	self clearpath();
	self.keep_moving = 0;
	if(tier >= 3)
	{
		n_damage = max_health / 1;
		self.var_16d0eb06 = n_damage;
	}
	self.var_72a8a05d = self.var_16d0eb06;
	self.takedamage = 0;
	self.allowdeath = 0;
	self.allowpain = 0;
	self.b_ignore_cleanup = 1;
	if(self.archetype === #"zombie")
	{
		self zombie_utility::set_zombie_run_cycle("super_sprint");
		if(math::cointoss())
		{
			if(self.zombie_arms_position == "up")
			{
				self.variant_type = 6;
			}
			else
			{
				self.variant_type = 7;
			}
		}
		else
		{
			if(self.zombie_arms_position == "up")
			{
				self.variant_type = 7;
			}
			else
			{
				self.variant_type = 8;
			}
		}
	}
	if(isplayer(attacker))
	{
		self.var_443d78cc = attacker;
	}
	self thread function_f7f8a2cc(attacker, weapon);
	self thread zombie_kill_tracker(attacker);
	if(isdefined(self.var_d106da57))
	{
		self [[self.var_d106da57]]();
	}
}

/*
	Name: function_589926fd
	Namespace: ammomod_brainrot
	Checksum: 0x642E939C
	Offset: 0xC98
	Size: 0x36
	Parameters: 0
	Flags: Linked
*/
function function_589926fd()
{
	waitframe(1);
	if(isdefined(self) && isalive(self))
	{
		self.health = self.maxhealth;
	}
}

/*
	Name: function_f7f8a2cc
	Namespace: ammomod_brainrot
	Checksum: 0xA3E5B55
	Offset: 0xCD8
	Size: 0x1BC
	Parameters: 2
	Flags: Linked
*/
function function_f7f8a2cc(attacker, weapon)
{
	var_fd6c12d9 = self.origin;
	a_ai_zombies = array::get_all_closest(var_fd6c12d9, getaiteamarray(level.zombie_team), undefined, undefined, 90);
	if(!isdefined(a_ai_zombies))
	{
		return;
	}
	var_be0a98b9 = 8100;
	n_flung_zombies = 0;
	for(i = 0; i < a_ai_zombies.size; i++)
	{
		if(!isdefined(a_ai_zombies[i]) || !isalive(a_ai_zombies[i]))
		{
			continue;
		}
		if(is_true(level.aat[#"ammomod_brainrot"].immune_result_indirect[a_ai_zombies[i].archetype]))
		{
			continue;
		}
		if(a_ai_zombies[i] == self)
		{
			continue;
		}
		v_curr_zombie_origin = a_ai_zombies[i] getcentroid();
		if(distancesquared(var_fd6c12d9, v_curr_zombie_origin) > var_be0a98b9)
		{
			continue;
		}
		a_ai_zombies[i] function_eb8a62bc(var_fd6c12d9, 1, attacker, weapon);
		n_flung_zombies++;
		if(-1 && n_flung_zombies >= 3)
		{
			break;
		}
	}
}

/*
	Name: function_eb8a62bc
	Namespace: ammomod_brainrot
	Checksum: 0xE62062D1
	Offset: 0xEA0
	Size: 0x194
	Parameters: 4
	Flags: Linked, Private
*/
function private function_eb8a62bc(var_c5ad44f1, n_damage, e_attacker, weapon)
{
	if(zm_trial_headshots_only::is_active())
	{
		return;
	}
	v_curr_zombie_origin = self getcentroid();
	if(n_damage >= self.health)
	{
		self.var_f42aed2a = 1;
	}
	self namespace_42457a0::function_601fabe9(#"hash_16b5c37d8feae38c", n_damage, v_curr_zombie_origin, e_attacker, undefined, "none", "MOD_AAT", 0, weapon);
	if(isalive(self))
	{
		self zombie_utility::setup_zombie_knockdown(var_c5ad44f1);
	}
	else
	{
		n_random_x = randomfloatrange(-3, 3);
		n_random_y = randomfloatrange(-3, 3);
		self startragdoll(1);
		self launchragdoll(60 * (vectornormalize((v_curr_zombie_origin - var_c5ad44f1) + (n_random_x, n_random_y, 10))), "torso_lower");
	}
}

/*
	Name: function_6f735de0
	Namespace: ammomod_brainrot
	Checksum: 0xBDF08AA1
	Offset: 0x1040
	Size: 0x132
	Parameters: 0
	Flags: Linked
*/
function function_6f735de0()
{
	if(is_true(level.aat[#"ammomod_brainrot"].immune_result_direct[self.archetype]))
	{
		return false;
	}
	if(is_true(self.barricade_enter))
	{
		return false;
	}
	if(is_true(self.is_traversing))
	{
		return false;
	}
	if(is_true(self.var_69a981e6))
	{
		return false;
	}
	if(!is_true(self.completed_emerging_into_playable_area))
	{
		return false;
	}
	if(is_true(self.is_leaping))
	{
		return false;
	}
	if(is_true(self.missinglegs))
	{
		return false;
	}
	if(isdefined(level.var_11350584) && !self [[level.var_11350584]]())
	{
		return false;
	}
	return true;
}

/*
	Name: zombie_death_time_limit
	Namespace: ammomod_brainrot
	Checksum: 0xFF0BC5B5
	Offset: 0x1180
	Size: 0x194
	Parameters: 4
	Flags: Linked
*/
function zombie_death_time_limit(e_attacker, weapon, var_fd90b0bb, tier)
{
	self endon(#"death");
	level endoncallback(&function_a22e41ec, #"end_game");
	var_d7064585 = 15;
	if(tier >= 2)
	{
		var_d7064585 = 20;
	}
	self waittilltimeout(var_d7064585, #"hash_1bbb03bd582e937f");
	if(isdefined(self.var_10083d9f))
	{
		self [[self.var_10083d9f]]();
	}
	var_8651a024 = self getcentroid();
	self clientfield::set("ammomod_brainrot", 0);
	self clientfield::increment("zm_ammomod_brainrot_exp", 1);
	waitframe(1);
	if(isalive(self))
	{
		self.takedamage = 1;
		self.allowdeath = 1;
		self.team = #"axis";
		self zombie_death_explosion(var_8651a024, e_attacker, weapon, var_fd90b0bb, tier);
		self zombie_death_gib(e_attacker, weapon, var_fd90b0bb);
	}
}

/*
	Name: function_a22e41ec
	Namespace: ammomod_brainrot
	Checksum: 0xD6BEC6F4
	Offset: 0x1320
	Size: 0x140
	Parameters: 1
	Flags: Linked
*/
function function_a22e41ec(_hash)
{
	if(!isdefined(level.ai))
	{
		return;
	}
	self notify("268f33f36bff5671");
	self endon("268f33f36bff5671");
	ai_zombies = getaiteamarray(#"axis");
	foreach(ai in ai_zombies)
	{
		if(is_true(ai.aat_turned) && isalive(ai))
		{
			ai.takedamage = 1;
			ai.allowdeath = 1;
			waitframe(1);
			ai kill();
		}
	}
}

/*
	Name: zombie_death_explosion
	Namespace: ammomod_brainrot
	Checksum: 0x90DFC8E1
	Offset: 0x1468
	Size: 0x324
	Parameters: 5
	Flags: Linked
*/
function zombie_death_explosion(var_3a5b1930, e_attacker, weapon, var_fd90b0bb, tier)
{
	if(!isdefined(tier))
	{
		tier = 0;
	}
	if(tier == 0)
	{
		return;
	}
	a_ai_zombies = array::get_all_closest(var_3a5b1930, getaiteamarray(#"axis"), undefined, undefined, 128);
	if(!isdefined(a_ai_zombies))
	{
		return;
	}
	var_be0a98b9 = 16384;
	var_a374f6da = 3;
	var_5bb9cba5 = 0;
	n_flung_zombies = 0;
	for(i = 0; i < a_ai_zombies.size; i++)
	{
		if(!isdefined(a_ai_zombies[i]) || !isalive(a_ai_zombies[i]))
		{
			continue;
		}
		if(is_true(level.aat[#"ammomod_brainrot"].immune_result_indirect[a_ai_zombies[i].archetype]))
		{
			continue;
		}
		if(a_ai_zombies[i] == self)
		{
			continue;
		}
		v_curr_zombie_origin = a_ai_zombies[i] getcentroid();
		if(distancesquared(var_3a5b1930, v_curr_zombie_origin) > var_be0a98b9)
		{
			continue;
		}
		if(distancesquared(var_3a5b1930, v_curr_zombie_origin) > var_be0a98b9 / 2)
		{
			var_3e23677c = self.var_72a8a05d / 2;
		}
		else
		{
			var_3e23677c = self.var_72a8a05d;
		}
		if(tier >= 5)
		{
			if(var_5bb9cba5 < var_a374f6da)
			{
				if(isdefined(a_ai_zombies[i].var_6f84b820) && a_ai_zombies[i].var_6f84b820 != #"elite")
				{
					a_ai_zombies[i] function_c81ac3e5(e_attacker, weapon, var_fd90b0bb, 3);
					var_5bb9cba5++;
				}
			}
			else
			{
				a_ai_zombies[i] function_eb8a62bc(var_3a5b1930, var_3e23677c, e_attacker, weapon);
				util::wait_network_frame(randomintrange(1, 3));
			}
			continue;
		}
		a_ai_zombies[i] function_eb8a62bc(var_3a5b1930, var_3e23677c, e_attacker, weapon);
		util::wait_network_frame(randomintrange(1, 3));
	}
}

/*
	Name: zombie_kill_tracker
	Namespace: ammomod_brainrot
	Checksum: 0x8F103D5B
	Offset: 0x1798
	Size: 0x9E
	Parameters: 1
	Flags: Linked
*/
function zombie_kill_tracker(e_attacker)
{
	self endon(#"death");
	var_a57adbdc = 1;
	while(self.n_aat_turned_zombie_kills < 6)
	{
		if(!isdefined(self.favoriteenemy) && !isdefined(self.var_73d04341))
		{
			if(!var_a57adbdc)
			{
				break;
			}
			var_a57adbdc = 0;
		}
		else
		{
			var_a57adbdc = 1;
		}
		wait(1);
	}
	self notify(#"hash_1bbb03bd582e937f");
}

/*
	Name: zombie_death_gib
	Namespace: ammomod_brainrot
	Checksum: 0xDAE0D859
	Offset: 0x1840
	Size: 0x144
	Parameters: 3
	Flags: Linked
*/
function zombie_death_gib(e_attacker, weapon, var_fd90b0bb)
{
	var_c3317960 = gibserverutils::function_de4d9d(weapon, var_fd90b0bb);
	gibserverutils::gibhead(self, var_c3317960);
	if(math::cointoss())
	{
		gibserverutils::gibleftarm(self, var_c3317960);
	}
	else
	{
		gibserverutils::gibrightarm(self, var_c3317960);
	}
	gibserverutils::giblegs(self, var_c3317960);
	self.var_f42aed2a = 1;
	if(is_true(level.headshots_only) || zm_trial_headshots_only::is_active())
	{
		self kill();
	}
	else
	{
		self dodamage(self.health, self.origin, e_attacker, undefined, undefined, "MOD_AAT", 0, weapon);
	}
}

