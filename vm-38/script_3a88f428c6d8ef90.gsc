#using script_2c5daa95f8fec03c;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\perks.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\scoreevents.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_b61a349a;

/*
	Name: function_5ebbd151
	Namespace: namespace_b61a349a
	Checksum: 0x7CC8D42D
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5ebbd151()
{
	level notify(940080514);
}

/*
	Name: function_89f2df9
	Namespace: namespace_b61a349a
	Checksum: 0x9EC49C01
	Offset: 0x100
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_775f993ac537d970", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_b61a349a
	Checksum: 0xAEFC58F0
	Offset: 0x158
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	/#
		level.var_6aa829ef = &function_6aa829ef;
	#/
	callback::on_connect(&on_player_connect);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_b61a349a
	Checksum: 0x80F724D1
	Offset: 0x1A0
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: on_player_connect
	Namespace: namespace_b61a349a
	Checksum: 0xE3C2B32C
	Offset: 0x1B0
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self.var_d9fddbc5 = 0;
	self.var_b37d3db2 = 0;
	self callback::add_callback(#"weapon_fired", &function_78ccee50);
	self callback::add_callback(#"weapon_change", &function_39ab0a6a);
}

/*
	Name: function_39ab0a6a
	Namespace: namespace_b61a349a
	Checksum: 0xCEE6E974
	Offset: 0x238
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_39ab0a6a(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	if(isdefined(eventstruct.weapon))
	{
		w_base = zm_weapons::get_base_weapon(eventstruct.weapon);
		weapon_class = "none";
		if(isdefined(w_base))
		{
			weapon_class = level.zombie_weapons[w_base].weapon_classname;
		}
		if(!(weapon_class === "launcher" || weapon_class === "special"))
		{
			if(self perks::function_be94fe26(#"specialty_ammodrainsfromstockfirst"))
			{
				self perks::function_45d12554(#"specialty_ammodrainsfromstockfirst");
			}
		}
	}
}

/*
	Name: function_78ccee50
	Namespace: namespace_b61a349a
	Checksum: 0xEF33902A
	Offset: 0x338
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function function_78ccee50(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	if(isdefined(eventstruct.weapon))
	{
		w_base = zm_weapons::get_base_weapon(eventstruct.weapon);
		if(isdefined(w_base) && isdefined(level.zombie_weapons[w_base].weapon_classname))
		{
			if(function_998f8321(w_base) >= 3)
			{
				if(level.zombie_weapons[w_base].weapon_classname == "launcher" || level.zombie_weapons[w_base].weapon_classname == "special")
				{
					if(!self perks::function_be94fe26(#"specialty_ammodrainsfromstockfirst"))
					{
						self.var_d9fddbc5++;
						if(math::cointoss(25) || self.var_d9fddbc5 >= 4)
						{
							self.var_b37d3db2 = 1;
							self perks::function_7637bafa(#"specialty_ammodrainsfromstockfirst");
							self.var_d9fddbc5 = 0;
						}
					}
					else
					{
						var_409524fd = 75;
						if(math::cointoss(var_409524fd))
						{
							self.var_d9fddbc5 = 0;
							self perks::function_45d12554(#"specialty_ammodrainsfromstockfirst");
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_998f8321
	Namespace: namespace_b61a349a
	Checksum: 0x68EF567A
	Offset: 0x508
	Size: 0x31C
	Parameters: 1
	Flags: Linked
*/
function function_998f8321(weapon)
{
	/#
		var_df6f833b = getdvarint(#"hash_31933df32887a98b", 0);
		if(var_df6f833b > 0)
		{
			return var_df6f833b;
		}
	#/
	var_8c590502 = getgametypesetting(#"hash_3c2c78e639bfd3c6");
	if(isdefined(var_8c590502) && var_8c590502 > 0)
	{
		return var_8c590502;
	}
	w_base = zm_weapons::get_base_weapon(weapon);
	if(isdefined(level.zombie_weapons[w_base].weapon_classname))
	{
		switch(level.zombie_weapons[w_base].weapon_classname)
		{
			case "ar":
			{
				return self zm_stats::function_12b698fa(#"hash_e4ec67369bdd326");
				break;
			}
			case "lmg":
			{
				return self zm_stats::function_12b698fa(#"hash_5511ea176da6ac83");
				break;
			}
			case "pistol":
			{
				return self zm_stats::function_12b698fa(#"hash_47a2d98887910102");
				break;
			}
			case "shotgun":
			{
				return self zm_stats::function_12b698fa(#"hash_1f78483ef16f84d5");
				break;
			}
			case "smg":
			{
				return self zm_stats::function_12b698fa(#"hash_2c88d3bcf790ec34");
				break;
			}
			case "sniper":
			{
				return self zm_stats::function_12b698fa(#"hash_3d590f7af842ad92");
				break;
			}
			case "tr":
			{
				return self zm_stats::function_12b698fa(#"hash_707a5c5c35f50dec");
				break;
			}
			case "melee":
			{
				return self zm_stats::function_12b698fa(#"hash_265dfd25205ffba8");
				break;
			}
			case "launcher":
			{
				return self zm_stats::function_12b698fa(#"hash_604f7493136f8a3");
				break;
			}
			case "special":
			{
				return self zm_stats::function_12b698fa(#"hash_746a85760decf362");
				break;
			}
		}
	}
	return 0;
}

/*
	Name: function_b3496fde
	Namespace: namespace_b61a349a
	Checksum: 0xFB89FA49
	Offset: 0x830
	Size: 0xB1C
	Parameters: 12
	Flags: Linked
*/
function function_b3496fde(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	n_base_damage = psoffsettime;
	if(boneindex == "MOD_MELEE")
	{
		n_tier = shitloc zm_stats::function_12b698fa(#"hash_265dfd25205ffba8");
		/#
			var_df6f833b = getdvarint(#"hash_31933df32887a98b", 0);
			if(var_df6f833b > 0)
			{
				n_tier = var_df6f833b;
			}
		#/
		if(!isdefined(n_tier))
		{
			return 0;
		}
		switch(n_tier)
		{
			case 2:
			case 3:
			{
				n_damage = function_1fd0807c(0.1, n_base_damage);
				shitloc function_8a6ccd14(surfacetype, n_tier, n_damage);
				return n_damage;
				break;
			}
			case 4:
			{
				n_damage = function_1fd0807c(0.25, n_base_damage);
				shitloc function_8a6ccd14(surfacetype, n_tier, n_damage);
				return n_damage;
				break;
			}
			case 5:
			{
				if(isplayer(shitloc))
				{
					shitloc.health = shitloc.health + (int(0.1 * shitloc.var_66cb03ad));
					if(shitloc.health > shitloc.var_66cb03ad)
					{
						shitloc.health = shitloc.var_66cb03ad;
					}
				}
				n_damage = function_1fd0807c(0.25, n_base_damage);
				shitloc function_8a6ccd14(surfacetype, n_tier, n_damage);
				return n_damage;
				break;
			}
			default:
			{
				return 0;
				break;
			}
		}
	}
	n_tier = shitloc function_998f8321(surfacetype);
	w_base = zm_weapons::get_base_weapon(surfacetype);
	if(isdefined(level.zombie_weapons[w_base]) && isdefined(n_tier))
	{
		switch(level.zombie_weapons[w_base].weapon_classname)
		{
			case "ar":
			{
				switch(n_tier)
				{
					case 1:
					case 2:
					case 3:
					{
						if(self function_cf4432e8(surfacetype, shitloc))
						{
							n_damage = function_1fd0807c(0.1, n_base_damage);
							shitloc function_8a6ccd14(surfacetype, n_tier, n_damage);
							return n_damage;
						}
						break;
					}
					case 4:
					case 5:
					{
						if(self function_cf4432e8(surfacetype, shitloc))
						{
							n_damage = function_1fd0807c(0.25, n_base_damage);
							shitloc function_8a6ccd14(surfacetype, n_tier, n_damage);
							return n_damage;
						}
						break;
					}
				}
				break;
			}
			case "pistol":
			{
				var_9b4953c = 0;
				switch(n_tier)
				{
					case 1:
					case 2:
					case 3:
					{
						if(self function_1d2de48d(shitloc))
						{
							var_9b4953c = function_1fd0807c(0.1, n_base_damage);
							shitloc function_8a6ccd14(surfacetype, n_tier, var_9b4953c);
						}
						return var_9b4953c;
						break;
					}
					case 4:
					case 5:
					{
						if(self function_1d2de48d(shitloc))
						{
							var_9b4953c = function_1fd0807c(0.25, n_base_damage);
							shitloc function_8a6ccd14(surfacetype, n_tier, var_9b4953c);
						}
						return var_9b4953c;
						break;
					}
				}
				break;
			}
			case "shotgun":
			{
				var_9b4953c = 0;
				switch(n_tier)
				{
					case 1:
					case 2:
					case 3:
					{
						if(self function_1d2de48d(shitloc))
						{
							var_9b4953c = function_1fd0807c(0.1, n_base_damage);
							shitloc function_8a6ccd14(surfacetype, n_tier, var_9b4953c);
						}
						return var_9b4953c;
						break;
					}
					case 4:
					case 5:
					{
						if(self function_1d2de48d(shitloc))
						{
							var_9b4953c = function_1fd0807c(0.25, n_base_damage);
							shitloc function_8a6ccd14(surfacetype, n_tier, var_9b4953c);
						}
						return var_9b4953c;
						break;
					}
				}
				break;
			}
			case "smg":
			{
				var_9b4953c = 0;
				switch(n_tier)
				{
					case 1:
					case 2:
					case 3:
					{
						if(self function_1d2de48d(shitloc))
						{
							var_9b4953c = function_1fd0807c(0.1, n_base_damage);
							shitloc function_8a6ccd14(surfacetype, n_tier, var_9b4953c);
						}
						return var_9b4953c;
						break;
					}
					case 4:
					case 5:
					{
						if(self function_1d2de48d(shitloc))
						{
							var_9b4953c = function_1fd0807c(0.25, n_base_damage);
							shitloc function_8a6ccd14(surfacetype, n_tier, var_9b4953c);
						}
						return var_9b4953c;
						break;
					}
				}
				break;
			}
			case "tr":
			{
				switch(n_tier)
				{
					case 1:
					case 2:
					case 3:
					{
						if(self function_cf4432e8(surfacetype, shitloc))
						{
							n_damage = function_1fd0807c(0.1, n_base_damage);
							shitloc function_8a6ccd14(surfacetype, n_tier, n_damage);
							return n_damage;
						}
						break;
					}
					case 4:
					case 5:
					{
						if(self function_cf4432e8(surfacetype, shitloc))
						{
							n_damage = function_1fd0807c(0.25, n_base_damage);
							shitloc function_8a6ccd14(surfacetype, n_tier, n_damage);
							return n_damage;
						}
						break;
					}
				}
				break;
			}
			case "launcher":
			case "special":
			{
				switch(n_tier)
				{
					case 1:
					case 2:
					case 3:
					{
						if(self.var_6f84b820 === #"special" || self.var_6f84b820 === #"elite")
						{
							n_damage = function_1fd0807c(0.1, n_base_damage);
							shitloc function_8a6ccd14(surfacetype, n_tier, n_damage);
							return n_damage;
						}
						break;
					}
					case 4:
					case 5:
					{
						if(self.var_6f84b820 === #"special" || self.var_6f84b820 === #"elite")
						{
							n_damage = function_1fd0807c(0.25, n_base_damage);
							shitloc function_8a6ccd14(surfacetype, n_tier, n_damage);
							return n_damage;
						}
						break;
					}
				}
				break;
			}
		}
	}
	return 0;
}

/*
	Name: function_1fd0807c
	Namespace: namespace_b61a349a
	Checksum: 0x991044D5
	Offset: 0x1358
	Size: 0x1A
	Parameters: 2
	Flags: Linked
*/
function function_1fd0807c(n_percent, n_base_damage)
{
	return n_base_damage * n_percent;
}

/*
	Name: function_cf4432e8
	Namespace: namespace_b61a349a
	Checksum: 0x731453FF
	Offset: 0x1380
	Size: 0x96
	Parameters: 2
	Flags: Linked
*/
function function_cf4432e8(weapon, attacker)
{
	weaponclass = util::getweaponclass(weapon);
	weap_min_dmg_range = scoreevents::get_distance_for_weapon(weapon, weaponclass);
	disttovictim = distancesquared(self.origin, attacker.origin);
	if(disttovictim > weap_min_dmg_range)
	{
		return true;
	}
	return false;
}

/*
	Name: function_1d2de48d
	Namespace: namespace_b61a349a
	Checksum: 0xD8BF8F45
	Offset: 0x1420
	Size: 0x58
	Parameters: 1
	Flags: Linked
*/
function function_1d2de48d(attacker)
{
	var_2e4eec5f = 16384;
	disttovictim = distancesquared(self.origin, attacker.origin);
	if(disttovictim <= var_2e4eec5f)
	{
		return true;
	}
	return false;
}

/*
	Name: function_817f0439
	Namespace: namespace_b61a349a
	Checksum: 0xE59C78E4
	Offset: 0x1480
	Size: 0x79C
	Parameters: 4
	Flags: Linked
*/
function function_817f0439(damage, weapon, vpoint, shitloc)
{
	n_base_damage = vpoint;
	n_tier = self function_998f8321(shitloc);
	if(!isdefined(n_tier))
	{
		n_tier = 0;
	}
	w_base = zm_weapons::get_base_weapon(shitloc);
	if(isdefined(level.zombie_weapons[w_base].weapon_classname))
	{
		switch(level.zombie_weapons[w_base].weapon_classname)
		{
			case "ar":
			{
				switch(n_tier)
				{
					case 2:
					case 3:
					case 4:
					{
						n_damage = function_1fd0807c(0.1, n_base_damage);
						self function_8a6ccd14(shitloc, n_tier, n_damage);
						return n_damage;
						break;
					}
					case 5:
					{
						n_damage = function_1fd0807c(0.25, n_base_damage);
						self function_8a6ccd14(shitloc, n_tier, n_damage);
						return n_damage;
						break;
					}
				}
				break;
			}
			case "smg":
			{
				switch(n_tier)
				{
					case 2:
					case 3:
					case 4:
					{
						n_damage = function_1fd0807c(0.1, n_base_damage);
						self function_8a6ccd14(shitloc, n_tier, n_damage);
						return n_damage;
						break;
					}
					case 5:
					{
						n_damage = function_1fd0807c(0.25, n_base_damage);
						self function_8a6ccd14(shitloc, n_tier, n_damage);
						return n_damage;
						break;
					}
				}
				break;
			}
			case "lmg":
			{
				switch(n_tier)
				{
					case 2:
					case 3:
					case 4:
					{
						n_damage = function_1fd0807c(0.1, n_base_damage);
						self function_8a6ccd14(shitloc, n_tier, n_damage);
						return n_damage;
						break;
					}
					case 5:
					{
						n_damage = function_1fd0807c(0.25, n_base_damage);
						self function_8a6ccd14(shitloc, n_tier, n_damage);
						return n_damage;
						break;
					}
				}
				break;
			}
			case "sniper":
			{
				switch(n_tier)
				{
					case 2:
					case 3:
					case 4:
					{
						n_damage = function_1fd0807c(0.1, n_base_damage);
						self function_8a6ccd14(shitloc, n_tier, n_damage);
						return n_damage;
						break;
					}
					case 5:
					{
						n_damage = function_1fd0807c(0.25, n_base_damage);
						self function_8a6ccd14(shitloc, n_tier, n_damage);
						return n_damage;
						break;
					}
				}
				break;
			}
			case "shotgun":
			{
				switch(n_tier)
				{
					case 2:
					case 3:
					case 4:
					{
						n_damage = function_1fd0807c(0.1, n_base_damage);
						self function_8a6ccd14(shitloc, n_tier, n_damage);
						return n_damage;
						break;
					}
					case 5:
					{
						n_damage = function_1fd0807c(0.25, n_base_damage);
						self function_8a6ccd14(shitloc, n_tier, n_damage);
						return n_damage;
						break;
					}
				}
				break;
			}
			case "tr":
			{
				switch(n_tier)
				{
					case 2:
					case 3:
					case 4:
					{
						n_damage = function_1fd0807c(0.1, n_base_damage);
						self function_8a6ccd14(shitloc, n_tier, n_damage);
						return n_damage;
						break;
					}
					case 5:
					{
						n_damage = function_1fd0807c(0.25, n_base_damage);
						self function_8a6ccd14(shitloc, n_tier, n_damage);
						return n_damage;
						break;
					}
				}
				break;
			}
			case "pistol":
			{
				switch(n_tier)
				{
					case 2:
					case 3:
					case 4:
					{
						n_damage = function_1fd0807c(0.1, n_base_damage);
						self function_8a6ccd14(shitloc, n_tier, n_damage);
						return n_damage;
						break;
					}
					case 5:
					{
						n_damage = function_1fd0807c(0.25, n_base_damage);
						self function_8a6ccd14(shitloc, n_tier, n_damage);
						return n_damage;
						break;
					}
				}
				break;
			}
		}
	}
	return 0;
}

/*
	Name: function_8a6ccd14
	Namespace: namespace_b61a349a
	Checksum: 0x497A1EB4
	Offset: 0x1C28
	Size: 0x12C
	Parameters: 4
	Flags: Linked
*/
function function_8a6ccd14(weapon, n_tier, var_570564b8, var_497316dc)
{
	if(!isdefined(var_570564b8))
	{
		var_570564b8 = 0;
	}
	if(!isdefined(var_497316dc))
	{
		var_497316dc = 0;
	}
	if(isplayer(self) && isdefined(weapon))
	{
		if(!isdefined(n_tier))
		{
			n_tier = function_998f8321(weapon);
		}
		if(!isdefined(n_tier))
		{
			return;
		}
		var_5e90992c = {#armor_damage:int(var_497316dc), #bonus_damage:int(var_570564b8), #tier:n_tier, #weapon:weapon.name};
		self function_678f57c8(#"hash_5384f0bdf7f1eb1c", var_5e90992c);
	}
}

/*
	Name: function_6aa829ef
	Namespace: namespace_b61a349a
	Checksum: 0x92987AF4
	Offset: 0x1D60
	Size: 0x164
	Parameters: 0
	Flags: None
*/
function function_6aa829ef()
{
	/#
		level endon(#"game_ended");
		setdvar(#"hash_53ca11fb4a63975f", "");
		adddebugcommand(("" + 0) + "");
		adddebugcommand(("" + 1) + "");
		adddebugcommand(("" + 2) + "");
		adddebugcommand(("" + 3) + "");
		adddebugcommand(("" + 4) + "");
		adddebugcommand(("" + 5) + "");
		function_cd140ee9(#"hash_53ca11fb4a63975f", &function_6cb3521c);
	#/
}

/*
	Name: function_6cb3521c
	Namespace: namespace_b61a349a
	Checksum: 0xF21B596B
	Offset: 0x1ED0
	Size: 0x14C
	Parameters: 1
	Flags: None
*/
function function_6cb3521c(params)
{
	/#
		self notify("");
		self endon("");
		waitframe(1);
		foreach(player in getplayers())
		{
			if(params.value == "")
			{
				continue;
			}
			if(params.name === #"hash_53ca11fb4a63975f")
			{
				setdvar(#"hash_31933df32887a98b", int(params.value));
			}
		}
		setdvar(#"hash_53ca11fb4a63975f", "");
	#/
}

