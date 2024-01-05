#using scripts\core_common\map.gsc;
#using scripts\core_common\player\player_shared.gsc;

#namespace teams;

/*
	Name: function_bc6c7b80
	Namespace: teams
	Checksum: 0xD19415FF
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bc6c7b80()
{
	level notify(711735513);
}

/*
	Name: function_7f8faff9
	Namespace: teams
	Checksum: 0xD9F75B9F
	Offset: 0x90
	Size: 0x26
	Parameters: 1
	Flags: None
*/
function function_7f8faff9(team)
{
	return game.stat[#"teamscores"][team];
}

/*
	Name: function_dc7eaabd
	Namespace: teams
	Checksum: 0x76B815C
	Offset: 0xC0
	Size: 0x134
	Parameters: 1
	Flags: None
*/
function function_dc7eaabd(assignment)
{
	/#
		assert(isdefined(assignment));
	#/
	self.pers[#"team"] = assignment;
	self.team = assignment;
	self.sessionteam = assignment;
	if(isdefined(level.teams[assignment]))
	{
		status = self player::function_3d288f14();
		if(!isdefined(level.var_75dffa9f[assignment]) || (status != level.var_75dffa9f[assignment] && status == #"game"))
		{
			if(status == #"game")
			{
				level.var_75dffa9f[assignment] = #"game";
			}
			else
			{
				level.var_75dffa9f[assignment] = #"none";
			}
		}
	}
	/#
		self thread function_ba459d03(assignment);
	#/
}

/*
	Name: is_team_empty
	Namespace: teams
	Checksum: 0x3530437B
	Offset: 0x200
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function is_team_empty(team)
{
	team_players = getplayers(team);
	if(team_players.size > 0)
	{
		return false;
	}
	return true;
}

/*
	Name: function_959bac94
	Namespace: teams
	Checksum: 0x71006129
	Offset: 0x250
	Size: 0xFA
	Parameters: 0
	Flags: None
*/
function function_959bac94()
{
	foreach(team in level.teams)
	{
		if(self is_team_empty(team))
		{
			/#
				println(((("" + "") + self.name) + "") + team);
			#/
			/#
				function_d28f6fa0(team);
			#/
			return team;
		}
	}
	return #"spectator";
}

/*
	Name: function_712e3ba6
	Namespace: teams
	Checksum: 0x61AB7C92
	Offset: 0x358
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_712e3ba6(score)
{
	foreach(team, _ in level.teams)
	{
		if(game.stat[#"teamscores"][team] >= score)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: any_team_hit_score_limit
	Namespace: teams
	Checksum: 0x702FAB0F
	Offset: 0x410
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function any_team_hit_score_limit()
{
	return function_712e3ba6(level.scorelimit);
}

/*
	Name: function_67aac3d9
	Namespace: teams
	Checksum: 0x939695F0
	Offset: 0x438
	Size: 0xAA
	Parameters: 4
	Flags: Linked, Private
*/
function private function_67aac3d9(gamestat, teama, teamb, previous_winner_score)
{
	winner = undefined;
	/#
		assert(teama !== "");
	#/
	if(previous_winner_score == game.stat[gamestat][teamb])
	{
		winner = undefined;
	}
	else
	{
		if(game.stat[gamestat][teamb] > previous_winner_score)
		{
			winner = teamb;
		}
		else
		{
			winner = teama;
		}
	}
	return winner;
}

/*
	Name: function_d85770f0
	Namespace: teams
	Checksum: 0x6721D526
	Offset: 0x4F0
	Size: 0xBE
	Parameters: 1
	Flags: None
*/
function function_d85770f0(gamestat)
{
	teamkeys = getarraykeys(level.teams);
	winner = teamkeys[0];
	previous_winner_score = game.stat[gamestat][winner];
	for(teamindex = 1; teamindex < teamkeys.size; teamindex++)
	{
		winner = function_67aac3d9(gamestat, winner, teamkeys[teamindex], previous_winner_score);
		if(isdefined(winner))
		{
			previous_winner_score = game.stat[gamestat][winner];
		}
	}
	return winner;
}

/*
	Name: function_e390f598
	Namespace: teams
	Checksum: 0x5D069E68
	Offset: 0x5B8
	Size: 0x7E
	Parameters: 3
	Flags: Linked, Private
*/
function private function_e390f598(var_1ada49b5, teamb, var_2a5c5ccb)
{
	/#
		assert(var_1ada49b5 !== "");
	#/
	teambscore = [[level._getteamscore]](teamb);
	if(teambscore == var_2a5c5ccb)
	{
		return undefined;
	}
	if(teambscore > var_2a5c5ccb)
	{
		return teamb;
	}
	return var_1ada49b5;
}

/*
	Name: function_ef80de99
	Namespace: teams
	Checksum: 0x61A69525
	Offset: 0x640
	Size: 0xB6
	Parameters: 0
	Flags: None
*/
function function_ef80de99()
{
	teamkeys = getarraykeys(level.teams);
	winner = teamkeys[0];
	var_2a5c5ccb = [[level._getteamscore]](winner);
	for(teamindex = 1; teamindex < teamkeys.size; teamindex++)
	{
		winner = function_e390f598(winner, teamkeys[teamindex], var_2a5c5ccb);
		if(isdefined(winner))
		{
			var_2a5c5ccb = [[level._getteamscore]](winner);
		}
	}
	return winner;
}

/*
	Name: function_20cfd8b5
	Namespace: teams
	Checksum: 0x7C02E5C8
	Offset: 0x700
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function function_20cfd8b5(team)
{
	if(isdefined(team))
	{
		teamindex = level.teamindex[team];
		if(isdefined(teamindex))
		{
			var_504bfad6 = map::function_596f8772();
			faction_name = var_504bfad6.faction[teamindex].var_d2446fa0;
			if(isdefined(faction_name))
			{
				return getscriptbundle(faction_name);
			}
		}
	}
	return undefined;
}

/*
	Name: function_ba459d03
	Namespace: teams
	Checksum: 0x30998EF
	Offset: 0x7A0
	Size: 0x12C
	Parameters: 1
	Flags: Private
*/
function private function_ba459d03(team)
{
	/#
		if(is_true(level.var_ba13fb7a))
		{
			team_str = string(team);
			if(isdefined(level.teams[team]))
			{
				team_str = level.teams[team];
			}
			voip = "";
			if(isdefined(level.var_75dffa9f[team]))
			{
				voip = voip + (level.var_75dffa9f[team] == #"game" ? "" : "");
			}
			else
			{
				voip = voip + "";
			}
			println(((((("" + "") + self.name) + "") + team_str) + "") + voip);
		}
	#/
}

/*
	Name: function_a9d594a0
	Namespace: teams
	Checksum: 0x8D35B591
	Offset: 0x8D8
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function function_a9d594a0(party)
{
	/#
		foreach(var_52ec371a in party.var_d77ed5eb)
		{
			var_2798314b = var_52ec371a getparty();
			if(var_2798314b.var_a15e4438 != party.var_a15e4438)
			{
				/#
					assertmsg("");
				#/
			}
		}
	#/
}

/*
	Name: function_d28f6fa0
	Namespace: teams
	Checksum: 0x20E37B67
	Offset: 0x9B8
	Size: 0xC0
	Parameters: 1
	Flags: None
*/
function function_d28f6fa0(team)
{
	/#
		players = getplayers(team);
		foreach(player in players)
		{
			function_a9d594a0(player getparty());
		}
	#/
}

