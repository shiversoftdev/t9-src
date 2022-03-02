#using script_256b8879317373de;
#using script_6350c209b3d1b07d;

#namespace teams;

/*
	Name: function_7f8faff9
	Namespace: teams
	Checksum: 0x519E06F3
	Offset: 0x70
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
	Checksum: 0x68807CF8
	Offset: 0xA0
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
	Name: function_6d86768e
	Namespace: teams
	Checksum: 0x557E6A10
	Offset: 0x1E0
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function function_6d86768e(team)
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
	Checksum: 0x9552F9E0
	Offset: 0x230
	Size: 0xFA
	Parameters: 0
	Flags: None
*/
function function_959bac94()
{
	foreach(team in level.teams)
	{
		if(self function_6d86768e(team))
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
	Checksum: 0x20BC0A7C
	Offset: 0x338
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
	Checksum: 0xC266D7DE
	Offset: 0x3F0
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
	Checksum: 0x2443B69F
	Offset: 0x418
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
	Checksum: 0x9EF1CF10
	Offset: 0x4D0
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
	Checksum: 0xA71B2981
	Offset: 0x598
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
	Checksum: 0x91623A80
	Offset: 0x620
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
	Checksum: 0xB7B9DD95
	Offset: 0x6E0
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
	Checksum: 0xDC82BB80
	Offset: 0x780
	Size: 0x12C
	Parameters: 1
	Flags: Private
*/
function private function_ba459d03(team)
{
	/#
		if(is_true(level.var_ba13fb7a))
		{
			var_54e8d52e = string(team);
			if(isdefined(level.teams[team]))
			{
				var_54e8d52e = level.teams[team];
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
			println(((((("" + "") + self.name) + "") + var_54e8d52e) + "") + voip);
		}
	#/
}

/*
	Name: function_a9d594a0
	Namespace: teams
	Checksum: 0x8EAE2FA4
	Offset: 0x8B8
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function function_a9d594a0(party)
{
	/#
		foreach(var_52ec371a in party.var_d77ed5eb)
		{
			var_2798314b = var_52ec371a function_491311f4();
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
	Checksum: 0x3F4CF1F4
	Offset: 0x998
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
			function_a9d594a0(player function_491311f4());
		}
	#/
}

