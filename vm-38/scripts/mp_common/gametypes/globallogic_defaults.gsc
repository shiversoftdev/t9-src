#using script_1cc417743d7c262d;
#using script_32c8b5b0eb2854f3;
#using script_44b0b8420eabacad;
#using script_68d2ee1489345a1d;
#using script_7dc3a36c222eaf22;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\util.gsc;

#namespace globallogic_defaults;

/*
	Name: function_44cb2ab8
	Namespace: globallogic_defaults
	Checksum: 0x6C82E1CC
	Offset: 0x128
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_44cb2ab8()
{
	level notify(1781239746);
}

/*
	Name: getwinningteamfromloser
	Namespace: globallogic_defaults
	Checksum: 0x474F11BB
	Offset: 0x148
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
	Checksum: 0x65F79335
	Offset: 0x188
	Size: 0x174
	Parameters: 1
	Flags: Linked
*/
function default_onforfeit(params)
{
	level.gameforfeited = 1;
	level notify(#"hash_7c63ed1f465e8e8e");
	level endon(#"hash_7c63ed1f465e8e8e", #"hash_39a00a79045884ca");
	forfeit_delay = 20;
	announcement(game.strings[#"opponent_forfeiting_in"], forfeit_delay, 0);
	wait(10);
	announcement(game.strings[#"opponent_forfeiting_in"], 10, 0);
	wait(10);
	if(!isdefined(params))
	{
		round::function_d1e740f6(level.players[0]);
	}
	else if(params.var_6eb69269.size)
	{
		round::function_d1e740f6(params.var_6eb69269[0]);
	}
	level.forcedend = 1;
	round::set_flag("force_end");
	thread globallogic::end_round(7);
}

/*
	Name: default_ondeadevent
	Namespace: globallogic_defaults
	Checksum: 0xE534327D
	Offset: 0x308
	Size: 0xDC
	Parameters: 1
	Flags: None
*/
function default_ondeadevent(team)
{
	var_2e0d5506 = round::function_9b24638f();
	if(isdefined(var_2e0d5506) && var_2e0d5506 != #"none")
	{
		return;
	}
	if(isdefined(level.teams[team]))
	{
		round::function_d1e740f6(getwinningteamfromloser(team));
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
	Checksum: 0xF765DFAF
	Offset: 0x3F0
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
	Checksum: 0xF839DEA3
	Offset: 0x4D8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_daa7e9d5()
{
	level callback::remove_callback(#"hash_84d8c1164d90313", &function_dcf41142);
}

/*
	Name: default_onalivecountchange
	Namespace: globallogic_defaults
	Checksum: 0xA3E70BC3
	Offset: 0x518
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
	Checksum: 0x10B3AC4D
	Offset: 0x530
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
	Checksum: 0xB4326ECA
	Offset: 0x590
	Size: 0x150
	Parameters: 1
	Flags: Linked
*/
function default_ononeleftevent(team)
{
	if(!level.teambased)
	{
		round::function_d1e740f6(globallogic_score::gethighestscoringplayer());
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
	Checksum: 0xD453E44
	Offset: 0x6E8
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
	Checksum: 0x54270304
	Offset: 0x720
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
	Checksum: 0xF7AEEC66
	Offset: 0x770
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
	Checksum: 0xCDD7CBE0
	Offset: 0x7B8
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
	Checksum: 0xDFD5EF43
	Offset: 0x838
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
	Checksum: 0x3D667828
	Offset: 0x918
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
	Checksum: 0x238003F9
	Offset: 0x9D8
	Size: 0xBA
	Parameters: 0
	Flags: Linked
*/
function default_gettimelimit()
{
	/#
		if((getdvarfloat(#"hash_5424bc2a81bcb188", -1)) != -1)
		{
			return math::clamp(getdvarfloat(#"hash_5424bc2a81bcb188", -1), level.timelimitmin, level.timelimitmax);
		}
	#/
	return math::clamp(getgametypesetting(#"timelimit"), level.timelimitmin, level.timelimitmax);
}

/*
	Name: default_getteamkillpenalty
	Namespace: globallogic_defaults
	Checksum: 0xE30ABFD7
	Offset: 0xAA0
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
	Checksum: 0xF27A69F8
	Offset: 0xB58
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
	Checksum: 0xA92F800D
	Offset: 0xC28
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

