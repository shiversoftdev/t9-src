#using script_1cc417743d7c262d;
#using script_396f7d71538c9677;
#using script_6350c209b3d1b07d;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\audio_shared.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\sound_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\outcome.gsc;
#using scripts\mp_common\gametypes\round.gsc;

#namespace globallogic_audio;

/*
	Name: function_89f2df9
	Namespace: globallogic_audio
	Checksum: 0xFFFE39CD
	Offset: 0x530
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_410d0d4132d5f263", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: globallogic_audio
	Checksum: 0xAB9187EF
	Offset: 0x578
	Size: 0x11C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_start_gametype(&init);
	callback::on_joined_team(&on_joined_team);
	if(util::get_gametype_name() === "survival")
	{
		level.var_bc01f047 = "srtaacom";
		level.var_7ee6af9f = "srcommander";
	}
	else
	{
		level.var_bc01f047 = "mptaacom";
		level.var_7ee6af9f = "mpcommander";
	}
	level.playleaderdialogonplayer = &leader_dialog_on_player;
	level.var_57e2bc08 = &leader_dialog;
	level.playequipmentdestroyedonplayer = &play_equipment_destroyed_on_player;
	level.playequipmenthackedonplayer = &play_equipment_hacked_on_player;
	level.var_daaa6db3 = &function_4fb91bc7;
}

/*
	Name: init
	Namespace: globallogic_audio
	Checksum: 0x39217588
	Offset: 0x6A0
	Size: 0x40C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.multipledialogkeys = [];
	level.multipledialogkeys[#"enemyaitank"] = "enemyAiTankMultiple";
	level.multipledialogkeys[#"enemysupplydrop"] = "enemySupplyDropMultiple";
	level.multipledialogkeys[#"enemycombatrobot"] = "enemyCombatRobotMultiple";
	level.multipledialogkeys[#"enemycounteruav"] = "enemyCounterUavMultiple";
	level.multipledialogkeys[#"enemydart"] = "enemyDartMultiple";
	level.multipledialogkeys[#"enemyemp"] = "enemyEmpMultiple";
	level.multipledialogkeys[#"enemymicrowaveturret"] = "enemyMicrowaveTurretMultiple";
	level.multipledialogkeys[#"enemyrcbomb"] = "enemyRcBombMultiple";
	level.multipledialogkeys[#"enemyplanemortar"] = "enemyPlaneMortarMultiple";
	level.multipledialogkeys[#"enemyhelicoptergunner"] = "enemyHelicopterGunnerMultiple";
	level.multipledialogkeys[#"enemyraps"] = "enemyRapsMultiple";
	level.multipledialogkeys[#"enemydronestrike"] = "enemyDroneStrikeMultiple";
	level.multipledialogkeys[#"enemyturret"] = "enemyTurretMultiple";
	level.multipledialogkeys[#"enemyhelicopter"] = "enemyHelicopterMultiple";
	level.multipledialogkeys[#"enemyuav"] = "enemyUavMultiple";
	level.multipledialogkeys[#"enemysatellite"] = "enemySatelliteMultiple";
	level.multipledialogkeys[#"friendlyaitank"] = "";
	level.multipledialogkeys[#"friendlysupplydrop"] = "";
	level.multipledialogkeys[#"friendlycombatrobot"] = "";
	level.multipledialogkeys[#"friendlycounteruav"] = "";
	level.multipledialogkeys[#"friendlydart"] = "";
	level.multipledialogkeys[#"friendlyemp"] = "";
	level.multipledialogkeys[#"friendlymicrowaveturret"] = "";
	level.multipledialogkeys[#"friendlyrcbomb"] = "";
	level.multipledialogkeys[#"friendlyplanemortar"] = "";
	level.multipledialogkeys[#"friendlyhelicoptergunner"] = "";
	level.multipledialogkeys[#"friendlyraps"] = "";
	level.multipledialogkeys[#"friendlydronestrike"] = "";
	level.multipledialogkeys[#"friendlyturret"] = "";
	level.multipledialogkeys[#"friendlyhelicopter"] = "";
	level.multipledialogkeys[#"friendlyuav"] = "";
	level.multipledialogkeys[#"friendlysatellite"] = "";
}

/*
	Name: set_blops_dialog
	Namespace: globallogic_audio
	Checksum: 0x5E49B473
	Offset: 0xAB8
	Size: 0x188
	Parameters: 1
	Flags: Linked
*/
function set_blops_dialog(teamindex)
{
	if(isdefined(level.var_462ca9bb))
	{
		self.pers[level.var_bc01f047] = level.var_462ca9bb;
	}
	else
	{
		self.pers[level.var_bc01f047] = (level.var_bc01f047 === "mptaacom" ? "blops_taacom" : "sr_taacom");
	}
	if(isdefined(level.var_e2f95698))
	{
		self.pers[level.var_7ee6af9f] = level.var_e2f95698;
	}
	else
	{
		if(level.var_7ee6af9f === "mpcommander")
		{
			factionlist = map::function_596f8772();
			faction = getscriptbundle((isdefined(factionlist.faction[teamindex].var_d2446fa0) ? factionlist.faction[teamindex].var_d2446fa0 : #""));
			self.pers[level.var_7ee6af9f] = (isdefined(faction.var_ccc3e5ba) ? faction.var_ccc3e5ba : "blops_commander");
		}
		else
		{
			self.pers[level.var_7ee6af9f] = "sr_commander";
		}
	}
}

/*
	Name: set_cdp_dialog
	Namespace: globallogic_audio
	Checksum: 0x40342381
	Offset: 0xC48
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function set_cdp_dialog(teamindex)
{
	if(isdefined(level.var_2d24ff8d))
	{
		self.pers[level.var_bc01f047] = level.var_2d24ff8d;
	}
	else
	{
		self.pers[level.var_bc01f047] = "cdp_taacom";
	}
	if(isdefined(level.var_e2f95698))
	{
		self.pers[level.var_7ee6af9f] = level.var_e2f95698;
	}
	else
	{
		factionlist = map::function_596f8772();
		faction = getscriptbundle((isdefined(factionlist.faction[teamindex].var_d2446fa0) ? factionlist.faction[teamindex].var_d2446fa0 : #""));
		self.pers[level.var_7ee6af9f] = (isdefined(faction.var_ccc3e5ba) ? faction.var_ccc3e5ba : "cdp_commander");
	}
}

/*
	Name: on_joined_team
	Namespace: globallogic_audio
	Checksum: 0x85637929
	Offset: 0xD80
	Size: 0x24C
	Parameters: 1
	Flags: Linked
*/
function on_joined_team(params)
{
	self endon(#"disconnect");
	teammask = getteammask(self.team);
	teamindex = 0;
	while(teammask > 1)
	{
		teammask = teammask >> 1;
		teamindex++;
	}
	if(teamindex % 2)
	{
		self set_blops_dialog(teamindex);
	}
	else
	{
		self set_cdp_dialog(teamindex);
	}
	self flush_dialog();
	if(!is_true(level.inprematchperiod) && !is_true(self.pers[#"playedgamemode"]) && isdefined(level.leaderdialog))
	{
		if(level.hardcoremode)
		{
			if(globallogic_utils::function_308e3379())
			{
				self leader_dialog_on_player(level.leaderdialog.var_d04b3734, undefined, undefined, undefined, 1);
			}
			else
			{
				self leader_dialog_on_player(level.leaderdialog.starthcgamedialog, undefined, undefined, undefined, 1);
			}
		}
		else
		{
			if(globallogic_utils::function_308e3379())
			{
				self leader_dialog_on_player(level.leaderdialog.var_f6fda321, undefined, undefined, undefined, 1);
			}
			else
			{
				self leader_dialog_on_player(level.leaderdialog.startgamedialog, undefined, undefined, undefined, 1);
			}
		}
		self.pers[#"playedgamemode"] = 1;
	}
}

/*
	Name: announcercontroller
	Namespace: globallogic_audio
	Checksum: 0x48CF6696
	Offset: 0xFD8
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function announcercontroller()
{
	level endon(#"game_ended");
	level waittill(#"match_ending_soon");
	if(util::islastround() || util::isoneround())
	{
		if(level.teambased)
		{
			if(!announce_team_is_winning())
			{
				leader_dialog("min_draw");
			}
		}
		level waittill(#"match_ending_very_soon");
		if(level.var_70cd9e95 !== 1)
		{
			foreach(_ in level.teams)
			{
				leader_dialog("roundTimeWarning", team);
			}
		}
	}
	else
	{
		level waittill(#"match_ending_vox");
		if(level.var_70cd9e95 !== 1)
		{
			leader_dialog("roundTimeWarning");
		}
	}
}

/*
	Name: function_1f89b047
	Namespace: globallogic_audio
	Checksum: 0xB67CD62D
	Offset: 0x1188
	Size: 0x1F4
	Parameters: 0
	Flags: Linked
*/
function function_1f89b047()
{
	if(!isdefined(game.outcome.var_3c5fdf73))
	{
		return;
	}
	var_f743e210 = 0;
	if(game.outcome.var_3c5fdf73.size > 1)
	{
		var_cdf943df = undefined;
		for(index = game.outcome.var_3c5fdf73.size - 2; index >= 0; index--)
		{
			if(!isdefined(var_cdf943df))
			{
				var_cdf943df = game.outcome.var_3c5fdf73[index].team;
			}
			if(var_cdf943df != game.outcome.var_3c5fdf73[index].team)
			{
				break;
			}
			var_f743e210++;
		}
	}
	var_d70a4dd2 = game.outcome.var_3c5fdf73[game.outcome.var_3c5fdf73.size - 1].team;
	var_b66d2861 = 0;
	if(var_d70a4dd2 === var_cdf943df)
	{
		var_f743e210++;
	}
	else if(var_f743e210 > 1)
	{
		var_b66d2861 = 1;
	}
	if(is_true(var_b66d2861))
	{
		leader_dialog("announceStreakBreaker", var_d70a4dd2);
	}
	else if(var_f743e210 >= 3 && var_f743e210 <= 8)
	{
		dialogkey = "announceStreak_" + (isdefined(var_f743e210) ? "" + var_f743e210 : "");
		leader_dialog(dialogkey, var_d70a4dd2);
	}
}

/*
	Name: function_5e0a6842
	Namespace: globallogic_audio
	Checksum: 0x604F846D
	Offset: 0x1388
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_5e0a6842()
{
	level thread set_music_on_team("roundend_finish", undefined, 3);
	leader_dialog("roundSwitchSides");
}

/*
	Name: function_dfd17bd3
	Namespace: globallogic_audio
	Checksum: 0x620BB623
	Offset: 0x13D0
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_dfd17bd3()
{
	leader_dialog("roundHalftime");
}

/*
	Name: announce_team_is_winning
	Namespace: globallogic_audio
	Checksum: 0x23B800B4
	Offset: 0x13F8
	Size: 0x120
	Parameters: 0
	Flags: Linked
*/
function announce_team_is_winning()
{
	foreach(_ in level.teams)
	{
		if(is_team_winning(team))
		{
			var_5624e09d = (isdefined(level.var_2ee800c8) ? level.var_2ee800c8 : "gameWinning");
			var_c678068b = (isdefined(level.var_78739954) ? level.var_78739954 : "gameLosing");
			leader_dialog(var_5624e09d, team);
			leader_dialog_for_other_teams(var_c678068b, team);
			return true;
		}
	}
	return false;
}

/*
	Name: announce_round_winner
	Namespace: globallogic_audio
	Checksum: 0x13ED19E4
	Offset: 0x1520
	Size: 0x214
	Parameters: 1
	Flags: Linked
*/
function announce_round_winner(delay)
{
	if(delay > 0)
	{
		wait(delay);
	}
	winner = round::function_9b24638f();
	if(!isdefined(winner) || isplayer(winner))
	{
		return;
	}
	if(isdefined(level.teams[winner]))
	{
		if(level.gametype === "bounty" && round::function_3624d032() === 1)
		{
			leader_dialog("bountyRoundEncourageWon", winner, undefined, undefined, undefined, 1);
			leader_dialog_for_other_teams("bountyRoundEncourageLost", winner, undefined, undefined, undefined, 1);
		}
		else
		{
			leader_dialog("roundEncourageWon", winner, undefined, undefined, undefined, 1);
			leader_dialog_for_other_teams("roundEncourageLost", winner, undefined, undefined, undefined, 1);
		}
	}
	else
	{
		foreach(team, _ in level.teams)
		{
			if(isdefined(level.teampostfix[team]))
			{
				thread sound::play_on_players(("mus_round_draw" + "_") + level.teampostfix[team]);
			}
		}
		leader_dialog("roundDraw");
	}
}

/*
	Name: announce_game_winner
	Namespace: globallogic_audio
	Checksum: 0x43543433
	Offset: 0x1740
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function announce_game_winner(outcome)
{
	wait(battlechatter::mpdialog_value("announceWinnerDelay", 0));
	if(level.teambased)
	{
		if(outcome::function_5f24faac(outcome, "tie") || !match::function_c10174e7())
		{
			leader_dialog("gameDraw", undefined, undefined, undefined, undefined, 1);
		}
		else
		{
			leader_dialog("gameWon", outcome::function_9b24638f(outcome), undefined, undefined, undefined, 1);
			leader_dialog_for_other_teams("gameLost", outcome::function_9b24638f(outcome), undefined, undefined, undefined, 1);
		}
	}
}

/*
	Name: function_57678746
	Namespace: globallogic_audio
	Checksum: 0x4397CF82
	Offset: 0x1850
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_57678746(outcome)
{
}

/*
	Name: get_round_switch_dialog
	Namespace: globallogic_audio
	Checksum: 0x46A7CB56
	Offset: 0x1868
	Size: 0x6A
	Parameters: 1
	Flags: None
*/
function get_round_switch_dialog(switchtype)
{
	switch(switchtype)
	{
		case 2:
		{
			return "roundHalftime";
		}
		case 4:
		{
			return "roundOvertime";
		}
		default:
		{
			return "roundSwitchSides";
		}
	}
}

/*
	Name: sndmusicfunctions
	Namespace: globallogic_audio
	Checksum: 0x85C537BD
	Offset: 0x18E0
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function sndmusicfunctions()
{
	if(!is_true(level.var_34842a14))
	{
		level thread function_4e959ce6();
	}
	if(!is_true(level.var_ce802423))
	{
		level thread sndmusichalfway();
		level thread sndmusictimelimitwatcher();
	}
}

/*
	Name: function_4e959ce6
	Namespace: globallogic_audio
	Checksum: 0xF1E12601
	Offset: 0x1968
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_4e959ce6()
{
	level thread function_13bcae23();
	level thread function_913f483f();
	level thread function_c13cee9b();
}

/*
	Name: sndmusicsetrandomizer
	Namespace: globallogic_audio
	Checksum: 0x7552545B
	Offset: 0x19C0
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function sndmusicsetrandomizer()
{
	if(isdefined(level.var_30783ca9))
	{
		level thread [[level.var_30783ca9]]();
		return;
	}
	if(game.roundsplayed == 0)
	{
		game.musicset = 3;
		if(game.musicset <= 9)
		{
			game.musicset = "0" + game.musicset;
		}
		game.musicset = "_" + game.musicset;
	}
}

/*
	Name: function_c13cee9b
	Namespace: globallogic_audio
	Checksum: 0x1E30932E
	Offset: 0x1A60
	Size: 0xC0
	Parameters: 0
	Flags: Linked
*/
function function_c13cee9b()
{
	level endon(#"game_ended", #"match_ending_very_soon", #"hash_15b8b6edc4ed3032");
	if(is_true(level.var_ab24f23b))
	{
		return;
	}
	waitresult = undefined;
	waitresult = level waittill(#"match_ending_soon");
	if(waitresult.event === "score")
	{
		level notify(#"hash_15b8b6edc4ed3032", {#hash_7090bf53:1});
	}
}

/*
	Name: function_13bcae23
	Namespace: globallogic_audio
	Checksum: 0xE7602DA4
	Offset: 0x1B28
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function function_13bcae23()
{
	level endon(#"game_ended", #"hash_5473f958d5ea84dc");
	var_ffe73385 = 0;
	if(isdefined(level.gametype) && level.gametype == "sd")
	{
		var_ffe73385 = 1;
	}
	var_be17187b = undefined;
	var_be17187b = level waittill(#"hash_15b8b6edc4ed3032");
	if(!is_true(var_be17187b.var_7090bf53))
	{
		level notify(#"hash_d50c83061fcd561");
	}
	level.var_2179a6bf = 1;
	if(var_ffe73385)
	{
		level thread set_music_on_team("timeout_loop_quiet");
	}
	else
	{
		level thread set_music_on_team("timeout_loop");
	}
}

/*
	Name: function_913f483f
	Namespace: globallogic_audio
	Checksum: 0x5B663D8D
	Offset: 0x1C48
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_913f483f()
{
	level endon(#"game_ended", #"hash_d50c83061fcd561");
	var_be17187b = undefined;
	var_be17187b = level waittill(#"hash_28434e94a8844dc5");
	if(isdefined(var_be17187b.n_delay))
	{
		wait(var_be17187b.n_delay);
	}
	if(!is_true(level.var_a8b23f5a))
	{
		level thread set_music_on_team("none");
	}
}

/*
	Name: sndmusichalfway
	Namespace: globallogic_audio
	Checksum: 0xE0710EFB
	Offset: 0x1CF8
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function sndmusichalfway()
{
	level endon(#"game_ended", #"match_ending_soon", #"match_ending_very_soon", #"hash_15b8b6edc4ed3032");
	str_gametype = level.gametype;
	level waittill(#"sndmusichalfway");
	level thread set_music_on_team("underscore");
}

/*
	Name: sndmusictimelimitwatcher
	Namespace: globallogic_audio
	Checksum: 0xC6DCF8EB
	Offset: 0x1D98
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function sndmusictimelimitwatcher()
{
	level endon(#"game_ended", #"match_ending_soon", #"match_ending_very_soon", #"sndmusichalfway");
	if(!isdefined(level.timelimit) || level.timelimit == 0)
	{
		return;
	}
	halfway = (level.timelimit * 60) * 0.5;
	if(halfway <= 100)
	{
		return;
	}
	while(true)
	{
		timeleft = float(globallogic_utils::gettimeremaining()) / 1000;
		if(timeleft <= halfway)
		{
			level notify(#"sndmusichalfway");
			return;
		}
		wait(2);
	}
}

/*
	Name: function_91d557d3
	Namespace: globallogic_audio
	Checksum: 0x6D2DB821
	Offset: 0x1EB0
	Size: 0x1C8
	Parameters: 1
	Flags: Linked
*/
function function_91d557d3(outcome)
{
	if(isdefined(level.var_a4947666))
	{
		level thread [[level.var_a4947666]](outcome);
		return;
	}
	if(outcome::function_5f24faac(outcome, "tie") || !match::function_c10174e7())
	{
		level thread set_music_global("matchend_draw");
		return;
	}
	if(level.teambased)
	{
		level thread set_music_on_team("matchend_win", outcome::function_9b24638f(outcome));
		level thread function_89fe8163("matchend_lose", outcome::function_9b24638f(outcome));
	}
	else
	{
		foreach(player in level.players)
		{
			if(player === outcome::function_9b24638f(outcome))
			{
				player thread set_music_on_player("matchend_win");
				continue;
			}
			player thread set_music_on_player("matchend_lose");
		}
	}
}

/*
	Name: function_2685981b
	Namespace: globallogic_audio
	Checksum: 0x70D1A5F1
	Offset: 0x2080
	Size: 0x86
	Parameters: 0
	Flags: None
*/
function function_2685981b()
{
	var_5d9df74c = 0;
	str_gametype = util::function_5df4294();
	switch(str_gametype)
	{
		case "control":
		case "fireteam_dirty_bomb":
		case "vip":
		{
			var_5d9df74c = 1;
			break;
		}
	}
	return var_5d9df74c;
}

