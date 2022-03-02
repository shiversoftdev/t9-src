#using script_2c5daa95f8fec03c;
#using script_58c342edd81589fb;
#using script_799de24f8ad427f7;
#using script_7d5c9b91cf8d272b;
#using script_7e59d7bba853fe4b;
#using script_db06eb511bd9b36;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_7cadb1cc;

/*
	Name: function_346f872d
	Namespace: namespace_7cadb1cc
	Checksum: 0xAD4EB438
	Offset: 0x150
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_346f872d()
{
	level notify(1281655180);
}

/*
	Name: function_89f2df9
	Namespace: namespace_7cadb1cc
	Checksum: 0x6C6FC83B
	Offset: 0x170
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_65c0c481aff3fe43", &function_70a657d8, undefined, undefined, "zm_destination_manager");
}

/*
	Name: function_70a657d8
	Namespace: namespace_7cadb1cc
	Checksum: 0xC90E6C11
	Offset: 0x1C0
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	namespace_c3287616::register_archetype(#"hash_7c09b683edfb0e96", &function_48924a80, &round_spawn, undefined, 100);
	namespace_c3287616::function_306ce518(#"hash_7c09b683edfb0e96", &function_9282dcac);
	spawner::add_archetype_spawn_function(#"hash_7c09b683edfb0e96", &function_b82e0a5d);
	spawner::function_89a2cd87(#"hash_7c09b683edfb0e96", &function_545f669b);
	zm_cleanup::function_cdf5a512(#"hash_7c09b683edfb0e96", &function_1d787beb);
}

/*
	Name: function_b82e0a5d
	Namespace: namespace_7cadb1cc
	Checksum: 0x64697C42
	Offset: 0x2D8
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_b82e0a5d()
{
	self.b_ignore_cleanup = 0;
	self.closest_player_override = &zm_utility::function_3d70ba7a;
	self.var_ad033811 = &function_2e394e63;
	self.var_81e5ae7 = &function_953059a3;
	self.var_29ab3df0 = &function_65ef2078;
	level thread zm_spawner::zombie_death_event(self);
	if(zm_utility::function_c200446c())
	{
		self thread function_2995325f();
	}
	self thread function_3ec01d7a();
}

/*
	Name: function_545f669b
	Namespace: namespace_7cadb1cc
	Checksum: 0x24FCF45E
	Offset: 0x3A8
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_545f669b()
{
	self.completed_emerging_into_playable_area = 1;
	self.canbetargetedbyturnedzombies = 1;
	self.should_zigzag = 0;
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
	namespace_81245006::initweakpoints(self);
	self thread zm_audio::zmbaivox_notifyconvert();
	self thread zm_audio::play_ambient_zombie_vocals();
}

/*
	Name: function_1d787beb
	Namespace: namespace_7cadb1cc
	Checksum: 0x9D21EE59
	Offset: 0x448
	Size: 0xE8
	Parameters: 0
	Flags: Linked
*/
function function_1d787beb()
{
	if(isdefined(level.var_eb59a95c))
	{
		var_d7eff26a = [[level.var_eb59a95c]]();
	}
	else
	{
		var_91562d8c = level.zm_loc_types[#"hash_b7c88561b5e9b2c"];
		if(isdefined(var_91562d8c.size))
		{
			var_d7eff26a = zm_spawner::function_20e7d186(var_91562d8c);
		}
	}
	if(!isdefined(var_d7eff26a))
	{
		/#
		#/
		return false;
	}
	if(isentity(self))
	{
		self namespace_e0710ee6::function_a8dc3363(var_d7eff26a);
		self thread namespace_361e505d::function_940cd1d8();
	}
	return true;
}

/*
	Name: function_2995325f
	Namespace: namespace_7cadb1cc
	Checksum: 0x373A2710
	Offset: 0x538
	Size: 0x294
	Parameters: 0
	Flags: Linked
*/
function function_2995325f()
{
	self endon(#"death");
	var_cfad5b23 = 0;
	var_982efbc4 = undefined;
	while(true)
	{
		var_f1d04f0a = 2147483647;
		players = getplayers();
		foreach(player in players)
		{
			var_f1d04f0a = min(player.origin[2], var_f1d04f0a);
		}
		if(var_f1d04f0a - self.origin[2] > 300)
		{
			if(!ispointonnavmesh(self.origin, self))
			{
				var_cfad5b23++;
				if(var_cfad5b23 >= 2)
				{
					var_9f0bcfaa = var_982efbc4;
					if(!isdefined(var_9f0bcfaa) && isdefined(level.var_df7b46d1))
					{
						var_9f0bcfaa = getclosestpointonnavmesh(level.var_df7b46d1.origin, 64, 32);
					}
					var_9f0bcfaa = (isdefined(var_9f0bcfaa) ? var_9f0bcfaa : level.var_75d496b5);
					if(isvec(var_9f0bcfaa))
					{
						var_cfad5b23 = 0;
						self clientfield::set("abomDissolveCF", 2);
						wait(1);
						self namespace_e0710ee6::function_a8dc3363({#origin:var_9f0bcfaa});
						self.completed_emerging_into_playable_area = 1;
						self thread namespace_361e505d::function_940cd1d8();
					}
				}
			}
			else
			{
				var_cfad5b23 = 0;
			}
		}
		else if(ispointonnavmesh(self.origin, self))
		{
			var_982efbc4 = self.origin;
		}
		wait(1);
	}
}

/*
	Name: function_2e394e63
	Namespace: namespace_7cadb1cc
	Checksum: 0x61999600
	Offset: 0x7D8
	Size: 0x16
	Parameters: 2
	Flags: Linked, Private
*/
function private function_2e394e63(potential_target, var_ab0d150d)
{
	return false;
}

/*
	Name: function_953059a3
	Namespace: namespace_7cadb1cc
	Checksum: 0x3CC4696A
	Offset: 0x7F8
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function function_953059a3(enemy)
{
	if(!isdefined(enemy))
	{
		return false;
	}
	var_1eff24e4 = enemy getentitynumber();
	if(isdefined(self.var_de98707[var_1eff24e4]) && gettime() < self.var_de98707[var_1eff24e4])
	{
		return true;
	}
	return false;
}

/*
	Name: function_65ef2078
	Namespace: namespace_7cadb1cc
	Checksum: 0xE2CC0C6F
	Offset: 0x868
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function function_65ef2078(enemy)
{
	if(!isdefined(self.var_de98707))
	{
		self.var_de98707 = [];
	}
	var_1eff24e4 = enemy getentitynumber();
	if(!isdefined(self.var_de98707[var_1eff24e4]))
	{
		self.var_de98707[var_1eff24e4] = 0;
	}
	if(gettime() > self.var_de98707[var_1eff24e4])
	{
		self.var_de98707[var_1eff24e4] = gettime() + (int(3 * 1000));
	}
	return false;
}

/*
	Name: function_48924a80
	Namespace: namespace_7cadb1cc
	Checksum: 0x667FA55C
	Offset: 0x928
	Size: 0x1CA
	Parameters: 1
	Flags: Linked
*/
function function_48924a80(var_dbce0c44)
{
	if(isdefined(level.var_9135c56e) && level.round_number < level.var_9135c56e)
	{
		return 0;
	}
	n_player_count = zm_utility::function_a2541519(getplayers().size);
	if(n_player_count == 1)
	{
		switch(level.var_59adf71)
		{
			case 0:
			case 1:
			case 2:
			{
				var_2506688 = 1;
				var_1797c23a = 1;
				break;
			}
			default:
			{
				var_2506688 = 1;
				var_1797c23a = 2;
				break;
			}
		}
	}
	else
	{
		switch(level.var_59adf71)
		{
			case 0:
			case 1:
			{
				var_2506688 = 1;
				var_1797c23a = 1;
				break;
			}
			case 2:
			case 3:
			{
				var_2506688 = 2;
				var_1797c23a = 2;
				break;
			}
			default:
			{
				var_2506688 = 3;
				var_1797c23a = 3;
				break;
			}
		}
	}
	return function_21a3a673(var_2506688, var_1797c23a);
}

/*
	Name: round_spawn
	Namespace: namespace_7cadb1cc
	Checksum: 0x33BA93B6
	Offset: 0xB00
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function round_spawn()
{
	ai = spawn_single();
	if(isdefined(ai))
	{
		return true;
	}
	return false;
}

/*
	Name: spawn_single
	Namespace: namespace_7cadb1cc
	Checksum: 0x7A647E39
	Offset: 0xB38
	Size: 0x1E2
	Parameters: 3
	Flags: Linked
*/
function spawn_single(b_force_spawn, var_eb3a8721, var_bc66d64b)
{
	if(!isdefined(var_eb3a8721))
	{
		var_eb3a8721 = 0;
	}
	if(!var_eb3a8721 && !function_bbd518e8())
	{
		return undefined;
	}
	if(isdefined(var_bc66d64b))
	{
		s_spawn_loc = var_bc66d64b;
	}
	else
	{
		if(isdefined(level.var_eb59a95c))
		{
			s_spawn_loc = [[level.var_eb59a95c]]();
		}
		else if(level.zm_loc_types[#"zombie_location"].size > 0)
		{
			s_spawn_loc = array::random(level.zm_loc_types[#"zombie_location"]);
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
	ai = spawnactor(#"hash_39b3550f618c72e8", s_spawn_loc.origin, s_spawn_loc.angles);
	if(isdefined(ai))
	{
		ai.script_string = s_spawn_loc.script_string;
		ai.find_flesh_struct_string = s_spawn_loc.find_flesh_struct_string;
		ai.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
		ai.ignore_enemy_count = 1;
		ai forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
		ai.var_5e54763a = s_spawn_loc.zone_name;
	}
	return ai;
}

/*
	Name: function_bbd518e8
	Namespace: namespace_7cadb1cc
	Checksum: 0x601D8064
	Offset: 0xD28
	Size: 0x72
	Parameters: 0
	Flags: Linked
*/
function function_bbd518e8()
{
	var_7212f4c6 = function_dafc9693();
	var_e262a7a4 = function_b68d818c();
	if(var_7212f4c6 >= var_e262a7a4 || !level flag::get("spawn_zombies"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_dafc9693
	Namespace: namespace_7cadb1cc
	Checksum: 0xF5C0BA8C
	Offset: 0xDA8
	Size: 0xCA
	Parameters: 0
	Flags: Linked
*/
function function_dafc9693()
{
	var_5e8f3ee7 = getaiarchetypearray(#"hash_7c09b683edfb0e96");
	var_7212f4c6 = var_5e8f3ee7.size;
	foreach(var_60f0309d in var_5e8f3ee7)
	{
		if(!isalive(var_60f0309d))
		{
			var_7212f4c6--;
		}
	}
	return var_7212f4c6;
}

/*
	Name: function_b68d818c
	Namespace: namespace_7cadb1cc
	Checksum: 0x5CB334A8
	Offset: 0xE80
	Size: 0xB6
	Parameters: 0
	Flags: Linked
*/
function function_b68d818c()
{
	n_player_count = zm_utility::function_a2541519(getplayers().size);
	switch(n_player_count)
	{
		case 1:
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
			return 3;
			break;
		}
		case 4:
		{
			return 4;
			break;
		}
	}
	return 1;
}

/*
	Name: function_9282dcac
	Namespace: namespace_7cadb1cc
	Checksum: 0x34765EE3
	Offset: 0xF40
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_9282dcac(n_round_number)
{
	level endon(#"end_game");
	if(!isdefined(level.var_59adf71))
	{
		level.var_59adf71 = 0;
	}
	while(true)
	{
		level waittill(#"hash_5d3012139f083ccb");
		if(namespace_c3287616::function_d0db51fc(#"hash_7c09b683edfb0e96"))
		{
			level.var_59adf71++;
			n_player_count = zm_utility::function_a2541519(getplayers().size);
			if(n_player_count == 1)
			{
				level.var_9135c56e = level.round_number + function_21a3a673(3, 5);
			}
			else
			{
				level.var_9135c56e = level.round_number + function_21a3a673(3, 4);
			}
		}
	}
}

/*
	Name: function_3ec01d7a
	Namespace: namespace_7cadb1cc
	Checksum: 0x6F08DC60
	Offset: 0x1080
	Size: 0x318
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3ec01d7a()
{
	level endon(#"end_game");
	self endon(#"death");
	bad_path_count = 0;
	var_37c90cfe = 0;
	var_686cf729 = undefined;
	last_pos = undefined;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittilltimeout(2, #"bad_path");
		if(self isplayinganimscripted())
		{
			continue;
		}
		if(self flag::get(#"hash_67c62575285677e4"))
		{
			continue;
		}
		var_c84ba99b = 0;
		if(waitresult._notify == #"bad_path")
		{
			if(!self function_dd070839())
			{
				var_1f2328d0 = self function_4794d6a3();
				if(!isdefined(var_686cf729) || var_1f2328d0.goalpos !== var_686cf729)
				{
					var_686cf729 = var_1f2328d0.goalpos;
					bad_path_count = 1;
				}
				else
				{
					bad_path_count++;
				}
				if(bad_path_count >= 15)
				{
					var_c84ba99b = 1;
				}
			}
		}
		else
		{
			if(ispointonnavmesh(self.origin, self))
			{
				continue;
			}
			if(!isdefined(last_pos) || distancesquared(self.origin, last_pos) > sqr(self getpathfindingradius()))
			{
				last_pos = self.origin;
				var_37c90cfe = 0;
			}
			else if(distancesquared(self.origin, last_pos) < sqr(self getpathfindingradius()))
			{
				var_37c90cfe++;
				if(var_37c90cfe >= 15)
				{
					var_c84ba99b = 1;
				}
			}
		}
		if(is_true(var_c84ba99b))
		{
			/#
				if(is_true(level.var_bb61089c))
				{
					println((("" + "") + self.origin) + "");
				}
			#/
			bad_path_count = 0;
			var_37c90cfe = 0;
			self function_1d787beb();
		}
	}
}

