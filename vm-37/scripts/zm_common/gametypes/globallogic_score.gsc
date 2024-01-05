#using scripts\zm_common\util.gsc;
#using scripts\zm_common\bb.gsc;
#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\zm_common\gametypes\globallogic_audio.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\bb_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace globallogic_score;

/*
	Name: gethighestscoringplayer
	Namespace: globallogic_score
	Checksum: 0x6A05040A
	Offset: 0x238
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
	Checksum: 0xB4F0F9C3
	Offset: 0x348
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
	Checksum: 0x9C3BE407
	Offset: 0x380
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
	Checksum: 0x787D8534
	Offset: 0x400
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
	Checksum: 0x6100F599
	Offset: 0x458
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
	Checksum: 0xBD1E0DD5
	Offset: 0x650
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
	Checksum: 0x134AA09C
	Offset: 0x6B0
	Size: 0x382
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
	var_10d67c1a = {#delta:var_89b2d9e4, #player:victim.name, #type:(ishash(player) ? player : hash(player))};
	if(var_89b2d9e4 && !level.gameended && isdefined(label))
	{
		if(isactor(descvalue))
		{
			var_66c1748e = descvalue function_7f0363e8(1);
		}
		else
		{
			if(ishash(descvalue.var_c7e611ea))
			{
				var_66c1748e = descvalue.var_c7e611ea;
			}
			else if(ishash(descvalue.var_66c1748e))
			{
				var_66c1748e = descvalue.var_66c1748e;
			}
		}
		var_3fb48d9c = isdefined(var_dbaa74e2) && is_true(var_dbaa74e2.var_3fb48d9c);
		if(ishash(var_66c1748e))
		{
			victim luinotifyevent(#"score_event", 5, label, var_89b2d9e4, var_66c1748e, -1, var_3fb48d9c);
		}
		else
		{
			victim luinotifyevent(#"score_event", 5, label, var_89b2d9e4, #"", -1, var_3fb48d9c);
		}
	}
	self function_3172cf59(victim, newscore, level.weaponnone, var_10d67c1a);
	victim.objscore = victim.score_total;
	return var_89b2d9e4;
}

/*
	Name: giveplayerscore
	Namespace: globallogic_score
	Checksum: 0xCF2A515E
	Offset: 0xA40
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
	Checksum: 0xF4934B9
	Offset: 0xAA8
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
	Checksum: 0x8DCDB239
	Offset: 0xB98
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
		if(!isdefined(newscore.pers[#"scoreeventcache"]))
		{
			newscore.pers[#"scoreeventcache"] = [];
		}
		if(!isdefined(newscore.pers[#"scoreeventcache"][event]))
		{
			newscore.pers[#"scoreeventcache"][event] = 1;
		}
		else
		{
			newscore.pers[#"scoreeventcache"][event] = newscore.pers[#"scoreeventcache"][event] + 1;
		}
	}
	if(scorediff <= 0)
	{
		pixendevent();
		return;
	}
	recordplayerstats(newscore, "score", weapon);
	newscore stats::function_bb7eedf0(#"score", scorediff);
	newscore stats::function_bb7eedf0(#"score_core", scorediff);
	newscore.score_total = newscore.score_total + scorediff;
	pixendevent();
}

/*
	Name: _setplayerscore
	Namespace: globallogic_score
	Checksum: 0xAC36757E
	Offset: 0xD98
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
	Checksum: 0xB125DC2C
	Offset: 0xE80
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
	Checksum: 0xECF2D31A
	Offset: 0xEB0
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
	Checksum: 0x8C5FD2CA
	Offset: 0xFA8
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
	Checksum: 0x81F99F48
	Offset: 0x10C8
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
	zmteamscores = {#score:newscore, #diff:newscore - teamscore, #team:victim, #event:player, #gametime:function_f8d53445()};
	function_92d1707f(#"hash_6823717ff11a304a", zmteamscores);
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
	Checksum: 0x7274041A
	Offset: 0x1248
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
	Checksum: 0x86A36D19
	Offset: 0x1300
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
	Checksum: 0x3049F8FE
	Offset: 0x1388
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
	Checksum: 0x40964EC0
	Offset: 0x1460
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
	Checksum: 0xA7DED2B1
	Offset: 0x1490
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
	Checksum: 0x3874893E
	Offset: 0x1530
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
	Checksum: 0xAD9FBDE3
	Offset: 0x1590
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
	Checksum: 0x61D5577B
	Offset: 0x1620
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
	Checksum: 0x47E84877
	Offset: 0x1650
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
	Checksum: 0x3B97B5FD
	Offset: 0x1748
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
	Checksum: 0xD105753A
	Offset: 0x1800
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
	Checksum: 0x88CDC3D
	Offset: 0x1AB0
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
	Checksum: 0x4E3A6526
	Offset: 0x1BA0
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
	Checksum: 0xE5F68F09
	Offset: 0x1BC0
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
	Checksum: 0xD5CE171E
	Offset: 0x1CB0
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
	Checksum: 0x1946A98C
	Offset: 0x1D00
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
	Checksum: 0xE72D51D
	Offset: 0x1D90
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
	Checksum: 0xD622E560
	Offset: 0x20C0
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
	Checksum: 0x89B4C5F7
	Offset: 0x2410
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
	Checksum: 0x4EA92177
	Offset: 0x2420
	Size: 0x168
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
	Checksum: 0xD5558077
	Offset: 0x2590
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
	Checksum: 0x4549365E
	Offset: 0x25E8
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
	Checksum: 0x3275323A
	Offset: 0x2748
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
	Checksum: 0x229E1E03
	Offset: 0x2868
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

