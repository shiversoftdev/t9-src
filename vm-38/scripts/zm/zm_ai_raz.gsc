#using script_3751b21462a54a7d;
#using script_3a88f428c6d8ef90;
#using script_58c342edd81589fb;
#using script_5f261a5d57de5f7c;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace zm_ai_raz;

/*
	Name: function_2d6ef273
	Namespace: zm_ai_raz
	Checksum: 0x70618202
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2d6ef273()
{
	level notify(849931540);
}

/*
	Name: function_89f2df9
	Namespace: zm_ai_raz
	Checksum: 0x23696365
	Offset: 0xF0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_ai_raz", &function_70a657d8, undefined, &function_4df027f2, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_ai_raz
	Checksum: 0xD93983F0
	Offset: 0x140
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.var_dff96419 = &function_f3c536e3;
	level.var_337f9ff7 = &function_484c9f1b;
	spawner::add_archetype_spawn_function(#"raz", &razspawnsetup);
}

/*
	Name: function_4df027f2
	Namespace: zm_ai_raz
	Checksum: 0x80F724D1
	Offset: 0x1B0
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_4df027f2()
{
}

/*
	Name: razspawnsetup
	Namespace: zm_ai_raz
	Checksum: 0xC17E8409
	Offset: 0x1C0
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function razspawnsetup()
{
	self.closest_player_override = &zm_utility::function_3d70ba7a;
}

/*
	Name: spawn_single
	Namespace: zm_ai_raz
	Checksum: 0x607EF8BC
	Offset: 0x1E8
	Size: 0x1C8
	Parameters: 3
	Flags: None
*/
function spawn_single(b_force_spawn, var_eb3a8721, var_bc66d64b)
{
	if(!isdefined(var_eb3a8721))
	{
		var_eb3a8721 = 0;
	}
	if(!var_eb3a8721 && !function_9230ac9a())
	{
		return undefined;
	}
	if(isdefined(var_bc66d64b))
	{
		s_spawn_loc = var_bc66d64b;
	}
	else
	{
		if(isdefined(level.var_2e33420c))
		{
			s_spawn_loc = [[level.var_2e33420c]]();
		}
		else if(level.zm_loc_types[#"raz_location"].size > 0)
		{
			s_spawn_loc = array::random(level.zm_loc_types[#"raz_location"]);
		}
	}
	if(!isdefined(s_spawn_loc))
	{
		/#
			if(getdvarint(#"hash_1f8efa579fee787c", 0))
			{
				iprintlnbold("");
			}
		#/
		return undefined;
	}
	ai = spawnactor(#"hash_4f87aa2a203d37d0", s_spawn_loc.origin, s_spawn_loc.angles);
	if(isdefined(ai))
	{
		ai.script_string = s_spawn_loc.script_string;
		ai.find_flesh_struct_string = s_spawn_loc.find_flesh_struct_string;
		ai.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
		ai forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
	}
	return ai;
}

/*
	Name: round_spawn
	Namespace: zm_ai_raz
	Checksum: 0x9B2E8336
	Offset: 0x3B8
	Size: 0x38
	Parameters: 0
	Flags: None
*/
function round_spawn()
{
	ai = spawn_single();
	if(isdefined(ai))
	{
		level.zombie_total--;
		return true;
	}
	return false;
}

/*
	Name: function_9230ac9a
	Namespace: zm_ai_raz
	Checksum: 0x68FCF70B
	Offset: 0x3F8
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function function_9230ac9a()
{
	var_2c3c71f0 = function_d29d5032();
	var_ea840c7e = function_62f1faf9();
	if(!is_true(level.var_76934955) && (is_true(level.var_fe2bb2ac) || var_2c3c71f0 >= var_ea840c7e || !level flag::get("spawn_zombies")))
	{
		return false;
	}
	return true;
}

/*
	Name: function_62f1faf9
	Namespace: zm_ai_raz
	Checksum: 0xA27763E7
	Offset: 0x4B8
	Size: 0xFA
	Parameters: 0
	Flags: None
*/
function function_62f1faf9()
{
	n_player_count = zm_utility::function_a2541519(getplayers().size);
	if(!isdefined(n_player_count) || n_player_count < 1)
	{
		n_player_count = 1;
	}
	switch(n_player_count)
	{
		case 1:
		default:
		{
			return 1;
			break;
		}
		case 2:
		{
			return 2;
			break;
		}
		case 3:
		{
			return 2;
			break;
		}
		case 4:
		{
			return 3;
			break;
		}
		case 5:
		{
			return 3;
			break;
		}
	}
}

/*
	Name: function_d29d5032
	Namespace: zm_ai_raz
	Checksum: 0x68CC965F
	Offset: 0x5C0
	Size: 0xCA
	Parameters: 0
	Flags: None
*/
function function_d29d5032()
{
	var_93e3feed = getaiarchetypearray(#"raz");
	var_2c3c71f0 = var_93e3feed.size;
	foreach(var_32c62397 in var_93e3feed)
	{
		if(!isalive(var_32c62397))
		{
			var_2c3c71f0--;
		}
	}
	return var_2c3c71f0;
}

/*
	Name: function_d4f11e3c
	Namespace: zm_ai_raz
	Checksum: 0xB2A04040
	Offset: 0x698
	Size: 0xE2
	Parameters: 1
	Flags: None
*/
function function_d4f11e3c(var_dbce0c44)
{
	var_8cf00d40 = int(floor(var_dbce0c44 / 25));
	if(level.round_number < 20)
	{
		var_74475add = 0.02;
	}
	else
	{
		if(level.round_number < 30)
		{
			var_74475add = 0.03;
		}
		else
		{
			var_74475add = 0.04;
		}
	}
	return min(var_8cf00d40, int(ceil(level.zombie_total * var_74475add)));
}

/*
	Name: function_f3c536e3
	Namespace: zm_ai_raz
	Checksum: 0xA7460268
	Offset: 0x788
	Size: 0x1D2
	Parameters: 2
	Flags: None
*/
function function_f3c536e3(damagemod, weapon)
{
	var_36d55c9c = 1;
	if(isplayer(self))
	{
		w_base = zm_weapons::get_base_weapon(weapon);
		weapclass = level.zombie_weapons[w_base].weapon_classname;
		if(isdefined(weapclass))
		{
			n_tier = self namespace_b61a349a::function_998f8321(weapon);
			switch(weapclass)
			{
				case "lmg":
				case "sniper":
				{
					if(n_tier >= 2)
					{
						var_36d55c9c = (n_tier >= 4 ? 1.25 : 1.1);
					}
					break;
				}
				case "pistol":
				case "shotgun":
				{
					if(n_tier >= 3)
					{
						var_36d55c9c = 1.1;
					}
					break;
				}
			}
		}
		if(self namespace_e86ffa8::function_7bf30775(2))
		{
			damagemod = (damagemod * 1.5) * var_36d55c9c;
			self namespace_b61a349a::function_8a6ccd14(weapon, n_tier, undefined, damagemod);
			return damagemod;
		}
		self namespace_b61a349a::function_8a6ccd14(weapon, n_tier, undefined, damagemod * var_36d55c9c);
	}
	return damagemod * var_36d55c9c;
}

/*
	Name: function_484c9f1b
	Namespace: zm_ai_raz
	Checksum: 0xD5EDBE8C
	Offset: 0x968
	Size: 0x170
	Parameters: 4
	Flags: None
*/
function function_484c9f1b(attacker, damage, weapon, target)
{
	var_12ed5e54 = 0;
	if(isplayer(attacker))
	{
		w_base = zm_weapons::get_base_weapon(weapon);
		weapclass = level.zombie_weapons[w_base].weapon_classname;
		if(isdefined(weapclass))
		{
			n_tier = attacker namespace_b61a349a::function_998f8321(weapon);
			switch(weapclass)
			{
				case "launcher":
				case "special":
				{
					if(n_tier >= 2 && n_tier < 5)
					{
						var_12ed5e54 = 0.1;
					}
					else if(n_tier >= 5)
					{
						var_12ed5e54 = 0.25;
					}
					break;
				}
			}
		}
	}
	var_2a3ef77c = weapons::function_74bbb3fa(damage, weapon, target);
	if(var_2a3ef77c > damage)
	{
		return 1.5 + var_12ed5e54;
	}
	return 1 + var_12ed5e54;
}

