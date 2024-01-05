#using scripts\zm_common\util.gsc;
#using scripts\zm_common\gametypes\spawnlogic.gsc;
#using script_44b0b8420eabacad;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace spawning;

/*
	Name: function_e21c8fdf
	Namespace: spawning
	Checksum: 0x553CC54D
	Offset: 0x348
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e21c8fdf()
{
	level notify(-1353610929);
}

/*
	Name: function_70a657d8
	Namespace: spawning
	Checksum: 0x2604DD58
	Offset: 0x368
	Size: 0x20C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level init_spawn_system();
	level.recently_deceased = [];
	foreach(team, _ in level.teams)
	{
		level.recently_deceased[team] = util::spawn_array_struct();
	}
	callback::on_connecting(&on_player_connecting);
	level.spawnprotectiontime = getgametypesetting(#"spawnprotectiontime");
	level.spawnprotectiontimems = int((isdefined(level.spawnprotectiontime) ? level.spawnprotectiontime : 0) * 1000);
	/#
		setdvar(#"scr_debug_spawn_player", "");
		setdvar(#"scr_debug_render_spawn_data", 1);
		setdvar(#"scr_debug_render_snapshotmode", 0);
		setdvar(#"scr_spawn_point_test_mode", 0);
		level.test_spawn_point_index = 0;
		setdvar(#"scr_debug_render_spawn_text", 1);
	#/
}

/*
	Name: init_spawn_system
	Namespace: spawning
	Checksum: 0xFB5C8A7D
	Offset: 0x580
	Size: 0x17C
	Parameters: 0
	Flags: Linked
*/
function init_spawn_system()
{
	level.spawnsystem = spawnstruct();
	spawnsystem = level.spawnsystem;
	if(!isdefined(spawnsystem.unifiedsideswitching))
	{
		spawnsystem.unifiedsideswitching = 1;
	}
	spawnsystem.objective_facing_bonus = 0;
	spawnsystem.ispawn_teammask = [];
	spawnsystem.ispawn_teammask_free = 1;
	spawnsystem.ispawn_teammask[#"none"] = spawnsystem.ispawn_teammask_free;
	all = spawnsystem.ispawn_teammask_free;
	count = 1;
	foreach(_ in level.teams)
	{
		spawnsystem.ispawn_teammask[team] = 1 << count;
		all = all | spawnsystem.ispawn_teammask[team];
		count++;
	}
	spawnsystem.ispawn_teammask[#"all"] = all;
}

/*
	Name: on_player_connecting
	Namespace: spawning
	Checksum: 0x36A72DED
	Offset: 0x708
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function on_player_connecting()
{
	level endon(#"game_ended");
	self setentertime(gettime());
	callback::on_spawned(&on_player_spawned);
	callback::on_joined_team(&on_joined_team);
	self thread ongrenadethrow();
}

/*
	Name: on_player_spawned
	Namespace: spawning
	Checksum: 0x3EBC70F4
	Offset: 0x7A0
	Size: 0x78
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	for(;;)
	{
		self waittill(#"spawned_player");
		self enable_player_influencers(1);
		self thread ondeath();
	}
}

/*
	Name: ondeath
	Namespace: spawning
	Checksum: 0x57233B67
	Offset: 0x820
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function ondeath()
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	self waittill(#"death");
	self enable_player_influencers(0);
	level create_friendly_influencer("friend_dead", self.origin, self.team);
}

/*
	Name: on_joined_team
	Namespace: spawning
	Checksum: 0x220469EF
	Offset: 0x8B8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function on_joined_team(params)
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	self player_influencers_set_team();
}

/*
	Name: ongrenadethrow
	Namespace: spawning
	Checksum: 0x44370B30
	Offset: 0x908
	Size: 0xBE
	Parameters: 0
	Flags: Linked
*/
function ongrenadethrow()
{
	self endon(#"disconnect");
	level endon(#"game_ended");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"grenade_fire");
		grenade = waitresult.projectile;
		weapon = waitresult.weapon;
		level thread create_grenade_influencers(self.pers[#"team"], weapon, grenade);
		waitframe(1);
	}
}

/*
	Name: get_friendly_team_mask
	Namespace: spawning
	Checksum: 0xA4E692CF
	Offset: 0x9D0
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function get_friendly_team_mask(team)
{
	if(level.teambased)
	{
		team_mask = util::getteammask(team);
	}
	else
	{
		team_mask = level.spawnsystem.ispawn_teammask_free;
	}
	return team_mask;
}

/*
	Name: get_enemy_team_mask
	Namespace: spawning
	Checksum: 0x9744AFEC
	Offset: 0xA30
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function get_enemy_team_mask(team)
{
	if(level.teambased)
	{
		team_mask = util::getotherteamsmask(team);
	}
	else
	{
		team_mask = level.spawnsystem.ispawn_teammask_free;
	}
	return team_mask;
}

/*
	Name: create_influencer
	Namespace: spawning
	Checksum: 0x27C71835
	Offset: 0xA90
	Size: 0x60
	Parameters: 3
	Flags: Linked
*/
function create_influencer(name, origin, team_mask)
{
	self.influencers[name] = addinfluencer(name, origin, team_mask);
	self thread watch_remove_influencer();
	return self.influencers[name];
}

/*
	Name: create_friendly_influencer
	Namespace: spawning
	Checksum: 0x9852848
	Offset: 0xAF8
	Size: 0x6C
	Parameters: 3
	Flags: Linked
*/
function create_friendly_influencer(name, origin, team)
{
	team_mask = self get_friendly_team_mask(team);
	self.influencersfriendly[name] = create_influencer(name, origin, team_mask);
	return self.influencersfriendly[name];
}

/*
	Name: create_enemy_influencer
	Namespace: spawning
	Checksum: 0x5AEC2C75
	Offset: 0xB70
	Size: 0x6C
	Parameters: 3
	Flags: Linked
*/
function create_enemy_influencer(name, origin, team)
{
	team_mask = self get_enemy_team_mask(team);
	self.influencersenemy[name] = create_influencer(name, origin, team_mask);
	return self.influencersenemy[name];
}

/*
	Name: create_entity_influencer
	Namespace: spawning
	Checksum: 0x733FA1E4
	Offset: 0xBE8
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function create_entity_influencer(name, team_mask)
{
	self.influencers[name] = addentityinfluencer(name, self, team_mask);
	return self.influencers[name];
}

/*
	Name: create_entity_friendly_influencer
	Namespace: spawning
	Checksum: 0xDD30902A
	Offset: 0xC38
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function create_entity_friendly_influencer(name)
{
	team_mask = self get_friendly_team_mask();
	return self create_entity_masked_friendly_influencer(name, team_mask);
}

/*
	Name: create_entity_enemy_influencer
	Namespace: spawning
	Checksum: 0xB20D2B1B
	Offset: 0xC90
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function create_entity_enemy_influencer(name)
{
	team_mask = self get_enemy_team_mask();
	return self create_entity_masked_enemy_influencer(name, team_mask);
}

/*
	Name: create_entity_masked_friendly_influencer
	Namespace: spawning
	Checksum: 0x22C905B4
	Offset: 0xCE8
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function create_entity_masked_friendly_influencer(name, team_mask)
{
	self.influencersfriendly[name] = self create_entity_influencer(name, team_mask);
	return self.influencersfriendly[name];
}

/*
	Name: create_entity_masked_enemy_influencer
	Namespace: spawning
	Checksum: 0x737CA05
	Offset: 0xD38
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function create_entity_masked_enemy_influencer(name, team_mask)
{
	self.influencersenemy[name] = self create_entity_influencer(name, team_mask);
	return self.influencersenemy[name];
}

/*
	Name: create_player_influencers
	Namespace: spawning
	Checksum: 0xB2F870D
	Offset: 0xD88
	Size: 0x254
	Parameters: 0
	Flags: Linked
*/
function create_player_influencers()
{
	/#
		assert(!isdefined(self.influencers));
	#/
	/#
		assert(!isdefined(self.influencers));
	#/
	if(!level.teambased)
	{
		team_mask = level.spawnsystem.ispawn_teammask_free;
		other_team_mask = level.spawnsystem.ispawn_teammask_free;
		weapon_team_mask = level.spawnsystem.ispawn_teammask_free;
	}
	else
	{
		if(isdefined(self.pers[#"team"]))
		{
			team = self.pers[#"team"];
			team_mask = util::getteammask(team);
			enemy_teams_mask = util::getotherteamsmask(team);
		}
		else
		{
			team_mask = 0;
			enemy_teams_mask = 0;
		}
	}
	angles = self.angles;
	origin = self.origin;
	up = (0, 0, 1);
	forward = (1, 0, 0);
	self.influencers = [];
	self.friendlyinfluencers = [];
	self.enemyinfluencers = [];
	self create_entity_masked_enemy_influencer(#"enemy", enemy_teams_mask);
	if(level.teambased)
	{
		self create_entity_masked_friendly_influencer("friend", team_mask);
	}
	if(!isdefined(self.pers[#"team"]) || self.pers[#"team"] == "spectator")
	{
		self enable_influencers(0);
	}
}

/*
	Name: remove_influencers
	Namespace: spawning
	Checksum: 0x83B18745
	Offset: 0xFE8
	Size: 0xC2
	Parameters: 0
	Flags: None
*/
function remove_influencers()
{
	foreach(influencer in self.influencers)
	{
		removeinfluencer(influencer);
	}
	self.influencers = [];
	if(isdefined(self.influencersfriendly))
	{
		self.influencersfriendly = [];
	}
	if(isdefined(self.influencersenemy))
	{
		self.influencersenemy = [];
	}
}

/*
	Name: watch_remove_influencer
	Namespace: spawning
	Checksum: 0x46C0F589
	Offset: 0x10B8
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function watch_remove_influencer()
{
	self endon(#"death");
	self notify(#"watch_remove_influencer");
	self endon(#"watch_remove_influencer");
	waitresult = undefined;
	waitresult = self waittill(#"influencer_removed");
	arrayremovevalue(self.influencers, waitresult.index);
	arrayremovevalue(self.influencersfriendly, waitresult.index);
	arrayremovevalue(self.influencersenemy, waitresult.index);
	self thread watch_remove_influencer();
}

/*
	Name: enable_influencers
	Namespace: spawning
	Checksum: 0x84BB86ED
	Offset: 0x11A0
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function enable_influencers(enabled)
{
	foreach(influencer in self.influencers)
	{
		enableinfluencer(influencer, enabled);
	}
}

/*
	Name: enable_player_influencers
	Namespace: spawning
	Checksum: 0xBCF7E6C0
	Offset: 0x1238
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function enable_player_influencers(enabled)
{
	if(!isdefined(self.influencers))
	{
		self create_player_influencers();
	}
	self enable_influencers(enabled);
}

/*
	Name: player_influencers_set_team
	Namespace: spawning
	Checksum: 0x91C892F0
	Offset: 0x1288
	Size: 0x1B8
	Parameters: 0
	Flags: Linked
*/
function player_influencers_set_team()
{
	if(!level.teambased)
	{
		team_mask = level.spawnsystem.ispawn_teammask_free;
		enemy_teams_mask = level.spawnsystem.ispawn_teammask_free;
	}
	else
	{
		team = self.pers[#"team"];
		team_mask = util::getteammask(team);
		enemy_teams_mask = util::getotherteamsmask(team);
	}
	if(isdefined(self.influencersfriendly))
	{
		foreach(influencer in self.influencersfriendly)
		{
			setinfluencerteammask(influencer, team_mask);
		}
	}
	if(isdefined(self.influencersenemy))
	{
		foreach(influencer in self.influencersenemy)
		{
			setinfluencerteammask(influencer, enemy_teams_mask);
		}
	}
}

/*
	Name: create_grenade_influencers
	Namespace: spawning
	Checksum: 0xCD5208BD
	Offset: 0x1448
	Size: 0xE6
	Parameters: 3
	Flags: Linked
*/
function create_grenade_influencers(parent_team, weapon, grenade)
{
	pixbeginevent();
	spawn_influencer = weapon.spawninfluencer;
	if(isdefined(grenade.origin) && spawn_influencer != "")
	{
		if(!level.teambased)
		{
			weapon_team_mask = level.spawnsystem.ispawn_teammask_free;
		}
		else
		{
			weapon_team_mask = util::getotherteamsmask(parent_team);
			if(level.friendlyfire)
			{
				weapon_team_mask = weapon_team_mask | util::getteammask(parent_team);
			}
		}
		grenade create_entity_masked_enemy_influencer(spawn_influencer, weapon_team_mask);
	}
	pixendevent();
}

/*
	Name: create_map_placed_influencers
	Namespace: spawning
	Checksum: 0x4A67C1E6
	Offset: 0x1538
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function create_map_placed_influencers()
{
	staticinfluencerents = getentarray("mp_uspawn_influencer", "classname");
	for(i = 0; i < staticinfluencerents.size; i++)
	{
		staticinfluencerent = staticinfluencerents[i];
		create_map_placed_influencer(staticinfluencerent);
	}
}

/*
	Name: create_map_placed_influencer
	Namespace: spawning
	Checksum: 0x4E6DAF0D
	Offset: 0x15B8
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function create_map_placed_influencer(influencer_entity)
{
	influencer_id = -1;
	if(isdefined(influencer_entity.script_noteworty))
	{
		team_mask = util::getteammask(influencer_entity.script_team);
		level create_enemy_influencer(influencer_entity.script_noteworty, influencer_entity.origin, team_mask);
	}
	else
	{
		/#
			assertmsg("");
		#/
	}
	return influencer_id;
}

/*
	Name: updateallspawnpoints
	Namespace: spawning
	Checksum: 0xD2229E14
	Offset: 0x1658
	Size: 0x1BC
	Parameters: 0
	Flags: None
*/
function updateallspawnpoints()
{
	foreach(_ in level.teams)
	{
		gatherspawnpoints(team);
	}
	spawnlogic::clearspawnpoints();
	if(level.teambased)
	{
		foreach(team, _ in level.teams)
		{
			spawnlogic::addspawnpoints(team, level.unified_spawn_points[team].a);
		}
	}
	else
	{
		foreach(_ in level.teams)
		{
			spawnlogic::addspawnpoints(#"none", level.unified_spawn_points[team].a);
		}
	}
	remove_unused_spawn_entities();
}

/*
	Name: onspawnplayer_unified
	Namespace: spawning
	Checksum: 0x40AFA091
	Offset: 0x1820
	Size: 0x146
	Parameters: 1
	Flags: Linked
*/
function onspawnplayer_unified(predictedspawn)
{
	if(!isdefined(predictedspawn))
	{
		predictedspawn = 0;
	}
	/#
		if(getdvarint(#"scr_spawn_point_test_mode", 0) != 0)
		{
			spawn_point = get_debug_spawnpoint(self);
			self spawn(spawn_point.origin, spawn_point.angles);
			return;
		}
	#/
	use_new_spawn_system = 0;
	initial_spawn = 1;
	if(isdefined(self.uspawn_already_spawned))
	{
		initial_spawn = !self.uspawn_already_spawned;
	}
	if(usestartspawns())
	{
		use_new_spawn_system = 0;
	}
	if(level.gametype == "sd")
	{
		use_new_spawn_system = 0;
	}
	function_5ac4dc99("scr_spawn_force_unified", "0");
	[[level.onspawnplayer]](predictedspawn);
	if(!predictedspawn)
	{
		self.uspawn_already_spawned = 1;
	}
}

/*
	Name: getspawnpoint
	Namespace: spawning
	Checksum: 0xC897E647
	Offset: 0x1970
	Size: 0x13A
	Parameters: 2
	Flags: None
*/
function getspawnpoint(player_entity, predictedspawn)
{
	if(!isdefined(predictedspawn))
	{
		predictedspawn = 0;
	}
	if(level.teambased)
	{
		point_team = player_entity.pers[#"team"];
		influencer_team = player_entity.pers[#"team"];
	}
	else
	{
		point_team = #"none";
		influencer_team = #"none";
	}
	if(level.teambased && isdefined(game.switchedsides) && game.switchedsides && level.spawnsystem.unifiedsideswitching)
	{
		point_team = util::getotherteam(point_team);
	}
	best_spawn = get_best_spawnpoint(point_team, influencer_team, player_entity, predictedspawn);
	if(!predictedspawn)
	{
		player_entity.last_spawn_origin = best_spawn[#"origin"];
	}
	return best_spawn;
}

/*
	Name: get_debug_spawnpoint
	Namespace: spawning
	Checksum: 0xFAE224BA
	Offset: 0x1AB8
	Size: 0x25A
	Parameters: 1
	Flags: None
*/
function get_debug_spawnpoint(player)
{
	if(level.teambased)
	{
		team = player.pers[#"team"];
	}
	else
	{
		team = #"none";
	}
	index = level.test_spawn_point_index;
	level.test_spawn_point_index++;
	if(team == #"none")
	{
		spawn_counts = 0;
		foreach(_ in level.teams)
		{
			spawn_counts = spawn_counts + level.unified_spawn_points[team].a.size;
		}
		if(level.test_spawn_point_index >= spawn_counts)
		{
			level.test_spawn_point_index = 0;
		}
		count = 0;
		foreach(team, _ in level.teams)
		{
			size = level.unified_spawn_points[team].a.size;
			if(level.test_spawn_point_index < count + size)
			{
				return level.unified_spawn_points[team].a[level.test_spawn_point_index - count];
			}
			count = count + size;
		}
	}
	else
	{
		if(level.test_spawn_point_index >= level.unified_spawn_points[team].a.size)
		{
			level.test_spawn_point_index = 0;
		}
		return level.unified_spawn_points[team].a[level.test_spawn_point_index];
	}
}

/*
	Name: get_best_spawnpoint
	Namespace: spawning
	Checksum: 0x458415B8
	Offset: 0x1D20
	Size: 0x188
	Parameters: 4
	Flags: Linked
*/
function get_best_spawnpoint(point_team, influencer_team, player, predictedspawn)
{
	if(level.teambased)
	{
		vis_team_mask = util::getotherteamsmask(player.pers[#"team"]);
	}
	else
	{
		vis_team_mask = level.spawnsystem.ispawn_teammask_free;
	}
	spawn_point = getbestspawnpoint(point_team, influencer_team, vis_team_mask, player, predictedspawn);
	if(!predictedspawn)
	{
		var_48eba3a3 = {#z:spawn_point[#"origin"][2], #y:spawn_point[#"origin"][1], #x:spawn_point[#"origin"][0], #hash_c734ddf2:getplayerspawnid(player), #reason:"point used"};
		function_92d1707f(#"hash_263d9506f7e11fdd", var_48eba3a3);
	}
	return spawn_point;
}

/*
	Name: gatherspawnpoints
	Namespace: spawning
	Checksum: 0x8B175498
	Offset: 0x1EB0
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function gatherspawnpoints(player_team)
{
	if(!isdefined(level.unified_spawn_points))
	{
		level.unified_spawn_points = [];
	}
	else if(isdefined(level.unified_spawn_points[player_team]))
	{
		return level.unified_spawn_points[player_team];
	}
	spawn_entities_s = util::spawn_array_struct();
	spawn_entities_s.a = spawnlogic::getteamspawnpoints(player_team);
	if(!isdefined(spawn_entities_s.a))
	{
		spawn_entities_s.a = [];
	}
	level.unified_spawn_points[player_team] = spawn_entities_s;
	return spawn_entities_s;
}

/*
	Name: is_hardcore
	Namespace: spawning
	Checksum: 0x6B27B0F7
	Offset: 0x1F70
	Size: 0x20
	Parameters: 0
	Flags: None
*/
function is_hardcore()
{
	return isdefined(level.hardcoremode) && level.hardcoremode;
}

/*
	Name: teams_have_enmity
	Namespace: spawning
	Checksum: 0x73EB8D57
	Offset: 0x1F98
	Size: 0x82
	Parameters: 2
	Flags: None
*/
function teams_have_enmity(team1, team2)
{
	if(!isdefined(team1) || !isdefined(team2) || level.gametype == "dm")
	{
		return 1;
	}
	return team1 != #"neutral" && team2 != #"neutral" && team1 != team2;
}

/*
	Name: remove_unused_spawn_entities
	Namespace: spawning
	Checksum: 0x95380D4D
	Offset: 0x2028
	Size: 0x21C
	Parameters: 0
	Flags: Linked
*/
function remove_unused_spawn_entities()
{
	spawn_entity_types = [];
	spawn_entity_types[spawn_entity_types.size] = "mp_dm_spawn";
	spawn_entity_types[spawn_entity_types.size] = "mp_tdm_spawn_allies_start";
	spawn_entity_types[spawn_entity_types.size] = "mp_tdm_spawn_axis_start";
	spawn_entity_types[spawn_entity_types.size] = "mp_tdm_spawn";
	spawn_entity_types[spawn_entity_types.size] = "mp_ctf_spawn_allies_start";
	spawn_entity_types[spawn_entity_types.size] = "mp_ctf_spawn_axis_start";
	spawn_entity_types[spawn_entity_types.size] = "mp_ctf_spawn_allies";
	spawn_entity_types[spawn_entity_types.size] = "mp_ctf_spawn_axis";
	spawn_entity_types[spawn_entity_types.size] = "mp_dom_spawn_allies_start";
	spawn_entity_types[spawn_entity_types.size] = "mp_dom_spawn_axis_start";
	spawn_entity_types[spawn_entity_types.size] = "mp_dom_spawn";
	spawn_entity_types[spawn_entity_types.size] = "mp_sab_spawn_allies_start";
	spawn_entity_types[spawn_entity_types.size] = "mp_sab_spawn_axis_start";
	spawn_entity_types[spawn_entity_types.size] = "mp_sab_spawn_allies";
	spawn_entity_types[spawn_entity_types.size] = "mp_sab_spawn_axis";
	spawn_entity_types[spawn_entity_types.size] = "mp_sd_spawn_attacker";
	spawn_entity_types[spawn_entity_types.size] = "mp_sd_spawn_defender";
	spawn_entity_types[spawn_entity_types.size] = "mp_twar_spawn_axis_start";
	spawn_entity_types[spawn_entity_types.size] = "mp_twar_spawn_allies_start";
	spawn_entity_types[spawn_entity_types.size] = "mp_twar_spawn";
	for(i = 0; i < spawn_entity_types.size; i++)
	{
		if(spawn_point_class_name_being_used(spawn_entity_types[i]))
		{
			continue;
		}
		spawnpoints = spawnlogic::getspawnpointarray(spawn_entity_types[i]);
		delete_all_spawns(spawnpoints);
	}
}

/*
	Name: delete_all_spawns
	Namespace: spawning
	Checksum: 0xD6F439F
	Offset: 0x2250
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function delete_all_spawns(spawnpoints)
{
	for(i = 0; i < spawnpoints.size; i++)
	{
		spawnpoints[i] delete();
	}
}

/*
	Name: spawn_point_class_name_being_used
	Namespace: spawning
	Checksum: 0x48761BFA
	Offset: 0x22A0
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function spawn_point_class_name_being_used(name)
{
	if(!isdefined(level.spawn_point_class_names))
	{
		return false;
	}
	for(i = 0; i < level.spawn_point_class_names.size; i++)
	{
		if(level.spawn_point_class_names[i] == name)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: initialspawnprotection
	Namespace: spawning
	Checksum: 0xD459555B
	Offset: 0x2318
	Size: 0xE4
	Parameters: 2
	Flags: None
*/
function initialspawnprotection(specialtyname, spawnmonitorspeed)
{
	self endon(#"death", #"disconnect");
	if(!isdefined(level.spawnprotectiontime) || level.spawnprotectiontime == 0)
	{
		return;
	}
	if(spawnmonitorspeed == "specialty_nottargetedbyairsupport")
	{
		self.specialty_nottargetedbyairsupport = 1;
		wait(level.spawnprotectiontime);
		self.specialty_nottargetedbyairsupport = undefined;
	}
	else if(!self hasperk(spawnmonitorspeed))
	{
		self setperk(spawnmonitorspeed);
		wait(level.spawnprotectiontime);
		self unsetperk(spawnmonitorspeed);
	}
}

