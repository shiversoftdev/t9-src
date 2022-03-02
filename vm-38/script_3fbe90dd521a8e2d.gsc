#using script_3f9e0dc8454d98e1;
#using script_62caa307a394c18c;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\lightning_chain.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace ammomod_deadwire;

/*
	Name: function_97b6a34b
	Namespace: ammomod_deadwire
	Checksum: 0x14C9BAAA
	Offset: 0x248
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_97b6a34b()
{
	level notify(1281833007);
}

/*
	Name: function_af1f180
	Namespace: ammomod_deadwire
	Checksum: 0x3928381C
	Offset: 0x268
	Size: 0xA84
	Parameters: 0
	Flags: Linked
*/
function function_af1f180()
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_66cad2a554f4d928")))
	{
		level.var_92b7028a = 1;
	}
	aat::register("ammomod_deadwire", 0.2, 0, 15, 15, 1, &result, "t7_hud_zm_aat_deadwire", "wpn_aat_dead_wire_plr", undefined, #"electrical", &function_742f2da3, #"hash_bc4e073326251a8");
	aat::register("ammomod_deadwire_1", 0.2, 0, 15, 15, 1, &result, "t7_hud_zm_aat_deadwire", "wpn_aat_dead_wire_plr", undefined, #"electrical", &function_742f2da3, #"hash_bc4e073326251a8");
	aat::register("ammomod_deadwire_2", 0.2, 0, 15, 15, 1, &result, "t7_hud_zm_aat_deadwire", "wpn_aat_dead_wire_plr", undefined, #"electrical", &function_742f2da3, #"hash_bc4e073326251a8");
	aat::register("ammomod_deadwire_3", 0.2, 0, 15, 15, 1, &result, "t7_hud_zm_aat_deadwire", "wpn_aat_dead_wire_plr", undefined, #"electrical", &function_742f2da3, #"hash_bc4e073326251a8");
	aat::register("ammomod_deadwire_4", 0.2, 0, 15, 15, 1, &result, "t7_hud_zm_aat_deadwire", "wpn_aat_dead_wire_plr", undefined, #"electrical", &function_742f2da3, #"hash_bc4e073326251a8");
	aat::register("ammomod_deadwire_5", 0.2, 0, 15, 15, 1, &result, "t7_hud_zm_aat_deadwire", "wpn_aat_dead_wire_plr", undefined, #"electrical", &function_742f2da3, #"hash_bc4e073326251a8");
	clientfield::register("actor", "zm_ammomod_deadwire_explosion", 1, 1, "counter");
	clientfield::register("vehicle", "zm_ammomod_deadwire_explosion", 1, 1, "counter");
	clientfield::register("actor", "zm_ammomod_deadwire_zap", 1, 4, "int");
	clientfield::register("vehicle", "zm_ammomod_deadwire_zap", 1, 4, "int");
	clientfield::register("toplayer", "ammomod_deadwire_proc", 1, 1, "counter");
	level.var_6f993f47 = lightning_chain::create_lightning_chain_params(0, 1, 1);
	level.var_620d4080 = lightning_chain::create_lightning_chain_params(0, 1, 1);
	level.var_8ec0ca14 = lightning_chain::create_lightning_chain_params(0, 1, 1);
	level.var_b347489f = lightning_chain::create_lightning_chain_params(0, 1, 1);
	level.var_9d477dfa = lightning_chain::create_lightning_chain_params(0, 1, 1);
	level.var_7659ca85 = lightning_chain::create_lightning_chain_params(5, 6, 256);
	level.var_6f993f47.head_gib_chance = 0;
	level.var_6f993f47.network_death_choke = 4;
	level.var_6f993f47.should_kill_enemies = 0;
	level.var_6f993f47.challenge_stat_name = #"hash_39f67003b4faaaa1";
	level.var_6f993f47.no_fx = 1;
	level.var_6f993f47.clientside_fx = 0;
	level.var_6f993f47.str_mod = "MOD_AAT";
	level.var_6f993f47.var_a9255d36 = #"hash_ff52504bb0aceb9";
	level.var_6f993f47.var_871d3454 = 2;
	level.var_6f993f47.tier = 0;
	level.var_620d4080.head_gib_chance = 0;
	level.var_620d4080.network_death_choke = 4;
	level.var_620d4080.should_kill_enemies = 0;
	level.var_620d4080.challenge_stat_name = #"hash_39f67003b4faaaa1";
	level.var_620d4080.no_fx = 1;
	level.var_620d4080.clientside_fx = 0;
	level.var_620d4080.str_mod = "MOD_AAT";
	level.var_620d4080.var_a9255d36 = #"hash_ff52504bb0aceb9";
	level.var_620d4080.var_871d3454 = 4;
	level.var_620d4080.tier = 1;
	level.var_8ec0ca14.head_gib_chance = 0;
	level.var_8ec0ca14.network_death_choke = 4;
	level.var_8ec0ca14.should_kill_enemies = 0;
	level.var_8ec0ca14.challenge_stat_name = #"hash_39f67003b4faaaa1";
	level.var_8ec0ca14.no_fx = 1;
	level.var_8ec0ca14.clientside_fx = 0;
	level.var_8ec0ca14.str_mod = "MOD_AAT";
	level.var_8ec0ca14.var_a9255d36 = #"hash_ff52504bb0aceb9";
	level.var_8ec0ca14.var_871d3454 = 4;
	level.var_8ec0ca14.tier = 2;
	level.var_b347489f.head_gib_chance = 0;
	level.var_b347489f.network_death_choke = 4;
	level.var_b347489f.should_kill_enemies = 0;
	level.var_b347489f.challenge_stat_name = #"hash_39f67003b4faaaa1";
	level.var_b347489f.no_fx = 1;
	level.var_b347489f.clientside_fx = 0;
	level.var_b347489f.str_mod = "MOD_AAT";
	level.var_b347489f.var_a9255d36 = #"hash_ff52504bb0aceb9";
	level.var_b347489f.var_871d3454 = 4;
	level.var_b347489f.tier = 3;
	level.var_9d477dfa.head_gib_chance = 0;
	level.var_9d477dfa.network_death_choke = 4;
	level.var_9d477dfa.should_kill_enemies = 0;
	level.var_9d477dfa.challenge_stat_name = #"hash_39f67003b4faaaa1";
	level.var_9d477dfa.no_fx = 1;
	level.var_9d477dfa.clientside_fx = 0;
	level.var_9d477dfa.str_mod = "MOD_AAT";
	level.var_9d477dfa.var_a9255d36 = #"hash_ff52504bb0aceb9";
	level.var_9d477dfa.var_871d3454 = 4;
	level.var_9d477dfa.tier = 4;
	level.var_7659ca85.head_gib_chance = 0;
	level.var_7659ca85.network_death_choke = 4;
	level.var_7659ca85.should_kill_enemies = 0;
	level.var_7659ca85.challenge_stat_name = #"hash_39f67003b4faaaa1";
	level.var_7659ca85.no_fx = 1;
	level.var_7659ca85.clientside_fx = 0;
	level.var_7659ca85.str_mod = "MOD_AAT";
	level.var_7659ca85.var_a9255d36 = #"hash_ff52504bb0aceb9";
	level.var_7659ca85.var_871d3454 = 4;
	level.var_7659ca85.tier = 5;
	callback::add_callback(#"hash_210adcf09e99fba1", &function_ffe2bb2f);
}

/*
	Name: function_832f84f6
	Namespace: ammomod_deadwire
	Checksum: 0x52E2EB17
	Offset: 0xCF8
	Size: 0xBC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_832f84f6(aat_name)
{
	switch(aat_name)
	{
		case "ammomod_deadwire":
		{
			return 0;
			break;
		}
		case "ammomod_deadwire_1":
		{
			return 1;
			break;
		}
		case "ammomod_deadwire_2":
		{
			return 2;
			break;
		}
		case "ammomod_deadwire_3":
		{
			return 3;
			break;
		}
		case "ammomod_deadwire_4":
		{
			return 4;
			break;
		}
		case "ammomod_deadwire_5":
		{
			return 5;
			break;
		}
	}
	return 0;
}

/*
	Name: result
	Namespace: ammomod_deadwire
	Checksum: 0x708A5616
	Offset: 0xDC0
	Size: 0x3F4
	Parameters: 8
	Flags: Linked
*/
function result(death, attacker, mod, weapon, var_fd90b0bb, vpoint, shitloc, boneindex)
{
	if(!isdefined(boneindex))
	{
		boneindex = self.origin;
	}
	if(is_true(level.var_92b7028a))
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
	if(!isplayer(vpoint))
	{
		return;
	}
	if(self.var_6f84b820 === #"elite" || self.var_18bdc30 === #"boss")
	{
		return;
	}
	aat_name = vpoint aat::getaatonweapon(shitloc, 1);
	tier = function_832f84f6(aat_name);
	if(tier < 4 && self.var_6f84b820 === #"special")
	{
		return;
	}
	vpoint clientfield::increment_to_player("ammomod_deadwire_proc", 1);
	playfx("zm_weapons/fx9_aat_bul_impact_electric", boneindex);
	if(!isdefined(zombie_utility::function_d2dfacfd(#"tesla_head_gib_chance")))
	{
		zombie_utility::set_zombie_var(#"tesla_head_gib_chance", 50);
	}
	vpoint zm_utility::function_5d356609(aat_name, tier);
	switch(tier)
	{
		case 0:
		{
			level.var_6f993f47.weapon = shitloc;
			s_params = level.var_6f993f47;
			break;
		}
		case 1:
		{
			level.var_620d4080.weapon = shitloc;
			s_params = level.var_620d4080;
			break;
		}
		case 2:
		{
			level.var_8ec0ca14.weapon = shitloc;
			s_params = level.var_8ec0ca14;
			break;
		}
		case 3:
		{
			level.var_b347489f.weapon = shitloc;
			s_params = level.var_b347489f;
			break;
		}
		case 4:
		{
			level.var_9d477dfa.weapon = shitloc;
			s_params = level.var_9d477dfa;
			break;
		}
		case 5:
		{
			level.var_7659ca85.weapon = shitloc;
			s_params = level.var_7659ca85;
			break;
		}
	}
	if(self.var_6f84b820 === #"special")
	{
		if(tier >= 4)
		{
			self thread function_e0e02bed(vpoint, s_params, tier);
		}
	}
	else if(self.var_6f84b820 === #"normal")
	{
		self thread function_e0e02bed(vpoint, s_params, tier);
	}
}

/*
	Name: function_b686c867
	Namespace: ammomod_deadwire
	Checksum: 0xA05EF02
	Offset: 0x11C0
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function function_b686c867(e_attacker)
{
	n_current_time = float(gettime()) / 1000;
	if(isplayer(e_attacker))
	{
		if(!isdefined(e_attacker.aat_cooldown_start[#"zm_ammomod_deadwire_explosion"]))
		{
			return true;
		}
		if(isdefined(e_attacker.aat_cooldown_start[#"zm_ammomod_deadwire_explosion"]) && n_current_time >= (e_attacker.aat_cooldown_start[#"zm_ammomod_deadwire_explosion"] + 30))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_e0e02bed
	Namespace: ammomod_deadwire
	Checksum: 0xB6947A30
	Offset: 0x1290
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function function_e0e02bed(player, s_params, tier)
{
	self endon(#"death");
	if(isdefined(self.spawn_time) && gettime() == self.spawn_time)
	{
		waitframe(1);
	}
	if(!isplayer(player))
	{
		return;
	}
	if(tier >= 5 && function_b686c867(player))
	{
		function_5e4b580b(player, s_params, tier);
	}
	else
	{
		self function_de99f2ad(player, self, s_params, tier);
	}
}

/*
	Name: function_5e4b580b
	Namespace: ammomod_deadwire
	Checksum: 0x61B20112
	Offset: 0x1378
	Size: 0x184
	Parameters: 3
	Flags: Linked
*/
function function_5e4b580b(player, s_params, tier)
{
	if(isactor(self) || isvehicle(self))
	{
		self clientfield::increment("zm_ammomod_deadwire_explosion", 1);
	}
	a_zombies = getentitiesinradius(self.origin, 256, 15);
	count = 0;
	self function_de99f2ad(player, self, s_params, tier);
	foreach(e_zombie in a_zombies)
	{
		if(count >= 5)
		{
			return;
		}
		if(e_zombie == self)
		{
			continue;
		}
		e_zombie function_de99f2ad(player, self, s_params, tier);
		count++;
	}
}

/*
	Name: function_de99f2ad
	Namespace: ammomod_deadwire
	Checksum: 0xC635B8D4
	Offset: 0x1508
	Size: 0x164
	Parameters: 4
	Flags: Linked
*/
function function_de99f2ad(player, var_fb0999c0, s_params, tier)
{
	if(!isalive(self))
	{
		return;
	}
	if(is_true(level.aat[#"ammomod_deadwire"].immune_result_indirect[self.archetype]))
	{
		return;
	}
	if(self == var_fb0999c0 && is_true(level.aat[#"ammomod_deadwire"].immune_result_direct[self.archetype]))
	{
		return;
	}
	if(self ai::is_stunned() || self flag::get(#"hash_83000b27a1fe353") || !self ai::function_28aab32a())
	{
		return;
	}
	self flag::set(#"hash_83000b27a1fe353");
	self.var_9c33fa32 = player;
	self thread function_30c7f12c(player, s_params, tier);
}

/*
	Name: function_13d4bcdf
	Namespace: ammomod_deadwire
	Checksum: 0x8A38560C
	Offset: 0x1678
	Size: 0x154
	Parameters: 3
	Flags: Linked
*/
function function_13d4bcdf(origin, player, params)
{
	if(!isplayer(player) || !isalive(self))
	{
		return;
	}
	tier = (isdefined(params.tier) ? params.tier : 0);
	var_871d3454 = (isdefined(params.var_871d3454) ? params.var_871d3454 : 2);
	weapon = player getcurrentweapon();
	damage = (tier >= 3 ? 50 : 25);
	if(zm_utility::is_survival())
	{
		damage = zm_equipment::function_739fbb72(damage);
	}
	else
	{
		damage = zm_equipment::function_379f6b5d(damage);
	}
	self thread function_2bd8c11(player, damage, weapon, var_871d3454);
}

/*
	Name: function_2bd8c11
	Namespace: ammomod_deadwire
	Checksum: 0xE94C1B60
	Offset: 0x17D8
	Size: 0x1BE
	Parameters: 4
	Flags: Linked
*/
function function_2bd8c11(player, damage, weapon, var_871d3454)
{
	self endon(#"death", #"hash_41856bb6371c74a6", #"hash_3a0cc85cce9af776", #"hash_83000b27a1fe353");
	var_4691e777 = self.origin;
	time = 0;
	while(time <= var_871d3454)
	{
		a_potential_targets = getentitiesinradius(self.origin, 256, 15);
		foreach(zombie in a_potential_targets)
		{
			if(isalive(zombie) && isplayer(player) && isdefined(var_4691e777))
			{
				zombie namespace_42457a0::function_601fabe9(#"electrical", damage, var_4691e777, player, undefined, "none", "MOD_AAT", 0, weapon);
			}
			waitframe(1);
		}
		time = time + 1;
		wait(1);
	}
}

/*
	Name: function_30c7f12c
	Namespace: ammomod_deadwire
	Checksum: 0x6CAAE62
	Offset: 0x19A0
	Size: 0x124
	Parameters: 3
	Flags: Linked
*/
function function_30c7f12c(player, s_params, tier)
{
	if(!isdefined(tier))
	{
		tier = 0;
	}
	self notify(#"hash_41856bb6371c74a6");
	self endon(#"death", #"hash_41856bb6371c74a6");
	var_5c68bd89 = tier + 1;
	if(isactor(self) || isvehicle(self))
	{
		self clientfield::set("zm_ammomod_deadwire_zap", var_5c68bd89);
	}
	if(tier >= 1)
	{
		self.tesla_damage_func = &function_13d4bcdf;
	}
	self lightning_chain::arc_damage_ent(player, 2, s_params);
	wait(6);
	self thread function_ffe2bb2f();
}

/*
	Name: function_ffe2bb2f
	Namespace: ammomod_deadwire
	Checksum: 0xF83DB72D
	Offset: 0x1AD0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_ffe2bb2f()
{
	self endon(#"death", #"hash_41856bb6371c74a6");
	waitframe(1);
	if(self flag::get(#"hash_83000b27a1fe353"))
	{
		self flag::clear(#"hash_83000b27a1fe353");
		self.var_9c33fa32 = undefined;
		if(isactor(self) || isvehicle(self))
		{
			self clientfield::set("zm_ammomod_deadwire_zap", 0);
		}
	}
}

/*
	Name: function_742f2da3
	Namespace: ammomod_deadwire
	Checksum: 0x9CC5AF76
	Offset: 0x1BA0
	Size: 0x7C
	Parameters: 3
	Flags: Linked
*/
function function_742f2da3(damage, attacker, weapon)
{
	if(!isdefined(damage))
	{
		damage = 0;
	}
	if(self flag::get(#"hash_83000b27a1fe353"))
	{
		self.health = damage + 1;
		self thread function_851db518(attacker, weapon);
	}
}

/*
	Name: function_851db518
	Namespace: ammomod_deadwire
	Checksum: 0xAEEC528D
	Offset: 0x1C28
	Size: 0xB4
	Parameters: 2
	Flags: Linked
*/
function function_851db518(attacker, weapon)
{
	self notify("4273d3138d9da56b");
	self endon("4273d3138d9da56b");
	self endon(#"death");
	self flag::wait_till_clear(#"hash_83000b27a1fe353");
	if(!zm_utility::is_magic_bullet_shield_enabled(self))
	{
		self.var_fc304017 = 1;
		self kill(self.origin, attacker, undefined, weapon, undefined, 1);
	}
}

