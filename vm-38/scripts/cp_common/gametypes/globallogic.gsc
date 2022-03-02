#using script_32399001bdb550da;
#using script_44b0b8420eabacad;
#using script_47fb62300ac0bd60;
#using script_70a43d6ba27cff6a;
#using script_7bafaa95bb1b427e;
#using scripts\core_common\bb_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\gametype_shared.gsc;
#using scripts\core_common\healthoverlay.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\persistence_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spectating.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\cp_common\bb.gsc;
#using scripts\cp_common\callbacks.gsc;
#using scripts\cp_common\challenges.gsc;
#using scripts\cp_common\gametypes\battlechatter.gsc;
#using scripts\cp_common\gametypes\deathicons.gsc;
#using scripts\cp_common\gametypes\dev.gsc;
#using scripts\cp_common\gametypes\globallogic_defaults.gsc;
#using scripts\cp_common\gametypes\globallogic_player.gsc;
#using scripts\cp_common\gametypes\globallogic_spawn.gsc;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using scripts\cp_common\gametypes\globallogic_utils.gsc;
#using scripts\cp_common\gametypes\loadout.gsc;
#using scripts\cp_common\gametypes\menus.gsc;
#using scripts\cp_common\gametypes\serversettings.gsc;
#using scripts\cp_common\gametypes\shellshock.gsc;
#using scripts\cp_common\load.gsc;
#using scripts\cp_common\rat.gsc;
#using scripts\cp_common\util.gsc;

#namespace globallogic;

/*
	Name: function_b8ef4f02
	Namespace: globallogic
	Checksum: 0xF8F0A0C3
	Offset: 0x678
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b8ef4f02()
{
	level notify(1508041232);
}

/*
	Name: function_89f2df9
	Namespace: globallogic
	Checksum: 0x65E101DA
	Offset: 0x698
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"globallogic", &function_70a657d8, undefined, undefined, #"visionset_mgr");
}

/*
	Name: function_70a657d8
	Namespace: globallogic
	Checksum: 0x70989F56
	Offset: 0x6E8
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	visionset_mgr::register_info("visionset", "crithealth", 1, 4, 25, 1, &visionset_mgr::ramp_in_out_thread_per_player, 0);
}

/*
	Name: init
	Namespace: globallogic
	Checksum: 0xE69339F5
	Offset: 0x738
	Size: 0x9E4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.splitscreen = issplitscreen();
	level.xenon = getdvarstring(#"xenongame") == "true";
	level.ps3 = getdvarstring(#"ps3game") == "true";
	level.wiiu = getdvarstring(#"wiiugame") == "true";
	level.orbis = getdvarstring(#"orbisgame") == "true";
	level.durango = getdvarstring(#"durangogame") == "true";
	level.console = getdvarstring(#"consolegame") == "true";
	level.onlinegame = sessionmodeisonlinegame();
	level.systemlink = sessionmodeissystemlink();
	level.rankedmatch = gamemodeisusingxp();
	level.leaguematch = 0;
	level.arenamatch = 0;
	level.contractsenabled = !getgametypesetting(#"disablecontracts");
	level.new_health_model = getdvarint(#"new_health_model", 1) > 0;
	level.contractsenabled = 0;
	/#
		if(getdvarint(#"scr_forcerankedmatch", 0) == 1)
		{
			level.rankedmatch = 1;
		}
	#/
	level.script = util::function_53bbf9d2();
	level.gametype = util::function_5df4294();
	level.var_837aa533 = hash(level.gametype);
	if(isdefined(level.gametype))
	{
		level.var_12323003 = function_16495154(level.var_837aa533);
		level.basegametype = function_be90acca(level.var_837aa533);
	}
	level.teambased = 0;
	level.teamcount = getgametypesetting(#"teamcount");
	level.multiteam = level.teamcount > 2;
	level.enemy_ai_team_index = level.teamcount + 1;
	if(2 == level.enemy_ai_team_index)
	{
		level.enemy_ai_team = #"axis";
	}
	else
	{
		level.enemy_ai_team = "team" + level.enemy_ai_team_index;
	}
	gametype::init();
	level.teams = [];
	level.teamindex = [];
	level.playerteams = [];
	teamcount = level.teamcount;
	level.playerteams[#"allies"] = #"allies";
	level.playerteams[#"axis"] = #"axis";
	level.teams[#"allies"] = "allies";
	level.teams[#"axis"] = "axis";
	level.teams[#"team3"] = "team3";
	level.teamindex[#"neutral"] = 0;
	level.teamindex[#"allies"] = 1;
	level.teamindex[#"axis"] = 2;
	for(teamindex = 3; teamindex <= teamcount; teamindex++)
	{
		level.teams[hash("team" + teamindex)] = "team" + teamindex;
		level.teamindex[hash("team" + teamindex)] = teamindex;
	}
	level.overrideteamscore = 0;
	level.overrideplayerscore = 0;
	level.displayhalftimetext = 0;
	level.displayroundendtext = 1;
	level.endgameonscorelimit = 1;
	level.endgameontimelimit = 1;
	level.cumulativeroundscores = 1;
	level.scoreroundwinbased = 0;
	level.resetplayerscoreeveryround = 0;
	level.gameforfeited = 0;
	level.forceautoassign = 0;
	level.halftimetype = "halftime";
	level.halftimesubcaption = #"hash_54b0f0ec952ddba8";
	level.laststatustime = 0;
	level.waswinning = [];
	level.lastslowprocessframe = 0;
	level.placement = [];
	foreach(team, _ in level.teams)
	{
		level.placement[team] = [];
	}
	level.placement[#"all"] = [];
	level.postroundtime = 7;
	level.inovertime = 0;
	level.var_6cc58e4b = 1;
	level.defaultoffenseradius = 560;
	level.dropteam = getdvarint(#"sv_maxclients", 0);
	globallogic_ui::init();
	registerdvars();
	level.oldschool = getdvarint(#"scr_oldschool", 0) == 1;
	if(level.oldschool)
	{
		/#
			print("");
		#/
		setdvar(#"jump_height", 64);
		setdvar(#"jump_slowdownenable", 0);
		setdvar(#"bg_falldamageminheight", 256);
		setdvar(#"bg_falldamagemaxheight", 512);
		setdvar(#"player_clipsizemultiplier", 2);
	}
	precache_mp_leaderboards();
	if(!isdefined(game.tiebreaker))
	{
		game.tiebreaker = 0;
	}
	if(!isdefined(game.stat))
	{
		game.stat = [];
	}
	level.disablechallenges = 0;
	if(level.leaguematch || getdvarint(#"scr_disablechallenges", 0) > 0)
	{
		level.disablechallenges = 1;
	}
	level.disablestattracking = getdvarint(#"scr_disablestattracking", 0) > 0;
	level thread setupcallbacks();
	level.figure_out_attacker = &globallogic_player::figureoutattacker;
	level.figure_out_friendly_fire = &globallogic_player::figureoutfriendlyfire;
	/#
		level.updateteamstatus = &updateteamstatus;
	#/
}

/*
	Name: registerdvars
	Namespace: globallogic
	Checksum: 0x8DBE8093
	Offset: 0x1128
	Size: 0x204
	Parameters: 0
	Flags: Linked
*/
function registerdvars()
{
	if(getdvarstring(#"scr_oldschool") == "")
	{
		setdvar(#"scr_oldschool", 0);
	}
	if(getdvarstring(#"ui_guncycle") == "")
	{
		setdvar(#"ui_guncycle", 0);
	}
	if(getdvarstring(#"ui_weapon_tiers") == "")
	{
		setdvar(#"ui_weapon_tiers", 0);
	}
	setdvar(#"ui_text_endreason", "");
	setmatchflag("bomb_timer", 0);
	level.vehicledamagescalar = getdvarfloat(#"scr_vehicle_damage_scalar", 1);
	level.fire_audio_repeat_duration = getdvarint(#"fire_audio_repeat_duration", 0);
	level.fire_audio_random_max_duration = getdvarint(#"fire_audio_random_max_duration", 0);
	setdvar(#"g_customteamname_allies", "");
	setdvar(#"g_customteamname_axis", "");
}

/*
	Name: blank
	Namespace: globallogic
	Checksum: 0x19B548B2
	Offset: 0x1338
	Size: 0x54
	Parameters: 10
	Flags: Linked
*/
function blank(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
{
}

/*
	Name: setupcallbacks
	Namespace: globallogic
	Checksum: 0xC369DEBE
	Offset: 0x1398
	Size: 0x39C
	Parameters: 0
	Flags: Linked
*/
function setupcallbacks()
{
	level.spawnplayer = &globallogic_spawn::spawnplayer;
	level.spawnplayerprediction = &blank;
	level.spawnclient = &globallogic_spawn::spawnclient;
	level.spawnspectator = &globallogic_spawn::spawnspectator;
	level.spawnintermission = &globallogic_spawn::spawnintermission;
	level.wavespawntimer = &wavespawntimer;
	level.spawnmessage = &globallogic_spawn::default_spawnmessage;
	level.onspawnplayer = &blank;
	level.onspawnplayerunified = &blank;
	level.onspawnspectator = &globallogic_defaults::default_onspawnspectator;
	level.onspawnintermission = &globallogic_defaults::default_onspawnintermission;
	level.onrespawndelay = &blank;
	level.onforfeit = &globallogic_defaults::default_onforfeit;
	level.ontimelimit = &globallogic_defaults::default_ontimelimit;
	level.onscorelimit = &globallogic_defaults::default_onscorelimit;
	level.onalivecountchange = &globallogic_defaults::default_onalivecountchange;
	level.ondeadevent = &globallogic_defaults::default_ondeadevent;
	level.ononeleftevent = &globallogic_defaults::default_ononeleftevent;
	level.onlastteamaliveevent = &globallogic_defaults::default_onlastteamaliveevent;
	level.gettimepassed = &globallogic_utils::gettimepassed;
	level.gettimeremaining = &globallogic_utils::gettimeremaining;
	level.gettimelimit = &globallogic_defaults::default_gettimelimit;
	level.getteamkillpenalty = &globallogic_defaults::default_getteamkillpenalty;
	level.getteamkillscore = &globallogic_defaults::default_getteamkillscore;
	level.onprecachegametype = &blank;
	level.onstartgametype = &blank;
	level.onplayerconnect = &blank;
	level.onplayerdisconnect = &blank;
	level.onplayerdamage = &blank;
	level.onplayerkilled = &blank;
	level.onplayerkilledextraunthreadedcbs = [];
	level.onteamoutcomenotify = &blank;
	level.onoutcomenotify = &blank;
	level.onendgame = &blank;
	level.onroundendgame = &globallogic_defaults::default_onroundendgame;
	level.onmedalawarded = &blank;
	level.var_df67ea13 = &blank;
	globallogic_ui::setupcallbacks();
	callback::function_8a0395cd(&function_8a0395cd);
}

/*
	Name: function_8a0395cd
	Namespace: globallogic
	Checksum: 0x60D06FF3
	Offset: 0x1740
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_8a0395cd(params)
{
	self notify(#"hash_72a5fe161eb7a0ce", params);
}

/*
	Name: precache_mp_leaderboards
	Namespace: globallogic
	Checksum: 0x7CECF73B
	Offset: 0x1768
	Size: 0x23C
	Parameters: 0
	Flags: Linked
*/
function precache_mp_leaderboards()
{
	if(sessionmodeiszombiesgame())
	{
		return;
	}
	if(!level.rankedmatch)
	{
		return;
	}
	if(is_true(level.var_1238b6e0))
	{
		return;
	}
	mapname = util::function_53bbf9d2();
	globalleaderboards = "LB_MP_GB_XPPRESTIGE LB_MP_GB_SCORE LB_MP_GB_KDRATIO LB_MP_GB_KILLS LB_MP_GB_WINS LB_MP_GB_DEATHS LB_MP_GB_XPMAXPERGAME LB_MP_GB_TACTICALINSERTS LB_MP_GB_TACTICALINSERTSKILLS LB_MP_GB_PRESTIGEXP LB_MP_GB_HEADSHOTS LB_MP_GB_WEAPONS_PRIMARY LB_MP_GB_WEAPONS_SECONDARY";
	careerleaderboard = "";
	switch(level.gametype)
	{
		case "sas":
		case "oic":
		case "shrp":
		case "gun":
		{
			break;
		}
		default:
		{
			careerleaderboard = " LB_MP_GB_SCOREPERMINUTE";
			break;
		}
	}
	gamemodeleaderboard = " LB_MP_GM_" + level.gametype;
	gamemodeleaderboardext = (" LB_MP_GM_" + level.gametype) + "_EXT";
	gamemodehcleaderboard = "";
	gamemodehcleaderboardext = "";
	hardcoremode = getgametypesetting(#"hardcoremode");
	if(isdefined(hardcoremode) && hardcoremode)
	{
		gamemodehcleaderboard = gamemodeleaderboard + "_HC";
		gamemodehcleaderboardext = gamemodeleaderboardext + "_HC";
	}
	mapleaderboard = " LB_MP_MAP_" + getsubstr(mapname, 3, mapname.size);
	precacheleaderboards((((((globalleaderboards + careerleaderboard) + gamemodeleaderboard) + gamemodeleaderboardext) + gamemodehcleaderboard) + gamemodehcleaderboardext) + mapleaderboard);
}

/*
	Name: compareteambygamestat
	Namespace: globallogic
	Checksum: 0x3AB2B935
	Offset: 0x19B0
	Size: 0xEE
	Parameters: 4
	Flags: Linked
*/
function compareteambygamestat(gamestat, teama, teamb, previous_winner_score)
{
	winner = undefined;
	if(teama == "tie")
	{
		winner = #"tie";
		if(previous_winner_score < game.stat[gamestat][teamb])
		{
			winner = teamb;
		}
	}
	else
	{
		if(game.stat[gamestat][teama] == game.stat[gamestat][teamb])
		{
			winner = #"tie";
		}
		else
		{
			if(game.stat[gamestat][teamb] > game.stat[gamestat][teama])
			{
				winner = teamb;
			}
			else
			{
				winner = teama;
			}
		}
	}
	return winner;
}

/*
	Name: determineteamwinnerbygamestat
	Namespace: globallogic
	Checksum: 0x2E25BA26
	Offset: 0x1AA8
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function determineteamwinnerbygamestat(gamestat)
{
	teamkeys = getarraykeys(level.teams);
	winner = teamkeys[0];
	previous_winner_score = game.stat[gamestat][winner];
	for(teamindex = 1; teamindex < teamkeys.size; teamindex++)
	{
		winner = compareteambygamestat(gamestat, winner, teamkeys[teamindex], previous_winner_score);
		if(winner != #"tie")
		{
			previous_winner_score = game.stat[gamestat][winner];
		}
	}
	return winner;
}

/*
	Name: compareteambyteamscore
	Namespace: globallogic
	Checksum: 0xA499AE23
	Offset: 0x1B88
	Size: 0xCE
	Parameters: 3
	Flags: Linked
*/
function compareteambyteamscore(teama, teamb, previous_winner_score)
{
	winner = undefined;
	teambscore = [[level._getteamscore]](teamb);
	if(teama == "tie")
	{
		winner = "tie";
		if(previous_winner_score < teambscore)
		{
			winner = teamb;
		}
		return winner;
	}
	teamascore = [[level._getteamscore]](teama);
	if(teambscore == teamascore)
	{
		winner = "tie";
	}
	else
	{
		if(teambscore > teamascore)
		{
			winner = teamb;
		}
		else
		{
			winner = teama;
		}
	}
	return winner;
}

/*
	Name: determineteamwinnerbyteamscore
	Namespace: globallogic
	Checksum: 0xBC6386D0
	Offset: 0x1C60
	Size: 0xC2
	Parameters: 0
	Flags: None
*/
function determineteamwinnerbyteamscore()
{
	teamkeys = getarraykeys(level.teams);
	winner = teamkeys[0];
	previous_winner_score = [[level._getteamscore]](winner);
	for(teamindex = 1; teamindex < teamkeys.size; teamindex++)
	{
		winner = compareteambyteamscore(winner, teamkeys[teamindex], previous_winner_score);
		if(winner != "tie")
		{
			previous_winner_score = [[level._getteamscore]](winner);
		}
	}
	return winner;
}

/*
	Name: forceend
	Namespace: globallogic
	Checksum: 0xE6A8A5CD
	Offset: 0x1D30
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function forceend()
{
	level.nextbsptoload = undefined;
	level.nextbspgamemode = undefined;
	level.nextbsplightingstate = undefined;
	if(level.hostforcedend || level.forcedend)
	{
		return;
	}
	level.forcedend = 1;
	level.hostforcedend = 1;
	setmatchflag("disableIngameMenu", 1);
	thread endgame();
}

/*
	Name: killserverpc
	Namespace: globallogic
	Checksum: 0x3115555B
	Offset: 0x1DC8
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function killserverpc()
{
	if(level.hostforcedend || level.forcedend)
	{
		return;
	}
	level.forcedend = 1;
	level.hostforcedend = 1;
	level.killserver = 1;
	/#
		println("");
	#/
	thread endgame();
}

/*
	Name: atleasttwoteams
	Namespace: globallogic
	Checksum: 0x196D819B
	Offset: 0x1E50
	Size: 0xB0
	Parameters: 0
	Flags: Linked
*/
function atleasttwoteams()
{
	valid_count = 0;
	foreach(team, _ in level.teams)
	{
		if(level.playercount[team] != 0)
		{
			valid_count++;
		}
	}
	if(valid_count < 2)
	{
		return false;
	}
	return true;
}

/*
	Name: checkifteamforfeits
	Namespace: globallogic
	Checksum: 0xCCAA2E74
	Offset: 0x1F08
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function checkifteamforfeits(team)
{
	if(!game.everexisted[team])
	{
		return false;
	}
	if(level.playercount[team] < 1 && util::totalplayercount() > 0)
	{
		return true;
	}
	return false;
}

/*
	Name: checkforforfeit
	Namespace: globallogic
	Checksum: 0xEFBCCAE6
	Offset: 0x1F78
	Size: 0x120
	Parameters: 0
	Flags: Linked
*/
function checkforforfeit()
{
	forfeit_count = 0;
	valid_team = undefined;
	foreach(team, _ in level.teams)
	{
		if(checkifteamforfeits(team))
		{
			forfeit_count++;
			if(!level.multiteam)
			{
				thread [[level.onforfeit]](team);
				return true;
			}
			continue;
		}
		valid_team = team;
	}
	if(level.multiteam && forfeit_count == (level.teams.size - 1))
	{
		thread [[level.onforfeit]](valid_team);
		return true;
	}
	return false;
}

/*
	Name: dospawnqueueupdates
	Namespace: globallogic
	Checksum: 0x67F78924
	Offset: 0x20A0
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function dospawnqueueupdates()
{
	foreach(team, _ in level.teams)
	{
		if(level.spawnqueuemodified[team])
		{
			[[level.onalivecountchange]](team);
		}
	}
}

/*
	Name: isteamalldead
	Namespace: globallogic
	Checksum: 0x48E1064D
	Offset: 0x2148
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function isteamalldead(team)
{
	return level.everexisted[team] && !function_a1ef346b(team).size && !level.playerlives[team];
}

/*
	Name: areallteamsdead
	Namespace: globallogic
	Checksum: 0x58552579
	Offset: 0x21A0
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function areallteamsdead()
{
	foreach(_ in level.teams)
	{
		if(!isteamalldead(team))
		{
			return false;
		}
	}
	return true;
}

/*
	Name: getlastteamalive
	Namespace: globallogic
	Checksum: 0xEE0B83B0
	Offset: 0x2240
	Size: 0x100
	Parameters: 0
	Flags: Linked
*/
function getlastteamalive()
{
	count = 0;
	everexistedcount = 0;
	aliveteam = undefined;
	foreach(team, _ in level.teams)
	{
		if(level.everexisted[team])
		{
			if(!isteamalldead(team))
			{
				aliveteam = team;
				count++;
			}
			everexistedcount++;
		}
	}
	if(everexistedcount > 1 && count == 1)
	{
		return aliveteam;
	}
	return undefined;
}

/*
	Name: dodeadeventupdates
	Namespace: globallogic
	Checksum: 0xE3F94FFC
	Offset: 0x2348
	Size: 0x1B8
	Parameters: 0
	Flags: Linked
*/
function dodeadeventupdates()
{
	if(!isdefined(level.ondeadevent))
	{
		return false;
	}
	if(level.teambased)
	{
		if(areallteamsdead())
		{
			[[level.ondeadevent]]("all");
			return true;
		}
		if(!isdefined(level.ondeadevent))
		{
			lastteamalive = getlastteamalive();
			if(isdefined(lastteamalive))
			{
				[[level.onlastteamaliveevent]](lastteamalive);
				return true;
			}
		}
		else
		{
			foreach(_ in level.teams)
			{
				if(isteamalldead(team))
				{
					[[level.ondeadevent]](team);
					return true;
				}
			}
		}
	}
	else if(totalalivecount() == 0 && totalplayerlives() == 0 && level.maxplayercount > 1)
	{
		[[level.ondeadevent]]("all");
		return true;
	}
	return false;
}

/*
	Name: isonlyoneleftaliveonteam
	Namespace: globallogic
	Checksum: 0xC36F09FE
	Offset: 0x2508
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function isonlyoneleftaliveonteam(team)
{
	return level.lastalivecount[team] > 1 && function_a1ef346b(team).size == 1 && level.playerlives[team] == 1;
}

/*
	Name: doonelefteventupdates
	Namespace: globallogic
	Checksum: 0x3816E160
	Offset: 0x2570
	Size: 0x120
	Parameters: 0
	Flags: Linked
*/
function doonelefteventupdates()
{
	if(level.teambased)
	{
		foreach(_ in level.teams)
		{
			if(isonlyoneleftaliveonteam(team))
			{
				[[level.ononeleftevent]](team);
				return true;
			}
		}
	}
	else if(totalalivecount() == 1 && totalplayerlives() == 1 && level.maxplayercount > 1)
	{
		[[level.ononeleftevent]]("all");
		return true;
	}
	return false;
}

/*
	Name: updategameevents
	Namespace: globallogic
	Checksum: 0x401388C0
	Offset: 0x2698
	Size: 0x210
	Parameters: 0
	Flags: Linked
*/
function updategameevents()
{
	/#
		if(getdvarint(#"scr_hostmigrationtest", 0) == 1)
		{
			return;
		}
	#/
	if(level.rankedmatch || level.leaguematch && !level.ingraceperiod)
	{
		if(level.teambased)
		{
			if(!level.gameforfeited)
			{
				if(game.state == "playing" && checkforforfeit())
				{
					return;
				}
			}
			else if(atleasttwoteams())
			{
				level.gameforfeited = 0;
				level notify(#"hash_39a00a79045884ca");
			}
		}
		else
		{
			if(!level.gameforfeited)
			{
				if(util::totalplayercount() == 1 && level.maxplayercount > 1)
				{
					thread [[level.onforfeit]]();
					return;
				}
			}
			else if(util::totalplayercount() > 1)
			{
				level.gameforfeited = 0;
				level notify(#"hash_39a00a79045884ca");
			}
		}
	}
	if(!level.playerqueuedrespawn && !level.numlives && !level.inovertime)
	{
		return;
	}
	if(level.ingraceperiod)
	{
		return;
	}
	if(level.playerqueuedrespawn)
	{
		dospawnqueueupdates();
	}
	if(dodeadeventupdates())
	{
		return;
	}
	if(doonelefteventupdates())
	{
		return;
	}
}

/*
	Name: matchstarttimer
	Namespace: globallogic
	Checksum: 0xCF4FB8AA
	Offset: 0x28B0
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function matchstarttimer()
{
	self endon(#"death");
	var_e8598101 = int(level.prematchperiod);
	if(var_e8598101 >= 2)
	{
		while(var_e8598101 > 0 && !level.gameended)
		{
			self luinotifyevent(#"create_prematch_timer", 2, gettime() + (var_e8598101 * 1000), 1);
			if(var_e8598101 == 2)
			{
				visionsetnaked("default", 3);
			}
			var_e8598101--;
			self playlocalsound(#"hash_5e14726f77107d1b");
			wait(1);
		}
		self luinotifyevent(#"prematch_timer_ended", 1, 1);
	}
	else
	{
		visionsetnaked("default", 1);
	}
}

/*
	Name: matchstarttimerskip
	Namespace: globallogic
	Checksum: 0x6A260F77
	Offset: 0x2A18
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function matchstarttimerskip()
{
	visionsetnaked("default", 0);
}

/*
	Name: notifyteamwavespawn
	Namespace: globallogic
	Checksum: 0x3F0C06D4
	Offset: 0x2A40
	Size: 0x70
	Parameters: 2
	Flags: Linked
*/
function notifyteamwavespawn(team, time)
{
	if(time - level.lastwave[team] > level.wavedelay[team] * 1000)
	{
		level notify("wave_respawn_" + team);
		level.lastwave[team] = time;
		level.waveplayerspawnindex[team] = 0;
	}
}

/*
	Name: wavespawntimer
	Namespace: globallogic
	Checksum: 0x4FEE6528
	Offset: 0x2AB8
	Size: 0xD2
	Parameters: 0
	Flags: Linked
*/
function wavespawntimer()
{
	level endon(#"game_ended");
	while(game.state == "playing")
	{
		time = gettime();
		foreach(team, _ in level.teams)
		{
			notifyteamwavespawn(team, time);
		}
		waitframe(1);
	}
}

/*
	Name: hostidledout
	Namespace: globallogic
	Checksum: 0xB34A9BF1
	Offset: 0x2B98
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function hostidledout()
{
	hostplayer = util::gethostplayer();
	/#
		if(getdvarint(#"scr_writeconfigstrings", 0) == 1 || getdvarint(#"scr_hostmigrationtest", 0) == 1)
		{
			return false;
		}
	#/
	if(isdefined(hostplayer) && !is_true(hostplayer.hasspawned) && !isdefined(hostplayer.selectedclass))
	{
		return true;
	}
	return false;
}

/*
	Name: incrementmatchcompletionstat
	Namespace: globallogic
	Checksum: 0x3AADFDE
	Offset: 0x2C60
	Size: 0x54
	Parameters: 3
	Flags: Linked
*/
function incrementmatchcompletionstat(gamemode, playedorhosted, stat)
{
	self stats::inc_stat(#"gamehistory", gamemode, #"modehistory", playedorhosted, stat, 1);
}

/*
	Name: setmatchcompletionstat
	Namespace: globallogic
	Checksum: 0xEE6C4B6E
	Offset: 0x2CC0
	Size: 0x54
	Parameters: 3
	Flags: None
*/
function setmatchcompletionstat(gamemode, playedorhosted, stat)
{
	self stats::set_stat(#"gamehistory", gamemode, #"modehistory", playedorhosted, stat, 1);
}

/*
	Name: getteamscoreratio
	Namespace: globallogic
	Checksum: 0x19DC15C7
	Offset: 0x2D20
	Size: 0x15A
	Parameters: 0
	Flags: Linked
*/
function getteamscoreratio()
{
	playerteam = self.pers[#"team"];
	score = getteamscore(playerteam);
	otherteamscore = 0;
	foreach(_ in level.teams)
	{
		if(team == playerteam)
		{
			continue;
		}
		otherteamscore = otherteamscore + getteamscore(team);
	}
	if(level.teams.size > 1)
	{
		otherteamscore = otherteamscore / (level.teams.size - 1);
	}
	if(otherteamscore != 0)
	{
		return float(score) / float(otherteamscore);
	}
	return score;
}

/*
	Name: gethighestscore
	Namespace: globallogic
	Checksum: 0x65933456
	Offset: 0x2E88
	Size: 0x7E
	Parameters: 0
	Flags: None
*/
function gethighestscore()
{
	highestscore = 999999999;
	for(index = 0; index < level.players.size; index++)
	{
		player = level.players[index];
		if(player.score > highestscore)
		{
			highestscore = player.score;
		}
	}
	return highestscore;
}

/*
	Name: getnexthighestscore
	Namespace: globallogic
	Checksum: 0xCF37FDA8
	Offset: 0x2F10
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function getnexthighestscore(score)
{
	highestscore = 999999999;
	for(index = 0; index < level.players.size; index++)
	{
		player = level.players[index];
		if(player.score >= score)
		{
			continue;
		}
		if(player.score > highestscore)
		{
			highestscore = player.score;
		}
	}
	return highestscore;
}

/*
	Name: sendafteractionreport
	Namespace: globallogic
	Checksum: 0x3593D1B8
	Offset: 0x2FB8
	Size: 0x55C
	Parameters: 1
	Flags: None
*/
function sendafteractionreport(winner)
{
	/#
		if(getdvarint(#"scr_writeconfigstrings", 0) == 1)
		{
			return;
		}
	#/
	for(index = 0; index < level.players.size; index++)
	{
		player = level.players[index];
		spread = player.kills - player.deaths;
		if(player.pers[#"cur_kill_streak"] > player.pers[#"best_kill_streak"])
		{
			player.pers[#"best_kill_streak"] = player.pers[#"cur_kill_streak"];
		}
		if(level.rankedmatch)
		{
			player stats::function_7a850245(#"privatematch", 0);
		}
		else
		{
			player stats::function_7a850245(#"privatematch", 1);
		}
		player stats::function_7a850245(#"demofileid", getdemofileid());
		player stats::function_7a850245(#"matchid", function_c7c50474());
		if(isdefined(winner) && winner == player.pers[#"team"])
		{
			player stats::function_7a850245(#"matchwon", 1);
		}
		else
		{
			player stats::function_7a850245(#"matchwon", 0);
		}
		revivemaster = 0;
		assistmaster = 0;
		killmaster = 0;
		for(index = 0; index < level.players.size; index++)
		{
			if(level.players[index].kills > level.players[killmaster].kills)
			{
				killmaster = index;
			}
			if(level.players[index].assists > level.players[assistmaster].assists)
			{
				assistmaster = index;
			}
			if(level.players[index].revives > level.players[revivemaster].revives)
			{
				revivemaster = index;
			}
		}
		teamscoreratio = player getteamscoreratio();
		scoreboardposition = getplacementforplayer(player);
		if(scoreboardposition < 0)
		{
			scoreboardposition = level.players.size;
		}
		player gamehistoryfinishmatch(4, player.kills, player.deaths, player.score, scoreboardposition, teamscoreratio);
		placement = level.placement[#"all"];
		for(otherplayerindex = 0; otherplayerindex < placement.size; otherplayerindex++)
		{
			if(level.placement[#"all"][otherplayerindex] == player)
			{
				recordplayerstats(player, "position", otherplayerindex);
			}
		}
		player stats::function_7a850245(#"valid", 1);
		player stats::function_7a850245(#"viewed", 0);
		if(isdefined(player.pers[#"matchesplayedstatstracked"]))
		{
			gamemode = util::getcurrentgamemode();
			player incrementmatchcompletionstat(gamemode, "played", "completed");
			if(isdefined(player.pers[#"matcheshostedstatstracked"]))
			{
				player incrementmatchcompletionstat(gamemode, "hosted", "completed");
				player.pers[#"matcheshostedstatstracked"] = undefined;
			}
			player.pers[#"matchesplayedstatstracked"] = undefined;
		}
	}
}

/*
	Name: gamehistoryplayerkicked
	Namespace: globallogic
	Checksum: 0xEB57036E
	Offset: 0x3520
	Size: 0x1C2
	Parameters: 0
	Flags: Linked
*/
function gamehistoryplayerkicked()
{
	teamscoreratio = self getteamscoreratio();
	scoreboardposition = getplacementforplayer(self);
	if(scoreboardposition < 0)
	{
		scoreboardposition = level.players.size;
	}
	/#
		/#
			assert(isdefined(self.kills));
		#/
		/#
			assert(isdefined(self.deaths));
		#/
		/#
			assert(isdefined(self.score));
		#/
		/#
			assert(isdefined(scoreboardposition));
		#/
		/#
			assert(isdefined(teamscoreratio));
		#/
	#/
	self gamehistoryfinishmatch(2, self.kills, self.deaths, self.score, scoreboardposition, teamscoreratio);
	if(isdefined(self.pers[#"matchesplayedstatstracked"]))
	{
		gamemode = util::getcurrentgamemode();
		self incrementmatchcompletionstat(gamemode, "played", "kicked");
		self.pers[#"matchesplayedstatstracked"] = undefined;
	}
	uploadstats(self);
	wait(1);
}

/*
	Name: displayroundend
	Namespace: globallogic
	Checksum: 0x345EE76
	Offset: 0x36F0
	Size: 0x284
	Parameters: 2
	Flags: Linked
*/
function displayroundend(winner, endreasontext)
{
	if(level.displayroundendtext)
	{
		if(level.teambased)
		{
			if(winner == "tie")
			{
				demo::function_c6ae5fd6(#"round_result", level.teamindex[#"neutral"], level.teamindex[#"neutral"]);
			}
			else
			{
				demo::function_c6ae5fd6(#"round_result", level.teamindex[winner], level.teamindex[#"neutral"]);
			}
		}
		setmatchflag("cg_drawSpectatorMessages", 0);
		players = level.players;
		for(index = 0; index < players.size; index++)
		{
			player = players[index];
			if(!util::waslastround())
			{
				player notify(#"round_ended");
			}
			if(!isdefined(player.pers[#"team"]))
			{
				player [[level.spawnintermission]](1);
				continue;
			}
			if(level.teambased)
			{
				player thread [[level.onteamoutcomenotify]](winner, 1, endreasontext);
			}
			else
			{
				player thread [[level.onoutcomenotify]](winner, 1, endreasontext);
			}
			self val::set(#"round_end", "show_hud", 0);
			player setclientuivisibilityflag("g_compassShowEnemies", 0);
		}
	}
	if(util::waslastround())
	{
		roundendwait(level.roundenddelay, 0);
	}
	else
	{
		roundendwait(level.roundenddelay, 1);
	}
}

/*
	Name: displayroundswitch
	Namespace: globallogic
	Checksum: 0x3DDC28C6
	Offset: 0x3980
	Size: 0x214
	Parameters: 2
	Flags: Linked
*/
function displayroundswitch(winner, endreasontext)
{
	switchtype = level.halftimetype;
	if(switchtype == "halftime")
	{
		if(isdefined(level.nextroundisovertime) && level.nextroundisovertime)
		{
			switchtype = "overtime";
		}
		else
		{
			if(level.roundlimit)
			{
				if((game.roundsplayed * 2) == level.roundlimit)
				{
					switchtype = "halftime";
				}
				else
				{
					switchtype = "intermission";
				}
			}
			else
			{
				if(level.scorelimit)
				{
					if(game.roundsplayed == (level.scorelimit - 1))
					{
						switchtype = "halftime";
					}
					else
					{
						switchtype = "intermission";
					}
				}
				else
				{
					switchtype = "intermission";
				}
			}
		}
	}
	setmatchtalkflag("EveryoneHearsEveryone", 1);
	players = level.players;
	for(index = 0; index < players.size; index++)
	{
		player = players[index];
		if(!isdefined(player.pers[#"team"]))
		{
			player [[level.spawnintermission]](1);
			continue;
		}
		player thread [[level.onteamoutcomenotify]](switchtype, 0, level.halftimesubcaption);
		player val::set(#"round_switch", "show_hud", 0);
	}
	roundendwait(level.halftimeroundenddelay, 0);
}

/*
	Name: resetoutcomeforallplayers
	Namespace: globallogic
	Checksum: 0xC8E1BC74
	Offset: 0x3BA0
	Size: 0x60
	Parameters: 0
	Flags: None
*/
function resetoutcomeforallplayers()
{
	players = level.players;
	for(index = 0; index < players.size; index++)
	{
		player = players[index];
		player notify(#"reset_outcome");
	}
}

/*
	Name: startnextround
	Namespace: globallogic
	Checksum: 0xA3B05924
	Offset: 0x3C08
	Size: 0x25C
	Parameters: 2
	Flags: None
*/
function startnextround(winner, endreasontext)
{
	if(!util::isoneround())
	{
		displayroundend(winner, endreasontext);
		globallogic_utils::executepostroundevents();
		if(!util::waslastround())
		{
			if(checkroundswitch())
			{
				displayroundswitch(winner, endreasontext);
			}
			if(isdefined(level.nextroundisovertime) && level.nextroundisovertime)
			{
				if(!isdefined(game.overtime_round))
				{
					game.overtime_round = 1;
				}
				else
				{
					game.overtime_round++;
				}
			}
			setmatchtalkflag("DeadChatWithDead", level.voip.deadchatwithdead);
			setmatchtalkflag("DeadChatWithTeam", level.voip.deadchatwithteam);
			setmatchtalkflag("DeadHearTeamLiving", level.voip.deadhearteamliving);
			setmatchtalkflag("DeadHearAllLiving", level.voip.deadhearallliving);
			setmatchtalkflag("EveryoneHearsEveryone", level.voip.everyonehearseveryone);
			setmatchtalkflag("DeadHearKiller", level.voip.deadhearkiller);
			setmatchtalkflag("KillersHearVictim", level.voip.killershearvictim);
			game.state = "playing";
			level.allowbattlechatter[#"bc"] = getgametypesetting(#"allowbattlechatter");
			map_restart(1);
			return true;
		}
	}
	return false;
}

/*
	Name: endgame
	Namespace: globallogic
	Checksum: 0x2A3E56D2
	Offset: 0x3E70
	Size: 0x37C
	Parameters: 0
	Flags: Linked
*/
function endgame()
{
	if(game.state == "postgame" || level.gameended)
	{
		return;
	}
	if(!isdefined(level.disableoutrovisionset) || level.disableoutrovisionset == 0)
	{
		visionsetnaked("mpOutro", 2);
	}
	setmatchflag("game_ended", 1);
	game.state = "postgame";
	level.gameendtime = gettime();
	level.gameended = 1;
	setdvar(#"g_gameended", 1);
	level.ingraceperiod = 0;
	level notify(#"game_ended");
	players = level.players;
	for(index = 0; index < players.size; index++)
	{
		player = players[index];
		player freezecontrols(1);
		player clearallnoncheckpointdata();
		/#
			player globallogic_ui::freegameplayhudelems();
		#/
	}
	music::setmusicstate("silent");
	level lui::screen_fade_out(1);
	wait(0.3);
	if(util::isoneround())
	{
		globallogic_utils::executepostroundevents();
	}
	setmatchflag("disableIngameMenu", 1);
	foreach(player in players)
	{
		player closeingamemenu();
	}
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] setclientuivisibilityflag("weapon_hud_visible", 0);
	}
	level notify(#"sfade");
	/#
		print("");
	#/
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] cameraactivate(0);
	}
	function_7b994f00();
}

/*
	Name: function_7b994f00
	Namespace: globallogic
	Checksum: 0xE675A0AA
	Offset: 0x41F8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_7b994f00()
{
	level.gameended = 1;
	savegame::function_fa31c391();
	function_9ceb0931();
}

/*
	Name: function_9ceb0931
	Namespace: globallogic
	Checksum: 0xDDE7C98F
	Offset: 0x4238
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9ceb0931(var_a9241d2e)
{
	if(!isdefined(var_a9241d2e))
	{
		var_a9241d2e = 0;
	}
	player = getplayers()[0];
	setsaveddvar(#"hash_41519202e554dd2c", 1);
	uploadstats(player);
	waitframe(1);
	stats::function_ca76d4a();
	exitlevel(var_a9241d2e);
}

/*
	Name: roundendwait
	Namespace: globallogic
	Checksum: 0x4EADDEAB
	Offset: 0x42E8
	Size: 0x14
	Parameters: 2
	Flags: Linked
*/
function roundendwait(defaultdelay, matchbonus)
{
}

/*
	Name: checktimelimit
	Namespace: globallogic
	Checksum: 0x76B1A241
	Offset: 0x4308
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function checktimelimit()
{
	if(isdefined(level.timelimitoverride) && level.timelimitoverride)
	{
		return;
	}
	if(game.state != "playing")
	{
		setgameendtime(0);
		return;
	}
	if(level.timelimit <= 0)
	{
		setgameendtime(0);
		return;
	}
	if(level.inprematchperiod)
	{
		setgameendtime(0);
		return;
	}
	if(level.timerstopped)
	{
		setgameendtime(0);
		return;
	}
	if(!isdefined(level.starttime))
	{
		return;
	}
	timeleft = globallogic_utils::gettimeremaining();
	setgameendtime(gettime() + int(timeleft));
	if(timeleft > 0)
	{
		return;
	}
	[[level.ontimelimit]]();
}

/*
	Name: allteamsunderscorelimit
	Namespace: globallogic
	Checksum: 0xF6D06390
	Offset: 0x4440
	Size: 0xA8
	Parameters: 0
	Flags: Linked
*/
function allteamsunderscorelimit()
{
	foreach(team, _ in level.teams)
	{
		if(game.stat[#"teamscores"][team] >= level.scorelimit)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: checkscorelimit
	Namespace: globallogic
	Checksum: 0xA0786A74
	Offset: 0x44F0
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function checkscorelimit()
{
	if(game.state != "playing")
	{
		return false;
	}
	if(level.scorelimit <= 0)
	{
		return false;
	}
	if(level.teambased)
	{
		if(allteamsunderscorelimit())
		{
			return false;
		}
	}
	else
	{
		if(!isplayer(self))
		{
			return false;
		}
		if(self.pointstowin < level.scorelimit)
		{
			return false;
		}
	}
	[[level.onscorelimit]]();
}

/*
	Name: updategametypedvars
	Namespace: globallogic
	Checksum: 0x8A182856
	Offset: 0x45A0
	Size: 0x2AE
	Parameters: 0
	Flags: Linked
*/
function updategametypedvars()
{
	level endon(#"game_ended");
	while(game.state == "playing")
	{
		var_e030e453 = getgametypesetting(#"roundlimit");
		if(!isdefined(var_e030e453))
		{
			var_e030e453 = level.roundlimit;
		}
		roundlimit = math::clamp(var_e030e453, level.roundlimitmin, level.roundlimitmax);
		if(roundlimit != level.roundlimit)
		{
			level.roundlimit = roundlimit;
			level notify(#"update_roundlimit");
		}
		timelimit = [[level.gettimelimit]]();
		if(timelimit != level.timelimit)
		{
			level.timelimit = timelimit;
			setdvar(#"ui_timelimit", level.timelimit);
			level notify(#"update_timelimit");
		}
		checktimelimit();
		var_928c1df0 = getgametypesetting(#"scorelimit");
		if(!isdefined(var_928c1df0))
		{
			var_928c1df0 = level.scorelimit;
		}
		scorelimit = math::clamp(var_928c1df0, level.scorelimitmin, level.scorelimitmax);
		if(scorelimit != level.scorelimit)
		{
			level.scorelimit = scorelimit;
			setdvar(#"ui_scorelimit", level.scorelimit);
			level notify(#"update_scorelimit");
		}
		checkscorelimit();
		if(isdefined(level.starttime))
		{
			remaining_time = globallogic_utils::gettimeremaining();
			if(isdefined(remaining_time) && remaining_time < 3000)
			{
				wait(0.1);
				continue;
			}
		}
		wait(1);
	}
}

/*
	Name: removedisconnectedplayerfromplacement
	Namespace: globallogic
	Checksum: 0xA8DB83F2
	Offset: 0x4858
	Size: 0x200
	Parameters: 0
	Flags: None
*/
function removedisconnectedplayerfromplacement()
{
	offset = 0;
	numplayers = level.placement[#"all"].size;
	found = 0;
	for(i = 0; i < numplayers; i++)
	{
		if(level.placement[#"all"][i] == self)
		{
			found = 1;
		}
		if(found)
		{
			level.placement[#"all"][i] = level.placement[#"all"][i + 1];
		}
	}
	if(!found)
	{
		return;
	}
	level.placement[#"all"][numplayers - 1] = undefined;
	/#
		assert(level.placement[#"all"].size == (numplayers - 1));
	#/
	/#
		globallogic_utils::assertproperplacement();
	#/
	updateteamplacement();
	if(level.teambased)
	{
		return;
	}
	numplayers = level.placement[#"all"].size;
	for(i = 0; i < numplayers; i++)
	{
		player = level.placement[#"all"][i];
		if(isdefined(player))
		{
			player notify(#"update_outcome");
		}
	}
}

/*
	Name: updateplacement
	Namespace: globallogic
	Checksum: 0xD332ABBA
	Offset: 0x4A60
	Size: 0x314
	Parameters: 0
	Flags: Linked
*/
function updateplacement()
{
	if(!level.players.size)
	{
		return;
	}
	level.placement[#"all"] = [];
	foreach(player in level.players)
	{
		if(!level.teambased || isdefined(level.teams[player.team]))
		{
			level.placement[#"all"][level.placement[#"all"].size] = player;
		}
	}
	placementall = level.placement[#"all"];
	if(level.teambased)
	{
		for(i = 1; i < placementall.size; i++)
		{
			player = placementall[i];
			playerscore = player.score;
			for(j = i - 1; j >= 0 && (playerscore > placementall[j].score || (playerscore == placementall[j].score && player.deaths < placementall[j].deaths)); j--)
			{
				placementall[j + 1] = placementall[j];
			}
			placementall[j + 1] = player;
		}
	}
	else
	{
		for(i = 1; i < placementall.size; i++)
		{
			player = placementall[i];
			playerscore = player.pointstowin;
			for(j = i - 1; j >= 0 && (playerscore > placementall[j].pointstowin || (playerscore == placementall[j].pointstowin && player.deaths < placementall[j].deaths)); j--)
			{
				placementall[j + 1] = placementall[j];
			}
			placementall[j + 1] = player;
		}
	}
	level.placement[#"all"] = placementall;
	/#
		globallogic_utils::assertproperplacement();
	#/
	updateteamplacement();
}

/*
	Name: updateteamplacement
	Namespace: globallogic
	Checksum: 0x6C480F2C
	Offset: 0x4D80
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function updateteamplacement()
{
	foreach(team, _ in level.teams)
	{
		placement[team] = [];
	}
	placement[#"spectator"] = [];
	if(!level.teambased)
	{
		return;
	}
	placementall = level.placement[#"all"];
	placementallsize = placementall.size;
	for(i = 0; i < placementallsize; i++)
	{
		player = placementall[i];
		team = player.pers[#"team"];
		placement[team][placement[team].size] = player;
	}
	foreach(team, _ in level.teams)
	{
		level.placement[team] = placement[team];
	}
}

/*
	Name: getplacementforplayer
	Namespace: globallogic
	Checksum: 0x814F7594
	Offset: 0x4F38
	Size: 0xAE
	Parameters: 1
	Flags: Linked
*/
function getplacementforplayer(player)
{
	updateplacement();
	playerrank = -1;
	placement = level.placement[#"all"];
	for(placementindex = 0; placementindex < placement.size; placementindex++)
	{
		if(level.placement[#"all"][placementindex] == player)
		{
			playerrank = placementindex + 1;
			break;
		}
	}
	return playerrank;
}

/*
	Name: istopscoringplayer
	Namespace: globallogic
	Checksum: 0x6508D7E3
	Offset: 0x4FF0
	Size: 0x27C
	Parameters: 1
	Flags: None
*/
function istopscoringplayer(player)
{
	topplayer = 0;
	updateplacement();
	/#
		assert(level.placement[#"all"].size > 0);
	#/
	if(level.placement[#"all"].size == 0)
	{
		return 0;
	}
	if(level.teambased)
	{
		topscore = level.placement[#"all"][0].score;
		for(index = 0; index < level.placement[#"all"].size; index++)
		{
			if(level.placement[#"all"][index].score == 0)
			{
				break;
			}
			if(topscore > level.placement[#"all"][index].score)
			{
				break;
			}
			if(self == level.placement[#"all"][index])
			{
				topscoringplayer = 1;
				break;
			}
		}
	}
	else
	{
		topscore = level.placement[#"all"][0].pointstowin;
		for(index = 0; index < level.placement[#"all"].size; index++)
		{
			if(level.placement[#"all"][index].pointstowin == 0)
			{
				break;
			}
			if(topscore > level.placement[#"all"][index].pointstowin)
			{
				break;
			}
			if(self == level.placement[#"all"][index])
			{
				topplayer = 1;
				break;
			}
		}
	}
	return topplayer;
}

/*
	Name: sortdeadplayers
	Namespace: globallogic
	Checksum: 0xF51B066B
	Offset: 0x5278
	Size: 0x17A
	Parameters: 1
	Flags: Linked
*/
function sortdeadplayers(team)
{
	if(!level.playerqueuedrespawn)
	{
		return;
	}
	for(i = 1; i < level.deadplayers[team].size; i++)
	{
		player = level.deadplayers[team][i];
		for(j = i - 1; j >= 0 && player.deathtime < level.deadplayers[team][j].deathtime; j--)
		{
			level.deadplayers[team][j + 1] = level.deadplayers[team][j];
		}
		level.deadplayers[team][j + 1] = player;
	}
	for(i = 0; i < level.deadplayers[team].size; i++)
	{
		if(level.deadplayers[team][i].spawnqueueindex != i)
		{
			level.spawnqueuemodified[team] = 1;
		}
		level.deadplayers[team][i].spawnqueueindex = i;
	}
}

/*
	Name: totalalivecount
	Namespace: globallogic
	Checksum: 0x1E1B0C18
	Offset: 0x5400
	Size: 0xA2
	Parameters: 0
	Flags: Linked
*/
function totalalivecount()
{
	count = 0;
	foreach(_ in level.teams)
	{
		count = count + function_a1ef346b(team).size;
	}
	return count;
}

/*
	Name: totalplayerlives
	Namespace: globallogic
	Checksum: 0xDEF035DD
	Offset: 0x54B0
	Size: 0x9A
	Parameters: 0
	Flags: Linked
*/
function totalplayerlives()
{
	count = 0;
	foreach(_ in level.teams)
	{
		count = count + level.playerlives[team];
	}
	return count;
}

/*
	Name: totallaststandcount
	Namespace: globallogic
	Checksum: 0x8C22DDD0
	Offset: 0x5558
	Size: 0x9A
	Parameters: 0
	Flags: None
*/
function totallaststandcount()
{
	count = 0;
	foreach(_ in level.teams)
	{
		count = count + level.laststandcount[team];
	}
	return count;
}

/*
	Name: initteamvariables
	Namespace: globallogic
	Checksum: 0xF1200682
	Offset: 0x5600
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function initteamvariables(team)
{
	if(!isdefined(level.laststandcount))
	{
		level.laststandcount = [];
	}
	level.lastalivecount[team] = 0;
	level.laststandcount[team] = 0;
	if(!isdefined(game.everexisted))
	{
		game.everexisted = [];
	}
	if(!isdefined(game.everexisted[team]))
	{
		game.everexisted[team] = 0;
	}
	level.everexisted[team] = 0;
	level.wavedelay[team] = 0;
	level.lastwave[team] = 0;
	level.waveplayerspawnindex[team] = 0;
	resetteamvariables(team);
}

/*
	Name: resetteamvariables
	Namespace: globallogic
	Checksum: 0xFA6F1E31
	Offset: 0x56F0
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function resetteamvariables(team)
{
	level.playercount[team] = 0;
	level.botscount[team] = 0;
	level.lastalivecount[team] = function_a1ef346b(team).size;
	level.laststandcount[team] = 0;
	level.playerlives[team] = 0;
	level.spawningplayers[team] = [];
	level.deadplayers[team] = [];
	level.squads[team] = [];
	level.spawnqueuemodified[team] = 0;
}

/*
	Name: updateteamstatus
	Namespace: globallogic
	Checksum: 0x33CC3D67
	Offset: 0x57B0
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function updateteamstatus()
{
	if(game.state == "postgame")
	{
		return;
	}
	foreach(_ in level.teams)
	{
		resetteamvariables(team);
	}
	function_2905c18e();
	totalalive = totalalivecount();
	if(totalalive > level.maxplayercount)
	{
		level.maxplayercount = totalalive;
	}
	foreach(team, _ in level.teams)
	{
		if(function_a1ef346b(team).size)
		{
			game.everexisted[team] = 1;
			level.everexisted[team] = 1;
		}
		sortdeadplayers(team);
	}
	level updategameevents();
}

/*
	Name: function_2905c18e
	Namespace: globallogic
	Checksum: 0x9984F99A
	Offset: 0x5960
	Size: 0x220
	Parameters: 0
	Flags: Linked
*/
function function_2905c18e()
{
	foreach(player in getplayers())
	{
		team = player.team;
		str_class = player.curclass;
		level.playercount[team]++;
		if(isbot(player))
		{
			level.botscount[team]++;
		}
		if(team != #"spectator" && (isdefined(str_class) && str_class != ""))
		{
			level.playercount[team]++;
			if(player.sessionstate == "playing")
			{
				level.playerlives[team]++;
				player.spawnqueueindex = -1;
				if(isalive(player))
				{
					if(isdefined(player.laststand) && player.laststand)
					{
						level.laststandcount[team]++;
					}
				}
				else
				{
					level.deadplayers[team][level.deadplayers[team].size] = player;
				}
				continue;
			}
			level.deadplayers[team][level.deadplayers[team].size] = player;
			if(player globallogic_spawn::mayspawn())
			{
				level.playerlives[team]++;
			}
		}
	}
	level notify(#"hash_3a639e0edb9f3db7");
}

/*
	Name: checkteamscorelimitsoon
	Namespace: globallogic
	Checksum: 0xFD44B950
	Offset: 0x5B88
	Size: 0xC0
	Parameters: 1
	Flags: None
*/
function checkteamscorelimitsoon(team)
{
	/#
		assert(isdefined(team));
	#/
	if(level.scorelimit <= 0)
	{
		return;
	}
	if(!level.teambased)
	{
		return;
	}
	if(globallogic_utils::gettimepassed() < 60000)
	{
		return;
	}
	timeleft = globallogic_utils::getestimatedtimeuntilscorelimit(team);
	if(timeleft < 1)
	{
		level notify(#"match_ending_soon", {#event:"score"});
	}
}

/*
	Name: checkplayerscorelimitsoon
	Namespace: globallogic
	Checksum: 0x7076AD05
	Offset: 0x5C50
	Size: 0xC8
	Parameters: 0
	Flags: None
*/
function checkplayerscorelimitsoon()
{
	/#
		assert(isplayer(self));
	#/
	if(level.scorelimit <= 0)
	{
		return;
	}
	if(level.teambased)
	{
		return;
	}
	if(globallogic_utils::gettimepassed() < 60000)
	{
		return;
	}
	timeleft = globallogic_utils::getestimatedtimeuntilscorelimit(undefined);
	if(timeleft < 1)
	{
		level notify(#"match_ending_soon", {#event:"score"});
	}
}

/*
	Name: timelimitclock
	Namespace: globallogic
	Checksum: 0x789F6C65
	Offset: 0x5D20
	Size: 0x2CC
	Parameters: 0
	Flags: Linked
*/
function timelimitclock()
{
	level endon(#"game_ended");
	waitframe(1);
	clockobject = spawn("script_origin", (0, 0, 0));
	while(game.state == "playing")
	{
		if(!level.timerstopped && level.timelimit)
		{
			timeleft = globallogic_utils::gettimeremaining() / 1000;
			timeleftint = int(timeleft + 0.5);
			if(timeleftint == 601)
			{
				util::clientnotify("notify_10");
			}
			if(timeleftint == 301)
			{
				util::clientnotify("notify_5");
			}
			if(timeleftint == 60)
			{
				util::clientnotify("notify_1");
			}
			if(timeleftint == 12)
			{
				util::clientnotify("notify_count");
			}
			if(timeleftint >= 40 && timeleftint <= 60)
			{
				level notify(#"match_ending_soon", "time");
			}
			if(timeleftint >= 30 && timeleftint <= 40)
			{
				level notify(#"match_ending_pretty_soon", "time");
			}
			if(timeleftint <= 32)
			{
				level notify(#"match_ending_vox");
			}
			if(timeleftint <= 10 || (timeleftint <= 30 && (timeleftint % 2) == 0))
			{
				level notify(#"match_ending_very_soon", "time");
				if(timeleftint == 0)
				{
					break;
				}
				clockobject playsound(#"mpl_ui_timer_countdown");
			}
			if((timeleft - floor(timeleft)) >= 0.05)
			{
				wait(timeleft - floor(timeleft));
			}
		}
		wait(1);
	}
}

/*
	Name: timelimitclock_intermission
	Namespace: globallogic
	Checksum: 0x3D8FC1C8
	Offset: 0x5FF8
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function timelimitclock_intermission(waittime)
{
	setgameendtime(gettime() + (int(waittime * 1000)));
	clockobject = spawn("script_origin", (0, 0, 0));
	if(waittime >= 10)
	{
		wait(waittime - 10);
	}
	for(;;)
	{
		clockobject playsound(#"mpl_ui_timer_countdown");
		wait(1);
	}
}

/*
	Name: startgame
	Namespace: globallogic
	Checksum: 0x44241294
	Offset: 0x60B0
	Size: 0x234
	Parameters: 0
	Flags: Linked
*/
function startgame()
{
	thread globallogic_utils::gametimer();
	level.timerstopped = 0;
	setmatchtalkflag("DeadChatWithDead", level.voip.deadchatwithdead);
	setmatchtalkflag("DeadChatWithTeam", level.voip.deadchatwithteam);
	setmatchtalkflag("DeadHearTeamLiving", level.voip.deadhearteamliving);
	setmatchtalkflag("DeadHearAllLiving", level.voip.deadhearallliving);
	setmatchtalkflag("EveryoneHearsEveryone", level.voip.everyonehearseveryone);
	setmatchtalkflag("DeadHearKiller", level.voip.deadhearkiller);
	setmatchtalkflag("KillersHearVictim", level.voip.killershearvictim);
	if(isdefined(level.custom_prematch_period))
	{
		[[level.custom_prematch_period]]();
	}
	else
	{
		prematchperiod();
	}
	level notify(#"prematch_over");
	level.prematch_over = 1;
	function_c1207282(level.players);
	level flag::set("game_start");
	setdvar(#"hash_54488b7c651bd0ec", 0);
	thread timelimitclock();
	thread graceperiod();
	thread watchmatchendingsoon();
	recordmatchbegin();
}

/*
	Name: waitforplayers
	Namespace: globallogic
	Checksum: 0x897029E4
	Offset: 0x62F0
	Size: 0x58
	Parameters: 0
	Flags: None
*/
function waitforplayers()
{
	starttime = gettime();
	while(getnumconnectedplayers() < 1)
	{
		waitframe(1);
		if(gettime() - starttime > 120000)
		{
			function_9ceb0931();
		}
	}
}

/*
	Name: prematchperiod
	Namespace: globallogic
	Checksum: 0x6AD4405C
	Offset: 0x6350
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function prematchperiod()
{
	setmatchflag("hud_hardcore", level.hardcoremode);
	a_players = function_58385b58();
	foreach(e_player in a_players)
	{
		e_player thread function_b5d72fb0();
	}
	level waittill(#"hash_62badab89a3536b9");
}

/*
	Name: function_b5d72fb0
	Namespace: globallogic
	Checksum: 0x10631365
	Offset: 0x6430
	Size: 0x18A
	Parameters: 0
	Flags: Linked
*/
function function_b5d72fb0()
{
	level endon(#"game_ended");
	self endon(#"death");
	if(level.prematchperiod > 0 && !is_true(level.disableprematchperiod))
	{
		self thread matchstarttimer();
		self val::set(#"prematch", "ignoreme", 1);
		self val::set(#"prematch", "freezecontrols", 1);
		wait(level.prematchperiod);
	}
	else
	{
		matchstarttimerskip();
		waitframe(1);
	}
	level.inprematchperiod = 0;
	self val::reset(#"prematch", "ignoreme");
	self val::reset(#"prematch", "freezecontrols");
	level notify(#"hash_62badab89a3536b9");
	if(game.state != "playing")
	{
		return;
	}
}

/*
	Name: function_c1207282
	Namespace: globallogic
	Checksum: 0x373F5DBB
	Offset: 0x65C8
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_c1207282(players)
{
	if(!isdefined(players))
	{
		return;
	}
	for(index = 0; index < players.size; index++)
	{
		players[index] val::reset(#"prematch", "ignoreme");
		players[index] val::reset(#"prematch", "freezecontrols");
	}
}

/*
	Name: graceperiod
	Namespace: globallogic
	Checksum: 0xE2355B9D
	Offset: 0x6668
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function graceperiod()
{
	level endon(#"game_ended");
	if(isdefined(level.graceperiodfunc))
	{
		[[level.graceperiodfunc]]();
	}
	else
	{
		wait(level.graceperiod);
	}
	level notify(#"grace_period_ending");
	waitframe(1);
	level.ingraceperiod = 0;
	if(game.state != "playing")
	{
		return;
	}
	if(level.numlives)
	{
		players = level.players;
		for(i = 0; i < players.size; i++)
		{
			player = players[i];
			if(!player.hasspawned && player.sessionteam != #"spectator" && !isalive(player))
			{
				player.statusicon = "hud_status_dead";
			}
		}
	}
	updateteamstatus();
}

/*
	Name: watchmatchendingsoon
	Namespace: globallogic
	Checksum: 0x9C73E0F9
	Offset: 0x67C0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function watchmatchendingsoon()
{
	setdvar(#"xblive_matchendingsoon", 0);
	level waittill(#"match_ending_soon");
	setdvar(#"xblive_matchendingsoon", 1);
}

/*
	Name: anyteamhaswavedelay
	Namespace: globallogic
	Checksum: 0xB87F4D2E
	Offset: 0x6830
	Size: 0x90
	Parameters: 0
	Flags: None
*/
function anyteamhaswavedelay()
{
	foreach(team, _ in level.teams)
	{
		if(level.wavedelay[team])
		{
			return true;
		}
	}
	return false;
}

/*
	Name: callback_startgametype
	Namespace: globallogic
	Checksum: 0xC87F4036
	Offset: 0x68C8
	Size: 0x1614
	Parameters: 0
	Flags: Linked
*/
function callback_startgametype()
{
	level flag::init("game_start");
	level.prematchperiod = 0;
	level.intermission = 0;
	setmatchflag("cg_drawSpectatorMessages", 1);
	setmatchflag("game_ended", 0);
	if(!isdefined(game.gamestarted))
	{
		if(!isdefined(game.allies))
		{
			game.allies = #"cia";
		}
		if(!isdefined(game.axis))
		{
			game.axis = #"kgb";
		}
		if(!isdefined(game.attackers))
		{
			game.attackers = #"allies";
		}
		if(!isdefined(game.defenders))
		{
			game.defenders = #"axis";
		}
		/#
			assert(game.attackers != game.defenders);
		#/
		foreach(_ in level.teams)
		{
			if(!isdefined(game.team))
			{
				game.team = #"cia";
			}
		}
		gamestate::set_state(#"playing");
		setdvar(#"cg_thirdpersonangle", 354);
		game.strings[#"press_to_spawn"] = #"hash_203ff65a4ee460e6";
		if(level.teambased)
		{
			game.strings[#"waiting_for_teams"] = #"hash_150c54160239825";
			game.strings[#"opponent_forfeiting_in"] = #"hash_52d76ed35e0b625a";
		}
		else
		{
			game.strings[#"waiting_for_teams"] = #"hash_47c479655d474f31";
			game.strings[#"opponent_forfeiting_in"] = #"hash_52d76ed35e0b625a";
		}
		game.strings[#"match_starting_in"] = #"hash_18e58cc95db34427";
		game.strings[#"spawn_next_round"] = #"hash_5659065fae9d42fb";
		game.strings[#"waiting_to_spawn"] = #"hash_44d60a6e6ed2a53c";
		game.strings[#"waiting_to_spawn_ss"] = #"hash_78bf3a61cf52e257";
		game.strings[#"you_will_spawn"] = #"hash_53c0ba6abce1c0ea";
		game.strings[#"match_starting"] = #"hash_73938fd7959ab087";
		game.strings[#"item_on_respawn"] = #"hash_220160808c99fe71";
		game.strings[#"hash_b71875e85956ea"] = #"hash_61f8bf2959b7bd5a";
		game.strings[#"last_stand"] = #"hash_5732d212e4511a00";
		game.strings[#"cowards_way"] = #"hash_268e464278a2f8ff";
		game.strings[#"tie"] = #"hash_72785a9088fa0d1b";
		game.strings[#"round_draw"] = #"hash_7d3ae25e0187143e";
		game.strings[#"enemies_eliminated"] = #"mp_enemies_eliminated";
		game.strings[#"score_limit_reached"] = #"hash_3050eee23c6a3574";
		game.strings[#"round_limit_reached"] = #"hash_3b23cb510ab5970a";
		game.strings[#"time_limit_reached"] = #"hash_4e2680278af76571";
		game.strings[#"players_forfeited"] = #"hash_4b172be7ce459674";
		game.strings[#"other_teams_forfeited"] = #"mp_other_teams_forfeited";
		if(isdefined(level.onprecachegametype))
		{
			[[level.onprecachegametype]]();
		}
		game.gamestarted = 1;
		game.totalkills = 0;
		foreach(team, _ in level.teams)
		{
			game.stat[#"teamscores"][team] = 0;
			game.totalkillsteam[team] = 0;
		}
		level.prematchperiod = getgametypesetting(#"prematchperiod");
	}
	else if(!level.splitscreen)
	{
		level.prematchperiod = getgametypesetting(#"preroundperiod");
	}
	if(!isdefined(game.timepassed))
	{
		game.timepassed = 0;
	}
	if(!isdefined(game.roundsplayed))
	{
		game.roundsplayed = 0;
	}
	setroundsplayed(game.roundsplayed);
	if(isdefined(game.overtime_round))
	{
		setmatchflag("overtime", 1);
	}
	else
	{
		setmatchflag("overtime", 0);
	}
	if(!isdefined(game.roundwinner))
	{
		game.roundwinner = [];
	}
	if(!isdefined(game.lastroundscore))
	{
		game.lastroundscore = [];
	}
	if(!isdefined(game.stat[#"roundswon"]))
	{
		game.stat[#"roundswon"] = [];
	}
	if(!isdefined(game.stat[#"roundswon"][#"tie"]))
	{
		game.stat[#"roundswon"][#"tie"] = 0;
	}
	foreach(team, _ in level.teams)
	{
		if(!isdefined(game.stat[#"roundswon"][team]))
		{
			game.stat[#"roundswon"][team] = 0;
		}
	}
	level.skipvote = 0;
	level.gameended = 0;
	setdvar(#"g_gameended", 0);
	level.objidstart = 0;
	level.forcedend = 0;
	level.hostforcedend = 0;
	level.hardcoremode = getgametypesetting(#"hardcoremode");
	if(level.hardcoremode)
	{
		/#
			print("");
		#/
		if(!isdefined(level.friendlyfiredelaytime))
		{
			level.friendlyfiredelaytime = 0;
		}
	}
	level.rankcap = getdvarint(#"scr_max_rank", 0);
	level.minprestige = getdvarint(#"scr_min_prestige", 0);
	spawning::function_6325a7c5();
	level.cumulativeroundscores = getgametypesetting(#"cumulativeroundscores");
	level.allowhitmarkers = getgametypesetting(#"allowhitmarkers");
	level.playerqueuedrespawn = getgametypesetting(#"playerqueuedrespawn");
	level.playerforcerespawn = getgametypesetting(#"playerforcerespawn");
	level.roundstartexplosivedelay = getgametypesetting(#"roundstartexplosivedelay");
	level.roundstartkillstreakdelay = getgametypesetting(#"roundstartkillstreakdelay");
	level.perksenabled = getgametypesetting(#"perksenabled");
	level.disableattachments = getgametypesetting(#"disableattachments");
	level.disabletacinsert = getgametypesetting(#"disabletacinsert");
	level.var_d0e6b79d = getgametypesetting(#"hash_47df56af71e4df3");
	level.disablecustomcac = getgametypesetting(#"disablecustomcac");
	if(!isdefined(level.disableclassselection))
	{
		level.disableclassselection = getgametypesetting(#"disableclassselection");
	}
	level.disableweapondrop = getgametypesetting(#"disableweapondrop");
	level.onlyheadshots = getgametypesetting(#"onlyheadshots");
	level.minimumallowedteamkills = getgametypesetting(#"teamkillpunishcount") - 1;
	level.teamkillreducedpenalty = getgametypesetting(#"teamkillreducedpenalty");
	level.teamkillpointloss = getgametypesetting(#"teamkillpointloss");
	level.teamkillspawndelay = getgametypesetting(#"teamkillspawndelay");
	level.deathpointloss = getgametypesetting(#"deathpointloss");
	level.leaderbonus = getgametypesetting(#"leaderbonus");
	level.forceradar = getgametypesetting(#"forceradar");
	level.playersprinttime = getgametypesetting(#"playersprinttime");
	level.bulletdamagescalar = getgametypesetting(#"bulletdamagescalar");
	level.playermaxhealth = getgametypesetting(#"playermaxhealth");
	level.playerhealthregentime = getgametypesetting(#"playerhealthregentime");
	level.var_b1e41c9b = getgametypesetting(#"hash_430ea04f2dccef18");
	level.playerrespawndelay = getgametypesetting(#"playerrespawndelay");
	level.playerobjectiveheldrespawndelay = getgametypesetting(#"playerobjectiveheldrespawndelay");
	level.waverespawndelay = getgametypesetting(#"waverespawndelay");
	level.suicidespawndelay = getgametypesetting(#"spawnsuicidepenalty");
	level.teamkilledspawndelay = getgametypesetting(#"spawnteamkilledpenalty");
	level.maxsuicidesbeforekick = getgametypesetting(#"maxsuicidesbeforekick");
	level.spectatetype = getgametypesetting(#"spectatetype");
	level.voip = spawnstruct();
	level.voip.deadchatwithdead = getgametypesetting(#"voipdeadchatwithdead");
	level.voip.deadchatwithteam = getgametypesetting(#"voipdeadchatwithteam");
	level.voip.deadhearallliving = getgametypesetting(#"voipdeadhearallliving");
	level.voip.deadhearteamliving = getgametypesetting(#"voipdeadhearteamliving");
	level.voip.everyonehearseveryone = getgametypesetting(#"voipeveryonehearseveryone");
	level.voip.deadhearkiller = getgametypesetting(#"voipdeadhearkiller");
	level.voip.killershearvictim = getgametypesetting(#"voipkillershearvictim");
	gameobjects::main();
	callback::callback(#"on_start_gametype");
	foreach(_ in level.teams)
	{
		initteamvariables(team);
	}
	level.maxplayercount = 0;
	level.allowannouncer = getgametypesetting(#"allowannouncer");
	if(!isdefined(level.timelimit))
	{
		util::registertimelimit(1, 1440);
	}
	if(!isdefined(level.scorelimit))
	{
		util::registerscorelimit(1, 500);
	}
	if(!isdefined(level.roundlimit))
	{
		util::registerroundlimit(0, 10);
	}
	if(!isdefined(level.roundwinlimit))
	{
		util::registerroundwinlimit(0, 10);
	}
	wavedelay = level.waverespawndelay;
	if(wavedelay)
	{
		foreach(team, _ in level.teams)
		{
			level.wavedelay[team] = wavedelay;
			level.lastwave[team] = 0;
		}
		level thread [[level.wavespawntimer]]();
	}
	level.inprematchperiod = 1;
	if(level.prematchperiod > 2)
	{
		level.prematchperiod = level.prematchperiod + (randomfloat(4) - 2);
	}
	level.graceperiod = 10;
	level.ingraceperiod = 1;
	level.roundenddelay = 5;
	level.halftimeroundenddelay = 3;
	level.killstreaksenabled = 1;
	if(getdvarstring(#"scr_game_rankenabled") == "")
	{
		setdvar(#"scr_game_rankenabled", 1);
	}
	level.rankenabled = getdvarint(#"scr_game_rankenabled", 0);
	if(getdvarstring(#"scr_game_medalsenabled") == "")
	{
		setdvar(#"scr_game_medalsenabled", 1);
	}
	level.medalsenabled = getdvarint(#"scr_game_medalsenabled", 0);
	if(level.hardcoremode && level.rankedmatch && getdvarstring(#"scr_game_friendlyfiredelay") == "")
	{
		setdvar(#"scr_game_friendlyfiredelay", 1);
	}
	level.friendlyfiredelay = getdvarint(#"scr_game_friendlyfiredelay", 0);
	[[level.onstartgametype]]();
	if(getdvarint(#"custom_killstreak_mode", 0) == 1)
	{
		level.killstreaksenabled = 0;
	}
	if(isdefined(level.gameskill))
	{
		matchrecordsetleveldifficultyforindex(0, level.gameskill);
	}
	/#
		if(getdvarint(#"scr_writeconfigstrings", 0) == 1)
		{
			level.skipgameend = 1;
			level.roundlimit = 1;
			wait(1);
			thread forceend();
		}
	#/
	function_403c8a1();
	thread startgame();
	level thread updategametypedvars();
}

/*
	Name: function_403c8a1
	Namespace: globallogic
	Checksum: 0x3CF7B8F0
	Offset: 0x7EE8
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_403c8a1()
{
	level endon(#"level_intro_complete");
	level flag::wait_till("all_players_spawned");
	var_a1fdb637 = 0;
	foreach(e_player in level.players)
	{
		if(!isbot(e_player))
		{
			var_a1fdb637++;
			e_player thread function_70ff69a7();
		}
	}
	if(var_a1fdb637 > 0)
	{
		level flag::wait_till("level_intro_complete");
	}
}

/*
	Name: function_70ff69a7
	Namespace: globallogic
	Checksum: 0xD3D21AAD
	Offset: 0x7FF8
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_70ff69a7()
{
	self endon(#"disconnect");
	level endon(#"level_intro_complete");
	self flag::wait_till("kill_initial_black");
	level flag::set(#"level_intro_complete");
}

/*
	Name: registerfriendlyfiredelay
	Namespace: globallogic
	Checksum: 0x1BB3DE03
	Offset: 0x8068
	Size: 0x114
	Parameters: 4
	Flags: Linked
*/
function registerfriendlyfiredelay(dvarstring, defaultvalue, minvalue, maxvalue)
{
	dvarstring = ("scr_" + dvarstring) + "_friendlyFireDelayTime";
	if(getdvarstring(dvarstring) == "")
	{
		setdvar(dvarstring, defaultvalue);
	}
	if(getdvarint(dvarstring, 0) > maxvalue)
	{
		setdvar(dvarstring, maxvalue);
	}
	else if(getdvarint(dvarstring, 0) < minvalue)
	{
		setdvar(dvarstring, minvalue);
	}
	level.friendlyfiredelaytime = getdvarint(dvarstring, 0);
}

/*
	Name: checkroundswitch
	Namespace: globallogic
	Checksum: 0x1E5379C6
	Offset: 0x8188
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function checkroundswitch()
{
	if(!isdefined(level.roundswitch) || !level.roundswitch)
	{
		return false;
	}
	if(!isdefined(level.onroundswitch))
	{
		return false;
	}
	/#
		assert(game.roundsplayed > 0);
	#/
	if((game.roundsplayed % level.roundswitch) == 0)
	{
		[[level.onroundswitch]]();
		return true;
	}
	return false;
}

/*
	Name: listenforgameend
	Namespace: globallogic
	Checksum: 0xEDFE3DED
	Offset: 0x8220
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function listenforgameend()
{
	self endon(#"disconnect", #"killgameendmonitor");
	self waittill(#"host_sucks_end_game");
	level.skipvote = 1;
	if(!level.gameended)
	{
		level thread forceend();
	}
}

/*
	Name: getkillstreaks
	Namespace: globallogic
	Checksum: 0xB0A9B125
	Offset: 0x8298
	Size: 0xFA
	Parameters: 1
	Flags: Linked
*/
function getkillstreaks(player)
{
	for(killstreaknum = 0; killstreaknum < level.maxkillstreaks; killstreaknum++)
	{
		killstreak[killstreaknum] = "killstreak_null";
	}
	if(isplayer(player) && !level.oldschool && level.disableclassselection != 1 && isdefined(player.killstreak))
	{
		currentkillstreak = 0;
		for(killstreaknum = 0; killstreaknum < level.maxkillstreaks; killstreaknum++)
		{
			if(isdefined(player.killstreak[killstreaknum]))
			{
				killstreak[currentkillstreak] = player.killstreak[killstreaknum];
				currentkillstreak++;
			}
		}
	}
	return killstreak;
}

/*
	Name: updaterankedmatch
	Namespace: globallogic
	Checksum: 0x62A7770F
	Offset: 0x83A0
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function updaterankedmatch(winner)
{
	if(level.rankedmatch)
	{
		if(hostidledout())
		{
			level.hostforcedend = 1;
			/#
				print("");
			#/
		}
	}
}

