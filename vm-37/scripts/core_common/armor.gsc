#using scripts\weapons\weapon_utils.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace armor;

/*
	Name: main
	Namespace: armor
	Checksum: 0x5DC65E27
	Offset: 0x170
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	callback::on_connect(&on_player_connect);
}

/*
	Name: function_9c8b5737
	Namespace: armor
	Checksum: 0x168BD152
	Offset: 0x1A8
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_9c8b5737()
{
	self.lightarmor = {#hash_cdeeec29:1, #hash_2274e560:1, #max:0, #amount:0};
	self.var_59a874a7 = {#hash_cdeeec29:1, #hash_2274e560:1};
	self set_armor(0, 0, 0, 1, 0);
}

/*
	Name: on_player_connect
	Namespace: armor
	Checksum: 0x2FA56DF8
	Offset: 0x270
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self function_9c8b5737();
}

/*
	Name: setlightarmorhp
	Namespace: armor
	Checksum: 0x24CC627A
	Offset: 0x298
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function setlightarmorhp(newvalue)
{
	if(isdefined(newvalue))
	{
		self.lightarmor.amount = newvalue;
		if(isplayer(self) && self.lightarmor.max > 0)
		{
			lightarmorpercent = math::clamp(self.lightarmor.amount / self.lightarmor.max, 0, 1);
		}
	}
	else
	{
		self.lightarmor.amount = 0;
		self.lightarmor.max = 0;
	}
}

/*
	Name: setlightarmor
	Namespace: armor
	Checksum: 0x9F1E0211
	Offset: 0x368
	Size: 0x11C
	Parameters: 3
	Flags: None
*/
function setlightarmor(optionalarmorvalue, var_2274e560, var_cdeeec29)
{
	self notify(#"give_light_armor");
	if(isdefined(self.lightarmor.amount))
	{
		unsetlightarmor();
	}
	self thread removelightarmorondeath();
	self thread removelightarmoronmatchend();
	if(!isdefined(optionalarmorvalue))
	{
		optionalarmorvalue = 150;
	}
	self.lightarmor.max = optionalarmorvalue;
	if(!isdefined(var_2274e560))
	{
		var_2274e560 = 1;
	}
	self.lightarmor.var_2274e560 = var_2274e560;
	if(!isdefined(var_cdeeec29))
	{
		var_cdeeec29 = 1;
	}
	self.lightarmor.var_cdeeec29 = var_cdeeec29;
	self setlightarmorhp(self.lightarmor.max);
}

/*
	Name: removelightarmorondeath
	Namespace: armor
	Checksum: 0x257345BA
	Offset: 0x490
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function removelightarmorondeath()
{
	self endon(#"disconnect", #"give_light_armor", #"remove_light_armor");
	self waittill(#"death");
	unsetlightarmor();
}

/*
	Name: unsetlightarmor
	Namespace: armor
	Checksum: 0xE20C90BC
	Offset: 0x4F8
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function unsetlightarmor()
{
	self setlightarmorhp(0);
	self notify(#"remove_light_armor");
}

/*
	Name: removelightarmoronmatchend
	Namespace: armor
	Checksum: 0xBA7BD818
	Offset: 0x530
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function removelightarmoronmatchend()
{
	self endon(#"disconnect", #"remove_light_armor");
	level waittill(#"game_ended");
	self thread unsetlightarmor();
}

/*
	Name: haslightarmor
	Namespace: armor
	Checksum: 0x4C60C5F9
	Offset: 0x590
	Size: 0x16
	Parameters: 0
	Flags: None
*/
function haslightarmor()
{
	return self.lightarmor.amount > 0;
}

/*
	Name: function_a77114f2
	Namespace: armor
	Checksum: 0xBF463D8F
	Offset: 0x5B0
	Size: 0x178
	Parameters: 6
	Flags: Linked
*/
function function_a77114f2(einflictor, eattacker, idamage, smeansofdeath, weapon, shitloc)
{
	if(isdefined(self.lightarmor) && self.lightarmor.amount > 0)
	{
		if(weapon.ignoreslightarmor && smeansofdeath != "MOD_MELEE")
		{
			return idamage;
		}
		if(weapon.meleeignoreslightarmor && smeansofdeath == "MOD_MELEE")
		{
			return idamage;
		}
		if(smeansofdeath != "MOD_FALLING" && !weapons::isheadshot(weapon, shitloc, smeansofdeath))
		{
			damage_to_armor = idamage * self.lightarmor.var_cdeeec29;
			self.lightarmor.amount = self.lightarmorhp - damage_to_armor;
			idamage = 0;
			if(self.lightarmor.amount <= 0)
			{
				idamage = abs(self.lightarmor.amount);
				unsetlightarmor();
			}
		}
	}
	return idamage;
}

/*
	Name: get_armor
	Namespace: armor
	Checksum: 0x995DB53A
	Offset: 0x730
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function get_armor()
{
	total_armor = 0;
	if(isdefined(self.armor))
	{
		total_armor = self.armor;
	}
	if(isdefined(self.lightarmor) && isdefined(self.lightarmor.amount))
	{
		total_armor = total_armor + self.lightarmor.amount;
	}
	return total_armor;
}

/*
	Name: set_armor
	Namespace: armor
	Checksum: 0xA450B920
	Offset: 0x7A8
	Size: 0x26E
	Parameters: 13
	Flags: Linked
*/
function set_armor(amount, max_armor, armortier, var_2274e560, var_cdeeec29, var_5164d2e2, var_e6683a43, var_22c3ab38, var_9f307988, var_7a80f06e, explosive_damage_scale, var_35e3563e, var_4aad1e44)
{
	if(!isdefined(var_2274e560))
	{
		var_2274e560 = 1;
	}
	if(!isdefined(var_cdeeec29))
	{
		var_cdeeec29 = 1;
	}
	if(!isdefined(var_5164d2e2))
	{
		var_5164d2e2 = 1;
	}
	if(!isdefined(var_e6683a43))
	{
		var_e6683a43 = 1;
	}
	if(!isdefined(var_22c3ab38))
	{
		var_22c3ab38 = 1;
	}
	if(!isdefined(var_9f307988))
	{
		var_9f307988 = 1;
	}
	if(!isdefined(var_7a80f06e))
	{
		var_7a80f06e = 1;
	}
	if(!isdefined(explosive_damage_scale))
	{
		explosive_damage_scale = 1;
	}
	if(!isdefined(var_35e3563e))
	{
		var_35e3563e = 1;
	}
	if(!isdefined(var_4aad1e44))
	{
		var_4aad1e44 = undefined;
	}
	/#
		assert(isdefined(amount));
	#/
	self.var_d6f11c60 = undefined;
	self.var_e6c1bab8 = undefined;
	self.var_59a874a7.var_2274e560 = var_2274e560;
	self.var_59a874a7.var_22c3ab38 = var_22c3ab38;
	self.var_59a874a7.var_9f307988 = var_9f307988;
	self.var_59a874a7.var_7a80f06e = var_7a80f06e;
	self.var_59a874a7.var_cdeeec29 = var_cdeeec29;
	self.var_59a874a7.var_5164d2e2 = var_5164d2e2;
	self.var_59a874a7.var_e6683a43 = var_e6683a43;
	self.var_59a874a7.explosive_damage_scale = explosive_damage_scale;
	self.var_59a874a7.var_35e3563e = var_35e3563e;
	self.var_59a874a7.var_4aad1e44 = var_4aad1e44;
	if(isdefined(var_4aad1e44))
	{
		self.var_59a874a7.var_735ae1ee = getscriptbundle(var_4aad1e44);
	}
	self.armortier = armortier;
	self.maxarmor = max_armor;
	self.armor = amount;
}

/*
	Name: has_armor
	Namespace: armor
	Checksum: 0x9D3BF964
	Offset: 0xA20
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function has_armor()
{
	return self get_armor() > 0;
}

/*
	Name: get_damage_time_threshold_ms
	Namespace: armor
	Checksum: 0xA70A662E
	Offset: 0xA48
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function get_damage_time_threshold_ms(not_damaged_time_seconds)
{
	if(!isdefined(not_damaged_time_seconds))
	{
		not_damaged_time_seconds = 0.5;
	}
	damage_time_threshold_ms = gettime() - (int(not_damaged_time_seconds * 1000));
	return damage_time_threshold_ms;
}

/*
	Name: boost_armor
	Namespace: armor
	Checksum: 0x9D16E3DD
	Offset: 0xAA0
	Size: 0x11E
	Parameters: 2
	Flags: None
*/
function boost_armor(bars_to_give, damage_time_threshold_ms)
{
	player = self;
	if(!isdefined(player))
	{
		return;
	}
	if(bars_to_give <= 0)
	{
		return;
	}
	if(!player has_armor_bar_capability())
	{
		return;
	}
	if(player at_peak_armor_bars())
	{
		return;
	}
	if(isdefined(damage_time_threshold_ms) && isdefined(player.lastdamagetime) && player.lastdamagetime > 0 && player.lastdamagetime > damage_time_threshold_ms)
	{
		return;
	}
	empty_bars = get_empty_bars();
	if(empty_bars < bars_to_give)
	{
		player update_max_armor(1);
	}
	player.armor = player.armor + (int(bars_to_give * player.armorperbar));
}

/*
	Name: get_empty_bars
	Namespace: armor
	Checksum: 0xEB390871
	Offset: 0xBC8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function get_empty_bars()
{
	if(self.armorperbar <= 0)
	{
		return 0;
	}
	return (self.maxarmor - self.armor) / self.armorperbar;
}

/*
	Name: at_peak_armor_bars
	Namespace: armor
	Checksum: 0x112ACC84
	Offset: 0xC08
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function at_peak_armor_bars()
{
	if(self.armorperbar <= 0)
	{
		return 1;
	}
	return self.armor == self.maxarmor && self.maxarmor >= self.spawnarmor;
}

/*
	Name: update_max_armor
	Namespace: armor
	Checksum: 0x345E2EC8
	Offset: 0xC50
	Size: 0x8A
	Parameters: 1
	Flags: Linked
*/
function update_max_armor(bonus_bars)
{
	if(!isdefined(bonus_bars))
	{
		bonus_bars = 0;
	}
	var_59fec421 = 1;
	if(var_59fec421)
	{
		return;
	}
	new_max_bars = get_max_armor_bars(bonus_bars);
	self.maxarmor = int(ceil(new_max_bars * self.armorperbar));
}

/*
	Name: has_armor_bar_capability
	Namespace: armor
	Checksum: 0x6680FF9
	Offset: 0xCE8
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function has_armor_bar_capability()
{
	return self hasperk(#"specialty_armor");
}

/*
	Name: get_max_armor_bars
	Namespace: armor
	Checksum: 0xE7C19E6E
	Offset: 0xD18
	Size: 0x7A
	Parameters: 1
	Flags: Linked
*/
function get_max_armor_bars(bonus_bars)
{
	if(self.armorperbar <= 0)
	{
		return 0;
	}
	return math::clamp((ceil(self.armor / self.armorperbar)) + bonus_bars, 0, max(self.armorbarmaxcount, 1));
}

/*
	Name: get_armor_bars
	Namespace: armor
	Checksum: 0x321922B0
	Offset: 0xDA0
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function get_armor_bars()
{
	return math::clamp(self.armorbarcount, 1, 10);
}

/*
	Name: function_37f4e0e0
	Namespace: armor
	Checksum: 0x2B711F48
	Offset: 0xDD0
	Size: 0x246
	Parameters: 2
	Flags: Linked, Private
*/
function private function_37f4e0e0(smeansofdeath, shitloc)
{
	if(is_true(level.var_4ead52cc) && self laststand::player_is_in_laststand())
	{
		return false;
	}
	if(!isdefined(smeansofdeath))
	{
		return true;
	}
	isexplosivedamage = weapons::isexplosivedamage(smeansofdeath);
	if(isdefined(self.var_59a874a7) && isdefined(self.var_59a874a7.var_735ae1ee) && !is_true(isexplosivedamage))
	{
		if(!isdefined(self.var_59a874a7.var_735ae1ee.(shitloc)))
		{
			return false;
		}
		if(self.var_59a874a7.var_735ae1ee.(shitloc) == 0)
		{
			return false;
		}
		if(smeansofdeath == "MOD_HEAD_SHOT")
		{
			return true;
		}
	}
	if(level.var_d89ef54a === 1 || sessionmodeiszombiesgame())
	{
		if(smeansofdeath == "MOD_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_MELEE" || smeansofdeath == "MOD_MELEE_WEAPON_BUTT")
		{
			return true;
		}
		if(isexplosivedamage)
		{
			return true;
		}
	}
	else
	{
		if(smeansofdeath == "MOD_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_PISTOL_BULLET" || (smeansofdeath == "MOD_IMPACT" && shitloc !== "head"))
		{
			return true;
		}
		if(isexplosivedamage)
		{
			return true;
		}
	}
	if(is_true(level.var_369305cf))
	{
		return true;
	}
	return false;
}

/*
	Name: function_7538fede
	Namespace: armor
	Checksum: 0x8F1405EA
	Offset: 0x1020
	Size: 0x30
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7538fede(weapon)
{
	if(weapon.name == #"ar_stealth_t8_operator")
	{
		return true;
	}
	return false;
}

/*
	Name: apply_damage
	Namespace: armor
	Checksum: 0xFA5FE20A
	Offset: 0x1058
	Size: 0x962
	Parameters: 5
	Flags: Linked
*/
function apply_damage(weapon, damage, smeansofdeath, eattacker, shitloc)
{
	if(self.armor <= 0)
	{
		return damage;
	}
	if(isdefined(self.var_d44d1214))
	{
		return damage;
	}
	if(!self function_37f4e0e0(smeansofdeath, shitloc))
	{
		return damage;
	}
	if(!isdefined(weapon))
	{
		return damage;
	}
	var_737c8f6e = weapon.var_f857d6a0;
	if(!isdefined(var_737c8f6e) || var_737c8f6e <= 0)
	{
		var_737c8f6e = 1;
	}
	if(!isdefined(self.var_59a874a7))
	{
		self function_9c8b5737();
	}
	var_737c8f6e = var_737c8f6e * (is_true(weapon.var_ed6ea786) ? self.var_59a874a7.var_e6683a43 : self.var_59a874a7.var_cdeeec29);
	var_2274e560 = weapon.var_7b0ea85;
	if(weapons::isexplosivedamage(smeansofdeath))
	{
		var_2274e560 = self.var_59a874a7.explosive_damage_scale;
		var_737c8f6e = self.var_59a874a7.var_35e3563e;
	}
	else
	{
		if(smeansofdeath == "MOD_MELEE")
		{
			if(weapons::ispunch(weapon))
			{
				var_2274e560 = var_2274e560 * self.var_59a874a7.var_22c3ab38;
			}
			else
			{
				var_2274e560 = var_2274e560 * self.var_59a874a7.var_9f307988;
			}
		}
		else
		{
			if(smeansofdeath == "MOD_MELEE_WEAPON_BUTT")
			{
				if(function_7538fede(weapon))
				{
					var_2274e560 = var_2274e560 * self.var_59a874a7.var_9f307988;
				}
				else
				{
					var_2274e560 = var_2274e560 * self.var_59a874a7.var_7a80f06e;
				}
			}
			else
			{
				var_2274e560 = var_2274e560 * (weapon.var_ed6ea786 ? self.var_59a874a7.var_5164d2e2 : self.var_59a874a7.var_2274e560);
			}
		}
		if(isdefined(self.var_59a874a7) && isdefined(self.var_59a874a7.var_735ae1ee))
		{
			var_2274e560 = var_2274e560 + (1 - var_2274e560) * (1 - self.var_59a874a7.var_735ae1ee.(shitloc));
		}
	}
	if(is_true(level.var_369305cf))
	{
		var_2274e560 = 0;
		if(self isjuking())
		{
			damage = 0;
		}
	}
	if(getgametypesetting(#"hardcoremode"))
	{
		self.armor = 0;
		var_2274e560 = 0;
		weaponclass = util::getweaponclass(weapon);
		var_616f02b4 = weaponclass === #"weapon_sniper" || weaponclass === #"weapon_shotgun" || weaponclass === #"weapon_cqb";
		if(!var_616f02b4 && damage > (self.health - 5))
		{
			var_9bb721d3 = max(self.health - 5, 0);
		}
		else
		{
			var_9bb721d3 = damage;
		}
		if(isdefined(self.var_3f1410dd))
		{
			self.var_3f1410dd.damage_taken = self.var_3f1410dd.damage_taken + int(ceil(self.armor));
		}
	}
	else
	{
		var_aacd5df1 = damage * var_737c8f6e;
		var_9bb721d3 = 0;
		if(var_aacd5df1 > 0)
		{
			armor_damage = float(math::clamp(var_aacd5df1, 0, self.armor));
			var_e27873f2 = damage * (1 - var_2274e560);
			var_b1417997 = math::clamp(var_aacd5df1 - self.armor, 0, var_aacd5df1);
			var_9bb721d3 = var_e27873f2 * (var_b1417997 / var_aacd5df1);
			self.armor = self.armor - int(ceil(armor_damage));
			if(isdefined(self.var_3f1410dd))
			{
				self.var_3f1410dd.damage_taken = self.var_3f1410dd.damage_taken + int(ceil(armor_damage));
			}
			if(var_9bb721d3 > 0)
			{
				var_9bb721d3 = var_9bb721d3 * self function_e95ae03(#"hash_47245d009e766628");
			}
		}
	}
	self update_max_armor();
	if(isdefined(level.specialty_quieter_complete))
	{
		self [[level.specialty_quieter_complete]]();
	}
	if(self.armor <= 0)
	{
		self.var_d6f11c60 = eattacker;
		self.var_e6c1bab8 = gettime();
		self playsoundtoplayer(#"hash_22f2a16e63651515", self);
		self thread function_386de852();
		self function_51df9c0c(#"hash_6be738527a4213aa");
		if(perks::perk_hasperk(#"specialty_armor"))
		{
			self perks::perk_unsetperk(#"specialty_armor");
			playfxontag(#"hash_4a955131370a3720", self, "j_spineupper");
		}
		if(perks::perk_hasperk(#"specialty_armor_tier_two"))
		{
			self perks::perk_unsetperk(#"specialty_armor_tier_two");
			playfxontag(#"hash_56c8182de62c1c6", self, "j_spineupper");
		}
		if(perks::perk_hasperk(#"specialty_armor_tier_three"))
		{
			self perks::perk_unsetperk(#"specialty_armor_tier_three");
			playfxontag(#"hash_3c6a01bd4394d4f3", self, "j_spineupper");
		}
		if(isdefined(level.var_67f4fd41))
		{
			self [[level.var_67f4fd41]]();
		}
		if(isdefined(self.var_67f4fd41))
		{
			self [[self.var_67f4fd41]](eattacker, weapon);
		}
	}
	if(isdefined(self.var_ea1458aa) && isdefined(eattacker) && isdefined(eattacker.clientid))
	{
		if(!isdefined(self.var_ea1458aa.attackerdamage))
		{
			self.var_ea1458aa.attackerdamage = [];
		}
		if(!isdefined(self.var_ea1458aa.attackerdamage[eattacker.clientid]))
		{
			self.var_ea1458aa.attackerdamage[eattacker.clientid] = spawnstruct();
		}
		var_d72bd991 = self.var_ea1458aa.attackerdamage[eattacker.clientid];
		var_d72bd991.var_a74d2db8 = gettime();
	}
	remaining_damage = int(ceil(math::clamp((damage * var_2274e560) + var_9bb721d3, 0, damage)));
	return remaining_damage;
}

/*
	Name: function_386de852
	Namespace: armor
	Checksum: 0xB81E77DD
	Offset: 0x19C8
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_386de852()
{
	self notify("f5a0c65e739f7c4");
	self endon("f5a0c65e739f7c4");
	self endon(#"disconnect");
	cooldown_time = 0;
	self clientfield::set_player_uimodel("hudItems.armorIsOnCooldown", 0);
	if(!isdefined(self.var_a06951b7))
	{
		cooldown_time = self function_6d32a13b();
		self.var_a06951b7 = gettime() + cooldown_time;
	}
	if(cooldown_time <= 0)
	{
		return;
	}
	self clientfield::set_player_uimodel("hudItems.armorIsOnCooldown", 1);
	while(isdefined(self.var_a06951b7) && self.var_a06951b7 > gettime())
	{
		if(!isalive(self) && self function_725b4d91() == 0)
		{
			self.var_a06951b7 = self.var_a06951b7 + 250;
		}
		wait(0.25);
	}
	self clientfield::set_player_uimodel("hudItems.armorIsOnCooldown", 0);
}

/*
	Name: has_helmet
	Namespace: armor
	Checksum: 0x22FEE2F4
	Offset: 0x1B20
	Size: 0xA2
	Parameters: 0
	Flags: None
*/
function has_helmet()
{
	if(isdefined(self.var_59a874a7) && isdefined(self.var_59a874a7.var_735ae1ee))
	{
		return (isdefined(self.var_59a874a7.var_735ae1ee.helmet) ? self.var_59a874a7.var_735ae1ee.helmet : 0) || (isdefined(self.var_59a874a7.var_735ae1ee.head) ? self.var_59a874a7.var_735ae1ee.head : 0);
	}
	return 0;
}

