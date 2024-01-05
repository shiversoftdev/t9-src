#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\rat.gsc;
#using scripts\weapons\zm\weaponobjects.gsc;
#using scripts\zm_common\gametypes\spawnlogic.gsc;
#using scripts\zm_common\gametypes\hud_message.gsc;
#using scripts\zm_common\gametypes\hostmigration.gsc;
#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\zm_common\gametypes\globallogic_ui.gsc;
#using scripts\zm_common\gametypes\globallogic_spawn.gsc;
#using scripts\zm_common\gametypes\globallogic_score.gsc;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\zm_common\gametypes\globallogic_defaults.gsc;
#using scripts\zm_common\gametypes\globallogic_audio.gsc;
#using script_41b18a77720c5395;
#using scripts\zm_common\gametypes\dev.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\globallogic\globallogic_player.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\bb_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using script_44b0b8420eabacad;
#using scripts\core_common\simple_hostmigration.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\popups_shared.gsc;
#using scripts\core_common\persistence_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\healthoverlay.gsc;
#using scripts\core_common\gametype_shared.gsc;
#using script_32c8b5b0eb2854f3;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace globallogic;

/*
	Name: function_a87ed5da
	Namespace: globallogic
	Checksum: 0x94B476E4
	Offset: 0x4E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a87ed5da()
{
	level notify(1263530833);
}

/*
	Name: __init__system__
	Namespace: globallogic
	Checksum: 0x81C77E14
	Offset: 0x500
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"globallogic", &function_70a657d8, undefined, undefined, #"visionset_mgr");
}

/*
	Name: function_70a657d8
	Namespace: globallogic
	Checksum: 0xFD0F2693
	Offset: 0x550
	Size: 0xBC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	visionset_mgr::register_info("visionset", "crithealth", 1, 4, 25, 1, &visionset_mgr::ramp_in_out_thread_per_player, 0);
	clientfield::register_clientuimodel("hudItems.armorIsOnCooldown", 1, 1, "int");
	clientfield::function_91cd7763("string", "hudItems.cursorHintZMPurchaseInvalidText", 1, 0);
	clientfield::register_clientuimodel("hudItems.cursorHintZMPurchaseInvalid", 1, 1, "int");
}

/*
	Name: init
	Namespace: globallogic
	Checksum: 0xFD0BBCA9
	Offset: 0x618
	Size: 0x8D4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.language = getdvarstring(#"language");
	level.splitscreen = issplitscreen();
	level.xenon = getdvarstring(#"xenongame") == "true";
	level.ps3 = getdvarstring(#"ps3game") == "true";
	level.wiiu = getdvarstring(#"wiiugame") == "true";
	level.orbis = getdvarstring(#"orbisgame") == "true";
	level.durango = getdvarstring(#"durangogame") == "true";
	level.console = getdvarstring(#"consolegame") == "true";
	level.createfx_disable_fx = getdvarint(#"disable_fx", 0) == 1;
	level.onlinegame = sessionmodeisonlinegame();
	level.systemlink = sessionmodeissystemlink();
	level.rankedmatch = gamemodeisusingxp();
	level.leaguematch = 0;
	level.arenamatch = 0;
	level.contractsenabled = !getgametypesetting(#"disablecontracts");
	level.contractsenabled = 0;
	level.var_49d9aa70 = 1;
	level.new_health_model = 1;
	/#
		if(getdvarint(#"scr_forcerankedmatch", 0) == 1)
		{
			level.rankedmatch = 1;
		}
	#/
	level.script = util::get_map_name();
	level.gametype = util::get_game_type();
	level.var_837aa533 = hash(level.gametype);
	if(isdefined(level.gametype))
	{
		level.var_12323003 = function_16495154(level.var_837aa533);
		level.basegametype = function_be90acca(level.var_837aa533);
	}
	level.teambased = 0;
	level.teamcount = 1;
	level.multiteam = level.teamcount > 2;
	if(sessionmodeiszombiesgame())
	{
		level.zombie_team_index = level.teamcount + 1;
		if(2 == level.zombie_team_index)
		{
			level.zombie_team = #"axis";
		}
		else
		{
			level.zombie_team = "team" + level.zombie_team_index;
		}
	}
	gametype::init();
	level.teams = [];
	level.teamindex = [];
	teamcount = level.teamcount;
	level.teams[#"allies"] = "allies";
	level.teams[#"axis"] = "axis";
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
	level.defaultoffenseradius = 560;
	level.dropteam = getdvarint(#"sv_maxclients", 0);
	level.infinalkillcam = 0;
	registerdvars();
	level.oldschool = getdvarint(#"scr_oldschool", 0);
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
	display_transition::init_shared();
	if(!isdefined(game.tiebreaker))
	{
		game.tiebreaker = 0;
	}
	if(!isdefined(game.stat))
	{
		game.stat = [];
	}
	level.figure_out_attacker = &globallogic_player::figureoutattacker;
	level.figure_out_friendly_fire = &globallogic_player::figureoutfriendlyfire;
}

/*
	Name: registerdvars
	Namespace: globallogic
	Checksum: 0x7EF16F57
	Offset: 0xEF8
	Size: 0x19C
	Parameters: 0
	Flags: Linked
*/
function registerdvars()
{
	if(!isdefined(getdvar(#"scr_oldschool")))
	{
		setdvar(#"scr_oldschool", 0);
	}
	if(!isdefined(getdvar(#"ui_guncycle")))
	{
		setdvar(#"ui_guncycle", 0);
	}
	if(!isdefined(getdvar(#"ui_weapon_tiers")))
	{
		setdvar(#"ui_weapon_tiers", 0);
	}
	setdvar(#"ui_text_endreason", "");
	setmatchflag("bomb_timer", 0);
	level.vehicledamagescalar = getdvarfloat(#"scr_vehicle_damage_scalar", 1);
	level.fire_audio_repeat_duration = getdvarint(#"fire_audio_repeat_duration", 0);
	level.fire_audio_random_max_duration = getdvarint(#"fire_audio_random_max_duration", 0);
}

/*
	Name: blank
	Namespace: globallogic
	Checksum: 0x53450B62
	Offset: 0x10A0
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
	Checksum: 0xC171B985
	Offset: 0x1100
	Size: 0x434
	Parameters: 0
	Flags: None
*/
function setupcallbacks()
{
	level.spawnplayer = &globallogic_spawn::spawnplayer;
	level.spawnplayerprediction = &globallogic_spawn::spawnplayerprediction;
	level.spawnclient = &globallogic_spawn::spawnclient;
	level.spawnspectator = &globallogic_spawn::spawnspectator;
	level.spawnintermission = &globallogic_spawn::spawnintermission;
	level.scoreongiveplayerscore = &globallogic_score::giveplayerscore;
	level.onplayerscore = &globallogic_score::default_onplayerscore;
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
	level.giveteamscore = &globallogic_score::giveteamscore;
	level.onlastteamaliveevent = undefined;
	level.gettimepassed = &globallogic_utils::gettimepassed;
	level.gettimeremaining = &globallogic_utils::gettimeremaining;
	level.gettimelimit = &globallogic_defaults::default_gettimelimit;
	level.getteamkillpenalty = &blank;
	level.getteamkillscore = &blank;
	level.iskillboosting = &globallogic_score::default_iskillboosting;
	level._setteamscore = &globallogic_score::_setteamscore;
	level._setplayerscore = &globallogic_score::_setplayerscore;
	level._getteamscore = &globallogic_score::_getteamscore;
	level._getplayerscore = &globallogic_score::_getplayerscore;
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
	level.dogmanagerongetdogs = &blank;
	level.var_fc5ef179 = &blank;
}

/*
	Name: compareteambygamestat
	Namespace: globallogic
	Checksum: 0xF60C145E
	Offset: 0x1540
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
	Checksum: 0xE2BEA869
	Offset: 0x1638
	Size: 0xCA
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
		if(winner != "tie")
		{
			previous_winner_score = game.stat[gamestat][winner];
		}
	}
	return winner;
}

/*
	Name: compareteambyteamscore
	Namespace: globallogic
	Checksum: 0x5B1D2795
	Offset: 0x1710
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
	Checksum: 0x107A3B7
	Offset: 0x17E8
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
	Checksum: 0x86F07C0
	Offset: 0x18B8
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function forceend(hostsucks)
{
	if(!isdefined(hostsucks))
	{
		hostsucks = 0;
	}
	if(level.hostforcedend || level.forcedend)
	{
		return;
	}
	winner = undefined;
	if(level.teambased)
	{
		winner = determineteamwinnerbygamestat("teamScores");
		globallogic_utils::logteamwinstring("host ended game", winner);
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
	level.forcedend = 1;
	level.hostforcedend = 1;
	if(hostsucks)
	{
		endstring = #"hash_115339e33ac1efcb";
	}
	else
	{
		if(level.splitscreen)
		{
			endstring = #"mp/ended_game";
		}
		else
		{
			endstring = #"hash_cd63faed592da03";
		}
	}
	setmatchflag("disableIngameMenu", 1);
	setdvar(#"ui_text_endreason", endstring);
	thread endgame(winner, endstring);
}

/*
	Name: killserverpc
	Namespace: globallogic
	Checksum: 0x71E5A8D1
	Offset: 0x1A88
	Size: 0x15C
	Parameters: 0
	Flags: Linked
*/
function killserverpc()
{
	if(level.hostforcedend || level.forcedend)
	{
		return;
	}
	winner = undefined;
	if(level.teambased)
	{
		winner = determineteamwinnerbygamestat("teamScores");
		globallogic_utils::logteamwinstring("host ended game", winner);
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
	level.forcedend = 1;
	level.hostforcedend = 1;
	level.killserver = 1;
	endstring = #"hash_cd63faed592da03";
	/#
		println("");
	#/
	thread endgame(winner, endstring);
}

/*
	Name: someoneoneachteam
	Namespace: globallogic
	Checksum: 0x8DD007A7
	Offset: 0x1BF0
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function someoneoneachteam()
{
	foreach(team, _ in level.teams)
	{
		if(level.playercount[team] == 0)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: checkifteamforfeits
	Namespace: globallogic
	Checksum: 0x2527434F
	Offset: 0x1C90
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function checkifteamforfeits(team)
{
	if(!level.everexisted[team])
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
	Name: checkforanyteamforfeit
	Namespace: globallogic
	Checksum: 0x1E0F441B
	Offset: 0x1D00
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function checkforanyteamforfeit()
{
	foreach(_ in level.teams)
	{
		if(checkifteamforfeits(team))
		{
			thread [[level.onforfeit]](team);
			return true;
		}
	}
	return false;
}

/*
	Name: dospawnqueueupdates
	Namespace: globallogic
	Checksum: 0x85F1E427
	Offset: 0x1DB0
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
	Checksum: 0x175B704
	Offset: 0x1E58
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
	Checksum: 0xF51DBC44
	Offset: 0x1EB0
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
	Name: alldeadteamcount
	Namespace: globallogic
	Checksum: 0xF256831
	Offset: 0x1F50
	Size: 0xA2
	Parameters: 0
	Flags: Linked
*/
function alldeadteamcount()
{
	count = 0;
	foreach(_ in level.teams)
	{
		if(isteamalldead(team))
		{
			count++;
		}
	}
	return count;
}

/*
	Name: dodeadeventupdates
	Namespace: globallogic
	Checksum: 0x2E05C3E2
	Offset: 0x2000
	Size: 0x208
	Parameters: 0
	Flags: Linked
*/
function dodeadeventupdates()
{
	if(level.teambased)
	{
		if(areallteamsdead())
		{
			[[level.ondeadevent]]("all");
			return true;
		}
		if(isdefined(level.onlastteamaliveevent))
		{
			if(alldeadteamcount() == (level.teams.size - 1))
			{
				foreach(_ in level.teams)
				{
					if(!isteamalldead(team))
					{
						[[level.onlastteamaliveevent]](team);
						return true;
					}
				}
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
	Checksum: 0x4703FAA0
	Offset: 0x2210
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
	Checksum: 0x3AB1809E
	Offset: 0x2278
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
	Checksum: 0x9761EB4
	Offset: 0x23A0
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
				if(game.state == "playing" && checkforanyteamforfeit())
				{
					return;
				}
			}
			else if(someoneoneachteam())
			{
				level.gameforfeited = 0;
				level notify(#"abort forfeit");
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
				level notify(#"abort forfeit");
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
	Name: function_8da685e9
	Namespace: globallogic
	Checksum: 0x2D4941F3
	Offset: 0x25B8
	Size: 0x14E
	Parameters: 0
	Flags: Linked
*/
function function_8da685e9()
{
	level endon(#"hash_27f6b2240317c878");
	while(true)
	{
		foreach(player in level.players)
		{
			shouldshow = 1;
			for(var_3c0cc784 = 0; var_3c0cc784 < level.var_75433ec1.size; var_3c0cc784++)
			{
				if(player == level.var_75433ec1[var_3c0cc784])
				{
					shouldshow = 0;
				}
			}
			if(shouldshow)
			{
				player luinotifyevent(#"create_prematch_timer", 2, level.var_fd167bf6, level.var_5654073f);
				level.var_75433ec1[level.var_75433ec1.size] = player;
			}
		}
		waitframe(1);
	}
}

/*
	Name: matchstarttimer
	Namespace: globallogic
	Checksum: 0x1188B561
	Offset: 0x2710
	Size: 0x344
	Parameters: 1
	Flags: Linked
*/
function matchstarttimer(counttime)
{
	level endon(#"end_game");
	self notify("5eeb7c12cae8831b");
	self endon("5eeb7c12cae8831b");
	var_5654073f = counttime >= 2;
	level.var_5654073f = var_5654073f;
	level.var_fd167bf6 = gettime() + (int(counttime * 1000));
	level.var_75433ec1 = [];
	foreach(player in level.players)
	{
		player luinotifyevent(#"create_prematch_timer", 2, gettime() + (int(counttime * 1000)), var_5654073f);
		level.var_75433ec1[level.var_75433ec1.size] = player;
	}
	if(var_5654073f)
	{
		thread function_8da685e9();
		while(counttime > 0 && !level.gameended)
		{
			if(counttime == 2)
			{
				visionsetnaked("default", 3);
			}
			counttime--;
			var_b9ef7eae = [];
			foreach(player in level.players)
			{
				shouldplaysound = 1;
				for(var_3c0cc784 = 0; var_3c0cc784 < var_b9ef7eae.size; var_3c0cc784++)
				{
					if(player isplayeronsamemachine(var_b9ef7eae[var_3c0cc784]))
					{
						shouldplaysound = 0;
					}
				}
				if(shouldplaysound)
				{
					player playlocalsound(#"hash_5e14726f77107d1b");
					var_b9ef7eae[var_b9ef7eae.size] = player;
				}
			}
			wait(1);
		}
		level notify(#"hash_27f6b2240317c878");
	}
	else
	{
		visionsetnaked("default", 1);
	}
	luinotifyevent(#"prematch_timer_ended", 1, var_5654073f);
}

/*
	Name: matchstarttimerskip
	Namespace: globallogic
	Checksum: 0xC4A26B65
	Offset: 0x2A60
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
	Checksum: 0x340103A9
	Offset: 0x2A88
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
	Checksum: 0x92E72DC8
	Offset: 0x2B00
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
	Checksum: 0x911865E6
	Offset: 0x2BE0
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
	Checksum: 0x1D7C9B95
	Offset: 0x2CA8
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
	Checksum: 0x102E435A
	Offset: 0x2D08
	Size: 0x54
	Parameters: 3
	Flags: None
*/
function setmatchcompletionstat(gamemode, playedorhosted, stat)
{
	self stats::set_stat(#"gamehistory", gamemode, #"modehistory", playedorhosted, stat, 1);
}

/*
	Name: getendreasontext
	Namespace: globallogic
	Checksum: 0x8757E8F4
	Offset: 0x2D68
	Size: 0xC4
	Parameters: 0
	Flags: None
*/
function getendreasontext()
{
	if(util::hitroundlimit() || util::hitroundwinlimit())
	{
		return game.strings[#"round_limit_reached"];
	}
	if(util::hitscorelimit())
	{
		return game.strings[#"score_limit_reached"];
	}
	if(level.forcedend)
	{
		if(level.hostforcedend)
		{
			return #"hash_cd63faed592da03";
		}
		return #"mp/ended_game";
	}
	return game.strings[#"time_limit_reached"];
}

/*
	Name: resetoutcomeforallplayers
	Namespace: globallogic
	Checksum: 0xE199C2CC
	Offset: 0x2E38
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function resetoutcomeforallplayers()
{
	players = level.players;
	foreach(player in players)
	{
		if(!isdefined(player))
		{
			continue;
		}
		player notify(#"reset_outcome");
	}
}

/*
	Name: getgamelength
	Namespace: globallogic
	Checksum: 0x44AA3E2E
	Offset: 0x2EE8
	Size: 0x78
	Parameters: 0
	Flags: Linked
*/
function getgamelength()
{
	if(!level.timelimit || level.forcedend)
	{
		gamelength = globallogic_utils::gettimepassed() / 1000;
		gamelength = min(gamelength, 1200);
	}
	else
	{
		gamelength = level.timelimit * 60;
	}
	return gamelength;
}

/*
	Name: gamehistoryplayerquit
	Namespace: globallogic
	Checksum: 0x91CEC2F3
	Offset: 0x2F68
	Size: 0x14A
	Parameters: 0
	Flags: Linked
*/
function gamehistoryplayerquit()
{
	if(!gamemodeismode(0))
	{
		return;
	}
	teamscoreratio = 0;
	self gamehistoryfinishmatch(3, 0, 0, 0, 0, teamscoreratio);
	if(isdefined(self.pers[#"matchesplayedstatstracked"]))
	{
		gamemode = util::getcurrentgamemode();
		self incrementmatchcompletionstat(gamemode, "played", "quit");
		if(isdefined(self.pers[#"matcheshostedstatstracked"]))
		{
			self incrementmatchcompletionstat(gamemode, "hosted", "quit");
			self.pers[#"matcheshostedstatstracked"] = undefined;
		}
		self.pers[#"matchesplayedstatstracked"] = undefined;
	}
	uploadstats(self);
	wait(1);
}

/*
	Name: function_6c8d7c31
	Namespace: globallogic
	Checksum: 0x2E1121F9
	Offset: 0x30C0
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_6c8d7c31(winner)
{
	players = level.players;
	for(index = 0; index < players.size; index++)
	{
		globallogic_player::function_7314957c(players[index], winner);
	}
}

/*
	Name: endgame
	Namespace: globallogic
	Checksum: 0x727D006
	Offset: 0x3128
	Size: 0x180
	Parameters: 2
	Flags: Linked
*/
function endgame(winner, endreasontext)
{
	if(game.state == #"postgame" || level.gameended)
	{
		return;
	}
	level.winningteam = endreasontext;
	outcome = (endreasontext === level.zombie_team ? #"loss" : #"win");
	players = getplayers();
	foreach(player in players)
	{
		player.pers[#"outcome"] = outcome;
	}
	thread challenges::roundend(endreasontext);
	skillupdate(endreasontext, level.teambased);
	level notify(#"end_game");
}

/*
	Name: bbplayermatchend
	Namespace: globallogic
	Checksum: 0x33EE7EAF
	Offset: 0x32B0
	Size: 0xBE
	Parameters: 3
	Flags: Linked
*/
function bbplayermatchend(gamelength, endreasonstring, gameover)
{
	playerrank = getplacementforplayer(self);
	totaltimeplayed = 0;
	if(isdefined(self.timeplayed) && isdefined(self.timeplayed[#"total"]))
	{
		totaltimeplayed = self.timeplayed[#"total"];
		if(totaltimeplayed > gameover)
		{
			totaltimeplayed = gameover;
		}
	}
	xuid = self getxuid();
}

/*
	Name: roundendwait
	Namespace: globallogic
	Checksum: 0xCB672E50
	Offset: 0x3378
	Size: 0x78
	Parameters: 2
	Flags: None
*/
function roundendwait(defaultdelay, matchbonus)
{
	if(!matchbonus)
	{
		wait(defaultdelay);
		level notify(#"round_end_done");
		return;
	}
	wait(defaultdelay / 2);
	level notify(#"give_match_bonus");
	wait(defaultdelay / 2);
	level notify(#"round_end_done");
}

/*
	Name: roundenddof
	Namespace: globallogic
	Checksum: 0x66D2664B
	Offset: 0x33F8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function roundenddof(time)
{
	self clientfield::set_to_player("player_dof_settings", 2);
}

/*
	Name: checktimelimit
	Namespace: globallogic
	Checksum: 0x84D057D5
	Offset: 0x3430
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
	Checksum: 0x9F4CFC15
	Offset: 0x3568
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
	Checksum: 0x66B40A83
	Offset: 0x3618
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function checkscorelimit()
{
	if(game.state != "playing")
	{
		return;
	}
	if(level.scorelimit <= 0)
	{
		return;
	}
	if(level.teambased)
	{
		if(allteamsunderscorelimit())
		{
			return;
		}
	}
	else
	{
		if(!isplayer(self))
		{
			return;
		}
		if(self.score < level.scorelimit)
		{
			return;
		}
	}
	[[level.onscorelimit]]();
}

/*
	Name: updategametypedvars
	Namespace: globallogic
	Checksum: 0x421EA220
	Offset: 0x36C0
	Size: 0x2D2
	Parameters: 0
	Flags: Linked
*/
function updategametypedvars()
{
	level endon(#"end_game");
	while(game.state == "playing")
	{
		roundlimit = getgametypesetting(#"roundlimit");
		roundlimit = math::clamp((isdefined(roundlimit) ? roundlimit : 1), (isdefined(level.roundlimitmin) ? level.roundlimitmin : 0), (isdefined(level.roundlimitmax) ? level.roundlimitmax : 10));
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
		scorelimit = getgametypesetting(#"scorelimit");
		scorelimit = math::clamp((isdefined(scorelimit) ? scorelimit : 7500), (isdefined(level.scorelimitmin) ? level.scorelimitmin : 1), (isdefined(level.scorelimitmax) ? level.scorelimitmax : 500));
		if(scorelimit != level.scorelimit)
		{
			level.scorelimit = scorelimit;
			setdvar(#"ui_scorelimit", level.scorelimit);
			level notify(#"update_scorelimit");
		}
		checkscorelimit();
		if(isdefined(level.starttime))
		{
			if(globallogic_utils::gettimeremaining() < 3000)
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
	Checksum: 0x5DBF1732
	Offset: 0x39A0
	Size: 0x210
	Parameters: 0
	Flags: Linked
*/
function removedisconnectedplayerfromplacement()
{
	if(gamestate::is_shutting_down())
	{
		return;
	}
	offset = 0;
	numplayers = level.placement[#"all"].size;
	found = 0;
	for(i = 0; i < numplayers; i++)
	{
		if(level.placement[#"all"][i] === self)
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
	Checksum: 0x20A300EF
	Offset: 0x3BB8
	Size: 0x23C
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
	level.placement[#"all"] = placementall;
	/#
		globallogic_utils::assertproperplacement();
	#/
	updateteamplacement();
}

/*
	Name: updateteamplacement
	Namespace: globallogic
	Checksum: 0xE3AE1776
	Offset: 0x3E00
	Size: 0x1B4
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
		if(isdefined(player))
		{
			team = player.pers[#"team"];
			placement[team][placement[team].size] = player;
		}
	}
	foreach(team, _ in level.teams)
	{
		level.placement[team] = placement[team];
	}
}

/*
	Name: getplacementforplayer
	Namespace: globallogic
	Checksum: 0x5DC6EE77
	Offset: 0x3FC0
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
	Name: sortdeadplayers
	Namespace: globallogic
	Checksum: 0x2ED22E0E
	Offset: 0x4078
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
	Checksum: 0x253D85B3
	Offset: 0x4200
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
	Checksum: 0xDE757511
	Offset: 0x42B0
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
	Name: initteamvariables
	Namespace: globallogic
	Checksum: 0x655CE551
	Offset: 0x4358
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function initteamvariables(team)
{
	level.lastalivecount[team] = 0;
	level.everexisted[team] = 0;
	level.wavedelay[team] = 0;
	level.lastwave[team] = 0;
	level.waveplayerspawnindex[team] = 0;
	resetteamvariables(team);
}

/*
	Name: resetteamvariables
	Namespace: globallogic
	Checksum: 0x49ED5643
	Offset: 0x43D8
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function resetteamvariables(team)
{
	level.playercount[team] = 0;
	level.botscount[team] = 0;
	level.lastalivecount[team] = function_a1ef346b(team).size;
	level.playerlives[team] = 0;
	level.deadplayers[team] = [];
	level.squads[team] = [];
	level.spawnqueuemodified[team] = 0;
}

/*
	Name: updateteamstatus
	Namespace: globallogic
	Checksum: 0x97517676
	Offset: 0x4478
	Size: 0x368
	Parameters: 1
	Flags: Linked
*/
function updateteamstatus(var_bdfe75a7)
{
	if(game.state == "postgame")
	{
		return;
	}
	foreach(_ in level.teams)
	{
		resetteamvariables(team);
	}
	self.var_bdfe75a7 = var_bdfe75a7;
	foreach(player in getplayers())
	{
		team = player.team;
		if(team != "spectator")
		{
			level.playercount[team]++;
			if(isbot(player))
			{
				level.botscount[team]++;
			}
			if(player.sessionstate == "playing" && !is_true(player.var_bdfe75a7))
			{
				level.playerlives[team]++;
				player.spawnqueueindex = -1;
				if(!isalive(player))
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
	totalalive = totalalivecount();
	if(totalalive > level.maxplayercount)
	{
		level.maxplayercount = totalalive;
	}
	foreach(team, _ in level.teams)
	{
		if(function_a1ef346b(team).size && level.everexisted[team] == 0)
		{
			level.everexisted[team] = gettime();
		}
		sortdeadplayers(team);
	}
	level updategameevents();
	self.var_bdfe75a7 = undefined;
}

/*
	Name: checkteamscorelimitsoon
	Namespace: globallogic
	Checksum: 0xA1A218D8
	Offset: 0x47E8
	Size: 0xB0
	Parameters: 1
	Flags: Linked
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
		level notify(#"match_ending_soon", "score");
	}
}

/*
	Name: checkplayerscorelimitsoon
	Namespace: globallogic
	Checksum: 0x11F3FDFC
	Offset: 0x48A0
	Size: 0xB8
	Parameters: 0
	Flags: Linked
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
		level notify(#"match_ending_soon", "score");
	}
}

/*
	Name: startgame
	Namespace: globallogic
	Checksum: 0xEBB536B7
	Offset: 0x4960
	Size: 0x1E4
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
	prematchperiod();
	level notify(#"prematch_over");
	level.prematch_over = 1;
	thread graceperiod();
	thread watchmatchendingsoon();
	level callback::callback(#"on_game_playing");
	if(is_true(level.zm_disable_recording_stats))
	{
		return;
	}
	recordmatchbegin();
}

/*
	Name: waitforplayers
	Namespace: globallogic
	Checksum: 0x63613ED0
	Offset: 0x4B50
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function waitforplayers()
{
	while(level.players.size == 0)
	{
		waitframe(1);
	}
}

/*
	Name: prematchperiod
	Namespace: globallogic
	Checksum: 0x4A958DAB
	Offset: 0x4B80
	Size: 0x18A
	Parameters: 0
	Flags: Linked
*/
function prematchperiod()
{
	setmatchflag("hud_hardcore", level.hardcoremode);
	level endon(#"game_ended");
	if(level.prematchperiod > 0)
	{
		waitforplayers();
	}
	else
	{
		matchstarttimerskip();
		waitframe(1);
	}
	level.inprematchperiod = 0;
	foreach(player in level.players)
	{
		player val::reset(#"prematch_period", "freezecontrols");
		player val::reset(#"prematch_period", "disable_weapons");
		player val::reset(#"prematch_period", "disablegadgets");
	}
	if(game.state != "playing")
	{
		return;
	}
}

/*
	Name: graceperiod
	Namespace: globallogic
	Checksum: 0x1EE75A50
	Offset: 0x4D18
	Size: 0x152
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
		level flag::wait_till(#"initial_fade_in_complete");
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
			if(!player.hasspawned && player.sessionteam != "spectator" && !isalive(player))
			{
				player.statusicon = "hud_status_dead";
			}
		}
	}
}

/*
	Name: watchmatchendingsoon
	Namespace: globallogic
	Checksum: 0x16903B5F
	Offset: 0x4E78
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
	Name: assertteamvariables
	Namespace: globallogic
	Checksum: 0x80F724D1
	Offset: 0x4EE8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function assertteamvariables()
{
}

/*
	Name: anyteamhaswavedelay
	Namespace: globallogic
	Checksum: 0x4B079C36
	Offset: 0x4EF8
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
	Checksum: 0x1373CCF1
	Offset: 0x4F90
	Size: 0x1544
	Parameters: 0
	Flags: Linked
*/
function callback_startgametype()
{
	level.prematchperiod = 0;
	level.intermission = 0;
	if(isdefined(level.var_6c4ec3fc))
	{
		[[level.var_6c4ec3fc]]();
	}
	setmatchflag("cg_drawSpectatorMessages", 1);
	setmatchflag("game_ended", 0);
	if(!isdefined(game.gamestarted))
	{
		if(!isdefined(game.allies))
		{
			game.allies = "seals";
		}
		if(!isdefined(game.axis))
		{
			game.axis = "pmc";
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
				game.team = "pmc";
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
		game.strings[#"spawn_next_round"] = #"hash_590100cdca62e7db";
		game.strings[#"waiting_to_spawn"] = #"hash_44d60a6e6ed2a53c";
		game.strings[#"waiting_to_spawn_ss"] = #"hash_78bf3a61cf52e257";
		game.strings[#"you_will_spawn"] = #"hash_53c0ba6abce1c0ea";
		game.strings[#"match_starting"] = #"hash_73938fd7959ab087";
		game.strings[#"change_class"] = #"hash_181a96fe9c28ada2";
		game.strings[#"last_stand"] = #"hash_5732d212e4511a00";
		game.strings[#"cowards_way"] = #"hash_268e464278a2f8ff";
		game.strings[#"tie"] = #"mp/match_tie";
		game.strings[#"round_draw"] = #"mp/round_draw";
		game.strings[#"enemies_eliminated"] = #"mp_enemies_eliminated";
		game.strings[#"score_limit_reached"] = #"mp/score_limit_reached";
		game.strings[#"round_limit_reached"] = #"mp/round_limit_reached";
		game.strings[#"time_limit_reached"] = #"mp/time_limit_reached";
		game.strings[#"players_forfeited"] = #"mp/players_forfeited";
		assertteamvariables();
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
		if(!level.splitscreen && is_true(level.var_4ea2c79a))
		{
			level.prematchperiod = getgametypesetting(#"prematchperiod");
		}
	}
	if(!isdefined(game.timepassed))
	{
		game.timepassed = 0;
	}
	if(!isdefined(game.roundsplayed))
	{
		game.roundsplayed = 0;
	}
	if(!isdefined(game.roundwinner))
	{
		game.roundwinner = [];
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
		level.teamspawnpoints[team] = [];
		level.spawn_point_team_class_names[team] = [];
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
	level.maxteamplayers = getgametypesetting(#"maxteamplayers");
	level.cumulativeroundscores = getgametypesetting(#"cumulativeroundscores");
	level.var_d0e6b79d = getgametypesetting(#"hash_47df56af71e4df3");
	level.allowhitmarkers = getgametypesetting(#"allowhitmarkers");
	level.playerqueuedrespawn = getgametypesetting(#"playerqueuedrespawn");
	level.playerforcerespawn = getgametypesetting(#"playerforcerespawn");
	level.perksenabled = getgametypesetting(#"perksenabled");
	level.disableattachments = getgametypesetting(#"disableattachments");
	level.disabletacinsert = getgametypesetting(#"disabletacinsert");
	level.disablecustomcac = getgametypesetting(#"disablecustomcac");
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
	level.spectatetype = getgametypesetting(#"spectatetype");
	level.voip = spawnstruct();
	level.voip.deadchatwithdead = getgametypesetting(#"voipdeadchatwithdead");
	level.voip.deadchatwithteam = getgametypesetting(#"voipdeadchatwithteam");
	level.voip.deadhearallliving = getgametypesetting(#"voipdeadhearallliving");
	level.voip.deadhearteamliving = getgametypesetting(#"voipdeadhearteamliving");
	level.voip.everyonehearseveryone = getgametypesetting(#"voipeveryonehearseveryone");
	level.voip.deadhearkiller = getgametypesetting(#"voipdeadhearkiller");
	level.voip.killershearvictim = getgametypesetting(#"voipkillershearvictim");
	callback::callback(#"on_start_gametype");
	level.persistentdatainfo = [];
	level.maxrecentstats = 10;
	level.maxhitlocations = 19;
	level.globalshotsfired = 0;
	thread hud_message::init();
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
	globallogic_utils::registerpostroundevent(&potm::post_round_potm);
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
	if(!isdefined(level.graceperiod))
	{
		level.graceperiod = 15;
	}
	level.ingraceperiod = 1;
	level.roundenddelay = 5;
	level.halftimeroundenddelay = 3;
	globallogic_score::updateallteamscores();
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
	if(isdefined(level.onstartgametype))
	{
		[[level.onstartgametype]]();
	}
	if(getdvarint(#"custom_killstreak_mode", 0) == 1)
	{
		level.killstreaksenabled = 0;
	}
	level thread potm::play_potm(1);
	thread startgame();
	if(!is_true(level.var_82dda526))
	{
		level thread updategametypedvars();
	}
	level thread simple_hostmigration::updatehostmigrationdata();
	/#
		if(getdvarint(#"scr_writeconfigstrings", 0) == 1)
		{
			level.skipgameend = 1;
			level.roundlimit = 1;
			wait(1);
			thread forceend(0);
		}
		if(getdvarint(#"scr_hostmigrationtest", 0) == 1)
		{
			thread forcedebughostmigration();
		}
	#/
}

/*
	Name: forcedebughostmigration
	Namespace: globallogic
	Checksum: 0x426CDFDE
	Offset: 0x64E0
	Size: 0x50
	Parameters: 0
	Flags: None
*/
function forcedebughostmigration()
{
	/#
		while(true)
		{
			hostmigration::waittillhostmigrationdone();
			wait(60);
			starthostmigration();
			hostmigration::waittillhostmigrationdone();
		}
	#/
}

/*
	Name: registerfriendlyfiredelay
	Namespace: globallogic
	Checksum: 0x27D28D51
	Offset: 0x6538
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
	Checksum: 0xE6B7626A
	Offset: 0x6658
	Size: 0x90
	Parameters: 0
	Flags: None
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
	Checksum: 0x8A82E0AE
	Offset: 0x66F0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function listenforgameend()
{
	self endon(#"disconnect");
	self waittill(#"host_sucks_end_game");
	level.skipvote = 1;
	if(!level.gameended)
	{
		level thread forceend(1);
	}
}

/*
	Name: getkillstreaks
	Namespace: globallogic
	Checksum: 0xC7D26409
	Offset: 0x6760
	Size: 0x116
	Parameters: 1
	Flags: None
*/
function getkillstreaks(player)
{
	for(killstreaknum = 0; killstreaknum < level.maxkillstreaks; killstreaknum++)
	{
		killstreak[killstreaknum] = "killstreak_null";
	}
	if(isplayer(player) && !level.oldschool && level.disablecustomcac != 1 && (!isbot(player) && isdefined(player.killstreak)))
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
	Checksum: 0x18FA1233
	Offset: 0x6880
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

/*
	Name: function_d1924f29
	Namespace: globallogic
	Checksum: 0xCAA2C3D4
	Offset: 0x68E8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_d1924f29(var_c76ee8ad)
{
	self clientfield::set_player_uimodel("hudItems.cursorHintZMPurchaseInvalidText", var_c76ee8ad);
	self clientfield::set_player_uimodel("hudItems.cursorHintZMPurchaseInvalid", 1);
}

/*
	Name: function_d96c031e
	Namespace: globallogic
	Checksum: 0x6C3962D4
	Offset: 0x6940
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_d96c031e()
{
	self clientfield::set_player_uimodel("hudItems.cursorHintZMPurchaseInvalid", 0);
}

