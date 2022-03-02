#using script_14f4a3c583c77d4b;
#using script_27c22e1d8df4d852;
#using script_35d3717bf2cbee8f;
#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_6b49f66b;

/*
	Name: function_89f2df9
	Namespace: namespace_6b49f66b
	Checksum: 0xB0675087
	Offset: 0x3E8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1848c770303c538f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_6b49f66b
	Checksum: 0x6D763C0
	Offset: 0x430
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_576586e9331e76d2", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: is_weapon_allowed
	Namespace: namespace_6b49f66b
	Checksum: 0x263B8BCD
	Offset: 0x498
	Size: 0x1F6
	Parameters: 1
	Flags: Private
*/
function private is_weapon_allowed(weapon)
{
	/#
		assert(weapon != level.weaponnone);
	#/
	if(zm_loadout::function_2ff6913(weapon))
	{
		return true;
	}
	if(weapon.isaltmode)
	{
		str_weapon_name = weapon.altweapon.name;
	}
	else
	{
		str_weapon_name = weapon.name;
		w_root = self zm_weapons::function_93cd8e76(weapon);
		var_19010660 = w_root.name;
	}
	if(isdefined(level.var_526d919[str_weapon_name]) || (isdefined(var_19010660) && isdefined(level.var_526d919[var_19010660])))
	{
		return true;
	}
	var_876795bf = weapon.attachments;
	if(is_true(level.var_4400c4f7))
	{
		if(isarray(var_876795bf))
		{
			foreach(var_96bc131f in var_876795bf)
			{
				if(var_96bc131f != "clantag" && var_96bc131f != "killcounter" && var_96bc131f != "custom2")
				{
					return false;
				}
			}
		}
		return true;
	}
	return false;
}

/*
	Name: is_melee_allowed
	Namespace: namespace_6b49f66b
	Checksum: 0xA45413F
	Offset: 0x698
	Size: 0x126
	Parameters: 1
	Flags: Private
*/
function private is_melee_allowed(weapon)
{
	challenge = zm_trial::function_a36e8c38(#"hash_576586e9331e76d2");
	if(challenge.var_e097dc07 == #"melee")
	{
		return 1;
	}
	if(challenge.var_e097dc07 == "any_pistol" || challenge.var_e097dc07 == #"hash_7416cabf26f52c5f" && is_true(weapon.isriotshield) && weapon.weapclass == "pistol")
	{
		return 0;
	}
	if(isdefined(challenge) && challenge.var_e097dc07 != #"melee")
	{
		return self is_weapon_allowed(weapon);
	}
	if(self is_weapon_allowed(weapon))
	{
		return 1;
	}
	return 0;
}

/*
	Name: function_6a8979c9
	Namespace: namespace_6b49f66b
	Checksum: 0xAAB38D5E
	Offset: 0x7C8
	Size: 0x100
	Parameters: 0
	Flags: Private
*/
function private function_6a8979c9()
{
	/#
		assert(isdefined(level.var_526d919));
	#/
	foreach(weapon in self getweaponslist(1))
	{
		self function_e14e7b75(weapon);
		if(weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone)
		{
			self function_e14e7b75(weapon.dualwieldweapon);
		}
	}
}

/*
	Name: function_e14e7b75
	Namespace: namespace_6b49f66b
	Checksum: 0x4D3371B5
	Offset: 0x8D0
	Size: 0x14C
	Parameters: 1
	Flags: Private
*/
function private function_e14e7b75(weapon)
{
	var_9caacad5 = !is_weapon_allowed(weapon);
	var_b3340a9 = !is_melee_allowed(weapon);
	if(var_9caacad5 || var_b3340a9)
	{
		if(is_true(weapon.isburstfire) && self getcurrentweapon() == weapon)
		{
			while(self isfiring())
			{
				waitframe(1);
			}
		}
		self function_28602a03(weapon, var_9caacad5, var_b3340a9);
		if(zm_loadout::is_lethal_grenade(weapon))
		{
			self namespace_b22c99a5::function_88805385(1);
		}
	}
	if(is_true(weapon.isheroweapon) && var_9caacad5 && var_b3340a9)
	{
		self namespace_b22c99a5::function_9bf8e274();
	}
}

/*
	Name: function_33f0ddd3
	Namespace: namespace_6b49f66b
	Checksum: 0x9BE20830
	Offset: 0xA28
	Size: 0x24
	Parameters: 1
	Flags: Private
*/
function private function_33f0ddd3(eventstruct)
{
	self thread function_6a8979c9();
}

/*
	Name: function_f66032dd
	Namespace: namespace_6b49f66b
	Checksum: 0xB87F61F1
	Offset: 0xA58
	Size: 0xB4
	Parameters: 0
	Flags: Private
*/
function private function_f66032dd()
{
	if(isdefined(self._gadgets_player))
	{
		for(i = 0; i < 3; i++)
		{
			if(isdefined(self._gadgets_player[i]) && self hasweapon(self._gadgets_player[i]) && is_weapon_allowed(self._gadgets_player[i]))
			{
				self gadgetpowerset(i, self._gadgets_player[i].gadget_powermax);
			}
		}
	}
}

/*
	Name: function_d1de6a85
	Namespace: namespace_6b49f66b
	Checksum: 0xA1D60462
	Offset: 0xB18
	Size: 0x1578
	Parameters: 2
	Flags: Private
*/
function private function_d1de6a85(var_e097dc07, var_f5300808)
{
	if(isdefined(var_f5300808))
	{
		var_f5300808 = zm_trial::function_5769f26a(var_f5300808);
	}
	self.var_e097dc07 = var_e097dc07;
	var_e7beaa5 = [];
	switch(var_e097dc07)
	{
		case "equipment":
		{
			var_e7beaa5 = array(#"eq_acid_bomb", #"hash_246c869c9de45f07", #"hash_10f614b278daaebc", #"tomahawk_t8", #"tomahawk_t8_upgraded", #"claymore", #"hash_4a5efaceb780ecb0", #"eq_molotov", #"hash_308049a67e5afecf", #"hash_34b7eb9fde56bd35", #"hash_244eb1a096b12734", #"hash_c78156ba6aeda14", #"hash_6cb687e3f8c569fd", #"mini_turret", #"proximity_grenade", #"sticky_grenade", #"hash_187a9aad6da705c6");
			level zm_trial::function_8e2a923(1);
			level zm_trial::function_44200d07(1);
			break;
		}
		case "melee":
		{
			var_e7beaa5 = zm_weapons::function_ed29dde5("melee", 0, 1);
			level zm_trial::function_cdcce681(1);
			break;
		}
		case "bowie_knife":
		{
			var_e7beaa5 = array(#"bowie_knife", #"bowie_knife_story_1", #"bowie_knife_widows_wine");
			var_fda63ae3[0] = struct::get("bowie_knife", "zombie_weapon_upgrade").origin;
			level zm_trial::function_25ee130(1);
			break;
		}
		case "leveraction":
		{
			var_e7beaa5 = array(#"tr_leveraction_t8", #"hash_7f8028bb8adc966c");
			objective_struct = struct::get("tr_leveraction_t8", "zombie_weapon_upgrade");
			var_fda63ae3 = objective_struct.origin;
			level zm_trial::function_25ee130(1);
			break;
		}
		case "longburst":
		{
			var_e7beaa5 = array(#"tr_longburst_t8", #"hash_4bf5a2219b1a65d2");
			objective_struct = struct::get("tr_longburst_t8", "zombie_weapon_upgrade");
			var_fda63ae3 = objective_struct.origin;
			level zm_trial::function_25ee130(1);
			break;
		}
		case "hash_33380540d3ae5004":
		{
			var_e7beaa5 = array(#"shotgun_pump_t8", #"hash_459f15018585edda");
			level zm_trial::function_25ee130(1);
			objective_struct = struct::get("shotgun_pump_t8", "zombie_weapon_upgrade");
			var_fda63ae3 = objective_struct.origin;
			break;
		}
		case "hash_2d7eddbe7c839951":
		{
			var_e7beaa5 = array(#"pistol_burst_t8", #"hash_2df0835a53060b95");
			objective_struct = struct::get("pistol_burst_t8", "zombie_weapon_upgrade");
			var_fda63ae3 = objective_struct.origin;
			level zm_trial::function_25ee130(1);
			break;
		}
		case "any_pistol":
		{
			var_e7beaa5 = zm_weapons::function_ed29dde5("pistol", 1, 1);
			var_fda63ae3 = function_f1dd7bf8(array("pistol_standard_t8", "pistol_burst_t8", "pistol_revolver_t8"));
			level zm_trial::function_25ee130(1);
			break;
		}
		case "hash_7416cabf26f52c5f":
		{
			var_e7beaa5 = zm_weapons::function_ed29dde5("pistol", 0, 1);
			var_e7beaa5 = arraycombine(var_e7beaa5, array(#"hash_138efe2bb30be63c", #"hash_138f012bb30beb55", #"hash_46ad37ce8122812e", #"hash_138f002bb30be9a2", #"hash_3a8348f19a7e7629"), 0, 0);
			var_fda63ae3 = function_f1dd7bf8(array("pistol_standard_t8", "pistol_burst_t8", "pistol_revolver_t8"));
			level zm_trial::function_25ee130(1);
			break;
		}
		case "hash_14468aadde60f9e1":
		{
			var_e7beaa5 = zm_weapons::function_ed29dde5("smg", 0, 1);
			var_fda63ae3 = function_f1dd7bf8(array("smg_fastfire_t8", "smg_handling_t8", "smg_drum_pistol_t8", "smg_standard_t8", "smg_accurate_t8"));
			level zm_trial::function_25ee130(1);
			break;
		}
		case "hash_2d7ec445ba288abf":
		{
			var_e7beaa5 = zm_weapons::function_ed29dde5("ar", 0, 1);
			var_fda63ae3 = function_f1dd7bf8(array("ar_accurate_t8", "ar_damage_t8", "ar_fastfire_t8", "ar_galil_t8", "ar_mg1909_t8", "ar_modular_t8", "ar_standard_t8", "ar_stealth_t8"));
			level zm_trial::function_25ee130(1);
			break;
		}
		case "hash_44dcc4dbf2ce47de":
		{
			var_e7beaa5 = zm_weapons::function_ed29dde5("tr", 0, 1);
			var_fda63ae3 = function_f1dd7bf8(array("tr_leveraction_t8", "tr_powersemi_t8", "tr_longburst_t8"));
			level zm_trial::function_25ee130(1);
			break;
		}
		case "hash_1dd9431fbe7472b7":
		{
			var_e7beaa5 = zm_weapons::function_ed29dde5("sniper", 0, 1);
			var_fda63ae3 = function_f1dd7bf8(array("sniper_quickscope_t8", "sniper_fastrechamber_t8", "sniper_powerbolt_t8", "sniper_powersemi_t8"));
			level zm_trial::function_25ee130(1);
			break;
		}
		case "hash_54d4bc51239254b8":
		{
			var_e7beaa5 = zm_weapons::function_ed29dde5("lmg", 0, 1);
			var_fda63ae3 = function_f1dd7bf8(array("lmg_double_t8", "lmg_heavy_t8", "lmg_spray_t8", "lmg_standard_t8"));
			level zm_trial::function_25ee130(1);
			break;
		}
		case "hash_706c2575a1c4f65e":
		{
			var_e7beaa5 = zm_weapons::function_ed29dde5("shotgun", 0, 1);
			var_fda63ae3 = function_f1dd7bf8(array("shotgun_pump_t8", "shotgun_trenchgun_t8"));
			level zm_trial::function_25ee130(1);
			break;
		}
		case "hash_19a4271a5452dc0b":
		{
			var_e7beaa5 = array(#"hash_19a4271a5452dc0b", #"zhield_dw", #"knife", #"bowie_knife");
			level zm_trial::function_25ee130(1);
			break;
		}
		case "special":
		{
			var_e7beaa5 = array(#"hero_chakram_lv1", #"hero_chakram_lv2", #"hero_chakram_lv3", #"hash_68705e3b85992a56", #"hash_68705d3b859928a3", #"hash_68705c3b859926f0", #"hero_hammer_lv1", #"hero_hammer_lv2", #"hero_hammer_lv3", #"hash_50f35e4cfb775e02", #"hash_50f35d4cfb775c4f", #"hash_50f35c4cfb775a9c", #"hero_sword_pistol_lv1", #"hero_sword_pistol_lv2", #"hero_sword_pistol_lv3", #"hash_65e48a2e69e81a5e", #"hash_65e4892e69e818ab", #"hash_65e4882e69e816f8", #"hash_18829d56b3fbd75b", #"hash_18829e56b3fbd90e", #"hash_18829f56b3fbdac1", #"hash_1d3a5509fa2c9ee6", #"hash_1d3a5409fa2c9d33", #"hash_1d3a5309fa2c9b80", #"hash_6627879099b8a337", #"hash_6627889099b8a4ea", #"hash_6627899099b8a69d", #"hash_74dd67dd8a46d144", #"hash_74dd6add8a46d65d", #"hash_74dd69dd8a46d4aa");
			level.var_869ea5a = 1;
			level zm_trial::function_cdcce681(1);
			break;
		}
		case "shield":
		{
			var_e7beaa5 = array(#"zhield_zword_dw", #"hash_68bfa6918dc2eb81", #"hash_2421d32eb1a6a4a5", #"hash_6dc04683a260fcfe", #"hash_237b6756a81881cb", #"hash_2f351450f2e936dc");
			level zm_trial::function_25ee130(1);
			break;
		}
		case "hash_423a501528fbd0a2":
		{
			var_e7beaa5 = array(#"sniper_powersemi_t8");
			objective_struct = struct::get("sniper_powersemi_t8", "zombie_weapon_upgrade");
			if(isdefined(objective_struct))
			{
				var_fda63ae3 = objective_struct.origin;
			}
			level zm_trial::function_25ee130(1);
			break;
		}
		case "spoon":
		{
			var_e7beaa5 = array(#"hash_52b03a79f854eed3", #"hash_32a584f5a65c70d1", #"hash_42a45d43be3dba42", #"hash_42895043be26dc73", #"hash_2182349b1e42e1a4", #"hash_78e66b21aa05c753", #"hash_185abc5c82e9d849", #"hash_158041aab1e14f3a", "tomahawk_t8", "tomahawk_t8_upgraded");
			level zm_trial::function_8e2a923(1);
			level zm_trial::function_44200d07(1);
			break;
		}
		case "hash_6e90934692fe71cd":
		{
			var_e7beaa5 = array(#"zhield_zpear_dw", #"zhield_zpear_turret", #"hash_136814846f94f0cd");
			level zm_trial::function_8e2a923(1);
			level zm_trial::function_44200d07(1);
			level zm_trial::function_cd75b690(1);
			break;
		}
		case "hash_d3707a2c417be98":
		{
			var_e7beaa5 = array(#"pistol_revolver_t8", #"hash_c2a620242d1636a");
			objective_struct = struct::get("pistol_revolver_t8", "zombie_weapon_upgrade");
			if(isdefined(objective_struct))
			{
				var_fda63ae3 = objective_struct.origin;
			}
			level zm_trial::function_25ee130(1);
			break;
		}
		case "hash_2a9cff6031a07658":
		{
			var_e7beaa5 = array(#"smg_thompson_t8", #"hash_3273c6574279dea9");
			objective_struct = struct::get("smg_thompson_t8", "zombie_weapon_upgrade");
			if(isdefined(objective_struct))
			{
				var_fda63ae3 = objective_struct.origin;
			}
			level zm_trial::function_25ee130(1);
			break;
		}
		case "no_attachments":
		{
			level.var_4400c4f7 = 1;
			level.var_869ea5a = 1;
			break;
		}
		default:
		{
			/#
				assert(0, "" + var_e097dc07);
			#/
			break;
		}
	}
	level.var_526d919 = [];
	foreach(name in var_e7beaa5)
	{
		weapon = getweapon(name);
		if(isdefined(weapon) && weapon != level.weaponnone)
		{
			level.var_526d919[name] = weapon;
		}
	}
	foreach(player in getplayers())
	{
		if(var_e097dc07 === #"hash_6e90934692fe71cd")
		{
			player allowmelee(0);
		}
		player thread function_f0e03d3(var_f5300808);
	}
	callback::function_33f0ddd3(&function_33f0ddd3);
	callback::function_f77ced93(&namespace_b22c99a5::function_79518194);
	zm_traps::function_6966417b();
	self function_e20ebcfd();
	if(isdefined(var_fda63ae3))
	{
		if(!isdefined(var_fda63ae3))
		{
			var_fda63ae3 = [];
		}
		else if(!isarray(var_fda63ae3))
		{
			var_fda63ae3 = array(var_fda63ae3);
		}
		foreach(var_6bb4a364 in var_fda63ae3)
		{
			n_obj_id = gameobjects::get_next_obj_id();
			if(!isdefined(self.a_n_objective_ids))
			{
				self.a_n_objective_ids = [];
			}
			else if(!isarray(self.a_n_objective_ids))
			{
				self.a_n_objective_ids = array(self.a_n_objective_ids);
			}
			self.a_n_objective_ids[self.a_n_objective_ids.size] = n_obj_id;
			objective_add(n_obj_id, "active", var_6bb4a364, #"hash_423a75e2700a53ab");
			function_6da98133(n_obj_id);
		}
		foreach(player in getplayers())
		{
			player thread function_c305f695(self);
		}
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_6b49f66b
	Checksum: 0xD10A8D66
	Offset: 0x2098
	Size: 0x3D4
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	if(isarray(self.a_n_objective_ids))
	{
		foreach(n_objective_id in self.a_n_objective_ids)
		{
			gameobjects::release_obj_id(n_objective_id);
		}
		self.a_n_objective_ids = undefined;
	}
	level.var_869ea5a = undefined;
	callback::function_824d206(&function_33f0ddd3);
	callback::function_5a753d97(&namespace_b22c99a5::function_79518194);
	foreach(player in getplayers())
	{
		foreach(weapon in player getweaponslist(1))
		{
			player unlockweapon(weapon);
			if(weapon.isdualwield && weapon.dualwieldweapon != level.weaponnone)
			{
				player unlockweapon(weapon.dualwieldweapon);
			}
		}
		if(zm_loadout::is_lethal_grenade(weapon))
		{
			player namespace_b22c99a5::function_88805385(0);
		}
		player namespace_b22c99a5::function_73ff0096();
		player namespace_b22c99a5::function_7dbb1712(1);
		if(self.var_e097dc07 == #"hash_6e90934692fe71cd")
		{
			player allowmelee(1);
		}
	}
	if(round_reset && self.var_e097dc07 == #"equipment")
	{
		foreach(player in getplayers())
		{
			player function_f66032dd();
		}
	}
	zm_traps::function_9d0c9706();
	level.var_526d919 = undefined;
	level.var_4400c4f7 = undefined;
	level zm_trial::function_25ee130(0);
}

/*
	Name: function_f1dd7bf8
	Namespace: namespace_6b49f66b
	Checksum: 0x1A57A726
	Offset: 0x2478
	Size: 0x152
	Parameters: 1
	Flags: None
*/
function function_f1dd7bf8(var_9e126e48)
{
	if(!isdefined(var_9e126e48))
	{
		var_9e126e48 = [];
	}
	else if(!isarray(var_9e126e48))
	{
		var_9e126e48 = array(var_9e126e48);
	}
	var_fda63ae3 = [];
	foreach(var_957235ca in var_9e126e48)
	{
		s_wallbuy = struct::get(var_957235ca, "zombie_weapon_upgrade");
		if(isdefined(s_wallbuy))
		{
			if(!isdefined(var_fda63ae3))
			{
				var_fda63ae3 = [];
			}
			else if(!isarray(var_fda63ae3))
			{
				var_fda63ae3 = array(var_fda63ae3);
			}
			var_fda63ae3[var_fda63ae3.size] = s_wallbuy.origin;
		}
	}
	return var_fda63ae3;
}

/*
	Name: function_f0e03d3
	Namespace: namespace_6b49f66b
	Checksum: 0x2C63EFA6
	Offset: 0x25D8
	Size: 0x164
	Parameters: 1
	Flags: None
*/
function function_f0e03d3(var_f5300808)
{
	self endon(#"disconnect");
	if(is_true(var_f5300808))
	{
		while(self zm_utility::is_drinking())
		{
			waitframe(1);
		}
		var_3ba4bf7d = self getweaponslistprimaries();
		foreach(weapon in var_3ba4bf7d)
		{
			self takeweapon(weapon);
		}
		var_d6e53d7a = array::random(level.var_526d919);
		self zm_weapons::weapon_give(var_d6e53d7a);
	}
	self thread function_6a8979c9();
	self namespace_b22c99a5::function_7dbb1712(1);
}

/*
	Name: function_937e218c
	Namespace: namespace_6b49f66b
	Checksum: 0xB261235E
	Offset: 0x2748
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function function_937e218c()
{
	s_challenge = zm_trial::function_a36e8c38(#"hash_576586e9331e76d2");
	if(isdefined(s_challenge))
	{
		return s_challenge.var_e097dc07;
	}
}

/*
	Name: is_active
	Namespace: namespace_6b49f66b
	Checksum: 0x3A2884E5
	Offset: 0x2790
	Size: 0x72
	Parameters: 1
	Flags: None
*/
function is_active(var_1eb3fec6)
{
	if(!isdefined(var_1eb3fec6))
	{
		var_1eb3fec6 = 0;
	}
	if(var_1eb3fec6 && is_true(level.var_869ea5a))
	{
		return 0;
	}
	challenge = zm_trial::function_a36e8c38(#"hash_576586e9331e76d2");
	return isdefined(challenge);
}

/*
	Name: function_bb33631e
	Namespace: namespace_6b49f66b
	Checksum: 0xCB1D8076
	Offset: 0x2810
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function function_bb33631e(var_b5d0ea49)
{
}

/*
	Name: disable_offhand_weapons
	Namespace: namespace_6b49f66b
	Checksum: 0xDCD24FEA
	Offset: 0x2898
	Size: 0x6C
	Parameters: 0
	Flags: Private
*/
function private disable_offhand_weapons()
{
	self endon(#"disconnect");
	var_915fee20 = self offhandweaponsenabled();
	self disableoffhandweapons();
	wait(1);
	if(var_915fee20)
	{
		self enableoffhandweapons();
	}
}

/*
	Name: function_e20ebcfd
	Namespace: namespace_6b49f66b
	Checksum: 0x2E3956E7
	Offset: 0x2910
	Size: 0x18C
	Parameters: 0
	Flags: Private
*/
function private function_e20ebcfd()
{
	if(self.var_e097dc07 != #"equipment")
	{
		foreach(player in getplayers())
		{
			player thread disable_offhand_weapons();
			if(isarray(player.mini_turrets))
			{
				arrayremovevalue(player.mini_turrets, undefined);
				foreach(mini_turret in player.mini_turrets)
				{
					mini_turret dodamage(mini_turret.health + 100, mini_turret.origin);
				}
			}
		}
	}
}

/*
	Name: function_f3fdd8f7
	Namespace: namespace_6b49f66b
	Checksum: 0x5D3DA201
	Offset: 0x2AA8
	Size: 0x124
	Parameters: 0
	Flags: Private
*/
function private function_f3fdd8f7()
{
	/#
		assert(isdefined(level.var_526d919));
	#/
	foreach(weapon in level.var_526d919)
	{
		if(self hasweapon(weapon, 1))
		{
			return true;
		}
		if(isarray(level.var_5a069e6) && isweapon(level.var_5a069e6[weapon]) && self hasweapon(level.var_5a069e6[weapon], 1))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_c305f695
	Namespace: namespace_6b49f66b
	Checksum: 0x749673CC
	Offset: 0x2BD8
	Size: 0x232
	Parameters: 1
	Flags: Private
*/
function private function_c305f695(challenge)
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	/#
		assert(isarray(challenge.a_n_objective_ids), "");
	#/
	foreach(n_objective_id in challenge.a_n_objective_ids)
	{
		objective_setinvisibletoplayer(n_objective_id, self);
	}
	wait(12);
	while(true)
	{
		if(self function_f3fdd8f7())
		{
			foreach(n_objective_id in challenge.a_n_objective_ids)
			{
				objective_setinvisibletoplayer(n_objective_id, self);
			}
		}
		else
		{
			foreach(n_objective_id in challenge.a_n_objective_ids)
			{
				objective_setvisibletoplayer(n_objective_id, self);
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_5fbf572
	Namespace: namespace_6b49f66b
	Checksum: 0xD0C64A19
	Offset: 0x2E18
	Size: 0x104
	Parameters: 2
	Flags: None
*/
function function_5fbf572(weapon, var_2f0cc3aa)
{
	if(!isdefined(var_2f0cc3aa))
	{
		var_2f0cc3aa = 0;
	}
	if(!zm_utility::is_trials())
	{
		return true;
	}
	if(var_2f0cc3aa && is_active(1) && isdefined(weapon) && is_melee_allowed(weapon))
	{
		return true;
	}
	if(is_active(1) || namespace_fc5170d1::is_active() || self function_635f9c02(weapon))
	{
		if(isplayer(self))
		{
			self namespace_b22c99a5::function_97444b02();
		}
		return false;
	}
	return true;
}

