#using scripts\mp_common\teams\teams.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_3d703ef87a841fe4;
#using script_45fdb6cec5580007;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace teams;

/*
	Name: __init__system__
	Namespace: teams
	Checksum: 0x80EA8B53
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"team_assignment", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: teams
	Checksum: 0x51E7FDD8
	Offset: 0x108
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.var_a3e209ba))
	{
		level.var_a3e209ba = &function_321f8eb5;
	}
	/#
		level.var_ba13fb7a = getdvarint(#"hash_40fe9055da22add4", 1);
	#/
}

/*
	Name: get_assigned_team
	Namespace: teams
	Checksum: 0x59C3D92B
	Offset: 0x170
	Size: 0x26
	Parameters: 0
	Flags: None
*/
function get_assigned_team()
{
	teamname = getassignedteamname(self);
}

/*
	Name: function_2ba5e3e6
	Namespace: teams
	Checksum: 0x479F84F5
	Offset: 0x1A0
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function function_2ba5e3e6()
{
	var_ac46c774 = util::gethostplayerforbots();
	if(isdefined(var_ac46c774))
	{
		return var_ac46c774.team;
	}
	return "";
}

/*
	Name: function_582e5d7c
	Namespace: teams
	Checksum: 0x8DA4BAC4
	Offset: 0x1E0
	Size: 0x8E
	Parameters: 0
	Flags: Linked
*/
function function_582e5d7c()
{
	max_players = player::function_d36b6597();
	return isbot(self) && isdefined(self.botteam) && self.botteam != "autoassign" && (max_players == 0 || getplayers(self.botteam).size < max_players);
}

/*
	Name: function_ee150fcc
	Namespace: teams
	Checksum: 0x61B4B43B
	Offset: 0x278
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_ee150fcc(team_players)
{
	max_players = player::function_d36b6597();
	return max_players - player::function_1cec6cba(team_players);
}

/*
	Name: function_46edfa55
	Namespace: teams
	Checksum: 0x5B78A64B
	Offset: 0x2C0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_46edfa55(team_players)
{
	return level.var_704bcca1 - player::function_1cec6cba(team_players);
}

/*
	Name: function_efe5a681
	Namespace: teams
	Checksum: 0xD7E509DB
	Offset: 0x2F8
	Size: 0x162
	Parameters: 1
	Flags: Linked
*/
function function_efe5a681(team)
{
	max_players = player::function_d36b6597();
	team_players = getplayers(team);
	if(team_players.size >= max_players && max_players != 0)
	{
		return false;
	}
	if(!max_players)
	{
		return true;
	}
	var_fa810454 = function_ee150fcc(team_players);
	party = self getparty();
	if(party.var_a15e4438 > var_fa810454)
	{
		return false;
	}
	/#
		if(getdvarint(#"hash_2ffea48b89a9ff3f", 0) && self != getplayers()[0] && getplayers()[0].team == team && !isbot(self))
		{
			return false;
		}
	#/
	return true;
}

/*
	Name: function_ccb3bc7a
	Namespace: teams
	Checksum: 0x1B49F7EA
	Offset: 0x468
	Size: 0x12A
	Parameters: 1
	Flags: Linked
*/
function function_ccb3bc7a(teams)
{
	foreach(team in teams)
	{
		if(self function_efe5a681(team))
		{
			/#
				println((((("" + "") + self.name) + "") + function_2c846a74(team) + "") + getplayers(team).size);
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
	Name: function_b919f6aa
	Namespace: teams
	Checksum: 0x9AE3549
	Offset: 0x5A0
	Size: 0x1C2
	Parameters: 1
	Flags: Linked
*/
function function_b919f6aa(status)
{
	foreach(team in level.teams)
	{
		if(status == #"game")
		{
			if(isdefined(level.var_75dffa9f[team]) && level.var_75dffa9f[team] != #"game")
			{
				continue;
			}
		}
		else if(isdefined(level.var_75dffa9f[team]) && level.var_75dffa9f[team] == #"game")
		{
			continue;
		}
		if(self function_efe5a681(team))
		{
			/#
				println((((("" + "") + self.name) + "") + function_2c846a74(team) + "") + getplayers(team).size);
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
	Name: function_5c389625
	Namespace: teams
	Checksum: 0xFDA92233
	Offset: 0x770
	Size: 0xAA
	Parameters: 0
	Flags: Linked
*/
function function_5c389625()
{
	status = self player::function_3d288f14();
	assignment = self function_b919f6aa(status);
	if(!isdefined(assignment) || assignment == #"spectator")
	{
		assignment = function_959bac94();
	}
	if(!isdefined(assignment))
	{
		assignment = function_ccb3bc7a(level.teams);
	}
	return assignment;
}

/*
	Name: function_5d02dd86
	Namespace: teams
	Checksum: 0x5D7B5EEB
	Offset: 0x828
	Size: 0x236
	Parameters: 1
	Flags: Linked
*/
function function_5d02dd86(party)
{
	if(!isdefined(party))
	{
		/#
			println((("" + "") + self.name) + "");
		#/
		return undefined;
	}
	if(party.var_a15e4438 <= 1)
	{
		/#
			println((("" + "") + self.name) + "");
		#/
		return undefined;
	}
	foreach(member in party.var_d77ed5eb)
	{
		if(self == member)
		{
			continue;
		}
		if(member.team != "autoassign" && member.team != #"spectator" && member.team != #"none")
		{
			/#
				println(((((("" + "") + self.name) + "") + member.team) + "") + member.name);
			#/
			/#
				function_d28f6fa0(member.team);
			#/
			return member.team;
		}
	}
	/#
		println((("" + "") + self.name) + "");
	#/
	return undefined;
}

/*
	Name: function_650d105d
	Namespace: teams
	Checksum: 0x3CA55855
	Offset: 0xA68
	Size: 0x1D8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_650d105d()
{
	teamkeys = array::randomize(getarraykeys(level.teams));
	assignment = undefined;
	playercounts = self count_players();
	if(teamplayercountsequal(playercounts))
	{
		if(!level.splitscreen && self issplitscreen())
		{
			assignment = self get_splitscreen_team();
			if(assignment == "")
			{
				assignment = function_dd2e9892(teamkeys);
			}
		}
		else
		{
			assignment = function_dd2e9892(teamkeys);
		}
		/#
			println(((("" + "") + self.name) + "") + function_2c846a74(assignment));
		#/
	}
	else
	{
		assignment = function_d078493a(playercounts);
		/#
			println(((("" + "") + self.name) + "") + function_2c846a74(assignment));
		#/
	}
	/#
		assert(isdefined(assignment));
	#/
	return assignment;
}

/*
	Name: function_b0c92599
	Namespace: teams
	Checksum: 0x72E686BF
	Offset: 0xC48
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function function_b0c92599(party)
{
	/#
		var_f8896168 = getdvarint(#"hash_4cbf229ab691d987", 0);
		if(var_f8896168 && (var_f8896168 != 2 || self ishost()))
		{
			return false;
		}
	#/
	if(isdefined(level.var_7d3ed2bf) && level.var_7d3ed2bf && isdefined(party) && party.fill == 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_868b679c
	Namespace: teams
	Checksum: 0x2A2D0C
	Offset: 0xD08
	Size: 0x1B8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_868b679c(party)
{
	if(level.teamcount == 0 && level.var_c58668ea && function_b0c92599(party))
	{
		assignment = function_959bac94();
		/#
			println(((("" + "") + self.name) + "") + function_2c846a74(assignment));
		#/
	}
	else
	{
		if(getdvarint(#"hash_587d8e03df4f4f8a", 0))
		{
			assignment = function_ccb3bc7a(level.teams);
			/#
				println(((("" + "") + self.name) + "") + function_2c846a74(assignment));
			#/
		}
		else
		{
			assignment = self function_5c389625();
			/#
				println(((("" + "") + self.name) + "") + function_2c846a74(assignment));
			#/
		}
	}
	return assignment;
}

/*
	Name: function_bec6e9a
	Namespace: teams
	Checksum: 0x50468575
	Offset: 0xEC8
	Size: 0xFA
	Parameters: 0
	Flags: Linked
*/
function function_bec6e9a()
{
	party = self getparty();
	assignment = function_5d02dd86(party);
	if(isdefined(assignment))
	{
		/#
			println(((("" + "") + self.name) + "") + function_2c846a74(assignment));
		#/
		return assignment;
	}
	max_players = player::function_d36b6597();
	if(level.multiteam && level.maxteamplayers > 0)
	{
		return function_868b679c();
	}
	return function_650d105d();
}

/*
	Name: function_b55ab4b3
	Namespace: teams
	Checksum: 0x762437C6
	Offset: 0xFD0
	Size: 0x12C
	Parameters: 2
	Flags: Linked
*/
function function_b55ab4b3(comingfrommenu, var_4c542e39)
{
	if(!comingfrommenu && var_4c542e39 === "spectator")
	{
		return var_4c542e39;
	}
	if(isdefined(level.var_4614c421) && [[level.var_4614c421]]())
	{
		return #"spectator";
	}
	clientnum = self getentitynumber();
	count = 0;
	foreach(team, _ in level.teams)
	{
		count++;
		if(count == (clientnum + 1))
		{
			return team;
		}
	}
	return var_4c542e39;
}

/*
	Name: function_d22a4fbb
	Namespace: teams
	Checksum: 0x79D61F6A
	Offset: 0x1108
	Size: 0x360
	Parameters: 3
	Flags: Linked
*/
function function_d22a4fbb(comingfrommenu, var_4c542e39, var_432c77c2)
{
	teamname = var_4c542e39;
	if(!isdefined(teamname))
	{
		teamname = #"none";
	}
	var_bdb3f6a6 = var_432c77c2;
	if(!isdefined(var_bdb3f6a6))
	{
		var_bdb3f6a6 = #"none";
	}
	/#
		loc_000011BC:
		println((((("" + "") + self.name) + "") + (comingfrommenu ? "" : "") + "") + (isdefined(var_4c542e39) ? function_2c846a74(var_4c542e39) : ""));
	#/
	if(level.teamcount > 2 && var_bdb3f6a6 !== #"none" && !comingfrommenu)
	{
		assignment = function_79740c0f(var_bdb3f6a6);
		/#
			println(((((("" + "") + self.name) + "") + var_bdb3f6a6) + "") + function_2c846a74(assignment));
		#/
	}
	else
	{
		if(teamname !== #"none" && !comingfrommenu)
		{
			assignment = teamname;
			/#
				println(((("" + "") + self.name) + "") + function_2c846a74(assignment));
			#/
		}
		else if(function_a3e209ba(teamname, comingfrommenu))
		{
			assignment = #"spectator";
			/#
				println((("" + "") + self.name) + "");
			#/
		}
	}
	if(!isdefined(assignment) || (assignment != #"spectator" && !isdefined(level.teams[assignment])))
	{
		assignment = function_bec6e9a();
		/#
			assert(isdefined(assignment));
		#/
		if(function_582e5d7c())
		{
			/#
				println(((("" + "") + self.name) + "") + self.botteam);
			#/
			return self.botteam;
		}
	}
	return assignment;
}

/*
	Name: teamscoresequal
	Namespace: teams
	Checksum: 0xCD0D807
	Offset: 0x1470
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function teamscoresequal()
{
	score = undefined;
	foreach(_ in level.teams)
	{
		if(!isdefined(score))
		{
			score = getteamscore(team);
			continue;
		}
		if(score != getteamscore(team))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_4818e9af
	Namespace: teams
	Checksum: 0xE53D1EE4
	Offset: 0x1548
	Size: 0xBE
	Parameters: 0
	Flags: Linked
*/
function function_4818e9af()
{
	score = 99999999;
	lowest_team = undefined;
	foreach(team, _ in level.teams)
	{
		if(score > getteamscore(team))
		{
			lowest_team = team;
		}
	}
	return lowest_team;
}

/*
	Name: function_dd2e9892
	Namespace: teams
	Checksum: 0xA80179F1
	Offset: 0x1610
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_dd2e9892(teams)
{
	assignment = #"allies";
	if(teamscoresequal())
	{
		assignment = function_ccb3bc7a(teams);
	}
	else
	{
		assignment = function_4818e9af();
	}
	return assignment;
}

/*
	Name: get_splitscreen_team
	Namespace: teams
	Checksum: 0xA0D67CD8
	Offset: 0x1690
	Size: 0xCE
	Parameters: 0
	Flags: Linked
*/
function get_splitscreen_team()
{
	for(index = 0; index < level.players.size; index++)
	{
		if(!isdefined(level.players[index]))
		{
			continue;
		}
		if(level.players[index] == self)
		{
			continue;
		}
		if(!self isplayeronsamemachine(level.players[index]))
		{
			continue;
		}
		team = level.players[index].sessionteam;
		if(team != #"spectator")
		{
			return team;
		}
	}
	return "";
}

/*
	Name: teamplayercountsequal
	Namespace: teams
	Checksum: 0xB4B1B6D6
	Offset: 0x1768
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function teamplayercountsequal(playercounts)
{
	count = undefined;
	foreach(_ in level.teams)
	{
		if(!isdefined(count))
		{
			count = playercounts[team];
			continue;
		}
		if(count != playercounts[team])
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_d078493a
	Namespace: teams
	Checksum: 0xA02A3439
	Offset: 0x1828
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_d078493a(playercounts)
{
	count = 9999;
	lowest_team = undefined;
	foreach(team, _ in level.teams)
	{
		if(count > playercounts[team])
		{
			count = playercounts[team];
			lowest_team = team;
		}
	}
	return lowest_team;
}

/*
	Name: function_321f8eb5
	Namespace: teams
	Checksum: 0x9798C575
	Offset: 0x18F0
	Size: 0x10
	Parameters: 1
	Flags: Linked
*/
function function_321f8eb5(player)
{
	return true;
}

/*
	Name: function_a3e209ba
	Namespace: teams
	Checksum: 0xCA5546F2
	Offset: 0x1908
	Size: 0x106
	Parameters: 2
	Flags: Linked
*/
function function_a3e209ba(teamname, comingfrommenu)
{
	if(level.rankedmatch)
	{
		return false;
	}
	if(level.inprematchperiod)
	{
		return false;
	}
	if(teamname != #"none")
	{
		return false;
	}
	if(comingfrommenu)
	{
		return false;
	}
	if(self ishost())
	{
		return false;
	}
	if(level.forceautoassign)
	{
		return false;
	}
	if(isbot(self))
	{
		return false;
	}
	if(self issplitscreen())
	{
		return false;
	}
	/#
		if(getdvarint(#"hash_4421e80faf4736fc", 0))
		{
			return false;
		}
	#/
	if(![[level.var_a3e209ba]]())
	{
		return false;
	}
	return true;
}

/*
	Name: function_567994de
	Namespace: teams
	Checksum: 0x78321D56
	Offset: 0x1A18
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_567994de()
{
	if(!isdefined(level.teams[self.pers[#"team"]]) || level.var_c58668ea)
	{
		return #"none";
	}
	return self.pers[#"team"];
}

/*
	Name: function_7d93567f
	Namespace: teams
	Checksum: 0xFC61AF45
	Offset: 0x1A88
	Size: 0x192
	Parameters: 0
	Flags: Linked
*/
function function_7d93567f()
{
	distribution = [];
	foreach(player in level.players)
	{
		team = player function_567994de();
		squad = player.squad;
		if(squad == #"invalid")
		{
			continue;
		}
		if(!isdefined(distribution[team]))
		{
			distribution[team] = [];
		}
		if(!isdefined(distribution[team][squad]))
		{
			distribution[team][squad] = [];
		}
		if(!isdefined(distribution[team][squad]))
		{
			distribution[team][squad] = [];
		}
		else if(!isarray(distribution[team][squad]))
		{
			distribution[team][squad] = array(distribution[team][squad]);
		}
		distribution[team][squad][distribution[team][squad].size] = player;
	}
	return distribution;
}

/*
	Name: function_a119c7ef
	Namespace: teams
	Checksum: 0x3F80FC98
	Offset: 0x1C28
	Size: 0x266
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a119c7ef(distribution)
{
	var_2def7656 = [];
	foreach(team, var_e08edbde in distribution)
	{
		if(!isdefined(var_2def7656[team]))
		{
			var_2def7656[team] = [];
		}
		for(i = 1; i < level.var_704bcca1; i++)
		{
			var_2def7656[team][i] = [];
		}
	}
	foreach(team, var_e08edbde in distribution)
	{
		if(!isdefined(var_2def7656[team]))
		{
			var_2def7656[team] = [];
		}
		foreach(var_74578e76 in var_e08edbde)
		{
			if(var_74578e76.size < level.var_704bcca1)
			{
				var_a787dfe7 = function_46edfa55(var_74578e76);
				if(var_a787dfe7 > 0)
				{
					if(!isdefined(var_2def7656[team][var_a787dfe7]))
					{
						var_2def7656[team][var_a787dfe7] = [];
					}
					else if(!isarray(var_2def7656[team][var_a787dfe7]))
					{
						var_2def7656[team][var_a787dfe7] = array(var_2def7656[team][var_a787dfe7]);
					}
					var_2def7656[team][var_a787dfe7][var_2def7656[team][var_a787dfe7].size] = squad;
				}
			}
		}
	}
	return var_2def7656;
}

/*
	Name: function_569914e8
	Namespace: teams
	Checksum: 0x158EB211
	Offset: 0x1E98
	Size: 0x15A
	Parameters: 4
	Flags: Linked
*/
function function_569914e8(var_e439f5d6, var_a9ab69de, var_d9438b7, var_f36ce5dd)
{
	foreach(var_a787dfe7, var_2a80e9e0 in var_f36ce5dd)
	{
		if(level.var_704bcca1 - var_a787dfe7 > var_d9438b7)
		{
			continue;
		}
		if(var_2a80e9e0.size == 0)
		{
			continue;
		}
		foreach(squad in var_2a80e9e0)
		{
			if(squad == #"none")
			{
				continue;
			}
			if(squad == var_a9ab69de)
			{
				continue;
			}
			return squad;
		}
	}
	return undefined;
}

/*
	Name: function_5e84fc28
	Namespace: teams
	Checksum: 0xB1825596
	Offset: 0x2000
	Size: 0xF2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5e84fc28(var_68253610)
{
	team = #"none";
	var_d549939e = function_c65231e2(var_68253610);
	foreach(player in var_d549939e)
	{
		team = player.pers[#"team"];
		if(isdefined(level.teams[team]))
		{
			return team;
		}
	}
	return #"none";
}

/*
	Name: function_8c162ba0
	Namespace: teams
	Checksum: 0xC1A6AF63
	Offset: 0x2100
	Size: 0xF6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8c162ba0(var_8de04fca, var_68253610)
{
	var_5002c793 = function_5e84fc28(var_68253610);
	players = function_c65231e2(var_8de04fca);
	foreach(player in players)
	{
		player function_dc7eaabd(var_5002c793);
		player squads::function_ff3321ee(var_68253610);
	}
	return players.size;
}

/*
	Name: function_344e464d
	Namespace: teams
	Checksum: 0x282A8B27
	Offset: 0x2200
	Size: 0x574
	Parameters: 0
	Flags: None
*/
function function_344e464d()
{
	if(getdvarint(#"hash_761d80face4c4459", 1))
	{
		return;
	}
	customgame = gamemodeismode(1) || gamemodeismode(7);
	if(customgame)
	{
		return;
	}
	distribution = function_7d93567f();
	var_f36ce5dd = function_a119c7ef(distribution);
	/#
		if(level.var_ba13fb7a)
		{
			println("" + "");
			function_a9bfa6d6();
			println("" + "");
		}
	#/
	foreach(team, var_e08edbde in var_f36ce5dd)
	{
		/#
			println("" + team);
		#/
		foreach(var_a787dfe7, var_2a80e9e0 in var_e08edbde)
		{
			foreach(index, squad in var_2a80e9e0)
			{
				if(squad == #"none")
				{
					continue;
				}
				current_count = level.var_704bcca1 - var_a787dfe7;
				while(current_count < level.var_704bcca1)
				{
					var_d28e4159 = function_569914e8(squad, level.var_704bcca1 - current_count, distribution[squad], var_f36ce5dd[team]);
					if(!isdefined(var_d28e4159))
					{
						break;
					}
					var_74578e76 = function_c65231e2(squad);
					var_fd72a4f = function_c65231e2(var_d28e4159);
					/#
						assert((function_c65231e2(squad).size + function_c65231e2(var_d28e4159).size) <= level.var_704bcca1);
					#/
					/#
						println("" + var_f36ce5dd[team].size);
					#/
					foreach(var_1e066fba in var_f36ce5dd[team])
					{
						/#
							println("" + var_1e066fba.size);
						#/
						foreach(remove_index, var_16ba986d in var_1e066fba)
						{
							if(var_16ba986d == var_d28e4159)
							{
								var_1e066fba[remove_index] = #"none";
							}
						}
					}
					current_count = current_count + function_8c162ba0(var_d28e4159, squad);
				}
				var_2a80e9e0[index] = #"none";
			}
		}
	}
	/#
		if(level.var_ba13fb7a)
		{
			println("" + "");
			function_a9bfa6d6();
		}
	#/
}

/*
	Name: function_a9bfa6d6
	Namespace: teams
	Checksum: 0x34000AB2
	Offset: 0x2780
	Size: 0xA0
	Parameters: 0
	Flags: Private
*/
function private function_a9bfa6d6()
{
	/#
		if(level.var_ba13fb7a)
		{
			foreach(team in level.teams)
			{
				self thread function_6c66cc64(team);
			}
		}
	#/
}

/*
	Name: function_2c846a74
	Namespace: teams
	Checksum: 0x4F7F13BB
	Offset: 0x2828
	Size: 0x58
	Parameters: 1
	Flags: None
*/
function function_2c846a74(team)
{
	/#
		team_str = string(team);
		if(isdefined(level.teams[team]))
		{
			team_str = level.teams[team];
		}
		return team_str;
	#/
}

/*
	Name: function_6c66cc64
	Namespace: teams
	Checksum: 0xBBBAF8E1
	Offset: 0x2890
	Size: 0x2B0
	Parameters: 1
	Flags: Private
*/
function private function_6c66cc64(team)
{
	/#
		players = getplayers(team);
		if(players.size == 0)
		{
			return;
		}
		team_str = function_2c846a74(team);
		voip = "";
		if(isdefined(level.var_75dffa9f[team]))
		{
			voip = voip + (level.var_75dffa9f[team] == #"game" ? "" : "");
		}
		else
		{
			voip = voip + "";
		}
		println(((("" + "") + team_str) + "") + voip);
		foreach(player in players)
		{
			squad = player.squad;
			var_bdb3f6a6 = undefined;
			if(squad == #"invalid")
			{
				var_bdb3f6a6 = "";
			}
			else
			{
				if(squad == #"none")
				{
					var_bdb3f6a6 = "";
				}
				else if(isdefined(level.squads[squad]))
				{
					var_bdb3f6a6 = level.squads[squad].name;
				}
			}
			party = player getparty();
			println((((((("" + "") + player.name) + "") + var_bdb3f6a6) + "") + (party.fill ? "" : "") + "") + party.var_a15e4438);
		}
	#/
}

/*
	Name: function_58b6d2c9
	Namespace: teams
	Checksum: 0xCD19F6C3
	Offset: 0x2B48
	Size: 0x43C
	Parameters: 0
	Flags: None
*/
function function_58b6d2c9()
{
	/#
		if(level.multiteam && level.maxteamplayers > 0)
		{
			max_players = player::function_d36b6597();
			players = getplayers();
			foreach(team in level.teams)
			{
				var_dcbb8617 = getplayers(team);
				if(var_dcbb8617.size > max_players)
				{
					var_f554d31e = "";
					foreach(player in var_dcbb8617)
					{
						party = player getparty();
						var_f554d31e = (((var_f554d31e + player.name) + "") + party.party_id) + "";
					}
					/#
						assertmsg(((((((("" + self.name) + "") + (ishash(team) ? function_9e72a96(team) : team) + "") + var_dcbb8617.size) + "") + level.maxteamplayers) + "") + var_f554d31e);
					#/
				}
			}
			if(!level.custommatch)
			{
				foreach(player in players)
				{
					if(player.team == #"spectator")
					{
						continue;
					}
					party = player getparty();
					foreach(var_52ec371a in party.var_d77ed5eb)
					{
						if(var_52ec371a.team == #"spectator")
						{
							continue;
						}
						if(var_52ec371a.team != player.team)
						{
							/#
								assertmsg(((((("" + player.name) + "") + function_9e72a96(player.team) + "") + var_52ec371a.name) + "") + function_9e72a96(var_52ec371a.team) + "");
							#/
						}
					}
				}
			}
		}
	#/
}

/*
	Name: function_1aa0418f
	Namespace: teams
	Checksum: 0xD2F1BFC0
	Offset: 0x2F90
	Size: 0x14C
	Parameters: 0
	Flags: None
*/
function function_1aa0418f()
{
	/#
		while(true)
		{
			wait(3);
			players = getplayers();
			if(players.size > 0 && players[0] isstreamerready())
			{
				setdvar(#"devgui_bot", "");
				wait(3);
				function_344e464d();
				wait(1);
				bots = get_bots();
				foreach(bot in bots)
				{
					level thread bot::remove_bot(bot);
				}
			}
		}
	#/
}

/*
	Name: get_bots
	Namespace: teams
	Checksum: 0xE99143CC
	Offset: 0x30E8
	Size: 0xCA
	Parameters: 0
	Flags: None
*/
function get_bots()
{
	/#
		players = getplayers();
		bots = [];
		foreach(player in players)
		{
			if(isbot(player))
			{
				bots[bots.size] = player;
			}
		}
		return bots;
	#/
}

