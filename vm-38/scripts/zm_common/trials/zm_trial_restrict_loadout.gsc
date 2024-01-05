#using script_35d3717bf2cbee8f;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_trial_restrict_loadout;

/*
	Name: function_c4538a74
	Namespace: zm_trial_restrict_loadout
	Checksum: 0xD5A4F96A
	Offset: 0x3E8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c4538a74()
{
	level notify(1771804212);
}

/*
	Name: __init__system__
	Namespace: zm_trial_restrict_loadout
	Checksum: 0x18098DFC
	Offset: 0x408
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_restrict_loadout", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_restrict_loadout
	Checksum: 0xFBDEC3F2
	Offset: 0x450
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"restrict_loadout", &on_begin, &on_end);
}

/*
	Name: is_weapon_allowed
	Namespace: zm_trial_restrict_loadout
	Checksum: 0xECCFDCF9
	Offset: 0x4B8
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
	Namespace: zm_trial_restrict_loadout
	Checksum: 0xAD86760
	Offset: 0x6B8
	Size: 0x126
	Parameters: 1
	Flags: Private
*/
function private is_melee_allowed(weapon)
{
	challenge = zm_trial::function_a36e8c38(#"restrict_loadout");
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
	Namespace: zm_trial_restrict_loadout
	Checksum: 0x6727346D
	Offset: 0x7E8
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
	Namespace: zm_trial_restrict_loadout
	Checksum: 0x506A8B63
	Offset: 0x8F0
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
			self zm_trial_util::function_88805385(1);
		}
	}
	if(is_true(weapon.isheroweapon) && var_9caacad5 && var_b3340a9)
	{
		self zm_trial_util::function_9bf8e274();
	}
}

/*
	Name: function_33f0ddd3
	Namespace: zm_trial_restrict_loadout
	Checksum: 0x44D428A8
	Offset: 0xA48
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
	Namespace: zm_trial_restrict_loadout
	Checksum: 0x68362546
	Offset: 0xA78
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
	Name: on_begin
	Namespace: zm_trial_restrict_loadout
	Checksum: 0xB3E21364
	Offset: 0xB38
	Size: 0x1578
	Parameters: 2
	Flags: Private
*/
function private on_begin(var_e097dc07, var_f5300808)
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
			var_e7beaa5 = array(#"eq_acid_bomb", #"eq_acid_bomb_extra", #"homunculus", #"tomahawk_t8", #"tomahawk_t8_upgraded", #"claymore", #"claymore_extra", #"eq_molotov", #"eq_molotov_extra", #"eq_frag_grenade", #"eq_frag_grenade_extra", #"eq_wraith_fire", #"eq_wraith_fire_extra", #"mini_turret", #"proximity_grenade", #"sticky_grenade", #"sticky_grenade_extra");
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
			var_e7beaa5 = array(#"tr_leveraction_t8", #"tr_leveraction_t8_upgraded");
			objective_struct = struct::get("tr_leveraction_t8", "zombie_weapon_upgrade");
			var_fda63ae3 = objective_struct.origin;
			level zm_trial::function_25ee130(1);
			break;
		}
		case "longburst":
		{
			var_e7beaa5 = array(#"tr_longburst_t8", #"tr_longburst_t8_upgraded");
			objective_struct = struct::get("tr_longburst_t8", "zombie_weapon_upgrade");
			var_fda63ae3 = objective_struct.origin;
			level zm_trial::function_25ee130(1);
			break;
		}
		case "hash_33380540d3ae5004":
		{
			var_e7beaa5 = array(#"shotgun_pump_t8", #"shotgun_pump_t8_upgraded");
			level zm_trial::function_25ee130(1);
			objective_struct = struct::get("shotgun_pump_t8", "zombie_weapon_upgrade");
			var_fda63ae3 = objective_struct.origin;
			break;
		}
		case "burst_pistol":
		{
			var_e7beaa5 = array(#"pistol_burst_t8", #"pistol_burst_t8_upgraded");
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
		case "stake_knife":
		{
			var_e7beaa5 = array(#"stake_knife", #"zhield_dw", #"knife", #"bowie_knife");
			level zm_trial::function_25ee130(1);
			break;
		}
		case "special":
		{
			var_e7beaa5 = array(#"hero_chakram_lv1", #"hero_chakram_lv2", #"hero_chakram_lv3", #"hero_chakram_lh_lv1", #"hero_chakram_lh_lv2", #"hero_chakram_lh_lv3", #"hero_hammer_lv1", #"hero_hammer_lv2", #"hero_hammer_lv3", #"hero_scepter_lv1", #"hero_scepter_lv2", #"hero_scepter_lv3", #"hero_sword_pistol_lv1", #"hero_sword_pistol_lv2", #"hero_sword_pistol_lv3", #"hero_sword_pistol_lh_lv1", #"hero_sword_pistol_lh_lv2", #"hero_sword_pistol_lh_lv3", #"hero_flamethrower_t8_lv1", #"hero_flamethrower_t8_lv2", #"hero_flamethrower_t8_lv3", #"hero_gravityspikes_t8_lv1", #"hero_gravityspikes_t8_lv2", #"hero_gravityspikes_t8_lv3", #"hero_katana_t8_lv1", #"hero_katana_t8_lv2", #"hero_katana_t8_lv3", #"hero_minigun_t8_lv1", #"hero_minigun_t8_lv2", #"hero_minigun_t8_lv3");
			level.var_869ea5a = 1;
			level zm_trial::function_cdcce681(1);
			break;
		}
		case "shield":
		{
			var_e7beaa5 = array(#"zhield_zword_dw", #"zhield_zword_dw_upgraded", #"hash_2421d32eb1a6a4a5", #"hash_6dc04683a260fcfe", #"hash_237b6756a81881cb", #"hash_2f351450f2e936dc");
			level zm_trial::function_25ee130(1);
			break;
		}
		case "sniper_powersemi":
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
			var_e7beaa5 = array(#"spoon_alcatraz", #"spork_alcatraz", #"zhield_spectral_dw", #"hash_42895043be26dc73", #"hash_2182349b1e42e1a4", #"zhield_spectral_dw_upgraded", #"hash_185abc5c82e9d849", #"hash_158041aab1e14f3a", "tomahawk_t8", "tomahawk_t8_upgraded");
			level zm_trial::function_8e2a923(1);
			level zm_trial::function_44200d07(1);
			break;
		}
		case "spear_only":
		{
			var_e7beaa5 = array(#"zhield_zpear_dw", #"zhield_zpear_turret", #"hash_136814846f94f0cd");
			level zm_trial::function_8e2a923(1);
			level zm_trial::function_44200d07(1);
			level zm_trial::function_cd75b690(1);
			break;
		}
		case "mozu":
		{
			var_e7beaa5 = array(#"pistol_revolver_t8", #"pistol_revolver_t8_upgraded");
			objective_struct = struct::get("pistol_revolver_t8", "zombie_weapon_upgrade");
			if(isdefined(objective_struct))
			{
				var_fda63ae3 = objective_struct.origin;
			}
			level zm_trial::function_25ee130(1);
			break;
		}
		case "tommy_gun":
		{
			var_e7beaa5 = array(#"smg_thompson_t8", #"smg_thompson_t8_upgraded");
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
		if(var_e097dc07 === #"spear_only")
		{
			player allowmelee(0);
		}
		player thread function_f0e03d3(var_f5300808);
	}
	callback::function_33f0ddd3(&function_33f0ddd3);
	callback::on_weapon_change(&zm_trial_util::function_79518194);
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
			player thread monitor_objective(self);
		}
	}
}

/*
	Name: on_end
	Namespace: zm_trial_restrict_loadout
	Checksum: 0x7979FCBD
	Offset: 0x20B8
	Size: 0x3D4
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
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
	callback::remove_on_weapon_change(&zm_trial_util::function_79518194);
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
			player zm_trial_util::function_88805385(0);
		}
		player zm_trial_util::function_73ff0096();
		player zm_trial_util::function_7dbb1712(1);
		if(self.var_e097dc07 == #"spear_only")
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
	Namespace: zm_trial_restrict_loadout
	Checksum: 0xB07CE850
	Offset: 0x2498
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
	Namespace: zm_trial_restrict_loadout
	Checksum: 0xD3FA94EA
	Offset: 0x25F8
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
	self zm_trial_util::function_7dbb1712(1);
}

/*
	Name: function_937e218c
	Namespace: zm_trial_restrict_loadout
	Checksum: 0x1AB3F333
	Offset: 0x2768
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function function_937e218c()
{
	s_challenge = zm_trial::function_a36e8c38(#"restrict_loadout");
	if(isdefined(s_challenge))
	{
		return s_challenge.var_e097dc07;
	}
}

/*
	Name: is_active
	Namespace: zm_trial_restrict_loadout
	Checksum: 0x566889EC
	Offset: 0x27B0
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
	challenge = zm_trial::function_a36e8c38(#"restrict_loadout");
	return isdefined(challenge);
}

/*
	Name: function_bb33631e
	Namespace: zm_trial_restrict_loadout
	Checksum: 0x44C34F5D
	Offset: 0x2830
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function function_bb33631e(var_b5d0ea49)
{
}

/*
	Name: disable_offhand_weapons
	Namespace: zm_trial_restrict_loadout
	Checksum: 0x1FEDAF25
	Offset: 0x28B8
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
	Namespace: zm_trial_restrict_loadout
	Checksum: 0x8BBB7342
	Offset: 0x2930
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
	Namespace: zm_trial_restrict_loadout
	Checksum: 0xA3B28233
	Offset: 0x2AC8
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
	Name: monitor_objective
	Namespace: zm_trial_restrict_loadout
	Checksum: 0xE5D42130
	Offset: 0x2BF8
	Size: 0x232
	Parameters: 1
	Flags: Private
*/
function private monitor_objective(challenge)
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
	Namespace: zm_trial_restrict_loadout
	Checksum: 0x26509CB9
	Offset: 0x2E38
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
			self zm_trial_util::function_97444b02();
		}
		return false;
	}
	return true;
}

