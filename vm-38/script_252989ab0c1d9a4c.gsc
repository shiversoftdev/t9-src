#using script_1940fc077a028a81;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_net.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using script_ed50e9299d3e143;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie.gsc;
#using script_35598499769dbb3d;
#using script_41fe08c37d53a635;
#using script_3aa0f32b70d4f7cb;
#using script_4d85e8de54b02198;
#using scripts\core_common\ai\archetype_utility.gsc;
#using script_3819e7a1427df6d2;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_ai_mechz;

/*
	Name: function_8904e6ee
	Namespace: zm_ai_mechz
	Checksum: 0xBDF5BBDA
	Offset: 0x1B8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8904e6ee()
{
	level notify(-214266055);
}

/*
	Name: __init__system__
	Namespace: zm_ai_mechz
	Checksum: 0xD9835AA0
	Offset: 0x1D8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_ai_mechz", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_ai_mechz
	Checksum: 0xDB041621
	Offset: 0x230
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	zm_round_spawning::register_archetype(#"mechz", &function_13043824, &round_spawn, undefined, 100);
	zm_round_spawning::function_306ce518(#"mechz", &function_5e8a178a);
	spawner::add_archetype_spawn_function(#"mechz", &mechzspawnsetup);
	spawner::function_89a2cd87(#"mechz", &function_5d873f78);
	zm_cleanup::function_cdf5a512(#"mechz", &function_66247c2);
}

/*
	Name: function_8ac3bea9
	Namespace: zm_ai_mechz
	Checksum: 0x80F724D1
	Offset: 0x348
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
}

/*
	Name: mechzspawnsetup
	Namespace: zm_ai_mechz
	Checksum: 0xE27C71F0
	Offset: 0x358
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function mechzspawnsetup()
{
	self.closest_player_override = &zm_utility::function_3d70ba7a;
	self.completed_emerging_into_playable_area = 1;
	self.b_ignore_cleanup = 1;
	self.is_zombie = 1;
	self.var_5e55975f = &namespace_e292b080::zombieshouldmelee;
	self.var_e34ba400 = 600;
	self.var_a87eb847 = 900;
	self.var_535fbaa3 = 1200;
	self.var_e9a867e0 = &function_1064536d;
	self.var_64c67df3 = &function_6bf0d9e0;
	self.var_9d92b55a = &function_9d92b55a;
	self callback::function_d8abfc3d(#"hash_49bf4815e9501d2", &namespace_47c5b560::function_99487333);
	self util::delay(0.5, "death", &playsound, #"hash_172bca6e17f4b592");
	self function_c103f91d();
	self thread function_ea7b33b6();
}

/*
	Name: function_5d873f78
	Namespace: zm_ai_mechz
	Checksum: 0xAD88BDB7
	Offset: 0x4C0
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function function_5d873f78()
{
	self.var_72411ccf = &function_7f405e5e;
	self.var_bacf9a1a = &function_80ba943b;
}

/*
	Name: function_7f405e5e
	Namespace: zm_ai_mechz
	Checksum: 0x4A0F1C6B
	Offset: 0x500
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7f405e5e(entity)
{
	e_enemy = entity.favoriteenemy;
	if(isplayer(e_enemy) && e_enemy flag::get_any([1:#"hash_1b361b950317ecb5", 0:#"hash_686d5709e1566aa6"]))
	{
		return;
	}
	entity zm_behavior::zombiefindflesh(entity);
}

/*
	Name: function_80ba943b
	Namespace: zm_ai_mechz
	Checksum: 0x23B0CE62
	Offset: 0x5B0
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_80ba943b(e_attacker)
{
	self.b_ignore_cleanup = 0;
	self notify(#"hash_28e8830c0f1354d2");
	self.var_73915a58 = undefined;
}

/*
	Name: function_66247c2
	Namespace: zm_ai_mechz
	Checksum: 0xCDACFC5C
	Offset: 0x5E8
	Size: 0x3FE
	Parameters: 0
	Flags: Linked
*/
function function_66247c2()
{
	self endon(#"death");
	while(true)
	{
		var_31f7011a = arraysortclosest(getplayers(), self.origin);
		foreach(player in var_31f7011a)
		{
			if(zm_utility::is_player_valid(player))
			{
				closest_player = player;
				break;
			}
		}
		if(isdefined(closest_player))
		{
			break;
		}
		util::wait_network_frame();
	}
	s_spawn_locs = [];
	if(isdefined(level.var_e333bf92))
	{
		spawn_locs = [[level.var_e333bf92]](1);
		if(isarray(spawn_locs))
		{
			s_spawn_locs = spawn_locs;
		}
		else
		{
			array::add(s_spawn_locs, spawn_locs);
		}
	}
	else
	{
		spawn_locs = function_65c98960(1);
		if(isarray(spawn_locs))
		{
			s_spawn_locs = spawn_locs;
		}
	}
	var_69681a59 = [];
	if(isdefined(level.active_zone_names) && isarray(s_spawn_locs) && s_spawn_locs.size > 0)
	{
		foreach(spawn_loc in s_spawn_locs)
		{
			if(isdefined(spawn_loc.zone_name) && array::contains(level.active_zone_names, spawn_loc.zone_name))
			{
				if(!isdefined(var_69681a59))
				{
					var_69681a59 = [];
				}
				else if(!isarray(var_69681a59))
				{
					var_69681a59 = array(var_69681a59);
				}
				var_69681a59[var_69681a59.size] = spawn_loc;
			}
		}
	}
	if(var_69681a59.size < 1)
	{
		return true;
	}
	spawn_points = arraysortclosest(var_69681a59, closest_player.origin, undefined, 250);
	if(spawn_points.size > 0)
	{
		var_b2aa54a9 = spawn_points[0];
	}
	else
	{
		var_b2aa54a9 = arraygetfarthest(closest_player.origin, var_69681a59);
	}
	if(!isdefined(var_b2aa54a9))
	{
		return true;
	}
	/#
		iprintln((("" + self.origin) + "") + var_b2aa54a9.origin);
	#/
	self zm_ai_utility::function_a8dc3363(var_b2aa54a9);
	self.completed_emerging_into_playable_area = 1;
	self.var_5e54763a = var_b2aa54a9.zone_name;
	return true;
}

/*
	Name: round_spawn
	Namespace: zm_ai_mechz
	Checksum: 0x5D28C781
	Offset: 0x9F0
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
	Namespace: zm_ai_mechz
	Checksum: 0x4360DDBD
	Offset: 0xA28
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
	if(!var_eb3a8721 && !can_spawn_mechz())
	{
		return undefined;
	}
	if(isdefined(var_bc66d64b))
	{
		s_spawn_loc = var_bc66d64b;
	}
	else
	{
		if(isdefined(level.var_e333bf92))
		{
			s_spawn_loc = [[level.var_e333bf92]]();
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
	ai = spawnactor(#"hash_704a090ff9fcffd0", s_spawn_loc.origin, s_spawn_loc.angles);
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
	Name: can_spawn_mechz
	Namespace: zm_ai_mechz
	Checksum: 0xDC6FC6F9
	Offset: 0xC18
	Size: 0x72
	Parameters: 0
	Flags: Linked
*/
function can_spawn_mechz()
{
	var_e2ec0129 = function_638411dd();
	var_1548fdf = function_33485c02();
	if(var_e2ec0129 >= var_1548fdf || !level flag::get("spawn_zombies"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_638411dd
	Namespace: zm_ai_mechz
	Checksum: 0x1D0F8B95
	Offset: 0xC98
	Size: 0xCA
	Parameters: 0
	Flags: Linked
*/
function function_638411dd()
{
	var_c500a70f = getaiarchetypearray(#"mechz");
	var_e2ec0129 = var_c500a70f.size;
	foreach(mechz in var_c500a70f)
	{
		if(!isalive(mechz))
		{
			var_e2ec0129--;
		}
	}
	return var_e2ec0129;
}

/*
	Name: function_33485c02
	Namespace: zm_ai_mechz
	Checksum: 0xFCA7B3F
	Offset: 0xD70
	Size: 0xB6
	Parameters: 0
	Flags: Linked
*/
function function_33485c02()
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
	Name: function_65c98960
	Namespace: zm_ai_mechz
	Checksum: 0xC52C1686
	Offset: 0xE30
	Size: 0xBA
	Parameters: 1
	Flags: Linked
*/
function function_65c98960(get_all)
{
	if(!isdefined(get_all))
	{
		get_all = 0;
	}
	if(isdefined(level.zm_loc_types[#"mechz_location"]) && level.zm_loc_types[#"mechz_location"].size)
	{
		if(get_all)
		{
			s_spawn_loc = level.zm_loc_types[#"mechz_location"];
		}
		else
		{
			s_spawn_loc = array::random(level.zm_loc_types[#"mechz_location"]);
		}
	}
	return s_spawn_loc;
}

/*
	Name: function_13043824
	Namespace: zm_ai_mechz
	Checksum: 0x578CDF72
	Offset: 0xEF8
	Size: 0x1CA
	Parameters: 1
	Flags: Linked
*/
function function_13043824(var_dbce0c44)
{
	if(isdefined(level.var_1db9948) && level.round_number < level.var_1db9948)
	{
		return 0;
	}
	n_player_count = zm_utility::function_a2541519(getplayers().size);
	if(n_player_count == 1)
	{
		switch(level.var_ea1e9b1e)
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
		switch(level.var_ea1e9b1e)
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
	Name: function_5e8a178a
	Namespace: zm_ai_mechz
	Checksum: 0xC652F576
	Offset: 0x10D0
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_5e8a178a(n_round_number)
{
	level endon(#"end_game");
	if(!isdefined(level.var_ea1e9b1e))
	{
		level.var_ea1e9b1e = 0;
	}
	while(true)
	{
		level waittill(#"hash_5d3012139f083ccb");
		if(zm_round_spawning::function_d0db51fc(#"mechz"))
		{
			level.var_ea1e9b1e++;
			n_player_count = zm_utility::function_a2541519(getplayers().size);
			if(n_player_count == 1)
			{
				level.var_1db9948 = level.round_number + function_21a3a673(3, 5);
			}
			else
			{
				level.var_1db9948 = level.round_number + function_21a3a673(3, 4);
			}
		}
	}
}

/*
	Name: function_1064536d
	Namespace: zm_ai_mechz
	Checksum: 0xD38DC42A
	Offset: 0x1210
	Size: 0xF2
	Parameters: 1
	Flags: Linked
*/
function function_1064536d(pos)
{
	a_vols = getentarray("mechz_cant_path", "script_noteworthy");
	if(a_vols.size)
	{
		radius = self getpathfindingradius();
		foreach(e_vol in a_vols)
		{
			if(istouching(pos, e_vol, (radius, radius, radius)))
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_6bf0d9e0
	Namespace: zm_ai_mechz
	Checksum: 0x688A51DF
	Offset: 0x1310
	Size: 0x312
	Parameters: 2
	Flags: Linked
*/
function function_6bf0d9e0(zone_path, player)
{
	if(!self function_1064536d(player.origin))
	{
		if(isdefined(self.var_a61b4e17))
		{
			if(distancesquared(self.var_a61b4e17.var_b1fc2f78, player.origin) < 1024)
			{
				return {#origin:self.var_a61b4e17.point, #hash_ec8356c8:1};
			}
		}
		points = getrandomnavpoints(player.origin, 128, 20, self getpathfindingradius());
		foreach(point in points)
		{
			if(self function_1064536d(point))
			{
				self.var_a61b4e17 = {#hash_b1fc2f78:player.origin, #point:point};
				return {#origin:point, #hash_ec8356c8:1};
			}
		}
	}
	var_2a4e3502 = zm_utility::function_ebd87099(player);
	if(isdefined(var_2a4e3502))
	{
		if(isdefined(self.var_a61b4e17))
		{
			if(distancesquared(self.var_a61b4e17.var_b1fc2f78, player.origin) < 1024)
			{
				return {#origin:self.var_a61b4e17.point, #hash_ec8356c8:1};
			}
		}
		goal = getclosestpointonnavmesh(var_2a4e3502.goal_origin, var_2a4e3502.var_b9e9cdf3, self getpathfindingradius() * 1.2);
		if(isdefined(goal))
		{
			self.var_a61b4e17 = {#hash_b1fc2f78:player.origin, #point:goal};
			return {#origin:goal, #hash_ec8356c8:1};
		}
	}
	return player;
}

/*
	Name: function_c103f91d
	Namespace: zm_ai_mechz
	Checksum: 0x2B1298C4
	Offset: 0x1630
	Size: 0x10A
	Parameters: 0
	Flags: Linked
*/
function function_c103f91d()
{
	if(!self function_1064536d(self.origin))
	{
		points = getrandomnavpoints(self.origin, 128, 20, self getpathfindingradius());
		foreach(point in points)
		{
			if(self function_1064536d(point))
			{
				self forceteleport(point, self.angles);
				return;
			}
		}
	}
}

/*
	Name: function_9d92b55a
	Namespace: zm_ai_mechz
	Checksum: 0x96B15ED0
	Offset: 0x1748
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_9d92b55a(entity)
{
	entity.var_9e6e6645 = undefined;
}

/*
	Name: function_ea7b33b6
	Namespace: zm_ai_mechz
	Checksum: 0x7BC7CEFA
	Offset: 0x1768
	Size: 0x258
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ea7b33b6()
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
		var_c84ba99b = 0;
		if(waitresult._notify == #"bad_path")
		{
			if(!self function_dd070839() && !namespace_47c5b560::function_602211f7(self))
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
			if(!isdefined(last_pos) || self.origin !== last_pos)
			{
				last_pos = self.origin;
				var_37c90cfe = 0;
			}
			else if(self.origin == last_pos)
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
				println(("" + self.origin) + "");
			#/
			bad_path_count = 0;
			var_37c90cfe = 0;
			self function_66247c2();
		}
	}
}

/*
	Name: function_73769410
	Namespace: zm_ai_mechz
	Checksum: 0xE73DCB84
	Offset: 0x19C8
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private function_73769410(message)
{
	/#
		if(getdvarint(#"hash_3553283c6676bb54", 0))
		{
			println("" + message);
		}
	#/
}

