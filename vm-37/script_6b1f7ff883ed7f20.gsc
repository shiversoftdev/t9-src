#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using script_7f6cd71c43c45c57;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using script_7464a3005f61a5f6;
#using scripts\core_common\aat_shared.gsc;

#namespace ammomod_cryofreeze;

/*
	Name: function_ab6c8a0b
	Namespace: ammomod_cryofreeze
	Checksum: 0x9384EFE5
	Offset: 0x238
	Size: 0x454
	Parameters: 0
	Flags: Linked
*/
function function_ab6c8a0b()
{
	if(!is_true(level.aat_in_use))
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_54537cc749c2001d")))
	{
		level.var_8b4e3a9f = 1;
	}
	aat::register("ammomod_cryofreeze", 0.25, 0, 0, 3, 1, &result, "t7_hud_zm_aat_thunderwall", "wpn_aat_thunder_wall_plr", undefined, #"cold", undefined, #"hash_42ab7b3bdc482a44");
	aat::register("ammomod_cryofreeze_1", 0.25, 0, 0, 3, 1, &result, "t7_hud_zm_aat_thunderwall", "wpn_aat_thunder_wall_plr", undefined, #"cold", undefined, #"hash_42ab7b3bdc482a44");
	aat::register("ammomod_cryofreeze_2", 0.25, 0, 0, 3, 1, &result, "t7_hud_zm_aat_thunderwall", "wpn_aat_thunder_wall_plr", undefined, #"cold", undefined, #"hash_42ab7b3bdc482a44");
	aat::register("ammomod_cryofreeze_3", 0.25, 0, 0, 3, 1, &result, "t7_hud_zm_aat_thunderwall", "wpn_aat_thunder_wall_plr", undefined, #"cold", undefined, #"hash_42ab7b3bdc482a44");
	aat::register("ammomod_cryofreeze_4", 0.25, 0, 0, 3, 1, &result, "t7_hud_zm_aat_thunderwall", "wpn_aat_thunder_wall_plr", undefined, #"cold", undefined, #"hash_42ab7b3bdc482a44");
	aat::register("ammomod_cryofreeze_5", 0.25, 0, 0, 3, 1, &result, "t7_hud_zm_aat_thunderwall", "wpn_aat_thunder_wall_plr", undefined, #"cold", undefined, #"hash_42ab7b3bdc482a44");
	clientfield::register("actor", "zm_ammomod_cryofreeze_trail_clientfield", 1, 1, "int");
	clientfield::register("vehicle", "zm_ammomod_cryofreeze_trail_clientfield", 1, 1, "int");
	clientfield::register("actor", "zm_ammomod_cryofreeze_explosion_clientfield", 1, 1, "counter");
	clientfield::register("vehicle", "zm_ammomod_cryofreeze_explosion_clientfield", 1, 1, "counter");
	clientfield::register("toplayer", "ammomod_cryofreeze_proc", 1, 1, "counter");
	namespace_df7b10e3::register_slowdown(#"hash_11428bfe58012e24", 0.7, 3);
	namespace_df7b10e3::register_slowdown(#"hash_61bdd7c7815dd7a9", 0.7, 5);
	namespace_df7b10e3::register_slowdown(#"hash_61bdd6c7815dd5f6", 0.5, 5);
}

/*
	Name: function_a0c6cb5d
	Namespace: ammomod_cryofreeze
	Checksum: 0x71B6C8A4
	Offset: 0x698
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a0c6cb5d(aat_name)
{
	switch(aat_name)
	{
		case "ammomod_cryofreeze":
		default:
		{
			return 0;
			break;
		}
		case "ammomod_cryofreeze_1":
		{
			return 1;
			break;
		}
		case "ammomod_cryofreeze_2":
		{
			return 2;
			break;
		}
		case "ammomod_cryofreeze_3":
		{
			return 3;
			break;
		}
		case "ammomod_cryofreeze_4":
		{
			return 4;
			break;
		}
		case "ammomod_cryofreeze_5":
		{
			return 5;
			break;
		}
	}
	return 0;
}

/*
	Name: result
	Namespace: ammomod_cryofreeze
	Checksum: 0xC4395DA2
	Offset: 0x770
	Size: 0x30C
	Parameters: 6
	Flags: Linked
*/
function result(death, attacker, mod, weapon, var_fd90b0bb, vpoint)
{
	if(!isdefined(vpoint))
	{
		vpoint = self.origin;
	}
	self notify(#"hash_3c2776b4262d3359");
	self endon(#"hash_3c2776b4262d3359");
	if(is_true(level.var_8b4e3a9f))
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
	aat_name = mod aat::getaatonweapon(var_fd90b0bb, 1);
	tier = function_a0c6cb5d(aat_name);
	if(tier < 4 && self.var_6f84b820 === #"special")
	{
		return;
	}
	mod clientfield::increment_to_player("ammomod_cryofreeze_proc", 1);
	playfx("zm_weapons/fx9_aat_bul_impact_frost", vpoint);
	mod zm_utility::function_5d356609(aat_name, tier);
	if(is_true(attacker) && function_3be79107(mod) && tier >= 5 && (self.var_6f84b820 === #"normal" || self.var_6f84b820 === #"special"))
	{
		level thread function_9366890d(self, self.origin, mod, weapon, var_fd90b0bb);
	}
	else
	{
		if(self.var_6f84b820 === #"special")
		{
			if(tier >= 4)
			{
				self thread function_f00409f3(mod, weapon, var_fd90b0bb, 0, tier);
			}
		}
		else if(self.var_6f84b820 === #"normal")
		{
			self thread function_f00409f3(mod, weapon, var_fd90b0bb, 0, tier);
		}
	}
}

/*
	Name: function_3be79107
	Namespace: ammomod_cryofreeze
	Checksum: 0xCEDC4EF2
	Offset: 0xA88
	Size: 0xC2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3be79107(e_attacker)
{
	n_current_time = float(gettime()) / 1000;
	if(isplayer(e_attacker))
	{
		if(!isdefined(e_attacker.aat_cooldown_start[#"hash_6c45efdfc5561fe0"]))
		{
			return true;
		}
		if(isdefined(e_attacker.aat_cooldown_start[#"hash_6c45efdfc5561fe0"]) && n_current_time >= (e_attacker.aat_cooldown_start[#"hash_6c45efdfc5561fe0"] + 30))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_f00409f3
	Namespace: ammomod_cryofreeze
	Checksum: 0x465307DF
	Offset: 0xB58
	Size: 0x32C
	Parameters: 5
	Flags: Linked
*/
function function_f00409f3(attacker, mod, weapon, var_e1ec1eee, tier)
{
	if(!isdefined(var_e1ec1eee))
	{
		var_e1ec1eee = 0;
	}
	if(!isdefined(tier))
	{
		tier = 0;
	}
	self endon(#"death");
	if(!isdefined(self.var_d70e35fb))
	{
		self.var_d70e35fb = 1;
	}
	else if(self.var_d70e35fb <= 0.4)
	{
		return;
	}
	if(!isdefined(weapon) || !isdefined(mod) || !isplayer(mod))
	{
		return;
	}
	if(var_e1ec1eee)
	{
		self.var_d70e35fb = 0.4;
	}
	else
	{
		var_1b767d36 = weapons::getbaseweapon(weapon);
		var_fa87e189 = var_1b767d36.firetime;
		multiplier = 1.5;
		if(tier >= 1)
		{
			multiplier = 3;
		}
		self.var_d70e35fb = self.var_d70e35fb - (var_fa87e189 * multiplier);
		if(self.var_d70e35fb <= 0.4)
		{
			self.var_d70e35fb = 0.4;
		}
	}
	if(!self clientfield::get("zm_ammomod_cryofreeze_trail_clientfield"))
	{
		self callback::callback(#"hash_7f690ab86160d4f6");
	}
	self clientfield::set("zm_ammomod_cryofreeze_trail_clientfield", 1);
	self.var_958cf9c5 = 1;
	self.var_e5d5f66e = mod;
	switch(tier)
	{
		case 0:
		case 1:
		{
			self thread namespace_df7b10e3::slowdown(#"hash_11428bfe58012e24", self.var_d70e35fb);
			break;
		}
		case 2:
		{
			self thread namespace_df7b10e3::slowdown(#"hash_61bdd7c7815dd7a9", self.var_d70e35fb);
			break;
		}
		case 3:
		case 4:
		case 5:
		{
			self thread namespace_df7b10e3::slowdown(#"hash_61bdd6c7815dd5f6", self.var_d70e35fb);
			break;
		}
	}
	self thread function_76d7d189(mod, weapon, tier);
	self thread function_6af83db3(mod, undefined, weapon, tier);
}

/*
	Name: function_76d7d189
	Namespace: ammomod_cryofreeze
	Checksum: 0xA92260E8
	Offset: 0xE90
	Size: 0x25C
	Parameters: 3
	Flags: Linked
*/
function function_76d7d189(e_attacker, weapon, tier)
{
	if(!isdefined(tier))
	{
		tier = 0;
	}
	self notify(#"hash_271e03ecc07954ab");
	self endon(#"hash_271e03ecc07954ab", #"death");
	var_b543d2cf = 3;
	if(tier >= 2)
	{
		var_b543d2cf = 5;
	}
	for(i = 0; i < 8; i++)
	{
		wait(var_b543d2cf / 8);
		self.var_d70e35fb = self.var_d70e35fb + 0.125;
		if(self.var_d70e35fb >= 1)
		{
			break;
			continue;
		}
		switch(tier)
		{
			case 0:
			case 1:
			{
				self thread namespace_df7b10e3::slowdown(#"hash_11428bfe58012e24", self.var_d70e35fb);
				break;
			}
			case 2:
			{
				self thread namespace_df7b10e3::slowdown(#"hash_61bdd7c7815dd7a9", self.var_d70e35fb);
				break;
			}
			case 3:
			case 4:
			case 5:
			{
				self thread namespace_df7b10e3::slowdown(#"hash_61bdd6c7815dd5f6", self.var_d70e35fb);
				break;
			}
		}
	}
	self clientfield::set("zm_ammomod_cryofreeze_trail_clientfield", 0);
	self.var_958cf9c5 = undefined;
	self.var_e5d5f66e = undefined;
	self.var_d70e35fb = 1;
	self notify(#"hash_4e1fee0199a7c7c9");
	self callback::callback(#"hash_40f6b51ae82126a4");
}

/*
	Name: function_6af83db3
	Namespace: ammomod_cryofreeze
	Checksum: 0x961EFCFC
	Offset: 0x10F8
	Size: 0x114
	Parameters: 4
	Flags: Linked
*/
function function_6af83db3(attacker, mod, weapon, tier)
{
	if(!isdefined(tier))
	{
		tier = 0;
	}
	self notify(#"hash_42f4135c766a4dd0");
	self endon(#"hash_42f4135c766a4dd0", #"hash_4e1fee0199a7c7c9");
	self waittill(#"death");
	if(isdefined(self))
	{
		if(is_true(self.var_958cf9c5) && function_3be79107(attacker) && tier == 5)
		{
			level thread function_9366890d(self, self.origin, attacker, mod, weapon);
		}
		else
		{
			self namespace_df7b10e3::function_520f4da5(#"hash_11428bfe58012e24");
		}
	}
}

/*
	Name: function_9366890d
	Namespace: ammomod_cryofreeze
	Checksum: 0xF1749C7E
	Offset: 0x1218
	Size: 0x218
	Parameters: 5
	Flags: Linked
*/
function function_9366890d(var_4589e270, var_23255fc5, attacker, mod, weapon)
{
	self endon(#"death");
	var_4589e270 clientfield::increment("zm_ammomod_cryofreeze_explosion_clientfield");
	if(isplayer(attacker))
	{
		attacker.aat_cooldown_start[#"hash_6c45efdfc5561fe0"] = float(gettime()) / 1000;
	}
	a_potential_targets = getentitiesinradius(var_23255fc5, 256, 15);
	count = 0;
	foreach(e_target in a_potential_targets)
	{
		if(!isalive(e_target))
		{
			continue;
		}
		if(count >= 5)
		{
			return;
		}
		if(var_4589e270 === e_target)
		{
			continue;
		}
		if(isalive(e_target))
		{
			if(e_target.var_6f84b820 === #"special" || e_target.var_6f84b820 === #"normal")
			{
				e_target thread function_f00409f3(attacker, mod, weapon, 1, 5);
			}
		}
		count++;
		util::wait_network_frame();
	}
}

