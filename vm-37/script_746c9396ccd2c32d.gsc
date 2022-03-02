#using script_35598499769dbb3d;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace ammomod_napalmburst;

/*
	Name: function_4e4244c1
	Namespace: ammomod_napalmburst
	Checksum: 0xD799C609
	Offset: 0x240
	Size: 0x3C4
	Parameters: 0
	Flags: Linked
*/
function function_4e4244c1()
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_10de3b1cea667398")))
	{
		level.var_172a89cd = 1;
	}
	aat::register("ammomod_napalmburst", 0.15, 0, 3, 3, 1, &result, "t7_hud_zm_aat_blastfurnace", "wpn_aat_blast_furnace_plr", undefined, #"fire", undefined, #"hash_25c5cf4ba6d26606");
	aat::register("ammomod_napalmburst_1", 0.15, 0, 3, 3, 1, &result, "t7_hud_zm_aat_blastfurnace", "wpn_aat_blast_furnace_plr", undefined, #"fire", undefined, #"hash_25c5cf4ba6d26606");
	aat::register("ammomod_napalmburst_2", 0.15, 0, 3, 3, 1, &result, "t7_hud_zm_aat_blastfurnace", "wpn_aat_blast_furnace_plr", undefined, #"fire", undefined, #"hash_25c5cf4ba6d26606");
	aat::register("ammomod_napalmburst_3", 0.15, 0, 3, 3, 1, &result, "t7_hud_zm_aat_blastfurnace", "wpn_aat_blast_furnace_plr", undefined, #"fire", undefined, #"hash_25c5cf4ba6d26606");
	aat::register("ammomod_napalmburst_4", 0.15, 0, 3, 3, 1, &result, "t7_hud_zm_aat_blastfurnace", "wpn_aat_blast_furnace_plr", undefined, #"fire", undefined, #"hash_25c5cf4ba6d26606");
	aat::register("ammomod_napalmburst_5", 0.15, 0, 3, 3, 1, &result, "t7_hud_zm_aat_blastfurnace", "wpn_aat_blast_furnace_plr", undefined, #"fire", undefined, #"hash_25c5cf4ba6d26606");
	clientfield::register("actor", "zm_ammomod_napalmburst_explosion", 1, 1, "counter");
	clientfield::register("vehicle", "zm_ammomod_napalmburst_explosion", 1, 1, "counter");
	clientfield::register("actor", "zm_ammomod_napalmburst_burn", 1, 1, "int");
	clientfield::register("vehicle", "zm_ammomod_napalmburst_burn", 1, 1, "int");
	clientfield::register("toplayer", "ammomod_napalmburst_proc", 1, 1, "counter");
}

/*
	Name: function_e8018847
	Namespace: ammomod_napalmburst
	Checksum: 0xBBD33D6F
	Offset: 0x610
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e8018847(aat_name)
{
	switch(aat_name)
	{
		case "ammomod_napalmburst":
		default:
		{
			return 0;
			break;
		}
		case "ammomod_napalmburst_1":
		{
			return 1;
			break;
		}
		case "ammomod_napalmburst_2":
		{
			return 2;
			break;
		}
		case "ammomod_napalmburst_3":
		{
			return 3;
			break;
		}
		case "ammomod_napalmburst_4":
		{
			return 4;
			break;
		}
		case "ammomod_napalmburst_5":
		{
			return 5;
			break;
		}
	}
	return 0;
}

/*
	Name: result
	Namespace: ammomod_napalmburst
	Checksum: 0x27B0FFDA
	Offset: 0x6E8
	Size: 0x2F4
	Parameters: 6
	Flags: Linked
*/
function result(death, attacker, mod, weapon, var_fd90b0bb, vpoint)
{
	if(!isdefined(vpoint))
	{
		vpoint = self.origin;
	}
	if(is_true(level.var_172a89cd))
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
	if(!isplayer(attacker))
	{
		return;
	}
	if(self.var_6f84b820 === #"elite" || self.var_18bdc30 === #"boss")
	{
		return;
	}
	aat_name = attacker aat::getaatonweapon(weapon, 1);
	tier = function_e8018847(aat_name);
	if(tier < 4 && self.var_6f84b820 === #"special")
	{
		return;
	}
	attacker clientfield::increment_to_player("ammomod_napalmburst_proc", 1);
	playfx("zm_weapons/fx9_aat_bul_impact_fire", vpoint);
	attacker zm_utility::function_5d356609(aat_name, tier);
	if(is_true(death) && function_4f7f29ab(attacker) && tier >= 5)
	{
		level thread function_c8e3a0dc(self, self.origin, attacker, mod, weapon, var_fd90b0bb);
	}
	else
	{
		if(self.var_6f84b820 === #"special")
		{
			if(tier >= 4)
			{
				self thread function_80b0dbe5(attacker, weapon, tier);
				self thread function_be5234be(attacker, mod, weapon, var_fd90b0bb, tier);
			}
		}
		else if(self.var_6f84b820 === #"normal")
		{
			self thread function_80b0dbe5(attacker, weapon, tier);
			self thread function_be5234be(attacker, mod, weapon, var_fd90b0bb, tier);
		}
	}
}

/*
	Name: function_4f7f29ab
	Namespace: ammomod_napalmburst
	Checksum: 0x22ED8430
	Offset: 0x9E8
	Size: 0xC2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4f7f29ab(e_attacker)
{
	n_current_time = float(gettime()) / 1000;
	if(isplayer(e_attacker))
	{
		if(!isdefined(e_attacker.aat_cooldown_start[#"zm_ammomod_napalmburst_explosion"]))
		{
			return true;
		}
		if(isdefined(e_attacker.aat_cooldown_start[#"zm_ammomod_napalmburst_explosion"]) && n_current_time >= (e_attacker.aat_cooldown_start[#"zm_ammomod_napalmburst_explosion"] + 30))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_c8e3a0dc
	Namespace: ammomod_napalmburst
	Checksum: 0x390F45B0
	Offset: 0xAB8
	Size: 0x240
	Parameters: 6
	Flags: Linked
*/
function function_c8e3a0dc(var_4589e270, var_23255fc5, e_attacker, mod, w_weapon, var_fd90b0bb)
{
	if(isdefined(var_23255fc5))
	{
		var_23255fc5 thread clientfield::increment("zm_ammomod_napalmburst_explosion");
		if(isactor(var_23255fc5))
		{
			var_23255fc5 zombie_death_gib(mod, w_weapon, var_fd90b0bb);
		}
	}
	n_range = 256;
	if(isplayer(mod))
	{
		mod.aat_cooldown_start[#"zm_ammomod_napalmburst_explosion"] = float(gettime()) / 1000;
	}
	a_potential_targets = getentitiesinradius(e_attacker, 256, 15);
	count = 0;
	foreach(zombie in a_potential_targets)
	{
		if(!isalive(zombie))
		{
			continue;
		}
		if(count >= 5)
		{
			return;
		}
		if(var_23255fc5 === zombie)
		{
			continue;
		}
		if(isalive(zombie))
		{
			zombie thread function_80b0dbe5(mod, w_weapon, 5);
			zombie thread function_be5234be(mod, undefined, w_weapon, var_fd90b0bb, 5);
		}
		count++;
		util::wait_network_frame();
	}
}

/*
	Name: function_80b0dbe5
	Namespace: ammomod_napalmburst
	Checksum: 0x274B108A
	Offset: 0xD00
	Size: 0x256
	Parameters: 3
	Flags: Linked
*/
function function_80b0dbe5(e_attacker, w_weapon, tier)
{
	self notify(#"hash_8ba8465d56bb40e");
	self endon(#"hash_8ba8465d56bb40e", #"death");
	self function_74816787();
	var_70ab6bc = self.maxhealth * 0.02;
	var_9b6cf9b5 = self.maxhealth * 0.05;
	if(tier >= 3)
	{
		var_70ab6bc = var_70ab6bc * 2;
		var_9b6cf9b5 = var_9b6cf9b5 * 2;
	}
	i = 0;
	var_9fa954e6 = 5;
	if(tier >= 2)
	{
		var_9fa954e6 = 10;
	}
	var_2c5684be = 0;
	while(i <= var_9fa954e6)
	{
		if(tier >= 1 && !var_2c5684be)
		{
			if(var_9b6cf9b5 >= self.health)
			{
				self.var_9b0f545e = 1;
			}
			self dodamage(var_9b6cf9b5, self.origin, e_attacker, undefined, "none", "MOD_AAT", 0, w_weapon);
			var_2c5684be = 1;
		}
		else
		{
			if(var_70ab6bc >= self.health)
			{
				self.var_9b0f545e = 1;
			}
			self dodamage(var_70ab6bc, self.origin, e_attacker, undefined, "none", "MOD_AAT", 0, w_weapon);
		}
		i++;
		wait(1);
	}
	if(self ishidden())
	{
		while(self ishidden())
		{
			wait(1);
		}
		wait(1);
	}
	self function_68364c40();
	self notify(#"hash_1a322c9f227ee");
}

/*
	Name: function_74816787
	Namespace: ammomod_napalmburst
	Checksum: 0xC3F30350
	Offset: 0xF60
	Size: 0x58
	Parameters: 0
	Flags: Linked
*/
function function_74816787()
{
	if(!isdefined(self.var_2290a541))
	{
		self.var_2290a541 = 0;
	}
	if(self.var_2290a541 == 0)
	{
		self thread clientfield::set("zm_ammomod_napalmburst_burn", 1);
	}
	self.var_2290a541++;
}

/*
	Name: function_68364c40
	Namespace: ammomod_napalmburst
	Checksum: 0xACF60838
	Offset: 0xFC0
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_68364c40()
{
	if(isdefined(self.var_2290a541))
	{
		self.var_2290a541--;
		if(self.var_2290a541 <= 0)
		{
			self.var_2290a541 = 0;
			self thread clientfield::set("zm_ammomod_napalmburst_burn", 0);
		}
	}
}

/*
	Name: function_be5234be
	Namespace: ammomod_napalmburst
	Checksum: 0x2BF2D6FB
	Offset: 0x1020
	Size: 0x114
	Parameters: 5
	Flags: Linked
*/
function function_be5234be(attacker, mod, weapon, var_fd90b0bb, tier)
{
	if(!isdefined(tier))
	{
		tier = 0;
	}
	self notify(#"hash_382c4508f36af706");
	self endon(#"hash_382c4508f36af706", #"hash_1a322c9f227ee");
	self waittill(#"death");
	if(isdefined(self))
	{
		if(is_true((isdefined(self.var_2290a541) ? self.var_2290a541 : 0) > 0) && function_4f7f29ab(attacker) && tier == 5)
		{
			level thread function_c8e3a0dc(self, self.origin, attacker, mod, weapon, var_fd90b0bb);
		}
	}
}

/*
	Name: zombie_death_gib
	Namespace: ammomod_napalmburst
	Checksum: 0x61E0B652
	Offset: 0x1140
	Size: 0xCC
	Parameters: 3
	Flags: Linked
*/
function zombie_death_gib(e_attacker, w_weapon, var_fd90b0bb)
{
	var_c3317960 = gibserverutils::function_de4d9d(w_weapon, var_fd90b0bb);
	self clientfield::set("zm_ammomod_napalmburst_burn", 1);
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
}

