#using script_335d0650ed05d36d;
#using script_75da5547b1822294;
#using script_7d712f77ab8d0c16;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace spawning;

/*
	Name: calculate_map_center
	Namespace: spawning
	Checksum: 0x76CD640E
	Offset: 0x138
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function calculate_map_center()
{
	if(isdefined(level.mapcenter))
	{
		return;
	}
	if(!function_5abfedf7("auto_normal"))
	{
		return;
	}
	var_7465f696 = function_92f03095("auto_normal");
	level.spawnmins = var_7465f696[#"mins"];
	level.spawnmaxs = var_7465f696[#"maxs"];
	level.mapbounds.var_1d694d71 = var_7465f696[#"mins"];
	level.mapbounds.var_a13a9915 = var_7465f696[#"maxs"];
	level.mapbounds.center = var_7465f696[#"center"];
	level.mapcenter = var_7465f696[#"center"];
	setmapcenter(level.mapcenter);
}

/*
	Name: function_1bc642b7
	Namespace: spawning
	Checksum: 0x9FB619F2
	Offset: 0x260
	Size: 0x3A
	Parameters: 0
	Flags: None
*/
function function_1bc642b7()
{
	if(game.switchedsides == 0)
	{
		return false;
	}
	if(level.spawnsystem.var_3709dc53 == 0)
	{
		return true;
	}
	return false;
}

/*
	Name: get_spawnpoint_random
	Namespace: spawning
	Checksum: 0x2030831E
	Offset: 0x2A8
	Size: 0xBA
	Parameters: 3
	Flags: Linked
*/
function get_spawnpoint_random(spawnpoints, predictedspawn, isintermissionspawn)
{
	if(!isdefined(isintermissionspawn))
	{
		isintermissionspawn = 0;
	}
	if(!isdefined(spawnpoints))
	{
		return undefined;
	}
	for(i = 0; i < spawnpoints.size; i++)
	{
		j = randomint(spawnpoints.size);
		spawnpoint = spawnpoints[i];
		spawnpoints[i] = spawnpoints[j];
		spawnpoints[j] = spawnpoint;
	}
	return get_spawnpoint_final(spawnpoints, predictedspawn, isintermissionspawn);
}

/*
	Name: get_spawnpoint_final
	Namespace: spawning
	Checksum: 0xDD17C406
	Offset: 0x370
	Size: 0x250
	Parameters: 3
	Flags: Linked
*/
function get_spawnpoint_final(spawnpoints, predictedspawn, isintermmissionspawn)
{
	if(!isdefined(isintermmissionspawn))
	{
		isintermmissionspawn = 0;
	}
	var_e627dced = &positionwouldtelefrag;
	if(isdefined(level.var_79f19f00))
	{
		var_e627dced = level.var_79f19f00;
	}
	bestspawnpoint = undefined;
	if(!isdefined(spawnpoints) || spawnpoints.size == 0)
	{
		return undefined;
	}
	if(!isdefined(predictedspawn))
	{
		predictedspawn = 0;
	}
	if(isdefined(self.lastspawnpoint) && self.lastspawnpoint.lastspawnpredicted && !predictedspawn && !isintermmissionspawn && (!isdefined(self.var_7007b746) || !self.var_7007b746))
	{
		if(![[var_e627dced]](self.lastspawnpoint.origin))
		{
			bestspawnpoint = self.lastspawnpoint;
		}
	}
	if(!isdefined(bestspawnpoint))
	{
		for(i = 0; i < spawnpoints.size; i++)
		{
			if(isdefined(self.lastspawnpoint) && self.lastspawnpoint == spawnpoints[i] && !self.lastspawnpoint.lastspawnpredicted)
			{
				continue;
			}
			if([[var_e627dced]](spawnpoints[i].origin))
			{
				continue;
			}
			bestspawnpoint = spawnpoints[i];
			break;
		}
	}
	if(!isdefined(bestspawnpoint))
	{
		if(isdefined(self.lastspawnpoint) && ![[var_e627dced]](self.lastspawnpoint.origin))
		{
			for(i = 0; i < spawnpoints.size; i++)
			{
				if(spawnpoints[i] == self.lastspawnpoint)
				{
					bestspawnpoint = spawnpoints[i];
					break;
				}
			}
		}
	}
	if(!isdefined(bestspawnpoint))
	{
		bestspawnpoint = spawnpoints[0];
	}
	self finalize_spawnpoint_choice(bestspawnpoint, predictedspawn);
	return bestspawnpoint;
}

/*
	Name: get_random_intermission_point
	Namespace: spawning
	Checksum: 0x515516CE
	Offset: 0x5C8
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function get_random_intermission_point()
{
	spawnpoints = [];
	if(isdefined(level.var_b65f1e4))
	{
		spawnpoints = [[level.var_b65f1e4]]();
	}
	if(!spawnpoints.size)
	{
		spawnpoints = get_spawnpoint_array("mp_global_intermission");
	}
	if(!spawnpoints.size)
	{
		spawnpoints = get_spawnpoint_array("cp_global_intermission");
	}
	if(!spawnpoints.size)
	{
		spawnpoints = get_spawnpoint_array("info_player_start");
	}
	/#
		assert(spawnpoints.size);
	#/
	spawnpoint = get_spawnpoint_random(spawnpoints, undefined, 1);
	return spawnpoint;
}

/*
	Name: finalize_spawnpoint_choice
	Namespace: spawning
	Checksum: 0xA72B596E
	Offset: 0x6C8
	Size: 0x6A
	Parameters: 2
	Flags: Linked
*/
function finalize_spawnpoint_choice(spawnpoint, predictedspawn)
{
	time = gettime();
	self.lastspawnpoint = spawnpoint;
	self.lastspawntime = time;
	self.var_7007b746 = 0;
	spawnpoint.lastspawnedplayer = self;
	spawnpoint.lastspawntime = time;
	spawnpoint.lastspawnpredicted = predictedspawn;
}

/*
	Name: move_spawn_point
	Namespace: spawning
	Checksum: 0xC0592BD2
	Offset: 0x740
	Size: 0x196
	Parameters: 4
	Flags: None
*/
function move_spawn_point(var_75347e0b, start_point, new_point, new_angles)
{
	var_690d7ade = [];
	if(isarray(var_75347e0b))
	{
		var_690d7ade = var_75347e0b;
	}
	else
	{
		if(!isdefined(var_690d7ade))
		{
			var_690d7ade = [];
		}
		else if(!isarray(var_690d7ade))
		{
			var_690d7ade = array(var_690d7ade);
		}
		var_690d7ade[var_690d7ade.size] = var_75347e0b;
	}
	foreach(targetname in var_690d7ade)
	{
		spawn_points = get_spawnpoint_array(targetname);
		for(i = 0; i < spawn_points.size; i++)
		{
			if(distancesquared(spawn_points[i].origin, start_point) < 1)
			{
				spawn_points[i].origin = new_point;
				if(isdefined(new_angles))
				{
					spawn_points[i].angles = new_angles;
				}
			}
		}
	}
}

/*
	Name: get_spawnpoint_array
	Namespace: spawning
	Checksum: 0x4FAFEB0D
	Offset: 0x8E0
	Size: 0x16A
	Parameters: 2
	Flags: Linked
*/
function get_spawnpoint_array(classname, include_disabled)
{
	if(!isdefined(include_disabled))
	{
		include_disabled = 0;
	}
	spawn_points = struct::get_array(classname, "targetname");
	if(!include_disabled && getdvarint(#"spawnsystem_use_code_point_enabled", 0) == 0)
	{
		enabled_spawn_points = [];
		foreach(spawn_point in spawn_points)
		{
			if(!is_true(spawn_point.disabled))
			{
				if(!isdefined(enabled_spawn_points))
				{
					enabled_spawn_points = [];
				}
				else if(!isarray(enabled_spawn_points))
				{
					enabled_spawn_points = array(enabled_spawn_points);
				}
				enabled_spawn_points[enabled_spawn_points.size] = spawn_point;
			}
		}
		spawn_points = enabled_spawn_points;
	}
	return spawn_points;
}

/*
	Name: drop_spawn_points
	Namespace: spawning
	Checksum: 0xCB873786
	Offset: 0xA58
	Size: 0x9C
	Parameters: 1
	Flags: None
*/
function drop_spawn_points(spawnpointname)
{
	spawnpoints = get_spawnpoint_array(spawnpointname);
	if(!spawnpoints.size)
	{
		/#
			println(("" + spawnpointname) + "");
		#/
		return;
	}
	for(index = 0; index < spawnpoints.size; index++)
	{
		placespawnpoint(spawnpoints[index]);
	}
}

/*
	Name: function_82ca1565
	Namespace: spawning
	Checksum: 0x757AF928
	Offset: 0xB00
	Size: 0x954
	Parameters: 2
	Flags: Linked
*/
function function_82ca1565(spawnpoint, gametype)
{
	switch(gametype)
	{
		case "base":
		{
			return isdefined(spawnpoint.base) && spawnpoint.base;
			break;
		}
		case "ffa":
		{
			return isdefined(spawnpoint.ffa) && spawnpoint.ffa;
			break;
		}
		case "sd":
		{
			return isdefined(spawnpoint.sd) && spawnpoint.sd;
			break;
		}
		case "ctf":
		{
			return isdefined(spawnpoint.ctf) && spawnpoint.ctf;
			break;
		}
		case "dom":
		{
			return isdefined(spawnpoint.domination) && spawnpoint.domination;
			break;
		}
		case "dem":
		{
			return isdefined(spawnpoint.demolition) && spawnpoint.demolition;
			break;
		}
		case "gg":
		{
			return isdefined(spawnpoint.gg) && spawnpoint.gg;
			break;
		}
		case "tdm":
		{
			return isdefined(spawnpoint.tdm) && spawnpoint.tdm;
			break;
		}
		case "infil":
		{
			return isdefined(spawnpoint.infiltration) && spawnpoint.infiltration;
			break;
		}
		case "control":
		{
			return isdefined(spawnpoint.control) && spawnpoint.control;
			break;
		}
		case "uplink":
		{
			return isdefined(spawnpoint.uplink) && spawnpoint.uplink;
			break;
		}
		case "kc":
		{
			return isdefined(spawnpoint.kc) && spawnpoint.kc;
			break;
		}
		case "koth":
		{
			return isdefined(spawnpoint.hardpoint) && spawnpoint.hardpoint;
			break;
		}
		case "frontline":
		{
			return isdefined(spawnpoint.frontline) && spawnpoint.frontline;
			break;
		}
		case "dom_flag_a":
		{
			return isdefined(spawnpoint.var_50156c55) && spawnpoint.var_50156c55;
			break;
		}
		case "dom_flag_b":
		{
			return isdefined(spawnpoint.var_3e85c936) && spawnpoint.var_3e85c936;
			break;
		}
		case "dom_flag_c":
		{
			return isdefined(spawnpoint.var_6cda25e2) && spawnpoint.var_6cda25e2;
			break;
		}
		case "dom_flag_d":
		{
			return isdefined(spawnpoint.var_99227e72) && spawnpoint.var_99227e72;
			break;
		}
		case "dom_flag_e":
		{
			return isdefined(spawnpoint.var_6cd325d0) && spawnpoint.var_6cd325d0;
			break;
		}
		case "dom_flag_f":
		{
			return isdefined(spawnpoint.var_991d7e64) && spawnpoint.var_991d7e64;
			break;
		}
		case "hash_6056c310624d5afd":
		{
			return isdefined(spawnpoint.var_5b72d24c) && spawnpoint.var_5b72d24c;
			break;
		}
		case "hash_6056c010624d55e4":
		{
			return isdefined(spawnpoint.var_f3739d6) && spawnpoint.var_f3739d6;
			break;
		}
		case "hash_6ef2d89ce8ee9a32":
		{
			return isdefined(spawnpoint.var_efff95db) && spawnpoint.var_efff95db;
			break;
		}
		case "hash_6ef2d79ce8ee987f":
		{
			return isdefined(spawnpoint.var_58e9e7ae) && spawnpoint.var_58e9e7ae;
			break;
		}
		case "dem_overtime":
		{
			return isdefined(spawnpoint.var_21f814f) && spawnpoint.var_21f814f;
			break;
		}
		case "hash_7cb9d0a58715cebe":
		{
			return isdefined(spawnpoint.var_20e05c9f) && spawnpoint.var_20e05c9f;
			break;
		}
		case "hash_6d83e5f1bdefa7dd":
		{
			return isdefined(spawnpoint.var_7d98dad4) && spawnpoint.var_7d98dad4;
			break;
		}
		case "hash_6d83e2f1bdefa2c4":
		{
			return isdefined(spawnpoint.var_93530648) && spawnpoint.var_93530648;
			break;
		}
		case "control_attack_add_0":
		{
			return isdefined(spawnpoint.var_ce26d39d) && spawnpoint.var_ce26d39d;
			break;
		}
		case "control_attack_add_1":
		{
			return isdefined(spawnpoint.var_dfd87700) && spawnpoint.var_dfd87700;
			break;
		}
		case "control_attack_remove_0":
		{
			return isdefined(spawnpoint.var_2c6a069f) && spawnpoint.var_2c6a069f;
			break;
		}
		case "control_attack_remove_1":
		{
			return isdefined(spawnpoint.var_5f196bfd) && spawnpoint.var_5f196bfd;
			break;
		}
		case "control_defend_add_0":
		{
			return isdefined(spawnpoint.registerlast_mapshouldstun) && spawnpoint.registerlast_mapshouldstun;
			break;
		}
		case "control_defend_add_1":
		{
			return isdefined(spawnpoint.var_8dfc136) && spawnpoint.var_8dfc136;
			break;
		}
		case "control_defend_remove_0":
		{
			return isdefined(spawnpoint.var_ba7e6e0d) && spawnpoint.var_ba7e6e0d;
			break;
		}
		case "control_defend_remove_1":
		{
			return isdefined(spawnpoint.var_5cc5b29d) && spawnpoint.var_5cc5b29d;
			break;
		}
		case "ct":
		{
			return isdefined(spawnpoint.ct) && spawnpoint.ct;
			break;
		}
		case "escort":
		{
			return isdefined(spawnpoint.escort) && spawnpoint.escort;
			break;
		}
		case "bounty":
		{
			return isdefined(spawnpoint.bounty) && spawnpoint.bounty;
			break;
		}
		case "fireteam":
		{
			return is_true(spawnpoint.fireteam);
			break;
		}
		case "vip":
		{
			return is_true(spawnpoint.vip);
			break;
		}
		case "war":
		{
			return is_true(spawnpoint.war);
			break;
		}
		case "dropkick":
		{
			return is_true(spawnpoint.dropkick);
			break;
		}
		case "hash_35b3b60f0a291417":
		{
			return is_true(spawnpoint.var_3cb82e5e);
			break;
		}
		case "hash_450dd6aacc69e524":
		{
			return is_true(spawnpoint.var_d8e690f8);
			break;
		}
		case "hash_42f07692f7d48364":
		{
			return is_true(spawnpoint.var_3d72e6da);
			break;
		}
		default:
		{
			/#
				assertmsg((((((("" + gametype) + "") + spawnpoint.origin[0]) + "") + spawnpoint.origin[1]) + "") + spawnpoint.origin[2]);
			#/
			break;
		}
	}
	return 0;
}

/*
	Name: is_spawn_trapped
	Namespace: spawning
	Checksum: 0x9840B501
	Offset: 0x1460
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function is_spawn_trapped(team)
{
	if(!level.rankedmatch)
	{
		return false;
	}
	if(level.spawnsystem.spawntraptriggertime == 0)
	{
		return false;
	}
	if(isdefined(level.alivetimesaverage) && isdefined(level.alivetimesaverage[team]) && level.alivetimesaverage[team] != 0 && level.alivetimesaverage[team] < (int(level.spawnsystem.spawntraptriggertime * 1000)))
	{
		return true;
	}
	return false;
}

/*
	Name: function_e1a7c3d9
	Namespace: spawning
	Checksum: 0xC7FDB78E
	Offset: 0x1530
	Size: 0x7E
	Parameters: 2
	Flags: Linked
*/
function function_e1a7c3d9(spawn_origin, spawn_angles)
{
	var_50747a19 = spawn_origin + vectorscale((0, 0, 1), 60);
	self predictspawnpoint(var_50747a19, spawn_angles);
	self.predicted_spawn_point = {#angles:spawn_angles, #origin:var_50747a19};
}

/*
	Name: function_754c78a6
	Namespace: spawning
	Checksum: 0xB220A52D
	Offset: 0x15B8
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_754c78a6(func_callback)
{
	if(!isdefined(level.var_811300ad))
	{
		level.var_811300ad = [];
	}
	array::add(level.var_811300ad, func_callback);
}

/*
	Name: function_4c00b132
	Namespace: spawning
	Checksum: 0xE11B234
	Offset: 0x1608
	Size: 0xE2
	Parameters: 1
	Flags: None
*/
function function_4c00b132(func_callback)
{
	/#
		assert(isdefined(level.var_811300ad) && level.var_811300ad.size, "");
	#/
	foreach(index, func in level.var_811300ad)
	{
		if(func == func_callback)
		{
			arrayremoveindex(level.var_811300ad, index, 0);
			return;
		}
	}
}

/*
	Name: function_a782529
	Namespace: spawning
	Checksum: 0x238A0239
	Offset: 0x16F8
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_a782529(e_player)
{
	var_8bfdbbee = [];
	foreach(func in level.var_811300ad)
	{
		var_ee69d92d = [[func]](e_player);
		if(isdefined(var_ee69d92d))
		{
			array::add(var_8bfdbbee, var_ee69d92d);
		}
	}
	return var_8bfdbbee;
}

/*
	Name: usestartspawns
	Namespace: spawning
	Checksum: 0xC3EF1C8
	Offset: 0x17C8
	Size: 0x46
	Parameters: 0
	Flags: Linked
*/
function usestartspawns()
{
	if(is_true(level.alwaysusestartspawns))
	{
		return true;
	}
	if(!is_true(level.usestartspawns))
	{
		return false;
	}
	return true;
}

/*
	Name: function_7a87efaa
	Namespace: spawning
	Checksum: 0x9CC5F2A0
	Offset: 0x1818
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function function_7a87efaa()
{
	level.usestartspawns = 0;
}

/*
	Name: function_6325a7c5
	Namespace: spawning
	Checksum: 0xB596C89C
	Offset: 0x1830
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_6325a7c5()
{
	level.usestartspawns = 1;
}

/*
	Name: function_923afc2e
	Namespace: spawning
	Checksum: 0x536EFD73
	Offset: 0x1850
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function function_923afc2e(spawnpointarray)
{
	foreach(spawn in spawnpointarray)
	{
		placespawnpoint(spawn);
	}
}

/*
	Name: function_3ea24e49
	Namespace: spawning
	Checksum: 0x190B527D
	Offset: 0x18E8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_3ea24e49(team)
{
	correctedteam = team;
	if(game.switchedsides && (team == 2 || team == 1))
	{
		correctedteam = (team == 1 ? 2 : 1);
	}
	return correctedteam;
}

/*
	Name: function_fac242d0
	Namespace: spawning
	Checksum: 0x654545C6
	Offset: 0x1960
	Size: 0x2CC
	Parameters: 3
	Flags: None
*/
function function_fac242d0(var_9be0d23f, var_f64fe0e3, var_efb263ee)
{
	spawns = struct::get_array("mp_spawn_point", "targetname");
	var_a6155878 = [];
	foreach(spawn in spawns)
	{
		for(index = 0; index < var_9be0d23f; index++)
		{
			key = var_f64fe0e3 + index;
			if(is_true(spawn.(key)))
			{
				if(!isdefined(var_a6155878[index]))
				{
					var_a6155878[index] = [];
				}
				if(!isdefined(var_a6155878[index][spawn.group_index]))
				{
					var_a6155878[index][spawn.group_index] = [];
				}
				else if(!isarray(var_a6155878[index][spawn.group_index]))
				{
					var_a6155878[index][spawn.group_index] = array(var_a6155878[index][spawn.group_index]);
				}
				var_a6155878[index][spawn.group_index][var_a6155878[index][spawn.group_index].size] = spawn;
			}
		}
	}
	var_3d07f18c = getarraykeys(var_a6155878);
	for(index = 0; index < var_3d07f18c.size; index++)
	{
		var_49c85f88 = var_3d07f18c[index];
		spawnlistname = [[var_efb263ee]](var_49c85f88);
		var_f3ec1a55 = getarraykeys(var_a6155878[var_49c85f88]);
		for(teamindex = 0; teamindex < var_f3ec1a55.size; teamindex++)
		{
			var_b2b02f12 = var_f3ec1a55[teamindex];
			var_598298ff = var_a6155878[var_49c85f88][var_b2b02f12];
			addspawnpoints(var_b2b02f12, var_598298ff, spawnlistname);
		}
	}
}

/*
	Name: function_90dee50d
	Namespace: spawning
	Checksum: 0xA4B07564
	Offset: 0x1C38
	Size: 0x122
	Parameters: 0
	Flags: None
*/
function function_90dee50d()
{
	var_637da63f = [];
	spawns = function_4fe2525a();
	foreach(spawn in spawns)
	{
		if(!territory::is_valid(spawn))
		{
			continue;
		}
		if(territory::is_inside(spawn.origin))
		{
			if(!isdefined(var_637da63f))
			{
				var_637da63f = [];
			}
			else if(!isarray(var_637da63f))
			{
				var_637da63f = array(var_637da63f);
			}
			var_637da63f[var_637da63f.size] = spawn;
		}
	}
	return var_637da63f;
}

/*
	Name: function_c24e290c
	Namespace: spawning
	Checksum: 0x20F7FAF5
	Offset: 0x1D68
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_c24e290c(spawn)
{
	if(!territory::is_valid(spawn))
	{
		return 0;
	}
	return !territory::is_inside(spawn.origin);
}

/*
	Name: function_daa5852f
	Namespace: spawning
	Checksum: 0x8B524D15
	Offset: 0x1DB8
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function function_daa5852f()
{
	if(level.var_f2814a96 === 0 || level.var_f2814a96 === 2)
	{
		return true;
	}
	return false;
}

