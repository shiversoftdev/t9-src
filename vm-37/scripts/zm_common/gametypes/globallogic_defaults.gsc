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
	Name: getwinningteamfromloser
	Namespace: globallogic_defaults
	Checksum: 0x82005BD6
	Offset: 0x138
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
	Checksum: 0x838DA0BF
	Offset: 0x180
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
	Checksum: 0x2AEF2745
	Offset: 0x478
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
	Checksum: 0x1A0650BE
	Offset: 0x640
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
	Checksum: 0xBB5399F4
	Offset: 0x658
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
	Checksum: 0x4195E79A
	Offset: 0x670
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
	Checksum: 0x26B8E2C5
	Offset: 0x7D0
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
	Checksum: 0x23BE869A
	Offset: 0x900
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
	Checksum: 0x5E712C72
	Offset: 0xA48
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
	Checksum: 0xB1C03380
	Offset: 0xB40
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
	Checksum: 0x9A48E910
	Offset: 0xBF8
	Size: 0x42
	Parameters: 0
	Flags: Linked
*/
function default_gettimelimit()
{
	return math::clamp(getgametypesetting(#"timelimit"), level.timelimitmin, level.timelimitmax);
}

