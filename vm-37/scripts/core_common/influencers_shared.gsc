#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace influencers;

/*
	Name: __init__system__
	Namespace: influencers
	Checksum: 0x2CEF7063
	Offset: 0x108
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
	Checksum: 0x606D6F27
	Offset: 0x150
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
	Checksum: 0x5E4E995B
	Offset: 0x260
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
	Checksum: 0x71AD0DB0
	Offset: 0x2A0
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
	Checksum: 0x6FE91828
	Offset: 0x300
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
	Checksum: 0xFAC11358
	Offset: 0x320
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
	Checksum: 0xA0F150E7
	Offset: 0x3B0
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
	Checksum: 0x8349BCB
	Offset: 0x410
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
	Checksum: 0x914214F0
	Offset: 0x470
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
	Checksum: 0x433EBA0D
	Offset: 0x558
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
	Checksum: 0x6C073663
	Offset: 0x6D8
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
	Checksum: 0x8650E629
	Offset: 0x730
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
	Checksum: 0xC81CFD7A
	Offset: 0x7A0
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
	Checksum: 0x1A3279CF
	Offset: 0x810
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
	Checksum: 0x878B0CCE
	Offset: 0x868
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
	Checksum: 0x3F67D10C
	Offset: 0x8C0
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
	Checksum: 0x4696D624
	Offset: 0x928
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
	Checksum: 0xEF44F39F
	Offset: 0x990
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
	Checksum: 0x5040308C
	Offset: 0xB88
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
	Checksum: 0xB258B6C
	Offset: 0xC10
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
	Checksum: 0x66A639E1
	Offset: 0xCB8
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
	Checksum: 0x742A07C1
	Offset: 0xD70
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
	Checksum: 0xE0C5B65E
	Offset: 0xDE8
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
	Checksum: 0xB676AED1
	Offset: 0xF70
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
	Checksum: 0xE2DF63EB
	Offset: 0x1098
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
	Checksum: 0x77C78F2D
	Offset: 0x1138
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
	Checksum: 0xA34FAD02
	Offset: 0x11F8
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

