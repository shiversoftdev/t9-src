#using script_32c8b5b0eb2854f3;
#using script_47fb62300ac0bd60;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\persistence_shared.gsc;
#using scripts\core_common\spectating.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\globallogic_ui.gsc;
#using scripts\mp_common\util.gsc;

#namespace teams;

/*
	Name: function_61e55cd9
	Namespace: teams
	Checksum: 0xE4C05246
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_61e55cd9()
{
	level notify(1495789993);
}

/*
	Name: function_89f2df9
	Namespace: teams
	Checksum: 0x42102778
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"teams", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: teams
	Checksum: 0xBE197CD7
	Offset: 0x140
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
	Checksum: 0x4A96D4F3
	Offset: 0x198
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
	Checksum: 0x5957D29F
	Offset: 0x360
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_player_connect()
{
	self function_fc746047();
}

/*
	Name: on_free_player_connect
	Namespace: teams
	Checksum: 0x6D6060A
	Offset: 0x388
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
	Checksum: 0x6EF2AB85
	Offset: 0x3B0
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
	Checksum: 0x14EC2734
	Offset: 0x3E0
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
	Checksum: 0x4F94DD8E
	Offset: 0x410
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
	Name: function_fc746047
	Namespace: teams
	Checksum: 0xC2A067DB
	Offset: 0x4E0
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function function_fc746047()
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
	Checksum: 0xFA482878
	Offset: 0x5E0
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
	Checksum: 0x2667EC84
	Offset: 0x658
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
	Checksum: 0x9EE5D7FC
	Offset: 0x6D0
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
					var_f39606bb = self stats::get_stat(#"playerstatslist", #"hash_3a048394c836b4fa", #"statvalue") + time;
					self stats::set_stat(#"playerstatslist", #"hash_3a048394c836b4fa", #"statvalue", var_f39606bb);
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
	Checksum: 0x8091382C
	Offset: 0xB48
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
	Checksum: 0xA42679E9
	Offset: 0xB90
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
	Checksum: 0x1F1384D8
	Offset: 0xC00
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
	Checksum: 0x5D77F981
	Offset: 0xD80
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
	Checksum: 0x3F8E3AD0
	Offset: 0xF00
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
	Checksum: 0x83D4316C
	Offset: 0x1138
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
	Checksum: 0x70496E44
	Offset: 0x11B0
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
	Checksum: 0x202ACD8A
	Offset: 0x1280
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
	Checksum: 0x6061E772
	Offset: 0x13C8
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
	Checksum: 0xF7A61C91
	Offset: 0x14D8
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
	Checksum: 0x47209EFB
	Offset: 0x15B0
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
	Checksum: 0x1D41B890
	Offset: 0x16A8
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
	Checksum: 0xCC0C2F49
	Offset: 0x1728
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
	Checksum: 0x54AD8679
	Offset: 0x1750
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
	Checksum: 0x59F7F857
	Offset: 0x17E0
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
	Checksum: 0xCE00516C
	Offset: 0x1958
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
	Checksum: 0xA6A890A1
	Offset: 0x19C8
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
	Checksum: 0x90E77F3A
	Offset: 0x1A38
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

