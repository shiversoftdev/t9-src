#using scripts\mp_common\util.gsc;
#using scripts\mp_common\gametypes\globallogic_ui.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spectating.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\persistence_shared.gsc;
#using script_32c8b5b0eb2854f3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace teams;

/*
	Name: __init__system__
	Namespace: teams
	Checksum: 0xEA7EFA03
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"teams", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: teams
	Checksum: 0xC3B25286
	Offset: 0x120
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
	level.getenemyteam = &getenemyteam;
	level.use_team_based_logic_for_locking_on = 1;
}

/*
	Name: init
	Namespace: teams
	Checksum: 0xE5F31F09
	Offset: 0x178
	Size: 0x1BC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	game.strings[#"autobalance"] = #"hash_3e1f31b57ad2d3d9";
	level.teambalance = getdvarint(#"scr_teambalance", 0);
	level.teambalancetimer = 0;
	level.timeplayedcap = getdvarint(#"scr_timeplayedcap", 1800);
	level.freeplayers = [];
	if(level.teambased)
	{
		level.alliesplayers = [];
		level.axisplayers = [];
		callback::on_connect(&on_player_connect);
		callback::on_joined_team(&on_joined_team);
		callback::on_joined_spectate(&on_joined_spectators);
		level thread update_balance_dvar();
		wait(0.15);
		level thread update_player_times();
		level thread function_badbaae6();
	}
	else
	{
		callback::on_connect(&on_free_player_connect);
		wait(0.15);
		level thread update_player_times();
	}
}

/*
	Name: on_player_connect
	Namespace: teams
	Checksum: 0x97B6DA31
	Offset: 0x340
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self init_played_time();
}

/*
	Name: on_free_player_connect
	Namespace: teams
	Checksum: 0x65D077EA
	Offset: 0x368
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_free_player_connect()
{
	self thread track_free_played_time();
}

/*
	Name: on_joined_team
	Namespace: teams
	Checksum: 0xD59570F0
	Offset: 0x390
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function on_joined_team(params)
{
	self update_time();
}

/*
	Name: on_joined_spectators
	Namespace: teams
	Checksum: 0x7A115BCD
	Offset: 0x3C0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function on_joined_spectators(params)
{
	self.pers[#"teamtime"] = undefined;
}

/*
	Name: function_45721cef
	Namespace: teams
	Checksum: 0x9EC7CF0E
	Offset: 0x3F0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_45721cef()
{
	foreach(team, _ in level.teams)
	{
		if(!isdefined(game.migratedhost))
		{
			game.stat[#"teamscores"][team] = 0;
		}
		game.teamsuddendeath[team] = 0;
		game.totalkillsteam[team] = 0;
	}
}

/*
	Name: init_played_time
	Namespace: teams
	Checksum: 0x17594B36
	Offset: 0x4C0
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function init_played_time()
{
	if(!isdefined(self.pers[#"totaltimeplayed"]))
	{
		self.pers[#"totaltimeplayed"] = 0;
	}
	self.timeplayed[#"other"] = 0;
	self.timeplayed[#"alive"] = 0;
	if(!isdefined(self.timeplayed[#"total"]) || (!(level.gametype == "twar" && 0 < game.roundsplayed && 0 < self.timeplayed[#"total"])))
	{
		self.timeplayed[#"total"] = 0;
	}
}

/*
	Name: function_badbaae6
	Namespace: teams
	Checksum: 0x3C4DB2C2
	Offset: 0x5C0
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function function_badbaae6()
{
	level endon(#"game_ended");
	while(level.inprematchperiod)
	{
		waitframe(1);
	}
	for(;;)
	{
		if(game.state == #"playing")
		{
			function_351a57a9();
		}
		wait(1);
	}
}

/*
	Name: update_player_times
	Namespace: teams
	Checksum: 0x8FC84747
	Offset: 0x638
	Size: 0x70
	Parameters: 0
	Flags: Linked
*/
function update_player_times()
{
	nexttoupdate = 0;
	for(;;)
	{
		nexttoupdate++;
		if(nexttoupdate >= level.players.size)
		{
			nexttoupdate = 0;
		}
		if(isdefined(level.players[nexttoupdate]))
		{
			level.players[nexttoupdate] update_played_time();
		}
		wait(1);
	}
}

/*
	Name: update_played_time
	Namespace: teams
	Checksum: 0xE33A864D
	Offset: 0x6B0
	Size: 0x46C
	Parameters: 0
	Flags: Linked
*/
function update_played_time()
{
	pixbeginevent();
	foreach(team, str_team in level.teams)
	{
		if(isdefined(self.timeplayed[team]) && self.timeplayed[team])
		{
			time = int(min(self.timeplayed[team], level.timeplayedcap));
			if(sessionmodeismultiplayergame())
			{
				if(level.teambased)
				{
					self stats::function_dad108fa(#"time_played_" + str_team, time);
				}
				if(is_true(level.hardcoremode))
				{
					hc_time_played = self stats::get_stat(#"playerstatslist", #"hc_time_played", #"statvalue") + time;
					self stats::set_stat(#"playerstatslist", #"hc_time_played", #"statvalue", hc_time_played);
				}
			}
			self stats::function_bb7eedf0(#"time_played_total", time);
		}
	}
	if(self.timeplayed[#"other"])
	{
		time = int(min(self.timeplayed[#"other"], level.timeplayedcap));
		self stats::function_dad108fa(#"time_played_other", time);
		self stats::function_bb7eedf0(#"time_played_other", time);
	}
	if(self.timeplayed[#"alive"])
	{
		timealive = int(min(self.timeplayed[#"alive"], level.timeplayedcap));
		self stats::function_dad108fa(#"time_played_alive", timealive);
	}
	timealive = int(min(self.timeplayed[#"alive"], level.timeplayedcap));
	self.pers[#"time_played_alive"] = self.pers[#"time_played_alive"] + timealive;
	pixendevent();
	foreach(team, _ in level.teams)
	{
		if(isdefined(self.timeplayed[team]))
		{
			self.timeplayed[team] = 0;
		}
	}
	self.timeplayed[#"other"] = 0;
	self.timeplayed[#"alive"] = 0;
}

/*
	Name: update_time
	Namespace: teams
	Checksum: 0xD126CEEB
	Offset: 0xB28
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function update_time()
{
	if(game.state != #"playing")
	{
		return;
	}
	self.pers[#"teamtime"] = gettime();
}

/*
	Name: update_balance_dvar
	Namespace: teams
	Checksum: 0x20DCD7F0
	Offset: 0xB70
	Size: 0x66
	Parameters: 0
	Flags: Linked
*/
function update_balance_dvar()
{
	for(;;)
	{
		level.teambalance = getdvarint(#"scr_teambalance", 0);
		level.timeplayedcap = getdvarint(#"scr_timeplayedcap", 1800);
		wait(1);
	}
}

/*
	Name: change
	Namespace: teams
	Checksum: 0xCB6D1C1D
	Offset: 0xBE0
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function change(team)
{
	if(self.sessionstate != "dead")
	{
		self.switching_teams = 1;
		self.switchedteamsresetgadgets = 1;
		self.joining_team = team;
		self.leaving_team = self.pers[#"team"];
		self suicide();
	}
	self.pers[#"team"] = team;
	self.team = team;
	self.pers[#"spawnweapon"] = undefined;
	self.pers[#"savedmodel"] = undefined;
	self.pers[#"teamtime"] = undefined;
	self.sessionteam = self.pers[#"team"];
	self globallogic_ui::updateobjectivetext();
	self spectating::set_permissions();
	self openmenu(game.menu[#"menu_start_menu"]);
	self notify(#"end_respawn");
}

/*
	Name: count_players
	Namespace: teams
	Checksum: 0xC9CAF701
	Offset: 0xD60
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function count_players()
{
	players = level.players;
	playercounts = [];
	foreach(team, _ in level.teams)
	{
		playercounts[team] = 0;
	}
	foreach(player in level.players)
	{
		if(player == self)
		{
			continue;
		}
		team = player.pers[#"team"];
		if(isdefined(team) && isdefined(level.teams[team]))
		{
			playercounts[team]++;
		}
	}
	return playercounts;
}

/*
	Name: track_free_played_time
	Namespace: teams
	Checksum: 0xBFBD277F
	Offset: 0xEE0
	Size: 0x22C
	Parameters: 0
	Flags: Linked
*/
function track_free_played_time()
{
	self endon(#"disconnect");
	if(!isdefined(self.timeplayed))
	{
		self.timeplayed = [];
	}
	foreach(team, _ in level.teams)
	{
		if(isdefined(self.timeplayed[team]))
		{
			self.timeplayed[team] = 0;
		}
	}
	self.timeplayed[#"other"] = 0;
	self.timeplayed[#"total"] = 0;
	self.timeplayed[#"alive"] = 0;
	for(;;)
	{
		if(game.state == #"playing")
		{
			team = self.pers[#"team"];
			if(isdefined(team) && isdefined(level.teams[team]) && self.sessionteam != #"spectator")
			{
				if(!isdefined(self.timeplayed[team]))
				{
					self.timeplayed[team] = 0;
				}
				self.timeplayed[team]++;
				self.timeplayed[#"total"]++;
				if(isalive(self))
				{
					self.timeplayed[#"alive"]++;
				}
			}
			else
			{
				self.timeplayed[#"other"]++;
			}
		}
		wait(1);
	}
}

/*
	Name: getteamindex
	Namespace: teams
	Checksum: 0x3075CC0
	Offset: 0x1118
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function getteamindex(team)
{
	if(!isdefined(team))
	{
		return 0;
	}
	if(team == #"none")
	{
		return 0;
	}
	if(team == #"allies")
	{
		return 1;
	}
	if(team == #"axis")
	{
		return 2;
	}
	return 0;
}

/*
	Name: getenemyteam
	Namespace: teams
	Checksum: 0xB90A62D4
	Offset: 0x1190
	Size: 0xC2
	Parameters: 1
	Flags: Linked
*/
function getenemyteam(player_team)
{
	foreach(team, _ in level.teams)
	{
		if(team == player_team)
		{
			continue;
		}
		if(team == #"spectator")
		{
			continue;
		}
		return team;
	}
	return util::getotherteam(player_team);
}

/*
	Name: getenemyplayers
	Namespace: teams
	Checksum: 0x862EDD81
	Offset: 0x1260
	Size: 0x13A
	Parameters: 0
	Flags: Linked
*/
function getenemyplayers()
{
	enemies = [];
	foreach(player in level.players)
	{
		if(player.team == #"spectator")
		{
			continue;
		}
		if(level.teambased && player util::isenemyteam(self.team) || (!level.teambased && player != self))
		{
			if(!isdefined(enemies))
			{
				enemies = [];
			}
			else if(!isarray(enemies))
			{
				enemies = array(enemies);
			}
			enemies[enemies.size] = player;
		}
	}
	return enemies;
}

/*
	Name: getfriendlyplayers
	Namespace: teams
	Checksum: 0x88E8B565
	Offset: 0x13A8
	Size: 0x102
	Parameters: 0
	Flags: None
*/
function getfriendlyplayers()
{
	friendlies = [];
	foreach(player in level.players)
	{
		if(!player util::isenemyteam(self.team) && player != self)
		{
			if(!isdefined(friendlies))
			{
				friendlies = [];
			}
			else if(!isarray(friendlies))
			{
				friendlies = array(friendlies);
			}
			friendlies[friendlies.size] = player;
		}
	}
	return friendlies;
}

/*
	Name: waituntilteamchange
	Namespace: teams
	Checksum: 0xD135071E
	Offset: 0x14B8
	Size: 0xCA
	Parameters: 6
	Flags: None
*/
function waituntilteamchange(player, callback, arg, end_condition1, end_condition2, end_condition3)
{
	if(isdefined(end_condition1))
	{
		self endon(end_condition1);
	}
	if(isdefined(end_condition2))
	{
		self endon(end_condition2);
	}
	if(isdefined(end_condition3))
	{
		self endon(end_condition3);
	}
	event = undefined;
	event = player waittill(#"joined_team", #"disconnect", #"joined_spectators");
	if(isdefined(callback))
	{
		self [[callback]](arg, event);
	}
}

/*
	Name: waituntilteamchangesingleton
	Namespace: teams
	Checksum: 0xDAEB61B8
	Offset: 0x1590
	Size: 0xEA
	Parameters: 7
	Flags: Linked
*/
function waituntilteamchangesingleton(player, singletonstring, callback, arg, end_condition1, end_condition2, end_condition3)
{
	self notify(singletonstring);
	self endon(singletonstring);
	if(isdefined(end_condition1))
	{
		self endon(end_condition1);
	}
	if(isdefined(end_condition2))
	{
		self endon(end_condition2);
	}
	if(isdefined(end_condition3))
	{
		self endon(end_condition3);
	}
	event = undefined;
	event = player waittill(#"joined_team", #"disconnect", #"joined_spectators");
	if(isdefined(callback))
	{
		self thread [[callback]](arg, event);
	}
}

/*
	Name: hidetosameteam
	Namespace: teams
	Checksum: 0x39405DCA
	Offset: 0x1688
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function hidetosameteam()
{
	if(isdefined(self))
	{
		if(level.teambased)
		{
			self setvisibletoallexceptteam(self.team);
		}
		else
		{
			self setvisibletoall();
			if(isdefined(self.owner))
			{
				self setinvisibletoplayer(self.owner);
			}
		}
	}
}

/*
	Name: function_9dd75dad
	Namespace: teams
	Checksum: 0xDFF7C1C1
	Offset: 0x1708
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_9dd75dad(team)
{
	return level.everexisted[team];
}

/*
	Name: is_all_dead
	Namespace: teams
	Checksum: 0x302F62B2
	Offset: 0x1730
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function is_all_dead(team)
{
	if(level.numteamlives > 0 && !level.spawnsystem.var_c2cc011f && game.lives[team] > 0)
	{
		return false;
	}
	if(level.playerlives[team])
	{
		return false;
	}
	if(function_a1ef346b(team).size)
	{
		return false;
	}
	return true;
}

/*
	Name: function_596bfb16
	Namespace: teams
	Checksum: 0x64A4D1F3
	Offset: 0x17C0
	Size: 0x170
	Parameters: 0
	Flags: Linked
*/
function function_596bfb16()
{
	foreach(team, _ in level.teams)
	{
		if(function_a1ef346b(team).size)
		{
			game.everexisted[team] = 1;
			level.var_4ad4bec3 = 1;
			if(level.everexisted[team] == 0)
			{
				level.everexisted[team] = gettime();
			}
		}
	}
	/#
		if(getdvarint(#"hash_79f55d595a926104", 0))
		{
			foreach(team, _ in level.teams)
			{
				game.everexisted[team] = 0;
				level.everexisted[team] = 0;
			}
		}
	#/
}

/*
	Name: get_flag_model
	Namespace: teams
	Checksum: 0xEC282810
	Offset: 0x1938
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function get_flag_model(teamref)
{
	/#
		assert(isdefined(game.flagmodels));
	#/
	/#
		assert(isdefined(game.flagmodels[teamref]));
	#/
	return game.flagmodels[teamref];
}

/*
	Name: get_flag_carry_model
	Namespace: teams
	Checksum: 0x7EBC5260
	Offset: 0x19A8
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function get_flag_carry_model(teamref)
{
	/#
		assert(isdefined(game.carry_flagmodels));
	#/
	/#
		assert(isdefined(game.carry_flagmodels[teamref]));
	#/
	return game.carry_flagmodels[teamref];
}

/*
	Name: get_flag_icon
	Namespace: teams
	Checksum: 0x192BBA14
	Offset: 0x1A18
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function get_flag_icon(teamref)
{
	/#
		assert(isdefined(game.carry_icon));
	#/
	/#
		assert(isdefined(game.carry_icon[teamref]));
	#/
	return game.carry_icon[teamref];
}

