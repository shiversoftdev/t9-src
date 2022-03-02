#using script_44b0b8420eabacad;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\cp_common\gametypes\globallogic.gsc;
#using scripts\cp_common\gametypes\globallogic_utils.gsc;
#using scripts\cp_common\util.gsc;

#namespace globallogic_defaults;

/*
	Name: function_ffd68ae5
	Namespace: globallogic_defaults
	Checksum: 0x52979AE0
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ffd68ae5()
{
	level notify(1798844278);
}

/*
	Name: getwinningteamfromloser
	Namespace: globallogic_defaults
	Checksum: 0x49E0888A
	Offset: 0x150
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function getwinningteamfromloser(losing_team)
{
	if(level.multiteam)
	{
		return "tie";
	}
	return util::getotherteam(losing_team);
}

/*
	Name: default_onforfeit
	Namespace: globallogic_defaults
	Checksum: 0xA0E19B81
	Offset: 0x198
	Size: 0x34C
	Parameters: 1
	Flags: Linked
*/
function default_onforfeit(team)
{
	level.gameforfeited = 1;
	level notify(#"hash_7c63ed1f465e8e8e");
	level endon(#"hash_7c63ed1f465e8e8e", #"hash_39a00a79045884ca");
	forfeit_delay = 20;
	announcement(game.strings[#"opponent_forfeiting_in"], forfeit_delay, 0);
	wait(10);
	announcement(game.strings[#"opponent_forfeiting_in"], 10, 0);
	wait(10);
	endreason = #"";
	if(level.multiteam)
	{
		setdvar(#"ui_text_endreason", game.strings[#"other_teams_forfeited"]);
		endreason = game.strings[#"other_teams_forfeited"];
		winner = team;
	}
	else
	{
		if(!isdefined(team))
		{
			setdvar(#"ui_text_endreason", game.strings[#"players_forfeited"]);
			endreason = game.strings[#"players_forfeited"];
			winner = level.players[0];
		}
		else
		{
			if(isdefined(level.teams[team]))
			{
				endreason = game.strings[team + "_forfeited"];
				setdvar(#"ui_text_endreason", endreason);
				winner = getwinningteamfromloser(team);
			}
			else
			{
				/#
					assert(isdefined(team), "");
				#/
				/#
					assert(0, ("" + team) + "");
				#/
				winner = "tie";
			}
		}
	}
	level.forcedend = 1;
	/#
		if(isplayer(winner))
		{
			print(((("" + winner getxuid()) + "") + winner.name) + "");
		}
		else
		{
			globallogic_utils::logteamwinstring("", winner);
		}
	#/
	thread globallogic::endgame();
}

/*
	Name: default_ondeadevent
	Namespace: globallogic_defaults
	Checksum: 0x68CF97FD
	Offset: 0x4F0
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function default_ondeadevent(team)
{
	if(team == "all")
	{
		winner = level.enemy_ai_team;
		globallogic_utils::logteamwinstring("team eliminated", winner);
		thread globallogic::endgame();
	}
	else
	{
		winner = getwinningteamfromloser(team);
		globallogic_utils::logteamwinstring("team eliminated", winner);
		thread globallogic::endgame();
	}
}

/*
	Name: default_onlastteamaliveevent
	Namespace: globallogic_defaults
	Checksum: 0x616D47F4
	Offset: 0x5A0
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function default_onlastteamaliveevent(team)
{
	if(isdefined(level.teams[team]))
	{
		eliminatedstring = game.strings[#"enemies_eliminated"];
		iprintln(eliminatedstring);
		setdvar(#"ui_text_endreason", eliminatedstring);
		winner = globallogic::determineteamwinnerbygamestat("teamScores");
		globallogic_utils::logteamwinstring("team eliminated", winner);
		thread globallogic::endgame();
	}
	else
	{
		setdvar(#"ui_text_endreason", game.strings[#"tie"]);
		globallogic_utils::logteamwinstring("tie");
		if(level.teambased)
		{
			thread globallogic::endgame();
		}
		else
		{
			thread globallogic::endgame();
		}
	}
}

/*
	Name: things_exist_which_could_revive_player
	Namespace: globallogic_defaults
	Checksum: 0x13087B0F
	Offset: 0x708
	Size: 0xE
	Parameters: 1
	Flags: Linked
*/
function things_exist_which_could_revive_player(team)
{
	return false;
}

/*
	Name: team_can_be_revived
	Namespace: globallogic_defaults
	Checksum: 0x8D60871
	Offset: 0x720
	Size: 0xC8
	Parameters: 1
	Flags: Linked
*/
function team_can_be_revived(team)
{
	if(things_exist_which_could_revive_player(team))
	{
		return true;
	}
	if(level.playercount[team] == 1 && function_a1ef346b(team).size == 1)
	{
		/#
			assert(function_a1ef346b(team).size == 1);
		#/
		if(function_a1ef346b(team)[0].lives > 0)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: default_onlaststandevent
	Namespace: globallogic_defaults
	Checksum: 0xD526C663
	Offset: 0x7F0
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function default_onlaststandevent(team)
{
	if(team_can_be_revived(team))
	{
		return;
	}
	if(team == "all")
	{
		thread globallogic::endgame();
	}
	else
	{
		thread globallogic::endgame();
	}
}

/*
	Name: default_onalivecountchange
	Namespace: globallogic_defaults
	Checksum: 0x78404DDA
	Offset: 0x860
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function default_onalivecountchange(team)
{
}

/*
	Name: default_onroundendgame
	Namespace: globallogic_defaults
	Checksum: 0x7DBF8AF1
	Offset: 0x878
	Size: 0x10
	Parameters: 1
	Flags: Linked
*/
function default_onroundendgame(winner)
{
	return winner;
}

/*
	Name: default_ononeleftevent
	Namespace: globallogic_defaults
	Checksum: 0xBB74BA11
	Offset: 0x890
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function default_ononeleftevent(team)
{
}

/*
	Name: default_ontimelimit
	Namespace: globallogic_defaults
	Checksum: 0x40EF4BC2
	Offset: 0x8A8
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function default_ontimelimit()
{
	winner = undefined;
	if(level.teambased)
	{
		winner = globallogic::determineteamwinnerbygamestat("teamScores");
		globallogic_utils::logteamwinstring("time limit", winner);
	}
	else
	{
		/#
			print("" + winner.name);
			print("");
		#/
		if(isdefined(winner))
		{
		}
		else
		{
		}
	}
	setdvar(#"ui_text_endreason", game.strings[#"time_limit_reached"]);
	thread globallogic::endgame();
}

/*
	Name: default_onscorelimit
	Namespace: globallogic_defaults
	Checksum: 0x841A3DF8
	Offset: 0x9A8
	Size: 0x110
	Parameters: 0
	Flags: Linked
*/
function default_onscorelimit()
{
	if(!level.endgameonscorelimit)
	{
		return false;
	}
	winner = undefined;
	if(level.teambased)
	{
		winner = globallogic::determineteamwinnerbygamestat("teamScores");
		globallogic_utils::logteamwinstring("scorelimit", winner);
	}
	else
	{
		/#
			print("" + winner.name);
			print("");
		#/
		if(isdefined(winner))
		{
		}
		else
		{
		}
	}
	setdvar(#"ui_text_endreason", game.strings[#"score_limit_reached"]);
	thread globallogic::endgame();
	return true;
}

/*
	Name: default_onspawnspectator
	Namespace: globallogic_defaults
	Checksum: 0xD83DE3E
	Offset: 0xAC0
	Size: 0x17C
	Parameters: 2
	Flags: Linked
*/
function default_onspawnspectator(origin, angles)
{
	if(isdefined(origin) && isdefined(angles))
	{
		self spawn(origin, angles);
		return;
	}
	spawnpointname = "cp_global_intermission";
	spawnpoints = struct::get_array(spawnpointname, "targetname");
	/#
		assert(spawnpoints.size, ("" + spawnpointname) + "");
	#/
	spawnpoint = spawning::get_spawnpoint_random(spawnpoints);
	/#
		assert(isdefined(spawnpoint.origin), ("" + spawnpointname) + "");
	#/
	/#
		assert(isdefined(spawnpoint.angles), ((("" + spawnpointname) + "") + spawnpoint.origin) + "");
	#/
	self spawn(spawnpoint.origin, spawnpoint.angles);
}

/*
	Name: default_onspawnintermission
	Namespace: globallogic_defaults
	Checksum: 0xE72EC452
	Offset: 0xC48
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function default_onspawnintermission()
{
	spawnpointname = "cp_global_intermission";
	spawnpoints = struct::get_array(spawnpointname, "targetname");
	spawnpoint = spawnpoints[0];
	if(isdefined(spawnpoint))
	{
		self spawn(spawnpoint.origin, spawnpoint.angles);
	}
	else
	{
		/#
			util::error(("" + spawnpointname) + "");
		#/
	}
}

/*
	Name: default_gettimelimit
	Namespace: globallogic_defaults
	Checksum: 0x3F6C97C1
	Offset: 0xD00
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function default_gettimelimit()
{
	var_a25a9aa9 = getgametypesetting(#"timelimit");
	if(!isdefined(var_a25a9aa9))
	{
		var_a25a9aa9 = level.timelimitmax;
	}
	return math::clamp(var_a25a9aa9, level.timelimitmin, level.timelimitmax);
}

/*
	Name: default_getteamkillpenalty
	Namespace: globallogic_defaults
	Checksum: 0xA52C6EC2
	Offset: 0xD78
	Size: 0x26
	Parameters: 4
	Flags: Linked
*/
function default_getteamkillpenalty(einflictor, attacker, smeansofdeath, weapon)
{
	return false;
}

/*
	Name: default_getteamkillscore
	Namespace: globallogic_defaults
	Checksum: 0xCCADB82A
	Offset: 0xDA8
	Size: 0x26
	Parameters: 4
	Flags: Linked
*/
function default_getteamkillscore(einflictor, attacker, smeansofdeath, weapon)
{
	return false;
}

