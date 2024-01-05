#using script_18077945bb84ede7;
#using script_72401f526ba71638;
#using scripts\zm_common\zm_maptable.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_placeable_mine.gsc;
#using scripts\zm_common\zm_pack_a_punch_util.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_items.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\gametypes\globallogic_ui.gsc;
#using scripts\zm_common\bb.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using script_7a8059ca02b7b09e;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using script_4108035fe400ce67;
#using scripts\core_common\item_inventory.gsc;
#using script_32c8b5b0eb2854f3;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\abilities\ability_util.gsc;

#namespace zm_loadout;

/*
	Name: __init__system__
	Namespace: zm_loadout
	Checksum: 0x1C6E52FE
	Offset: 0x418
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_loadout", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_loadout
	Checksum: 0x41314426
	Offset: 0x460
	Size: 0x484
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_928a7cf1 = 1;
	callback::on_connect(&on_player_connect);
	callback::on_spawned(&on_player_spawned);
	level.defaultclass = "CLASS_CUSTOM1";
	level.classmap[#"class_smg"] = "CLASS_SMG";
	level.classmap[#"class_cqb"] = "CLASS_CQB";
	level.classmap[#"class_assault"] = "CLASS_ASSAULT";
	level.classmap[#"class_lmg"] = "CLASS_LMG";
	level.classmap[#"class_sniper"] = "CLASS_SNIPER";
	level.classmap[#"class_specialized"] = "CLASS_SPECIALIZED";
	level.classmap[#"custom0"] = "CLASS_CUSTOM1";
	level.classmap[#"custom1"] = "CLASS_CUSTOM2";
	level.classmap[#"custom2"] = "CLASS_CUSTOM3";
	level.classmap[#"custom3"] = "CLASS_CUSTOM4";
	level.classmap[#"custom4"] = "CLASS_CUSTOM5";
	level.classmap[#"custom5"] = "CLASS_CUSTOM6";
	level.classmap[#"custom6"] = "CLASS_CUSTOM7";
	level.classmap[#"custom7"] = "CLASS_CUSTOM8";
	level.classmap[#"custom8"] = "CLASS_CUSTOM9";
	level.classmap[#"custom9"] = "CLASS_CUSTOM10";
	level.classmap[#"custom10"] = "CLASS_CUSTOM11";
	level.classmap[#"custom11"] = "CLASS_CUSTOM12";
	level.classmap[#"custom12"] = level.classmap[#"class_smg"];
	level.classmap[#"custom13"] = level.classmap[#"class_cqb"];
	level.classmap[#"custom14"] = level.classmap[#"class_assault"];
	level.classmap[#"custom15"] = level.classmap[#"class_lmg"];
	level.classmap[#"custom16"] = level.classmap[#"class_sniper"];
	level.classmap[#"custom17"] = level.classmap[#"class_specialized"];
	load_default_loadout("CLASS_SMG", 12);
	load_default_loadout("CLASS_CQB", 13);
	load_default_loadout("CLASS_ASSAULT", 14);
	load_default_loadout("CLASS_LMG", 15);
	load_default_loadout("CLASS_SNIPER", 16);
	load_default_loadout("CLASS_SPECIALIZED", 17);
}

/*
	Name: on_player_connect
	Namespace: zm_loadout
	Checksum: 0x750D46ED
	Offset: 0x8F0
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self.currentweaponstarttime = gettime();
	self.currentweapon = level.weaponnone;
	self.previousweapon = level.weaponnone;
	if(!isdefined(self.var_57c1d146))
	{
		self.var_57c1d146 = [];
	}
	self.pers[#"loadoutindex"] = 0;
	if(loadout::function_87bcb1b())
	{
		if(!isdefined(self.pers[#"class"]))
		{
			self.pers[#"class"] = "";
		}
		self.curclass = self.pers[#"class"];
		self.lastclass = "";
		self loadout::function_c67222df();
		self function_d7c205b9(self.curclass);
		self thread function_7a169290();
	}
}

/*
	Name: on_player_spawned
	Namespace: zm_loadout
	Checksum: 0x558CB293
	Offset: 0xA28
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self.class_num = self function_cc90c352();
}

/*
	Name: weapon_changed
	Namespace: zm_loadout
	Checksum: 0xC755917A
	Offset: 0xA58
	Size: 0x6A
	Parameters: 1
	Flags: Event
*/
event weapon_changed(eventstruct)
{
	if(!is_true(level.var_928a7cf1))
	{
		return;
	}
	if(!isplayer(self))
	{
		return;
	}
	self.currentweaponstarttime = gettime();
	self.currentweapon = eventstruct.weapon;
	self.previousweapon = eventstruct.last_weapon;
}

/*
	Name: loadout_changed
	Namespace: zm_loadout
	Checksum: 0xC65B64B5
	Offset: 0xAD0
	Size: 0x54
	Parameters: 1
	Flags: Event
*/
event loadout_changed(eventstruct)
{
	if(!is_true(level.var_928a7cf1))
	{
		return;
	}
	if(isdefined(self))
	{
		self callback::callback(#"hash_39bf72fd97e248a0", eventstruct);
	}
}

/*
	Name: function_ad4c1664
	Namespace: zm_loadout
	Checksum: 0xB0510C4A
	Offset: 0xB30
	Size: 0x22C
	Parameters: 1
	Flags: None
*/
function function_ad4c1664(weapon)
{
	self notify(#"weapon_take", weapon);
	primaryweapons = self getweaponslistprimaries();
	current_weapon = self getcurrentweapon();
	if(zm_equipment::is_equipment(weapon))
	{
		self zm_equipment::take(weapon);
	}
	if(function_59b0ef71("melee_weapon", weapon))
	{
		self function_6519eea8("melee_weapon", level.weaponnone);
	}
	else
	{
		if(function_59b0ef71("hero_weapon", weapon))
		{
			self function_6519eea8("hero_weapon", level.weaponnone);
		}
		else
		{
			if(function_59b0ef71("lethal_grenade", weapon))
			{
				self function_6519eea8("lethal_grenade", level.weaponnone);
			}
			else
			{
				if(function_59b0ef71("tactical_grenade", weapon))
				{
					self function_6519eea8("tactical_grenade", level.weaponnone);
				}
				else if(function_59b0ef71("placeable_mine", weapon))
				{
					self function_6519eea8("placeable_mine", level.weaponnone);
				}
			}
		}
	}
	if(!is_offhand_weapon(weapon) && primaryweapons.size < 1)
	{
		self zm_weapons::give_fallback_weapon();
	}
}

/*
	Name: function_54cb37a4
	Namespace: zm_loadout
	Checksum: 0x24285152
	Offset: 0xD68
	Size: 0x58C
	Parameters: 1
	Flags: None
*/
function function_54cb37a4(weapon)
{
	self notify(#"weapon_give", weapon);
	self endon(#"disconnect");
	if(weapon == getweapon(#"hash_788c96e19cc7a46e"))
	{
		return;
	}
	primaryweapons = self getweaponslistprimaries();
	initial_current_weapon = self getcurrentweapon();
	current_weapon = self zm_weapons::switch_from_alt_weapon(initial_current_weapon);
	/#
		assert(self zm_weapons::player_can_use_content(weapon));
	#/
	weapon_limit = zm_utility::get_player_weapon_limit(self);
	if(is_true(weapon.craftitem))
	{
		zm_items::player_pick_up(self, weapon);
		return;
	}
	if(zm_equipment::is_equipment(weapon))
	{
		self zm_equipment::give(weapon);
	}
	if(weapon.isriotshield)
	{
		if(isdefined(self.player_shield_reset_health))
		{
			self [[self.player_shield_reset_health]](weapon);
		}
	}
	if(function_59b0ef71("melee_weapon", weapon))
	{
		had_fallback_weapon = self zm_melee_weapon::take_fallback_weapon();
		self function_6519eea8("melee_weapon", weapon);
		if(had_fallback_weapon)
		{
			self zm_melee_weapon::give_fallback_weapon();
		}
	}
	else
	{
		if(function_59b0ef71("hero_weapon", weapon))
		{
			self function_6519eea8("hero_weapon", weapon);
		}
		else
		{
			if(function_59b0ef71("lethal_grenade", weapon))
			{
				self function_6519eea8("lethal_grenade", weapon);
			}
			else
			{
				if(function_59b0ef71("tactical_grenade", weapon))
				{
					self function_6519eea8("tactical_grenade", weapon);
				}
				else if(function_59b0ef71("placeable_mine", weapon))
				{
					self function_6519eea8("placeable_mine", weapon);
				}
			}
		}
	}
	if(!is_offhand_weapon(weapon) && !function_2ff6913(weapon) && weapon != self zm_melee_weapon::determine_fallback_weapon())
	{
		self zm_weapons::take_fallback_weapon();
	}
	if(primaryweapons.size > weapon_limit)
	{
		if(is_placeable_mine(current_weapon) || zm_equipment::is_equipment(current_weapon) || self.laststandpistol === weapon)
		{
			current_weapon = undefined;
		}
		if(isdefined(current_weapon))
		{
			if(!is_offhand_weapon(weapon))
			{
				self zm_weapons::weapon_take(current_weapon);
				if(isdefined(initial_current_weapon) && current_weapon != initial_current_weapon)
				{
					self zm_weapons::weapon_take(initial_current_weapon);
				}
			}
		}
	}
	if(isdefined(level.zombiemode_offhand_weapon_give_override))
	{
		if(self [[level.zombiemode_offhand_weapon_give_override]](weapon))
		{
			return;
		}
	}
	if(is_placeable_mine(weapon))
	{
		self thread zm_placeable_mine::setup_for_player(weapon);
		return weapon;
	}
	if(isdefined(level.zombie_weapons_callbacks) && isdefined(level.zombie_weapons_callbacks[weapon]))
	{
		self thread [[level.zombie_weapons_callbacks[weapon]]]();
	}
	self zm_weapons::function_7c5dd4bd(weapon);
	if(is_true(self.var_57c1d146[weapon]))
	{
		self.var_57c1d146[weapon] = undefined;
		return;
	}
	if(!is_offhand_weapon(weapon) && !is_hero_weapon(weapon))
	{
		if(!is_melee_weapon(weapon))
		{
			self switchtoweapon(weapon);
		}
		else
		{
			self switchtoweapon(current_weapon);
		}
	}
}

/*
	Name: function_5a5a742a
	Namespace: zm_loadout
	Checksum: 0x99230001
	Offset: 0x1300
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function function_5a5a742a(slot)
{
	if(!isdefined(level.var_d5f9c1d2))
	{
		level.var_d5f9c1d2 = [];
	}
	if(!isdefined(level.var_d5f9c1d2[slot]))
	{
		level.var_d5f9c1d2[slot] = [];
	}
	return level.var_d5f9c1d2[slot];
}

/*
	Name: function_e884e095
	Namespace: zm_loadout
	Checksum: 0x8CB84A2B
	Offset: 0x1368
	Size: 0xFA
	Parameters: 2
	Flags: Linked
*/
function function_e884e095(slot, weapon)
{
	if(!isdefined(weapon))
	{
		return;
	}
	if(isstring(weapon) || ishash(weapon))
	{
		weapon = getweapon(weapon);
	}
	if(weapon.name == #"none")
	{
		return;
	}
	if(function_59b0ef71(slot, weapon))
	{
		return;
	}
	if(!isdefined(level.var_d5f9c1d2))
	{
		level.var_d5f9c1d2 = [];
	}
	if(!isdefined(level.var_d5f9c1d2[slot]))
	{
		level.var_d5f9c1d2[slot] = [];
	}
	level.var_d5f9c1d2[slot][weapon] = weapon;
}

/*
	Name: function_59b0ef71
	Namespace: zm_loadout
	Checksum: 0xC1D0AA5E
	Offset: 0x1470
	Size: 0x60
	Parameters: 2
	Flags: Linked
*/
function function_59b0ef71(slot, weapon)
{
	if(!isdefined(weapon) || !isdefined(level.var_d5f9c1d2) || !isdefined(level.var_d5f9c1d2[slot]))
	{
		return 0;
	}
	return isdefined(level.var_d5f9c1d2[slot][weapon]);
}

/*
	Name: function_393977df
	Namespace: zm_loadout
	Checksum: 0x1156DAEC
	Offset: 0x14D8
	Size: 0x72
	Parameters: 2
	Flags: Linked
*/
function function_393977df(slot, weapon)
{
	if(!isdefined(weapon) || weapon == level.weaponnone || !isdefined(self.slot_weapons) || !isdefined(self.slot_weapons[slot]))
	{
		return 0;
	}
	return self.slot_weapons[slot] == weapon;
}

/*
	Name: function_8f85096
	Namespace: zm_loadout
	Checksum: 0x248C4274
	Offset: 0x1558
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function function_8f85096(slot)
{
	if(!isdefined(self.slot_weapons))
	{
		self.slot_weapons = [];
	}
	if(!isdefined(self.slot_weapons[slot]))
	{
		self.slot_weapons[slot] = level.weaponnone;
	}
	var_4d5892ca = level.weaponnone;
	if(isdefined(self.slot_weapons) && isdefined(self.slot_weapons[slot]))
	{
		var_4d5892ca = self.slot_weapons[slot];
	}
	return var_4d5892ca;
}

/*
	Name: function_6519eea8
	Namespace: zm_loadout
	Checksum: 0xA53C036A
	Offset: 0x15F8
	Size: 0x164
	Parameters: 2
	Flags: Linked
*/
function function_6519eea8(slot, weapon)
{
	if(!isdefined(self.slot_weapons))
	{
		self.slot_weapons = [];
	}
	if(!isdefined(self.slot_weapons[slot]))
	{
		self.slot_weapons[slot] = level.weaponnone;
	}
	if(!isdefined(weapon))
	{
		weapon = level.weaponnone;
	}
	old_weapon = self function_8f85096(slot);
	self notify(#"hash_4078956b159dd0f3", {#weapon:weapon, #slot:slot});
	self notify("new_" + slot, {#weapon:weapon});
	self.slot_weapons[slot] = level.weaponnone;
	if(old_weapon != level.weaponnone && old_weapon != weapon)
	{
		if(self hasweapon(old_weapon))
		{
			self takeweapon(old_weapon);
		}
	}
	self.slot_weapons[slot] = weapon;
}

/*
	Name: register_lethal_grenade_for_level
	Namespace: zm_loadout
	Checksum: 0x143CCE3C
	Offset: 0x1768
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function register_lethal_grenade_for_level(weaponname)
{
	function_e884e095("lethal_grenade", weaponname);
}

/*
	Name: is_lethal_grenade
	Namespace: zm_loadout
	Checksum: 0xA5935464
	Offset: 0x1798
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function is_lethal_grenade(weapon)
{
	return weapon.islethalgrenade;
}

/*
	Name: is_player_lethal_grenade
	Namespace: zm_loadout
	Checksum: 0x8FC3C295
	Offset: 0x17B8
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function is_player_lethal_grenade(weapon)
{
	return self function_393977df("lethal_grenade", weapon);
}

/*
	Name: get_player_lethal_grenade
	Namespace: zm_loadout
	Checksum: 0xD7026F79
	Offset: 0x17F0
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function get_player_lethal_grenade()
{
	return self function_8f85096("lethal_grenade");
}

/*
	Name: set_player_lethal_grenade
	Namespace: zm_loadout
	Checksum: 0xABC8204A
	Offset: 0x1820
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function set_player_lethal_grenade(weapon)
{
	self function_6519eea8("lethal_grenade", weapon);
}

/*
	Name: register_tactical_grenade_for_level
	Namespace: zm_loadout
	Checksum: 0x9FC6783C
	Offset: 0x1858
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function register_tactical_grenade_for_level(weaponname, var_b1830d98)
{
	if(!isdefined(var_b1830d98))
	{
		var_b1830d98 = 0;
	}
	function_e884e095("tactical_grenade", weaponname);
	if(var_b1830d98)
	{
		w_shield = getweapon(weaponname);
		level.var_b115fab2 = w_shield;
	}
}

/*
	Name: is_tactical_grenade
	Namespace: zm_loadout
	Checksum: 0x906CEF13
	Offset: 0x18D8
	Size: 0x6A
	Parameters: 2
	Flags: Linked
*/
function is_tactical_grenade(weapon, var_9f428637)
{
	if(!isdefined(var_9f428637))
	{
		var_9f428637 = 1;
	}
	if(!var_9f428637 && is_true(weapon.isriotshield))
	{
		return 0;
	}
	return function_59b0ef71("tactical_grenade", weapon);
}

/*
	Name: is_player_tactical_grenade
	Namespace: zm_loadout
	Checksum: 0xD8657929
	Offset: 0x1950
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function is_player_tactical_grenade(weapon)
{
	return self function_393977df("tactical_grenade", weapon);
}

/*
	Name: get_player_tactical_grenade
	Namespace: zm_loadout
	Checksum: 0x154400FB
	Offset: 0x1988
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function get_player_tactical_grenade()
{
	return self function_8f85096("tactical_grenade");
}

/*
	Name: set_player_tactical_grenade
	Namespace: zm_loadout
	Checksum: 0xF6A10D22
	Offset: 0x19B8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function set_player_tactical_grenade(weapon)
{
	self function_6519eea8("tactical_grenade", weapon);
}

/*
	Name: init_player_tactical_grenade
	Namespace: zm_loadout
	Checksum: 0xC2A350FD
	Offset: 0x19F0
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function init_player_tactical_grenade()
{
	self function_6519eea8("tactical_grenade", level.zombie_tactical_grenade_player_init);
}

/*
	Name: is_placeable_mine
	Namespace: zm_loadout
	Checksum: 0xD5AB0CCB
	Offset: 0x1A28
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function is_placeable_mine(weapon)
{
	return function_59b0ef71("placeable_mine", weapon);
}

/*
	Name: is_player_placeable_mine
	Namespace: zm_loadout
	Checksum: 0xF21FF26E
	Offset: 0x1A58
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function is_player_placeable_mine(weapon)
{
	return self function_393977df("placeable_mine", weapon);
}

/*
	Name: get_player_placeable_mine
	Namespace: zm_loadout
	Checksum: 0x5396FE07
	Offset: 0x1A90
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function get_player_placeable_mine()
{
	return self function_8f85096("placeable_mine");
}

/*
	Name: set_player_placeable_mine
	Namespace: zm_loadout
	Checksum: 0x652F72E3
	Offset: 0x1AC0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function set_player_placeable_mine(weapon)
{
	self function_6519eea8("placeable_mine", weapon);
}

/*
	Name: init_player_placeable_mine
	Namespace: zm_loadout
	Checksum: 0xFDDFF4C3
	Offset: 0x1AF8
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function init_player_placeable_mine()
{
	self function_6519eea8("placeable_mine", level.zombie_placeable_mine_player_init);
}

/*
	Name: register_melee_weapon_for_level
	Namespace: zm_loadout
	Checksum: 0xDCA7CFCF
	Offset: 0x1B30
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function register_melee_weapon_for_level(weaponname)
{
	function_e884e095("melee_weapon", weaponname);
}

/*
	Name: is_melee_weapon
	Namespace: zm_loadout
	Checksum: 0xD14C73A
	Offset: 0x1B60
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function is_melee_weapon(weapon)
{
	return function_59b0ef71("melee_weapon", weapon);
}

/*
	Name: is_player_melee_weapon
	Namespace: zm_loadout
	Checksum: 0xDBA9A1AC
	Offset: 0x1B90
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function is_player_melee_weapon(weapon)
{
	return self function_393977df("melee_weapon", weapon);
}

/*
	Name: get_player_melee_weapon
	Namespace: zm_loadout
	Checksum: 0x1940CB3F
	Offset: 0x1BC8
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function get_player_melee_weapon()
{
	return self function_8f85096("melee_weapon");
}

/*
	Name: set_player_melee_weapon
	Namespace: zm_loadout
	Checksum: 0x962E807D
	Offset: 0x1BF8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function set_player_melee_weapon(weapon)
{
	had_fallback_weapon = self zm_melee_weapon::take_fallback_weapon();
	self function_6519eea8("melee_weapon", weapon);
	if(had_fallback_weapon)
	{
		self zm_melee_weapon::give_fallback_weapon();
	}
}

/*
	Name: init_player_melee_weapon
	Namespace: zm_loadout
	Checksum: 0xC17DA351
	Offset: 0x1C70
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function init_player_melee_weapon()
{
	self zm_weapons::weapon_give(level.zombie_melee_weapon_player_init, 1, 0);
}

/*
	Name: register_hero_weapon_for_level
	Namespace: zm_loadout
	Checksum: 0xDBEE0D4
	Offset: 0x1CA8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function register_hero_weapon_for_level(weaponname)
{
	function_e884e095("hero_weapon", weaponname);
}

/*
	Name: is_hero_weapon
	Namespace: zm_loadout
	Checksum: 0x85A6A48C
	Offset: 0x1CD8
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function is_hero_weapon(weapon)
{
	return function_59b0ef71("hero_weapon", weapon);
}

/*
	Name: is_player_hero_weapon
	Namespace: zm_loadout
	Checksum: 0x12AF5DE3
	Offset: 0x1D08
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function is_player_hero_weapon(weapon)
{
	return self function_393977df("hero_weapon", weapon);
}

/*
	Name: get_player_hero_weapon
	Namespace: zm_loadout
	Checksum: 0xECBFEF57
	Offset: 0x1D40
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function get_player_hero_weapon()
{
	return self function_8f85096("hero_weapon");
}

/*
	Name: set_player_hero_weapon
	Namespace: zm_loadout
	Checksum: 0x62EDC86B
	Offset: 0x1D70
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function set_player_hero_weapon(weapon)
{
	self function_6519eea8("hero_weapon", weapon);
}

/*
	Name: has_player_hero_weapon
	Namespace: zm_loadout
	Checksum: 0x8E199AD3
	Offset: 0x1DA8
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function has_player_hero_weapon()
{
	current_hero_weapon = get_player_hero_weapon();
	return isdefined(current_hero_weapon) && current_hero_weapon != level.weaponnone;
}

/*
	Name: register_offhand_weapons_for_level_defaults
	Namespace: zm_loadout
	Checksum: 0x5D5586E1
	Offset: 0x1DE8
	Size: 0xE2
	Parameters: 0
	Flags: Linked
*/
function register_offhand_weapons_for_level_defaults()
{
	if(isdefined(level.register_offhand_weapons_for_level_defaults_override))
	{
		[[level.register_offhand_weapons_for_level_defaults_override]]();
		return;
	}
	if(isdefined(level.var_22fda912))
	{
		[[level.var_22fda912]]();
	}
	register_melee_weapon_for_level(level.weaponbasemelee.name);
	if(zm_maptable::get_story() == 1)
	{
		register_melee_weapon_for_level(#"bowie_knife_story_1");
	}
	else
	{
		register_melee_weapon_for_level(#"bowie_knife");
	}
	level.zombie_melee_weapon_player_init = level.weaponbasemelee;
	level.zombie_equipment_player_init = undefined;
}

/*
	Name: init_player_offhand_weapons
	Namespace: zm_loadout
	Checksum: 0x4FA810D2
	Offset: 0x1ED8
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function init_player_offhand_weapons()
{
	nullprimary = getweapon(#"null_offhand_primary");
	self giveweapon(nullprimary);
	self setweaponammoclip(nullprimary, 0);
	self switchtooffhand(nullprimary);
	bare_hands = getweapon(#"bare_hands");
	self giveweapon(bare_hands);
	self function_c9a111a(bare_hands);
	self switchtoweapon(bare_hands, 1);
}

/*
	Name: function_2ff6913
	Namespace: zm_loadout
	Checksum: 0x2D74CA1A
	Offset: 0x1FD0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_2ff6913(weapon)
{
	return weapon.isperkbottle || weapon.isflourishweapon;
}

/*
	Name: is_offhand_weapon
	Namespace: zm_loadout
	Checksum: 0xE9D96496
	Offset: 0x2000
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function is_offhand_weapon(weapon)
{
	return is_lethal_grenade(weapon) || is_tactical_grenade(weapon) || is_placeable_mine(weapon) || is_melee_weapon(weapon) || is_hero_weapon(weapon) || zm_equipment::is_equipment(weapon);
}

/*
	Name: is_player_offhand_weapon
	Namespace: zm_loadout
	Checksum: 0xBD0C20D8
	Offset: 0x20A8
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function is_player_offhand_weapon(weapon)
{
	return self is_player_lethal_grenade(weapon) || self is_player_tactical_grenade(weapon) || self is_player_placeable_mine(weapon) || self is_player_melee_weapon(weapon) || self is_player_hero_weapon(weapon) || self zm_equipment::is_player_equipment(weapon);
}

/*
	Name: has_powerup_weapon
	Namespace: zm_loadout
	Checksum: 0xE0538A9C
	Offset: 0x2150
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function has_powerup_weapon()
{
	return is_true(self.has_powerup_weapon);
}

/*
	Name: has_hero_weapon
	Namespace: zm_loadout
	Checksum: 0x4566890E
	Offset: 0x2178
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function has_hero_weapon()
{
	weapon = self getcurrentweapon();
	return is_true(weapon.isheroweapon);
}

/*
	Name: function_3e5c3a27
	Namespace: zm_loadout
	Checksum: 0x7322C0C2
	Offset: 0x21C8
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function function_3e5c3a27()
{
	if(zm_utility::is_survival())
	{
		var_173cd713 = (isdefined(level.var_b48509f9) ? level.var_b48509f9 : 0);
		score_threshold = var_173cd713 * 5000;
		score_threshold = math::clamp(score_threshold, 0, 25000);
		score = self zm_score::function_ffc2d0bc();
		if(score < score_threshold)
		{
			diff = score_threshold - score;
			self zm_score::add_to_player_score(diff);
		}
	}
	else
	{
		rounds = (isdefined(level.round_number) ? level.round_number : 0);
		score_threshold = rounds * 1000;
		score_threshold = math::clamp(score_threshold, 0, 50000);
		score = self zm_score::function_ffc2d0bc();
		if(score < score_threshold)
		{
			diff = score_threshold - score;
			self zm_score::add_to_player_score(diff);
		}
	}
}

/*
	Name: function_cdcea3fd
	Namespace: zm_loadout
	Checksum: 0x1AD67947
	Offset: 0x2330
	Size: 0x7A
	Parameters: 0
	Flags: Linked
*/
function function_cdcea3fd()
{
	itemname = self.var_6e3cb3d1;
	itemcount = self.var_a4be9abe;
	count = 0;
	while(count < itemcount)
	{
		if(isplayer(self))
		{
			self namespace_1b527536::function_6457e4cd(itemname);
		}
		count++;
		waitframe(1);
	}
}

/*
	Name: give_start_weapon
	Namespace: zm_loadout
	Checksum: 0xB7CE1B90
	Offset: 0x23B8
	Size: 0x4AC
	Parameters: 1
	Flags: Linked
*/
function give_start_weapon(b_switch_weapon)
{
	primary_weapon = self function_439b009a("primary");
	var_c6eea9c1 = (isdefined(zm_stats::function_12b698fa(#"hash_265dfd25205ffba8")) ? zm_stats::function_12b698fa(#"hash_265dfd25205ffba8") : 0);
	/#
		var_df6f833b = getdvarint(#"hash_31933df32887a98b", 0);
		if(var_df6f833b > 0)
		{
			var_c6eea9c1 = var_df6f833b;
		}
	#/
	var_8c590502 = (isdefined(getgametypesetting(#"hash_3c2c78e639bfd3c6")) ? getgametypesetting(#"hash_3c2c78e639bfd3c6") : 0);
	if(var_8c590502 > 0)
	{
		var_c6eea9c1 = var_8c590502;
	}
	if(var_c6eea9c1 >= 1 && var_c6eea9c1 < 3)
	{
		self zm_weapons::weapon_give(getweapon(#"knife"));
	}
	else if(var_c6eea9c1 >= 3)
	{
		self zm_weapons::weapon_give(getweapon(#"bowie_knife"));
	}
	s_weapon = getunlockableiteminfofromindex(primary_weapon.statindex, 1);
	if(isdefined(s_weapon) && isdefined(s_weapon.namehash) && zm_custom::function_bce642a1(s_weapon) && zm_custom::function_901b751c(#"zmstartingweaponenabled"))
	{
		var_9e4954fa = ((isdefined(self.var_3b511a7c) ? self.var_3b511a7c : 0) > 0 ? 1 : 0);
		if(var_9e4954fa)
		{
			self function_3e5c3a27();
			self.var_595a11bc = 0;
			self.var_72d64cfd = 0;
			self sr_scrap::function_b802c7fc();
			if(isdefined(self.var_6e3cb3d1) && self.var_87f72f8 === self.var_6e3cb3d1)
			{
				self thread function_cdcea3fd();
			}
		}
		if(isdefined(primary_weapon.attachments) && primary_weapon.attachments.size > 0)
		{
			self zm_weapons::weapon_give(primary_weapon, 1, b_switch_weapon, 0, 1, undefined, primary_weapon.attachments, var_9e4954fa);
		}
		else
		{
			self zm_weapons::weapon_give(primary_weapon, 1, b_switch_weapon, 0, 1, undefined, undefined, var_9e4954fa);
		}
		if(zm_custom::function_901b751c(#"zmstartingweaponenabled") && isdefined(self.var_8313fee5))
		{
			self thread function_d9153457(b_switch_weapon);
		}
	}
	else
	{
		var_abb79409 = getweapon(getdvarstring(#"hash_35d047ae6d3ad4a", "pistol_semiauto_t9"));
		self zm_weapons::weapon_give(var_abb79409, 1, b_switch_weapon);
		if(isdefined(s_weapon) && (!zm_custom::function_bce642a1(s_weapon) || !zm_custom::function_901b751c(#"zmstartingweaponenabled")))
		{
			self thread zm_custom::function_343353f8();
		}
	}
}

/*
	Name: get_loadout_item
	Namespace: zm_loadout
	Checksum: 0xDE7D091F
	Offset: 0x2870
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function get_loadout_item(slot)
{
	if(!isdefined(self.class_num))
	{
		self.class_num = self function_cc90c352();
	}
	if(!isdefined(self.class_num))
	{
		self.class_num = 0;
	}
	return self getloadoutitem(self.class_num, slot);
}

/*
	Name: function_439b009a
	Namespace: zm_loadout
	Checksum: 0x46F7370A
	Offset: 0x28E8
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function function_439b009a(slot)
{
	if(!isdefined(self.class_num))
	{
		self.class_num = self function_cc90c352();
	}
	if(!isdefined(self.class_num))
	{
		self.class_num = 0;
	}
	return self getloadoutweapon(self.class_num, slot);
}

/*
	Name: function_6972fdbb
	Namespace: zm_loadout
	Checksum: 0x181C868C
	Offset: 0x2960
	Size: 0x1D8
	Parameters: 1
	Flags: Linked
*/
function function_6972fdbb(weaponclass)
{
	/#
		assert(isdefined(weaponclass));
	#/
	prefixstring = "CLASS_CUSTOM";
	var_8bba14bc = self getcustomclasscount();
	var_8bba14bc = max(var_8bba14bc, 0);
	if(isstring(weaponclass) && issubstr(weaponclass, prefixstring))
	{
		var_3858e4e = getsubstr(weaponclass, prefixstring.size);
		class_num = int(var_3858e4e) - 1;
		if(class_num == -1)
		{
			class_num = var_8bba14bc;
		}
		/#
			assert(isdefined(class_num));
		#/
		if(class_num < 0 || class_num > var_8bba14bc)
		{
			class_num = 0;
		}
		/#
			assert(class_num >= 0 && class_num <= var_8bba14bc);
		#/
	}
	else
	{
		class_num = level.classtoclassnum[weaponclass];
	}
	if(!isdefined(class_num))
	{
		class_num = self stats::get_stat(#"selectedcustomclass");
		if(!isdefined(class_num))
		{
			class_num = 0;
		}
	}
	/#
		assert(isdefined(class_num));
	#/
	return class_num;
}

/*
	Name: function_d7c205b9
	Namespace: zm_loadout
	Checksum: 0x732467C8
	Offset: 0x2B40
	Size: 0x1B4
	Parameters: 2
	Flags: Linked
*/
function function_d7c205b9(newclass, var_eead10f0)
{
	if(!isdefined(var_eead10f0))
	{
		var_eead10f0 = #"unspecified";
	}
	loadoutindex = (isdefined(newclass) ? function_6972fdbb(newclass) : undefined);
	self.pers[#"loadoutindex"] = loadoutindex;
	var_45843e9a = var_eead10f0 == #"give_loadout";
	var_7f8c24df = 0;
	if(!var_45843e9a)
	{
		var_7f8c24df = isdefined(game) && isdefined(game.state) && game.state == #"playing" && isalive(self);
		if(var_7f8c24df && self.sessionstate == "playing")
		{
			var_25b0cd7 = self.usingsupplystation === 1;
			if(is_true(level.ingraceperiod) && !is_true(self.hasdonecombat) || var_25b0cd7)
			{
				var_7f8c24df = 0;
			}
		}
	}
	if(var_7f8c24df)
	{
		return;
	}
	self setloadoutindex(loadoutindex);
	self setplayerstateloadoutweapons(loadoutindex);
}

/*
	Name: function_97d216fa
	Namespace: zm_loadout
	Checksum: 0xEE263A00
	Offset: 0x2D00
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_97d216fa(response)
{
	/#
		assert(isdefined(level.classmap[response]));
	#/
	return level.classmap[response];
}

/*
	Name: function_a7079aac
	Namespace: zm_loadout
	Checksum: 0xEDD87312
	Offset: 0x2D50
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function function_a7079aac(attachments)
{
}

/*
	Name: menuclass
	Namespace: zm_loadout
	Checksum: 0x76B080D9
	Offset: 0x2D68
	Size: 0x718
	Parameters: 4
	Flags: Linked
*/
function menuclass(response, forcedclass, updatecharacterindex, var_632376a3)
{
	if(!isdefined(self.pers[#"team"]) || !isdefined(level.teams[self.pers[#"team"]]))
	{
		return false;
	}
	if(!loadout::function_87bcb1b())
	{
		if(game.state == #"pregame" || game.state == #"playing" && self.sessionstate != "playing")
		{
			self thread [[level.spawnclient]](0);
		}
		return;
	}
	if(!isdefined(updatecharacterindex))
	{
		playerclass = self function_97d216fa(forcedclass);
	}
	else
	{
		playerclass = updatecharacterindex;
	}
	if(is_true(level.disablecustomcac) && issubstr(playerclass, "CLASS_CUSTOM") && isarray(level.classtoclassnum) && level.classtoclassnum.size > 0)
	{
		defaultclasses = getarraykeys(level.var_8e1db8ee);
		playerclass = level.var_8e1db8ee[defaultclasses[randomint(defaultclasses.size)]];
	}
	self function_d7c205b9(playerclass);
	var_96b1ace = 0;
	if(isdefined(self.pers[#"class"]) && self.pers[#"class"] == playerclass)
	{
		primary_weapon = self function_439b009a("primary");
		current_weapon = self getcurrentweapon();
		if(isdefined(primary_weapon.attachments) && isdefined(current_weapon.attachments) && primary_weapon.rootweapon === current_weapon.rootweapon)
		{
			if(primary_weapon.attachments.size != current_weapon.attachments.size)
			{
				var_96b1ace = 1;
			}
			else
			{
				foreach(attachment in primary_weapon.attachments)
				{
					var_c27e271b = isinarray(current_weapon.attachments, attachment);
					if(!var_c27e271b)
					{
						var_96b1ace = 1;
						break;
					}
				}
			}
		}
		if(!var_96b1ace)
		{
			return true;
		}
	}
	self.pers[#"changed_class"] = !isdefined(self.curclass) || self.curclass != playerclass || var_96b1ace;
	var_8d7a946 = !isdefined(self.curclass) || self.curclass == "";
	self.pers[#"class"] = playerclass;
	self.curclass = playerclass;
	self function_d7c205b9(playerclass);
	self.pers[#"weapon"] = undefined;
	self notify(#"changed_class");
	if(gamestate::is_game_over())
	{
		return false;
	}
	if(self.sessionstate != "playing")
	{
		if(self.sessionstate != "spectator")
		{
			if(self isinvehicle())
			{
				return false;
			}
			if(self isremotecontrolling())
			{
				return false;
			}
			if(self isweaponviewonlylinked())
			{
				return false;
			}
		}
	}
	if(self.sessionstate == "playing")
	{
		supplystationclasschange = isdefined(self.usingsupplystation) && self.usingsupplystation;
		self.usingsupplystation = 0;
		if(is_true(self.var_12d4c9e8) || (is_true(level.ingraceperiod) && !is_true(self.hasdonecombat)) || is_true(supplystationclasschange) || var_632376a3 === 1)
		{
			self.curclass = self.pers[#"class"];
			self.tag_stowed_back = undefined;
			self.tag_stowed_hip = undefined;
			self give_loadout();
			loadoutindex = self function_6972fdbb(playerclass);
			self namespace_1b527536::function_1067f94c(loadoutindex);
		}
		else if(!var_8d7a946 && self.pers[#"changed_class"] && !is_true(level.var_f46d16f0))
		{
			loadoutindex = self function_6972fdbb(playerclass);
			self namespace_1b527536::function_1067f94c(loadoutindex);
			self luinotifyevent(#"hash_6b67aa04e378d681", 2, 6, loadoutindex);
		}
	}
	return true;
}

/*
	Name: load_default_loadout
	Namespace: zm_loadout
	Checksum: 0x20856B3A
	Offset: 0x3488
	Size: 0x34
	Parameters: 2
	Flags: Linked, Private
*/
function private load_default_loadout(weaponclass, classnum)
{
	level.classtoclassnum[weaponclass] = classnum;
	level.var_8e1db8ee[classnum] = weaponclass;
}

/*
	Name: give_loadout
	Namespace: zm_loadout
	Checksum: 0xD4F72EB8
	Offset: 0x34C8
	Size: 0x2AC
	Parameters: 0
	Flags: Linked
*/
function give_loadout()
{
	if(!is_true(level.var_928a7cf1))
	{
		return;
	}
	if(self.var_1fa95cc === gettime() && isdefined(self.curclass) && function_6972fdbb(self.curclass) === self.pers[#"loadoutindex"])
	{
		return;
	}
	if(loadout::function_87bcb1b())
	{
		/#
			assert(isdefined(self.curclass));
		#/
		self function_d7c205b9(self.curclass, #"give_loadout");
		actionslot3 = (getdvarint(#"hash_449fa75f87a4b5b4", 0) > 0 ? "ping_callouts" : "flourish_callouts");
		self setactionslot(3, actionslot3);
		actionslot4 = (getdvarint(#"hash_23270ec9008cb656", 0) > 0 ? "sprays_boasts" : "scorestreak_wheel");
		self setactionslot(4, actionslot4);
		if(isdefined(level.givecustomloadout))
		{
			self [[level.givecustomloadout]]();
		}
		else
		{
			init_player(isdefined(self.var_1fa95cc));
			function_f436358b(self.curclass);
			zm_weapons::give_start_weapons();
			telemetry::function_18135b72(#"hash_27cccc0731de1722", {#player:self});
		}
	}
	else if(isdefined(level.givecustomloadout))
	{
		self [[level.givecustomloadout]]();
	}
	self.var_1fa95cc = gettime();
	self flag::set("loadout_given");
	callback::callback(#"on_loadout");
}

/*
	Name: init_player
	Namespace: zm_loadout
	Checksum: 0x4E5A602B
	Offset: 0x3780
	Size: 0x4E
	Parameters: 1
	Flags: Linked
*/
function init_player(takeallweapons)
{
	if(takeallweapons)
	{
		item_inventory::reset_inventory(0);
		self takeallweapons();
	}
	self.specialty = [];
}

/*
	Name: function_f436358b
	Namespace: zm_loadout
	Checksum: 0xE4AC6018
	Offset: 0x37D8
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_f436358b(weaponclass)
{
	self.class_num = function_6972fdbb(weaponclass);
	if(issubstr(weaponclass, "CLASS_CUSTOM"))
	{
		pixbeginevent();
		self.class_num_for_global_weapons = self.class_num;
		pixendevent();
	}
	else
	{
		pixbeginevent();
		/#
			assert(isdefined(self.pers[#"class"]), "");
		#/
		self.class_num_for_global_weapons = 0;
		pixendevent();
	}
	self recordloadoutindex(self.class_num);
}

/*
	Name: function_d9153457
	Namespace: zm_loadout
	Checksum: 0xF994AF5D
	Offset: 0x38B0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_d9153457(b_switch_weapon)
{
	if(!isdefined(b_switch_weapon))
	{
		b_switch_weapon = 1;
	}
	self endon(#"death");
	var_19673a84 = getweapon(self.var_8313fee5);
	if(var_19673a84 !== level.weaponnone)
	{
		self zm_weapons::weapon_give(var_19673a84, 1, 0);
		if(b_switch_weapon)
		{
			level waittill(#"start_zombie_round_logic");
			self switchtoweaponimmediate(var_19673a84, 1);
		}
	}
}

/*
	Name: function_7a169290
	Namespace: zm_loadout
	Checksum: 0xFDCF7B2D
	Offset: 0x3980
	Size: 0x26C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7a169290()
{
	self endoncallback(&function_ff646bfc, #"death", #"end_game", #"disconnect");
	var_e9c7076a = (isdefined(getgametypesetting("zmMaxClassLoadoutTime")) ? getgametypesetting("zmMaxClassLoadoutTime") : 30);
	if(isbot(self))
	{
		return;
	}
	self waittill(#"show_class_select_slideout");
	if(!isdefined(level.var_48bad54e))
	{
		level.var_48bad54e = 0;
	}
	if(!isdefined(level.var_cf6387d8))
	{
		level.var_cf6387d8 = 1;
	}
	if(is_false(level.var_48bad54e) && level.var_cf6387d8)
	{
		level.var_cf6387d8 = 0;
		level flag::increment("world_is_paused");
	}
	self.var_12d4c9e8 = 1;
	self val::set(#"hash_4746015172ea9af0", "ignoreme", 1);
	self waittilltimeout(var_e9c7076a, #"hide_class_select_slideout");
	self val::reset(#"hash_4746015172ea9af0", "ignoreme");
	self.var_12d4c9e8 = 0;
	if(is_false(level.var_48bad54e))
	{
		level flag::decrement("world_is_paused");
		level.var_48bad54e = 1;
	}
	self globallogic_ui::function_f8f38932();
	telemetry::function_18135b72(#"hash_4481df211c9d18aa", {#player:self});
}

/*
	Name: function_ff646bfc
	Namespace: zm_loadout
	Checksum: 0xC3D91A36
	Offset: 0x3BF8
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ff646bfc(notifyhash)
{
	if(isbot(self))
	{
		return;
	}
	if(is_false(level.var_48bad54e))
	{
		level flag::decrement("world_is_paused");
		level.var_48bad54e = 1;
	}
}

