#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\scoreevents.gsc;
#using script_2c5daa95f8fec03c;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_b61a349a;

/*
	Name: __init__system__
	Namespace: namespace_b61a349a
	Checksum: 0x8B968403
	Offset: 0xB0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_775f993ac537d970", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_b61a349a
	Checksum: 0x4DC92187
	Offset: 0x108
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	/#
		level.var_6aa829ef = &function_6aa829ef;
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_b61a349a
	Checksum: 0x80F724D1
	Offset: 0x130
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: function_998f8321
	Namespace: namespace_b61a349a
	Checksum: 0x75451BDF
	Offset: 0x140
	Size: 0x2D4
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
	var_8c590502 = (isdefined(getgametypesetting(#"hash_3c2c78e639bfd3c6")) ? getgametypesetting(#"hash_3c2c78e639bfd3c6") : 0);
	if(var_8c590502 > 0)
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
		}
	}
	return 0;
}

/*
	Name: function_b3496fde
	Namespace: namespace_b61a349a
	Checksum: 0xF4BBD343
	Offset: 0x420
	Size: 0x994
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
					shitloc.health = shitloc.health + (int(0.1 * n_base_damage));
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
							var_9b4953c = function_1fd0807c(0.1, n_base_damage);
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
		}
	}
	return 0;
}

/*
	Name: function_1fd0807c
	Namespace: namespace_b61a349a
	Checksum: 0x4AC082B7
	Offset: 0xDC0
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
	Checksum: 0x3E7EBF70
	Offset: 0xDE8
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
	Checksum: 0xCC490502
	Offset: 0xE88
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
	Checksum: 0x8BD555C0
	Offset: 0xEE8
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
	Checksum: 0xEB4F6B51
	Offset: 0x1690
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
	Checksum: 0x4B51A0BB
	Offset: 0x17C8
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
	Checksum: 0xF0C53BC0
	Offset: 0x1938
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

