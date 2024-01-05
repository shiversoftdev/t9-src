#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace influencers_shared;

/*
	Name: function_4c9f7bd6
	Namespace: influencers_shared
	Checksum: 0x2AD29C96
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4c9f7bd6()
{
	level notify(80001351);
}

#namespace influencers;

/*
	Name: __init__system__
	Namespace: influencers
	Checksum: 0xA5EE95D3
	Offset: 0x128
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"influencers_shared", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: influencers
	Checksum: 0x75BBBF3C
	Offset: 0x170
	Size: 0x104
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.var_3d984b4c))
	{
		level.var_3d984b4c = 1;
	}
	sessionmode = currentsessionmode();
	level.var_a3e7732d = sessionmode == 1 || sessionmode == 3;
	if(level.var_3d984b4c && level.var_a3e7732d)
	{
		callback::on_grenade_fired(&on_grenade_fired);
		callback::on_player_killed(&on_player_death);
		callback::on_joined_team(&on_joined_team);
		callback::on_spawned(&on_spawned);
	}
}

/*
	Name: on_spawned
	Namespace: influencers
	Checksum: 0x40D97795
	Offset: 0x280
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function on_spawned()
{
	removeallinfluencersfromentity(self);
	self create_player_influencers();
}

/*
	Name: on_player_death
	Namespace: influencers
	Checksum: 0x57DA4029
	Offset: 0x2C0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function on_player_death(params)
{
	if(game.state != #"playing")
	{
		return;
	}
	level create_friendly_influencer("friend_dead", self.origin, self.team);
}

/*
	Name: on_joined_team
	Namespace: influencers
	Checksum: 0x5C865B64
	Offset: 0x320
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function on_joined_team(params)
{
	self.lastspawnpoint = undefined;
}

/*
	Name: on_grenade_fired
	Namespace: influencers
	Checksum: 0xA4E9146B
	Offset: 0x340
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function on_grenade_fired(params)
{
	grenade = params.projectile;
	weapon = params.weapon;
	team = undefined;
	if(isdefined(self.pers))
	{
		team = self.pers[#"team"];
	}
	level thread create_grenade_influencers(team, weapon, grenade);
}

/*
	Name: get_friendly_team_mask
	Namespace: influencers
	Checksum: 0xC02A26E0
	Offset: 0x3D0
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
		team_mask = level.spawnsystem.var_c2989de;
	}
	return team_mask;
}

/*
	Name: get_enemy_team_mask
	Namespace: influencers
	Checksum: 0x2B1AF2D8
	Offset: 0x430
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
		team_mask = level.spawnsystem.var_c2989de;
	}
	return team_mask;
}

/*
	Name: add_influencer_tracker
	Namespace: influencers
	Checksum: 0x65792871
	Offset: 0x490
	Size: 0xDE
	Parameters: 2
	Flags: Linked, Private
*/
function private add_influencer_tracker(influencer, name)
{
	if(!isdefined(self.influencers))
	{
		self.influencers = [];
	}
	if(!isdefined(self.influencers[name]))
	{
		self.influencers[name] = [];
	}
	if(!isdefined(self.influencers[name]))
	{
		self.influencers[name] = [];
	}
	else if(!isarray(self.influencers[name]))
	{
		self.influencers[name] = array(self.influencers[name]);
	}
	self.influencers[name][self.influencers[name].size] = influencer;
}

/*
	Name: create_influencer_generic
	Namespace: influencers
	Checksum: 0x9032E7F1
	Offset: 0x578
	Size: 0x178
	Parameters: 4
	Flags: Linked
*/
function create_influencer_generic(str_name, origin_or_entity, str_team, is_for_enemy)
{
	if(!isdefined(is_for_enemy))
	{
		is_for_enemy = 0;
	}
	if(!is_true(level.var_3d984b4c))
	{
		return;
	}
	if(str_team === #"any")
	{
		team_mask = level.spawnsystem.ispawn_teammask[#"all"];
	}
	else
	{
		if(is_for_enemy)
		{
			team_mask = self get_enemy_team_mask(str_team);
		}
		else
		{
			team_mask = self get_friendly_team_mask(str_team);
		}
	}
	if(isentity(origin_or_entity))
	{
		influencer = addentityinfluencer(str_name, origin_or_entity, team_mask);
	}
	else if(isvec(origin_or_entity))
	{
		influencer = addinfluencer(str_name, origin_or_entity, team_mask);
	}
	if(!isentity(origin_or_entity))
	{
		self add_influencer_tracker(influencer, str_name);
	}
	return influencer;
}

/*
	Name: create_influencer
	Namespace: influencers
	Checksum: 0x2ADA3D30
	Offset: 0x6F8
	Size: 0x4C
	Parameters: 3
	Flags: Linked
*/
function create_influencer(name, origin, team_mask)
{
	if(is_true(level.var_3d984b4c))
	{
		return addinfluencer(name, origin, team_mask);
	}
}

/*
	Name: create_friendly_influencer
	Namespace: influencers
	Checksum: 0x7DD9D7A4
	Offset: 0x750
	Size: 0x62
	Parameters: 3
	Flags: Linked
*/
function create_friendly_influencer(name, origin, team)
{
	team_mask = self get_friendly_team_mask(team);
	influencer = create_influencer(name, origin, team_mask);
	return influencer;
}

/*
	Name: create_enemy_influencer
	Namespace: influencers
	Checksum: 0xC05BDFC
	Offset: 0x7C0
	Size: 0x62
	Parameters: 3
	Flags: Linked
*/
function create_enemy_influencer(name, origin, team)
{
	team_mask = self get_enemy_team_mask(team);
	influencer = create_influencer(name, origin, team_mask);
	return influencer;
}

/*
	Name: create_entity_influencer
	Namespace: influencers
	Checksum: 0x34A37D9C
	Offset: 0x830
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function create_entity_influencer(name, team_mask)
{
	if(is_true(level.var_3d984b4c))
	{
		return addentityinfluencer(name, self, team_mask);
	}
}

/*
	Name: function_f15009ad
	Namespace: influencers
	Checksum: 0x34BE38FC
	Offset: 0x888
	Size: 0x4C
	Parameters: 3
	Flags: None
*/
function function_f15009ad(name, origin, var_f317c70c)
{
	if(is_true(level.var_3d984b4c))
	{
		return function_a116c91b(name, origin, var_f317c70c);
	}
}

/*
	Name: create_entity_friendly_influencer
	Namespace: influencers
	Checksum: 0x7FADA667
	Offset: 0x8E0
	Size: 0x5A
	Parameters: 2
	Flags: None
*/
function create_entity_friendly_influencer(name, team)
{
	team_mask = self get_friendly_team_mask(team);
	influencer = create_entity_influencer(name, team_mask);
	return influencer;
}

/*
	Name: create_entity_enemy_influencer
	Namespace: influencers
	Checksum: 0xDC656C73
	Offset: 0x948
	Size: 0x5A
	Parameters: 2
	Flags: Linked
*/
function create_entity_enemy_influencer(name, team)
{
	team_mask = self get_enemy_team_mask(team);
	influencer = create_entity_influencer(name, team_mask);
	return influencer;
}

/*
	Name: create_player_influencers
	Namespace: influencers
	Checksum: 0xE6D41F11
	Offset: 0x9B0
	Size: 0x1EA
	Parameters: 0
	Flags: Linked
*/
function create_player_influencers()
{
	if(!is_true(level.var_3d984b4c))
	{
		return;
	}
	if(!isdefined(self.pers[#"team"]) || self.pers[#"team"] == #"spectator")
	{
		return;
	}
	if(self.influencers_created === 0)
	{
		return;
	}
	if(!level.teambased)
	{
		team_mask = level.spawnsystem.var_c2989de;
		enemy_teams_mask = level.spawnsystem.var_c2989de;
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
	self create_entity_influencer("enemy", enemy_teams_mask);
	if(level.teambased)
	{
		self create_entity_influencer("friend", team_mask);
	}
	self.influencers_created = 1;
}

/*
	Name: create_player_spawn_influencers
	Namespace: influencers
	Checksum: 0x6B5005E6
	Offset: 0xBA8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function create_player_spawn_influencers(spawn_origin)
{
	level create_enemy_influencer("enemy_spawn", spawn_origin, self.pers[#"team"]);
	level create_friendly_influencer("friendly_spawn", spawn_origin, self.pers[#"team"]);
}

/*
	Name: remove_influencer_tracking
	Namespace: influencers
	Checksum: 0x8B8F4951
	Offset: 0xC30
	Size: 0xA0
	Parameters: 1
	Flags: Linked, Private
*/
function private remove_influencer_tracking(to_be_removed)
{
	if(isdefined(self.influencers))
	{
		foreach(influencer_name_array in self.influencers)
		{
			arrayremovevalue(influencer_name_array, to_be_removed);
		}
	}
}

/*
	Name: is_influencer_tracked
	Namespace: influencers
	Checksum: 0x195795AC
	Offset: 0xCD8
	Size: 0xAA
	Parameters: 1
	Flags: Linked, Private
*/
function private is_influencer_tracked(influencer)
{
	if(isdefined(self.influencers))
	{
		foreach(influencer_name_array in self.influencers)
		{
			if(isinarray(influencer_name_array, influencer))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: remove_influencer
	Namespace: influencers
	Checksum: 0x7ECE0C8
	Offset: 0xD90
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function remove_influencer(to_be_removed)
{
	if(is_true(level.var_3d984b4c))
	{
		if(is_influencer_tracked(to_be_removed))
		{
			self remove_influencer_tracking(to_be_removed);
		}
		removeinfluencer(to_be_removed);
	}
}

/*
	Name: remove_influencers
	Namespace: influencers
	Checksum: 0x6BE03F4
	Offset: 0xE08
	Size: 0x17E
	Parameters: 0
	Flags: Linked
*/
function remove_influencers()
{
	if(!isdefined(self))
	{
		return;
	}
	if(!is_true(level.var_3d984b4c))
	{
		return;
	}
	if(isentity(self))
	{
		removeallinfluencersfromentity(self);
	}
	else if(isdefined(self.influencers))
	{
		foreach(influencer_name_array in self.influencers)
		{
			foreach(influencer in influencer_name_array)
			{
				self remove_influencer_tracking(influencer);
				removeinfluencer(influencer);
			}
		}
	}
	self.influencers = [];
}

/*
	Name: create_grenade_influencers
	Namespace: influencers
	Checksum: 0xFA07DFB9
	Offset: 0xF90
	Size: 0x11E
	Parameters: 3
	Flags: Linked
*/
function create_grenade_influencers(parent_team, weapon, grenade)
{
	if(!is_true(level.var_3d984b4c))
	{
		return;
	}
	pixbeginevent();
	spawn_influencer = weapon.spawninfluencer;
	if(isdefined(grenade.origin) && spawn_influencer != "" && isdefined(level.spawnsystem))
	{
		if(!level.teambased || !isdefined(parent_team))
		{
			weapon_team_mask = level.spawnsystem.var_c2989de;
		}
		else
		{
			weapon_team_mask = util::getotherteamsmask(parent_team);
			if(level.friendlyfire)
			{
				weapon_team_mask = weapon_team_mask | util::getteammask(parent_team);
			}
		}
		grenade create_entity_influencer(spawn_influencer, weapon_team_mask);
	}
	pixendevent();
}

/*
	Name: create_map_placed_influencers
	Namespace: influencers
	Checksum: 0xE90401E6
	Offset: 0x10B8
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function create_map_placed_influencers()
{
	if(!is_true(level.var_3d984b4c))
	{
		return;
	}
	staticinfluencerents = getentarray("mp_uspawn_influencer", "classname");
	for(i = 0; i < staticinfluencerents.size; i++)
	{
		staticinfluencerent = staticinfluencerents[i];
		create_map_placed_influencer(staticinfluencerent);
	}
}

/*
	Name: create_map_placed_influencer
	Namespace: influencers
	Checksum: 0x9DEEC2B4
	Offset: 0x1158
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function create_map_placed_influencer(influencer_entity)
{
	if(!is_true(level.var_3d984b4c))
	{
		return;
	}
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
	Name: create_turret_influencer
	Namespace: influencers
	Checksum: 0x681DAF1E
	Offset: 0x1218
	Size: 0xDA
	Parameters: 1
	Flags: None
*/
function create_turret_influencer(name)
{
	if(!is_true(level.var_3d984b4c))
	{
		return;
	}
	turret = self;
	preset = getinfluencerpreset(name);
	if(!isdefined(preset))
	{
		return;
	}
	projected_point = turret.origin + (vectorscale(anglestoforward(turret.angles), preset[#"radius"] * 0.7));
	return create_enemy_influencer(name, turret.origin, turret.team);
}

