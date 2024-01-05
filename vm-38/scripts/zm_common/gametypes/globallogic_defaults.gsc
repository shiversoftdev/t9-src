#using scripts\zm_common\util.gsc;
#using scripts\zm_common\gametypes\spawnlogic.gsc;
#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\zm_common\gametypes\globallogic_score.gsc;
#using scripts\zm_common\gametypes\globallogic_audio.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace globallogic_defaults;

/*
	Name: function_beeb818c
	Namespace: globallogic_defaults
	Checksum: 0xECAF7B52
	Offset: 0x138
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_beeb818c()
{
	level notify(287903164);
}

/*
	Name: getwinningteamfromloser
	Namespace: globallogic_defaults
	Checksum: 0xC38E3696
	Offset: 0x158
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
	Checksum: 0x4463F151
	Offset: 0x1A0
	Size: 0x2EC
	Parameters: 1
	Flags: Linked
*/
function default_onforfeit(team)
{
	level.gameforfeited = 1;
	level notify(#"forfeit in progress");
	level endon(#"forfeit in progress");
	level endon(#"abort forfeit");
	forfeit_delay = 20;
	announcement(game.strings[#"opponent_forfeiting_in"], forfeit_delay, 0);
	wait(10);
	announcement(game.strings[#"opponent_forfeiting_in"], 10, 0);
	wait(10);
	endreason = #"";
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
	thread globallogic::endgame(winner, endreason);
}

/*
	Name: default_ondeadevent
	Namespace: globallogic_defaults
	Checksum: 0xF3713669
	Offset: 0x498
	Size: 0x1BC
	Parameters: 1
	Flags: Linked
*/
function default_ondeadevent(team)
{
	level callback::callback(#"on_team_eliminated", team);
	if(isdefined(level.teams[team]))
	{
		eliminatedstring = game.strings[team + "_eliminated"];
		iprintln(eliminatedstring);
		setdvar(#"ui_text_endreason", eliminatedstring);
		winner = getwinningteamfromloser(team);
		globallogic_utils::logteamwinstring("team eliminated", winner);
		thread globallogic::endgame(winner, eliminatedstring);
	}
	else
	{
		setdvar(#"ui_text_endreason", game.strings[#"tie"]);
		globallogic_utils::logteamwinstring("tie");
		if(level.teambased)
		{
			thread globallogic::endgame("tie", game.strings[#"tie"]);
		}
		else
		{
			thread globallogic::endgame(undefined, game.strings[#"tie"]);
		}
	}
}

/*
	Name: default_onalivecountchange
	Namespace: globallogic_defaults
	Checksum: 0x9A7D7FA4
	Offset: 0x660
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
	Checksum: 0xD881AE18
	Offset: 0x678
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
	Checksum: 0xF70C6ACF
	Offset: 0x690
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function default_ononeleftevent(team)
{
	if(!level.teambased)
	{
		winner = globallogic_score::gethighestscoringplayer();
		/#
			if(isdefined(winner))
			{
				print("" + winner.name);
			}
			else
			{
				print("");
			}
		#/
		thread globallogic::endgame(winner, #"mp_enemies_eliminated");
	}
	else
	{
		for(index = 0; index < level.players.size; index++)
		{
			player = level.players[index];
			if(!isalive(player))
			{
				continue;
			}
			if(!isdefined(player.pers[#"team"]) || player.pers[#"team"] != team)
			{
				continue;
			}
		}
	}
}

/*
	Name: default_ontimelimit
	Namespace: globallogic_defaults
	Checksum: 0x14E8C91A
	Offset: 0x7F0
	Size: 0x124
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
		winner = globallogic_score::gethighestscoringplayer();
		/#
			if(isdefined(winner))
			{
				print("" + winner.name);
			}
			else
			{
				print("");
			}
		#/
	}
	setdvar(#"ui_text_endreason", game.strings[#"time_limit_reached"]);
	thread globallogic::endgame(winner, game.strings[#"time_limit_reached"]);
}

/*
	Name: default_onscorelimit
	Namespace: globallogic_defaults
	Checksum: 0x8A73B771
	Offset: 0x920
	Size: 0x140
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
		winner = globallogic_score::gethighestscoringplayer();
		/#
			if(isdefined(winner))
			{
				print("" + winner.name);
			}
			else
			{
				print("");
			}
		#/
	}
	setdvar(#"ui_text_endreason", game.strings[#"score_limit_reached"]);
	thread globallogic::endgame(winner, game.strings[#"score_limit_reached"]);
	return true;
}

/*
	Name: default_onspawnspectator
	Namespace: globallogic_defaults
	Checksum: 0x7A5D791A
	Offset: 0xA68
	Size: 0xEC
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
	spawnpointname = "mp_global_intermission";
	spawnpoints = getentarray(spawnpointname, "classname");
	/#
		assert(spawnpoints.size, "");
	#/
	spawnpoint = spawnlogic::getspawnpoint_random(spawnpoints);
	self spawn(spawnpoint.origin, spawnpoint.angles);
}

/*
	Name: default_onspawnintermission
	Namespace: globallogic_defaults
	Checksum: 0xD9775483
	Offset: 0xB60
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function default_onspawnintermission()
{
	spawnpointname = "mp_global_intermission";
	spawnpoints = getentarray(spawnpointname, "classname");
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
	Checksum: 0xE5807B11
	Offset: 0xC18
	Size: 0x62
	Parameters: 0
	Flags: Linked
*/
function default_gettimelimit()
{
	timelimit = getgametypesetting(#"timelimit");
	if(!isdefined(timelimit))
	{
		timelimit = 0;
	}
	return math::clamp(timelimit, level.timelimitmin, level.timelimitmax);
}

