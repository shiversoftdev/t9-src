#using scripts\mp_common\util.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using script_1cc417743d7c262d;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_7dc3a36c222eaf22;
#using script_44b0b8420eabacad;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using script_32c8b5b0eb2854f3;
#using scripts\core_common\callbacks_shared.gsc;

#namespace globallogic_defaults;

/*
	Name: getwinningteamfromloser
	Namespace: globallogic_defaults
	Checksum: 0xFBD15FC0
	Offset: 0x128
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function getwinningteamfromloser(losing_team)
{
	if(level.multiteam)
	{
		return undefined;
	}
	return util::getotherteam(losing_team);
}

/*
	Name: default_onforfeit
	Namespace: globallogic_defaults
	Checksum: 0x32AF65EC
	Offset: 0x168
	Size: 0x174
	Parameters: 1
	Flags: Linked
*/
function default_onforfeit(params)
{
	level.gameforfeited = 1;
	level notify(#"forfeit in progress");
	level endon(#"forfeit in progress", #"abort forfeit");
	forfeit_delay = 20;
	announcement(game.strings[#"opponent_forfeiting_in"], forfeit_delay, 0);
	wait(10);
	announcement(game.strings[#"opponent_forfeiting_in"], 10, 0);
	wait(10);
	if(!isdefined(params))
	{
		round::set_winner(level.players[0]);
	}
	else if(params.var_6eb69269.size)
	{
		round::set_winner(params.var_6eb69269[0]);
	}
	level.forcedend = 1;
	round::set_flag("force_end");
	thread globallogic::end_round(7);
}

/*
	Name: default_ondeadevent
	Namespace: globallogic_defaults
	Checksum: 0x45DBC7AF
	Offset: 0x2E8
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function default_ondeadevent(team)
{
	var_2e0d5506 = round::get_winner();
	if(isdefined(var_2e0d5506) && var_2e0d5506 != #"none")
	{
		return;
	}
	if(isdefined(level.teams[team]))
	{
		round::set_winner(getwinningteamfromloser(team));
		thread globallogic::end_round(6);
	}
	else
	{
		round::set_flag("tie");
		thread globallogic::end_round(6);
	}
}

/*
	Name: function_dcf41142
	Namespace: globallogic_defaults
	Checksum: 0xF778728B
	Offset: 0x3D0
	Size: 0xDC
	Parameters: 1
	Flags: Linked
*/
function function_dcf41142(params)
{
	/#
		if(getdvarint(#"hash_3b4d2cf24a06392e", 0))
		{
			return;
		}
	#/
	if(gamestate::is_game_over())
	{
		return;
	}
	if(params.teams_alive.size && isdefined(level.teams[params.teams_alive[0]]))
	{
		round::function_af2e264f(params.teams_alive[0]);
	}
	else
	{
		round::set_flag("tie");
	}
	thread globallogic::end_round(6);
}

/*
	Name: function_daa7e9d5
	Namespace: globallogic_defaults
	Checksum: 0x5F8735D5
	Offset: 0x4B8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_daa7e9d5()
{
	level callback::remove_callback(#"on_last_alive", &function_dcf41142);
}

/*
	Name: default_onalivecountchange
	Namespace: globallogic_defaults
	Checksum: 0x5E18351B
	Offset: 0x4F8
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function default_onalivecountchange(team)
{
}

/*
	Name: onendgame
	Namespace: globallogic_defaults
	Checksum: 0x45C040A7
	Offset: 0x510
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function onendgame(var_c1e98979)
{
	if(level.scoreroundwinbased)
	{
		globallogic_score::function_9779ac61();
	}
	match::function_af2e264f(match::function_6d0354e3());
}

/*
	Name: default_ononeleftevent
	Namespace: globallogic_defaults
	Checksum: 0x89DE9924
	Offset: 0x570
	Size: 0x150
	Parameters: 1
	Flags: Linked
*/
function default_ononeleftevent(team)
{
	if(!level.teambased)
	{
		round::set_winner(globallogic_score::gethighestscoringplayer());
		thread globallogic::end_round(6);
	}
	else
	{
		foreach(player in level.players)
		{
			if(!isalive(player))
			{
				continue;
			}
			if(!isdefined(player.pers[#"team"]) || player.pers[#"team"] != team)
			{
				continue;
			}
			player globallogic_audio::leader_dialog_on_player("sudden_death");
		}
	}
}

/*
	Name: default_ontimelimit
	Namespace: globallogic_defaults
	Checksum: 0x72F19319
	Offset: 0x6C8
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function default_ontimelimit()
{
	round::function_870759fb();
	thread globallogic::end_round(2);
}

/*
	Name: default_onscorelimit
	Namespace: globallogic_defaults
	Checksum: 0xF169E9D3
	Offset: 0x700
	Size: 0x48
	Parameters: 0
	Flags: Linked
*/
function default_onscorelimit()
{
	if(!level.endgameonscorelimit)
	{
		return false;
	}
	round::function_870759fb();
	thread globallogic::end_round(3);
	return true;
}

/*
	Name: default_onroundscorelimit
	Namespace: globallogic_defaults
	Checksum: 0x3D0274BF
	Offset: 0x750
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function default_onroundscorelimit()
{
	round::function_870759fb();
	param1 = 4;
	thread globallogic::end_round(param1);
	return true;
}

/*
	Name: function_85d45b4b
	Namespace: globallogic_defaults
	Checksum: 0x483EBBA9
	Offset: 0x798
	Size: 0x74
	Parameters: 2
	Flags: Linked, Private
*/
function private function_85d45b4b(origin, angles)
{
	self spawn(origin, angles);
	if(self.team != #"spectator" && level.var_1ba484ad === 2)
	{
		self namespace_8a203916::function_86df9236();
	}
}

/*
	Name: default_onspawnspectator
	Namespace: globallogic_defaults
	Checksum: 0xFCD22B43
	Offset: 0x818
	Size: 0xD4
	Parameters: 2
	Flags: Linked
*/
function default_onspawnspectator(origin, angles)
{
	if(isdefined(origin) && isdefined(angles))
	{
		self function_85d45b4b(origin, angles);
		return;
	}
	spawnpoints = spawning::get_spawnpoint_array("mp_global_intermission");
	/#
		assert(spawnpoints.size, "");
	#/
	spawnpoint = spawning::get_spawnpoint_random(spawnpoints);
	self function_85d45b4b(spawnpoint.origin, spawnpoint.angles);
}

/*
	Name: default_onspawnintermission
	Namespace: globallogic_defaults
	Checksum: 0x181934FE
	Offset: 0x8F8
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function default_onspawnintermission(endgame)
{
	if(is_true(endgame))
	{
		return;
	}
	spawnpoint = spawning::get_random_intermission_point();
	if(isdefined(spawnpoint))
	{
		self spawn(spawnpoint.origin, spawnpoint.angles);
	}
	else
	{
		/#
			util::error("");
		#/
	}
	self callback::callback(#"hash_3e52a013a2eb0f16");
}

/*
	Name: default_gettimelimit
	Namespace: globallogic_defaults
	Checksum: 0x9CCDADF5
	Offset: 0x9B8
	Size: 0xBA
	Parameters: 0
	Flags: Linked
*/
function default_gettimelimit()
{
	/#
		if((getdvarfloat(#"timelimit_override", -1)) != -1)
		{
			return math::clamp(getdvarfloat(#"timelimit_override", -1), level.timelimitmin, level.timelimitmax);
		}
	#/
	return math::clamp(getgametypesetting(#"timelimit"), level.timelimitmin, level.timelimitmax);
}

/*
	Name: default_getteamkillpenalty
	Namespace: globallogic_defaults
	Checksum: 0x998A58B3
	Offset: 0xA80
	Size: 0xB0
	Parameters: 4
	Flags: Linked
*/
function default_getteamkillpenalty(einflictor, attacker, smeansofdeath, weapon)
{
	teamkill_penalty = 1;
	if(killstreaks::is_killstreak_weapon(weapon))
	{
		teamkill_penalty = teamkill_penalty * killstreaks::get_killstreak_team_kill_penalty_scale(weapon);
	}
	if(isdefined(level.var_17ae20ae) && [[level.var_17ae20ae]](einflictor, attacker, smeansofdeath, weapon))
	{
		teamkill_penalty = teamkill_penalty * level.teamkillpenaltymultiplier;
	}
	return teamkill_penalty;
}

/*
	Name: default_getteamkillscore
	Namespace: globallogic_defaults
	Checksum: 0x23A3B8B9
	Offset: 0xB38
	Size: 0xC2
	Parameters: 4
	Flags: Linked
*/
function default_getteamkillscore(einflictor, attacker, smeansofdeath, weapon)
{
	teamkill_score = attacker rank::getscoreinfovalue("team_kill");
	if(isdefined(level.var_17ae20ae) && [[level.var_17ae20ae]](einflictor, attacker, smeansofdeath, weapon))
	{
		teamkill_score = attacker rank::getscoreinfovalue("kill");
		teamkill_score = teamkill_score * level.teamkillscoremultiplier;
	}
	return int(teamkill_score);
}

/*
	Name: get_alive_players
	Namespace: globallogic_defaults
	Checksum: 0x956E87F6
	Offset: 0xC08
	Size: 0x102
	Parameters: 1
	Flags: None
*/
function get_alive_players(players)
{
	alive_players = [];
	foreach(player in players)
	{
		if(player == self)
		{
			continue;
		}
		if(!isalive(player))
		{
			continue;
		}
		if(!isdefined(alive_players))
		{
			alive_players = [];
		}
		else if(!isarray(alive_players))
		{
			alive_players = array(alive_players);
		}
		alive_players[alive_players.size] = player;
	}
	return alive_players;
}

