#using script_3f9e0dc8454d98e1;
#using script_47fb62300ac0bd60;
#using scripts\core_common\bb_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\bb.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\zm_common\gametypes\globallogic_audio.gsc;
#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\zm_common\util.gsc;

#namespace globallogic_score;

/*
	Name: function_f7b5c3ce
	Namespace: globallogic_score
	Checksum: 0xB8565C89
	Offset: 0x238
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f7b5c3ce()
{
	level notify(1455474369);
}

/*
	Name: gethighestscoringplayer
	Namespace: globallogic_score
	Checksum: 0x40EAC549
	Offset: 0x258
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function gethighestscoringplayer()
{
	players = level.players;
	winner = undefined;
	tie = 0;
	for(i = 0; i < players.size; i++)
	{
		if(!isdefined(players[i].score))
		{
			continue;
		}
		if(players[i].score < 1)
		{
			continue;
		}
		if(!isdefined(winner) || players[i].score > winner.score)
		{
			winner = players[i];
			tie = 0;
			continue;
		}
		if(players[i].score == winner.score)
		{
			tie = 1;
		}
	}
	if(tie || !isdefined(winner))
	{
		return undefined;
	}
	return winner;
}

/*
	Name: resetscorechain
	Namespace: globallogic_score
	Checksum: 0x5AC37E5C
	Offset: 0x368
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function resetscorechain()
{
	self notify(#"reset_score_chain");
	self.scorechain = 0;
	self.rankupdatetotal = 0;
}

/*
	Name: scorechaintimer
	Namespace: globallogic_score
	Checksum: 0x3F567851
	Offset: 0x3A0
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function scorechaintimer()
{
	self notify(#"score_chain_timer");
	self endon(#"reset_score_chain", #"score_chain_timer", #"death", #"disconnect");
	wait(20);
	self thread resetscorechain();
}

/*
	Name: roundtonearestfive
	Namespace: globallogic_score
	Checksum: 0x5B2A7ED9
	Offset: 0x420
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function roundtonearestfive(score)
{
	rounding = score % 5;
	if(rounding <= 2)
	{
		return score - rounding;
	}
	return score + (5 - rounding);
}

/*
	Name: giveplayermomentumnotification
	Namespace: globallogic_score
	Checksum: 0x32FB1CD9
	Offset: 0x478
	Size: 0x1EC
	Parameters: 4
	Flags: None
*/
function giveplayermomentumnotification(score, label, descvalue, countstowardrampage)
{
	rampagebonus = 0;
	if(isdefined(level.usingrampage) && level.usingrampage)
	{
		if(countstowardrampage)
		{
			if(!isdefined(self.scorechain))
			{
				self.scorechain = 0;
			}
			self.scorechain++;
			self thread scorechaintimer();
		}
		if(isdefined(self.scorechain) && self.scorechain >= 999)
		{
			rampagebonus = roundtonearestfive(int((label * level.rampagebonusscale) + 0.5));
		}
	}
	combat_efficiency_factor = 0;
	if(label != 0)
	{
		self luinotifyevent(#"score_event", 4, descvalue, label, rampagebonus, combat_efficiency_factor);
	}
	label = label + rampagebonus;
	if(label > 0 && self hasperk(#"specialty_earnmoremomentum"))
	{
		label = roundtonearestfive(int((label * getdvarfloat(#"perk_killstreakmomentummultiplier", 0)) + 0.5));
	}
	_setplayermomentum(self, self.pers[#"momentum"] + label);
}

/*
	Name: resetplayermomentumondeath
	Namespace: globallogic_score
	Checksum: 0x4B57B36D
	Offset: 0x670
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function resetplayermomentumondeath()
{
	if(isdefined(level.usingscorestreaks) && level.usingscorestreaks)
	{
		_setplayermomentum(self, 0);
		self thread resetscorechain();
	}
}

/*
	Name: function_144d0392
	Namespace: globallogic_score
	Checksum: 0xB2E0459A
	Offset: 0x6D0
	Size: 0x3A2
	Parameters: 5
	Flags: Linked
*/
function function_144d0392(event, player, victim, descvalue, var_dbaa74e2)
{
	score = victim rank::getscoreinfovalue(player);
	/#
		assert(isdefined(score));
	#/
	xp = victim rank::getscoreinfoxp(player);
	/#
		assert(isdefined(xp));
	#/
	label = rank::getscoreinfolabel(player);
	var_b393387d = victim.pers[#"score"];
	pixbeginevent();
	[[level.onplayerscore]](player, victim, descvalue);
	newscore = victim.pers[#"score"];
	pixendevent();
	var_89b2d9e4 = newscore - var_b393387d;
	var_10d67c1a = {#delta:var_89b2d9e4, #player:victim.name, #type:(function_7a600918(player) ? player : hash(player))};
	if(var_89b2d9e4 && !level.gameended && isdefined(label))
	{
		if(isdefined(descvalue.var_14e19734))
		{
			var_66c1748e = descvalue.var_14e19734;
		}
		else
		{
			if(isactor(descvalue))
			{
				var_66c1748e = descvalue function_7f0363e8(1);
			}
			else
			{
				if(function_7a600918(descvalue.var_c7e611ea))
				{
					var_66c1748e = descvalue.var_c7e611ea;
				}
				else if(function_7a600918(descvalue.var_66c1748e))
				{
					var_66c1748e = descvalue.var_66c1748e;
				}
			}
		}
		var_3fb48d9c = isdefined(var_dbaa74e2) && is_true(var_dbaa74e2.var_3fb48d9c);
		if(function_7a600918(var_66c1748e))
		{
			victim luinotifyevent(#"score_event", 5, label, var_89b2d9e4, var_66c1748e, -1, var_3fb48d9c);
		}
		else
		{
			victim luinotifyevent(#"score_event", 5, label, var_89b2d9e4, #"", -1, var_3fb48d9c);
		}
	}
	self function_3172cf59(victim, newscore, level.weaponnone, var_10d67c1a);
	victim.var_f22ee5e = victim.score_total;
	return var_89b2d9e4;
}

/*
	Name: giveplayerscore
	Namespace: globallogic_score
	Checksum: 0xC1E142EC
	Offset: 0xA80
	Size: 0x5A
	Parameters: 7
	Flags: Linked
*/
function giveplayerscore(event, player, victim, descvalue, weapon, var_36f23f1f, var_dbaa74e2)
{
	return function_144d0392(victim, descvalue, weapon, var_36f23f1f, var_dbaa74e2);
}

/*
	Name: default_onplayerscore
	Namespace: globallogic_score
	Checksum: 0xA725ED5C
	Offset: 0xAE8
	Size: 0xE4
	Parameters: 3
	Flags: Linked
*/
function default_onplayerscore(event, player, victim)
{
	score = rank::getscoreinfovalue(player);
	var_a08ade2e = zombie_utility::function_6403cf83(#"zombie_point_scalar", victim.team);
	score = int(score * var_a08ade2e);
	/#
		assert(isdefined(score));
	#/
	_setplayerscore(victim, victim.pers[#"score"] + score);
}

/*
	Name: function_3172cf59
	Namespace: globallogic_score
	Checksum: 0x54C6D349
	Offset: 0xBD8
	Size: 0x1F8
	Parameters: 4
	Flags: Linked
*/
function function_3172cf59(player, newscore, weapon, var_10d67c1a)
{
	newscore endon(#"disconnect");
	pixbeginevent();
	event = var_10d67c1a.type;
	scorediff = var_10d67c1a.delta;
	newscore bb::add_to_stat("score", var_10d67c1a.delta);
	if(!isbot(newscore))
	{
		if(!isdefined(newscore.pers[#"hash_f9d3527022e8383"]))
		{
			newscore.pers[#"hash_f9d3527022e8383"] = [];
		}
		if(!isdefined(newscore.pers[#"hash_f9d3527022e8383"][event]))
		{
			newscore.pers[#"hash_f9d3527022e8383"][event] = 1;
		}
		else
		{
			newscore.pers[#"hash_f9d3527022e8383"][event] = newscore.pers[#"hash_f9d3527022e8383"][event] + 1;
		}
	}
	if(scorediff <= 0)
	{
		pixendevent();
		return;
	}
	recordplayerstats(newscore, "score", weapon);
	newscore stats::function_bb7eedf0(#"score", scorediff);
	newscore stats::function_bb7eedf0(#"hash_2b53b624764a0a41", scorediff);
	newscore.score_total = newscore.score_total + scorediff;
	pixendevent();
}

/*
	Name: _setplayerscore
	Namespace: globallogic_score
	Checksum: 0x949272CE
	Offset: 0xDD8
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function _setplayerscore(player, score)
{
	if(score == player.pers[#"score"])
	{
		return;
	}
	player.pers[#"score"] = score;
	player.score = player.pers[#"score"];
	recordplayerstats(player, "score", player.pers[#"score"]);
	player notify(#"update_playerscore_hud");
	player thread globallogic::checkscorelimit();
	player thread globallogic::checkplayerscorelimitsoon();
}

/*
	Name: _getplayerscore
	Namespace: globallogic_score
	Checksum: 0xFBDBED5D
	Offset: 0xEC0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function _getplayerscore(player)
{
	return player.pers[#"score"];
}

/*
	Name: _setplayermomentum
	Namespace: globallogic_score
	Checksum: 0xC20C6200
	Offset: 0xEF0
	Size: 0xEE
	Parameters: 2
	Flags: Linked
*/
function _setplayermomentum(player, momentum)
{
	momentum = math::clamp(momentum, 0, getdvarint(#"hash_6cc2b9f9d4cbe073", 2000));
	oldmomentum = player.pers[#"momentum"];
	if(momentum == oldmomentum)
	{
		return;
	}
	player bb::add_to_stat("momentum", momentum - oldmomentum);
	player.pers[#"momentum"] = momentum;
	player.momentum = player.pers[#"momentum"];
}

/*
	Name: setplayermomentumdebug
	Namespace: globallogic_score
	Checksum: 0x2A07845C
	Offset: 0xFE8
	Size: 0x118
	Parameters: 0
	Flags: None
*/
function setplayermomentumdebug()
{
	/#
		setdvar(#"sv_momentumpercent", 0);
		while(true)
		{
			wait(1);
			var_2227c36c = getdvarfloat(#"sv_momentumpercent", 0);
			if(var_2227c36c != 0)
			{
				player = util::gethostplayer();
				if(!isdefined(player))
				{
					return;
				}
				if(isdefined(player.killstreak))
				{
					_setplayermomentum(player, int(getdvarint(#"hash_6cc2b9f9d4cbe073", 2000) * (var_2227c36c / 100)));
				}
			}
		}
	#/
}

/*
	Name: giveteamscore
	Namespace: globallogic_score
	Checksum: 0x3AD25B26
	Offset: 0x1108
	Size: 0x174
	Parameters: 4
	Flags: Linked
*/
function giveteamscore(event, team, player, victim)
{
	if(level.overrideteamscore)
	{
		return;
	}
	pixbeginevent();
	teamscore = game.stat[#"teamscores"][victim];
	[[level.onteamscore]](player, victim);
	pixendevent();
	newscore = game.stat[#"teamscores"][victim];
	var_c5fef2b3 = {#score:newscore, #diff:newscore - teamscore, #team:victim, #event:player, #gametime:function_f8d53445()};
	function_92d1707f(#"hash_6823717ff11a304a", var_c5fef2b3);
	if(teamscore == newscore)
	{
		return;
	}
	updateteamscores(victim);
	thread globallogic::checkscorelimit();
}

/*
	Name: giveteamscoreforobjective
	Namespace: globallogic_score
	Checksum: 0x99CF6466
	Offset: 0x1288
	Size: 0xAC
	Parameters: 2
	Flags: None
*/
function giveteamscoreforobjective(team, score)
{
	teamscore = game.stat[#"teamscores"][team];
	onteamscore(score, team);
	newscore = game.stat[#"teamscores"][team];
	if(teamscore == newscore)
	{
		return;
	}
	updateteamscores(team);
	thread globallogic::checkscorelimit();
}

/*
	Name: _setteamscore
	Namespace: globallogic_score
	Checksum: 0xB8A39CC9
	Offset: 0x1340
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function _setteamscore(team, teamscore)
{
	if(teamscore == game.stat[#"teamscores"][team])
	{
		return;
	}
	game.stat[#"teamscores"][team] = teamscore;
	updateteamscores(team);
	thread globallogic::checkscorelimit();
}

/*
	Name: resetteamscores
	Namespace: globallogic_score
	Checksum: 0xCFCC161E
	Offset: 0x13C8
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function resetteamscores()
{
	if(level.scoreroundwinbased || util::isfirstround())
	{
		foreach(team, _ in level.teams)
		{
			game.stat[#"teamscores"][team] = 0;
		}
	}
	updateallteamscores();
}

/*
	Name: resetallscores
	Namespace: globallogic_score
	Checksum: 0x5FBEC374
	Offset: 0x14A0
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function resetallscores()
{
	resetteamscores();
	resetplayerscores();
}

/*
	Name: resetplayerscores
	Namespace: globallogic_score
	Checksum: 0x61C3FEBF
	Offset: 0x14D0
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function resetplayerscores()
{
	players = level.players;
	winner = undefined;
	tie = 0;
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i].pers[#"score"]))
		{
			_setplayerscore(players[i], 0);
		}
	}
}

/*
	Name: updateteamscores
	Namespace: globallogic_score
	Checksum: 0x7515AD91
	Offset: 0x1570
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function updateteamscores(team)
{
	setteamscore(team, game.stat[#"teamscores"][team]);
	level thread globallogic::checkteamscorelimitsoon(team);
}

/*
	Name: updateallteamscores
	Namespace: globallogic_score
	Checksum: 0xCFA7E78F
	Offset: 0x15D0
	Size: 0x88
	Parameters: 0
	Flags: Linked
*/
function updateallteamscores()
{
	foreach(_ in level.teams)
	{
		updateteamscores(team);
	}
}

/*
	Name: _getteamscore
	Namespace: globallogic_score
	Checksum: 0xE628B39C
	Offset: 0x1660
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function _getteamscore(team)
{
	return game.stat[#"teamscores"][team];
}

/*
	Name: gethighestteamscoreteam
	Namespace: globallogic_score
	Checksum: 0x37D39234
	Offset: 0x1690
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function gethighestteamscoreteam()
{
	score = 0;
	winning_teams = [];
	foreach(team, _ in level.teams)
	{
		team_score = game.stat[#"teamscores"][team];
		if(team_score > score)
		{
			score = team_score;
			winning_teams = [];
		}
		if(team_score == score)
		{
			winning_teams[team] = team;
		}
	}
	return winning_teams;
}

/*
	Name: areteamarraysequal
	Namespace: globallogic_score
	Checksum: 0x85922646
	Offset: 0x1788
	Size: 0xAA
	Parameters: 2
	Flags: Linked
*/
function areteamarraysequal(teamsa, teamsb)
{
	if(teamsa.size != teamsb.size)
	{
		return false;
	}
	foreach(team in teamsa)
	{
		if(!isdefined(teamsb[team]))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: onteamscore
	Namespace: globallogic_score
	Checksum: 0x3BF3C97
	Offset: 0x1840
	Size: 0x2A8
	Parameters: 2
	Flags: Linked
*/
function onteamscore(score, team)
{
	game.stat[#"teamscores"][team] = game.stat[#"teamscores"][team] + score;
	if(level.scorelimit && game.stat[#"teamscores"][team] > level.scorelimit)
	{
		game.stat[#"teamscores"][team] = level.scorelimit;
	}
	if(level.splitscreen)
	{
		return;
	}
	if(level.scorelimit == 1)
	{
		return;
	}
	iswinning = gethighestteamscoreteam();
	if(iswinning.size == 0)
	{
		return;
	}
	if(gettime() - level.laststatustime < 5000)
	{
		return;
	}
	if(areteamarraysequal(iswinning, level.waswinning))
	{
		return;
	}
	level.laststatustime = gettime();
	if(iswinning.size == 1)
	{
		foreach(team in iswinning)
		{
			if(isdefined(level.waswinning[team]))
			{
				if(level.waswinning.size == 1)
				{
					continue;
				}
			}
		}
	}
	if(level.waswinning.size == 1)
	{
		foreach(team in level.waswinning)
		{
			if(isdefined(iswinning[team]))
			{
				if(iswinning.size == 1)
				{
					continue;
				}
				if(level.waswinning.size > 1)
				{
					continue;
				}
			}
		}
	}
	level.waswinning = iswinning;
}

/*
	Name: initpersstat
	Namespace: globallogic_score
	Checksum: 0x20593322
	Offset: 0x1AF0
	Size: 0xE8
	Parameters: 3
	Flags: Linked
*/
function initpersstat(dataname, record_stats, init_to_stat_value)
{
	if(!isdefined(self.pers[dataname]))
	{
		self.pers[dataname] = 0;
	}
	if(!isdefined(record_stats) || record_stats == 1)
	{
		recordplayerstats(self, dataname, int(self.pers[dataname]));
	}
	if(isdefined(init_to_stat_value) && init_to_stat_value == 1)
	{
		self.pers[dataname] = self stats::get_stat(#"playerstatslist", dataname, #"statvalue");
	}
}

/*
	Name: getpersstat
	Namespace: globallogic_score
	Checksum: 0x660A4947
	Offset: 0x1BE0
	Size: 0x18
	Parameters: 1
	Flags: Linked
*/
function getpersstat(dataname)
{
	return self.pers[dataname];
}

/*
	Name: incpersstat
	Namespace: globallogic_score
	Checksum: 0x309F6704
	Offset: 0x1C00
	Size: 0xE6
	Parameters: 4
	Flags: Linked
*/
function incpersstat(dataname, increment, record_stats, includegametype)
{
	pixbeginevent();
	/#
		/#
			assert(isdefined(self.pers[increment]), function_9e72a96(increment) + "");
		#/
	#/
	self.pers[increment] = self.pers[increment] + record_stats;
	self stats::function_dad108fa(increment, record_stats);
	if(!isdefined(includegametype) || includegametype == 1)
	{
		self thread threadedrecordplayerstats(increment);
	}
	pixendevent();
}

/*
	Name: threadedrecordplayerstats
	Namespace: globallogic_score
	Checksum: 0x61E90494
	Offset: 0x1CF0
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function threadedrecordplayerstats(dataname)
{
	self endon(#"disconnect");
	waittillframeend();
	recordplayerstats(self, dataname, self.pers[dataname]);
}

/*
	Name: inckillstreaktracker
	Namespace: globallogic_score
	Checksum: 0xE6A68AA0
	Offset: 0x1D40
	Size: 0x86
	Parameters: 1
	Flags: None
*/
function inckillstreaktracker(weapon)
{
	self endon(#"disconnect");
	waittillframeend();
	if(weapon.name == #"artillery")
	{
		self.pers[#"artillery_kills"]++;
	}
	if(weapon.name == #"dog_bite")
	{
		self.pers[#"dog_kills"]++;
	}
}

/*
	Name: trackattackerkill
	Namespace: globallogic_score
	Checksum: 0x5954FFF6
	Offset: 0x1DD0
	Size: 0x326
	Parameters: 5
	Flags: None
*/
function trackattackerkill(name, rank, xp, prestige, xuid)
{
	self endon(#"disconnect");
	attacker = self;
	waittillframeend();
	pixbeginevent();
	if(!isdefined(attacker.pers[#"killed_players"][name]))
	{
		attacker.pers[#"killed_players"][name] = 0;
	}
	if(!isdefined(attacker.killedplayerscurrent[name]))
	{
		attacker.killedplayerscurrent[name] = 0;
	}
	if(!isdefined(attacker.pers[#"nemesis_tracking"][name]))
	{
		attacker.pers[#"nemesis_tracking"][name] = 0;
	}
	attacker.pers[#"killed_players"][name]++;
	attacker.killedplayerscurrent[name]++;
	attacker.pers[#"nemesis_tracking"][name] = attacker.pers[#"nemesis_tracking"][name] + 1;
	if(attacker.pers[#"nemesis_name"] == name)
	{
		attacker challenges::killednemesis();
	}
	if(attacker.pers[#"nemesis_name"] == "" || attacker.pers[#"nemesis_tracking"][name] > attacker.pers[#"nemesis_tracking"][attacker.pers[#"nemesis_name"]])
	{
		attacker.pers[#"nemesis_name"] = name;
		attacker.pers[#"nemesis_rank"] = rank;
		attacker.pers[#"nemesis_rankicon"] = prestige;
		attacker.pers[#"nemesis_xp"] = xp;
		attacker.pers[#"nemesis_xuid"] = xuid;
	}
	else if(isdefined(attacker.pers[#"nemesis_name"]) && attacker.pers[#"nemesis_name"] == name)
	{
		attacker.pers[#"nemesis_rank"] = rank;
		attacker.pers[#"nemesis_xp"] = xp;
	}
	pixendevent();
}

/*
	Name: trackattackeedeath
	Namespace: globallogic_score
	Checksum: 0x79361F4
	Offset: 0x2100
	Size: 0x346
	Parameters: 5
	Flags: None
*/
function trackattackeedeath(attackername, rank, xp, prestige, xuid)
{
	self endon(#"disconnect");
	waittillframeend();
	pixbeginevent();
	if(!isdefined(self.pers[#"killed_by"][attackername]))
	{
		self.pers[#"killed_by"][attackername] = 0;
	}
	self.pers[#"killed_by"][attackername]++;
	if(!isdefined(self.pers[#"nemesis_tracking"][attackername]))
	{
		self.pers[#"nemesis_tracking"][attackername] = 0;
	}
	self.pers[#"nemesis_tracking"][attackername] = self.pers[#"nemesis_tracking"][attackername] + 1.5;
	if(self.pers[#"nemesis_name"] == "" || self.pers[#"nemesis_tracking"][attackername] > self.pers[#"nemesis_tracking"][self.pers[#"nemesis_name"]])
	{
		self.pers[#"nemesis_name"] = attackername;
		self.pers[#"nemesis_rank"] = rank;
		self.pers[#"nemesis_rankicon"] = prestige;
		self.pers[#"nemesis_xp"] = xp;
		self.pers[#"nemesis_xuid"] = xuid;
	}
	else if(isdefined(self.pers[#"nemesis_name"]) && self.pers[#"nemesis_name"] == attackername)
	{
		self.pers[#"nemesis_rank"] = rank;
		self.pers[#"nemesis_xp"] = xp;
	}
	if(self.pers[#"nemesis_name"] == attackername && self.pers[#"nemesis_tracking"][attackername] >= 2)
	{
		self setclientuivisibilityflag("killcam_nemesis", 1);
	}
	else
	{
		self setclientuivisibilityflag("killcam_nemesis", 0);
	}
	pixendevent();
}

/*
	Name: default_iskillboosting
	Namespace: globallogic_score
	Checksum: 0xE5AC9F28
	Offset: 0x2450
	Size: 0x6
	Parameters: 0
	Flags: Linked
*/
function default_iskillboosting()
{
	return false;
}

/*
	Name: givekillstats
	Namespace: globallogic_score
	Checksum: 0x37370F9C
	Offset: 0x2460
	Size: 0x190
	Parameters: 3
	Flags: None
*/
function givekillstats(smeansofdeath, weapon, evictim)
{
	self endon(#"disconnect");
	waittillframeend();
	if(level.rankedmatch && self [[level.iskillboosting]]())
	{
		/#
			self iprintlnbold("");
		#/
		return;
	}
	pixbeginevent();
	self incpersstat(#"kills", 1, 1, 1);
	self.kills = self getpersstat(#"kills");
	self.var_3f62a666 = self getpersstat(#"hash_7472529eae501802");
	self updatestatratio("kdratio", "kills", "deaths");
	attacker = self;
	if(evictim == "MOD_HEAD_SHOT")
	{
		attacker thread incpersstat(#"headshots", 1, 1, 0);
		attacker.headshots = attacker.pers[#"headshots"];
	}
	pixendevent();
}

/*
	Name: inctotalkills
	Namespace: globallogic_score
	Checksum: 0xB6F15916
	Offset: 0x25F8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function inctotalkills(team)
{
	if(level.teambased && isdefined(level.teams[team]))
	{
		game.totalkillsteam[team]++;
	}
	game.totalkills++;
}

/*
	Name: setinflictorstat
	Namespace: globallogic_score
	Checksum: 0x5F414A55
	Offset: 0x2650
	Size: 0x154
	Parameters: 3
	Flags: None
*/
function setinflictorstat(einflictor, eattacker, weapon)
{
	if(!isdefined(eattacker))
	{
		return;
	}
	if(!isdefined(einflictor))
	{
		eattacker stats::function_e24eec31(weapon, #"hits", 1);
		return;
	}
	if(!isdefined(einflictor.playeraffectedarray))
	{
		einflictor.playeraffectedarray = [];
	}
	foundnewplayer = 1;
	for(i = 0; i < einflictor.playeraffectedarray.size; i++)
	{
		if(einflictor.playeraffectedarray[i] == self)
		{
			foundnewplayer = 0;
			break;
		}
	}
	if(foundnewplayer)
	{
		einflictor.playeraffectedarray[einflictor.playeraffectedarray.size] = self;
		if(weapon == "concussion_grenade" || weapon == "tabun_gas")
		{
			eattacker stats::function_e24eec31(weapon, #"used", 1);
		}
		eattacker stats::function_e24eec31(weapon, #"hits", 1);
	}
}

/*
	Name: processshieldassist
	Namespace: globallogic_score
	Checksum: 0xF438F680
	Offset: 0x27B0
	Size: 0x112
	Parameters: 1
	Flags: None
*/
function processshieldassist(killedplayer)
{
	self endon(#"disconnect");
	killedplayer endon(#"disconnect");
	waitframe(1);
	util::waittillslowprocessallowed();
	if(!isdefined(level.teams[self.pers[#"team"]]))
	{
		return;
	}
	if(self.pers[#"team"] == killedplayer.pers[#"team"])
	{
		return;
	}
	if(!level.teambased)
	{
		return;
	}
	self incpersstat(#"assists", 1, 1, 1);
	self.assists = self getpersstat(#"assists");
}

/*
	Name: processassist
	Namespace: globallogic_score
	Checksum: 0x91ECA7D8
	Offset: 0x28D0
	Size: 0x27C
	Parameters: 4
	Flags: None
*/
function processassist(killedplayer, damagedone, weapon, assist_level)
{
	if(!isdefined(assist_level))
	{
		assist_level = undefined;
	}
	self endon(#"disconnect");
	killedplayer endon(#"disconnect");
	waitframe(1);
	util::waittillslowprocessallowed();
	if(!isdefined(level.teams[self.pers[#"team"]]))
	{
		return;
	}
	if(self.pers[#"team"] == killedplayer.pers[#"team"])
	{
		return;
	}
	if(!level.teambased)
	{
		return;
	}
	assist_level = "assist";
	assist_level_value = int(ceil(damagedone / 25));
	if(assist_level_value < 1)
	{
		assist_level_value = 1;
	}
	else if(assist_level_value > 3)
	{
		assist_level_value = 3;
	}
	assist_level = (assist_level + "_") + (assist_level_value * 25);
	self incpersstat(#"assists", 1, 1, 1);
	self.assists = self getpersstat(#"assists");
	switch(weapon.name)
	{
		case "concussion_grenade":
		{
			assist_level = "assist_concussion";
			break;
		}
		case "flash_grenade":
		{
			assist_level = "assist_flash";
			break;
		}
		case "emp_grenade":
		{
			assist_level = "assist_emp";
			break;
		}
		case "proximity_grenade":
		case "proximity_grenade_aoe":
		{
			assist_level = "assist_proximity";
			break;
		}
	}
	self challenges::assisted();
}

