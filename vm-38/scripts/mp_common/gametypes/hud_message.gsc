#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\gametypes\overtime.gsc;
#using scripts\mp_common\gametypes\outcome.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace hud_message;

/*
	Name: function_ca48327a
	Namespace: hud_message
	Checksum: 0x5F90B66C
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ca48327a()
{
	level notify(888573270);
}

/*
	Name: init
	Namespace: hud_message
	Checksum: 0x8A21499F
	Offset: 0xD8
	Size: 0x6DC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	game.strings[#"draw"] = #"hash_18114ebf7e352c55";
	game.strings[#"round_draw"] = #"hash_68d9a667406d9e2e";
	game.strings[#"round_win"] = #"hash_3f72c8cf61961fb2";
	game.strings[#"round_loss"] = #"hash_70e6b03f0ea9b11d";
	game.strings[#"victory"] = #"hash_31e1e88e88ba263f";
	game.strings[#"defeat"] = #"hash_141c79e0a2e1383e";
	game.strings[#"game_over"] = #"hash_ddc319addc8bcb2";
	game.strings[#"halftime"] = #"hash_4403919077b48aaf";
	game.strings[#"overtime"] = #"hash_19d325d8d1bfd3de";
	game.strings[#"roundend"] = #"hash_62af47ae5592dbf8";
	game.strings[#"intermission"] = #"hash_24bb668f17a9cc67";
	game.strings[#"match_bonus"] = #"mp/match_bonus_is";
	game.strings[#"codpoints_match_bonus"] = #"mp_codpoints_match_bonus_is";
	game.strings[#"cod_caster_team_wins"] = #"mp/wins";
	game.strings[#"cod_caster_team_eliminated"] = #"mp/team_eliminated";
	game.strings[#"tie"] = #"mp/match_tie";
	game.strings[#"round_draw"] = #"mp/round_draw";
	game.strings[#"enemies_eliminated"] = #"hash_3191d03a1c0615ad";
	game.strings[#"team_eliminated"] = #"hash_5ebfcbc4ad2769b6";
	game.strings[#"score_limit_reached"] = #"mp/score_limit_reached";
	game.strings[#"round_score_limit_reached"] = #"mp/score_limit_reached";
	game.strings[#"round_limit_reached"] = #"mp/round_limit_reached";
	game.strings[#"time_limit_reached"] = #"mp/time_limit_reached";
	game.strings[#"players_forfeited"] = #"mp/players_forfeited";
	game.strings[#"other_teams_forfeited"] = #"mp_other_teams_forfeited";
	game.strings[#"host_sucks"] = #"hash_115339e33ac1efcb";
	game.strings[#"host_ended"] = #"hash_cd63faed592da03";
	game.strings[#"game_ended"] = #"mp/ended_game";
	level.var_c3abe983 = [];
	function_5d9d54a9(0, game.strings[#"tie"]);
	function_36419c2(1, game.strings[#"victory"], game.strings[#"defeat"]);
	function_5d9d54a9(2, game.strings[#"time_limit_reached"]);
	function_36419c2(3, game.strings[#"score_limit_reached"], game.strings[#"score_limit_reached"]);
	function_36419c2(4, game.strings[#"round_score_limit_reached"], game.strings[#"round_score_limit_reached"]);
	function_36419c2(5, game.strings[#"round_limit_reached"], game.strings[#"round_limit_reached"]);
	function_36419c2(6, game.strings[#"enemies_eliminated"], game.strings[#"team_eliminated"]);
	function_5d9d54a9(8, game.strings[#"game_ended"]);
	function_2b2308c6(9, game.strings[#"host_ended"], game.strings[#"game_ended"]);
	function_5d9d54a9(10, game.strings[#"host_sucks"]);
}

/*
	Name: function_4e36b458
	Namespace: hud_message
	Checksum: 0xA96AF354
	Offset: 0x7C0
	Size: 0xA4
	Parameters: 1
	Flags: Private
*/
function private function_4e36b458(winner)
{
	if(!isdefined(self.pers[#"team"]))
	{
		return 0;
	}
	team = self.pers[#"team"];
	if(team != #"spectator" && (!isdefined(team) || !isdefined(level.teams[team])))
	{
		team = #"allies";
	}
	return winner == team;
}

/*
	Name: function_82f36142
	Namespace: hud_message
	Checksum: 0x3FD262A8
	Offset: 0x870
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_82f36142(var_c1e98979)
{
	switch(var_c1e98979)
	{
		case 0:
		case 8:
		case 9:
		case 10:
		{
			return true;
		}
		default:
		{
			return false;
		}
	}
	return false;
}

/*
	Name: function_460b0309
	Namespace: hud_message
	Checksum: 0x38DACE9E
	Offset: 0x8F8
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_460b0309(game_end)
{
	if(game_end)
	{
		return game.strings[#"draw"];
	}
	return game.strings[#"round_draw"];
}

/*
	Name: function_a2f30ab4
	Namespace: hud_message
	Checksum: 0x402EA704
	Offset: 0x950
	Size: 0x2AE
	Parameters: 4
	Flags: Linked
*/
function function_a2f30ab4(var_68c25772, var_c1e98979, game_end, outcome)
{
	result = function_2e532eed(outcome);
	result.var_277c7d47 = undefined;
	result.var_68c25772 = var_68c25772;
	result.var_14f94126 = "";
	result.var_7d5c2c5f = 0;
	if(level.teambased)
	{
		result.var_44e9b5f9 = teams::getteamindex(result.team);
		if(function_82f36142(var_c1e98979))
		{
			result.var_14f94126 = function_460b0309(game_end);
			result.var_277c7d47 = 0;
		}
		else
		{
			if(var_68c25772 == 2)
			{
				result.var_14f94126 = game.strings[#"halftime"];
				result.var_277c7d47 = 1;
			}
			else
			{
				if(var_68c25772 == 3)
				{
					result.var_14f94126 = game.strings[#"intermission"];
					result.var_277c7d47 = 1;
				}
				else
				{
					if(var_68c25772 == 4)
					{
						result.var_14f94126 = game.strings[#"overtime"];
						result.var_277c7d47 = 1;
					}
					else
					{
						if(outcome::get_flag(outcome, "tie"))
						{
							result.var_14f94126 = function_460b0309(game_end);
						}
						result.var_277c7d47 = !game_end && !util::isoneround() && !util::waslastround();
					}
				}
			}
		}
	}
	else
	{
		result.var_44e9b5f9 = 0;
		if(!util::isoneround() && game_end)
		{
			result.var_14f94126 = game.strings[#"game_over"];
		}
		else
		{
			result.var_14f94126 = game.strings[#"defeat"];
			result.var_7d5c2c5f = 1;
		}
	}
	return result;
}

/*
	Name: function_555e3f9f
	Namespace: hud_message
	Checksum: 0x285969FC
	Offset: 0xC08
	Size: 0x78
	Parameters: 0
	Flags: Linked, Private
*/
function private function_555e3f9f()
{
	if(isdefined(self.pers[#"totalmatchbonus"]))
	{
		bonus = ceil(self.pers[#"totalmatchbonus"] * level.xpscale);
		if(bonus > 0)
		{
			return bonus;
		}
	}
	return 0;
}

/*
	Name: teamoutcomenotify
	Namespace: hud_message
	Checksum: 0xC73B3FCF
	Offset: 0xC88
	Size: 0x804
	Parameters: 1
	Flags: Linked
*/
function teamoutcomenotify(outcome)
{
	self endon(#"disconnect");
	self notify(#"reset_outcome");
	team = self.pers[#"team"];
	if(team != #"spectator" && (!isdefined(team) || !isdefined(level.teams[team])))
	{
		team = #"allies";
	}
	self endon(#"reset_outcome");
	matchbonus = function_555e3f9f();
	winnerenum = outcome.var_44e9b5f9;
	winner = outcome.team;
	var_14f94126 = outcome.var_14f94126;
	var_277c7d47 = outcome.var_277c7d47;
	if(!isdefined(winner))
	{
		return;
	}
	outcometext = function_5b0c08ec(self, outcome);
	if(level.gametype == "ctf" || level.gametype == "escort" || level.gametype == "ball" && overtime::is_overtime_round())
	{
		if(outcome::get_flag(outcome, "overtime"))
		{
			if(isdefined(game.overtime_first_winner))
			{
				winner = game.overtime_first_winner;
			}
			if(!outcome::get_flag(outcome, "tie"))
			{
				winningtime = game.overtime_time_to_beat[level.gametype];
			}
		}
		else
		{
			if(isdefined(game.overtime_first_winner) && game.overtime_first_winner == "tie")
			{
				winningtime = game.overtime_best_time[level.gametype];
			}
			else
			{
				winningtime = undefined;
				if(outcome::get_flag(outcome, "tie") && isdefined(game.overtime_first_winner))
				{
					if(game.overtime_first_winner == #"allies")
					{
						winnerenum = 1;
					}
					else if(game.overtime_first_winner == #"axis")
					{
						winnerenum = 2;
					}
				}
				if(isdefined(game.overtime_time_to_beat[level.gametype]))
				{
					winningtime = game.overtime_time_to_beat[level.gametype];
				}
				if(isdefined(game.overtime_best_time[level.gametype]) && (!isdefined(winningtime) || winningtime > game.overtime_best_time[level.gametype]))
				{
					if(game.overtime_first_winner !== winner)
					{
						losingtime = winningtime;
					}
					winningtime = game.overtime_best_time[level.gametype];
					if(outcome::set_flag(outcome, "tie"))
					{
						winningtime = 0;
					}
				}
			}
			if(level.gametype == "escort" && outcome::get_flag(outcome, "tie"))
			{
				winnerenum = 0;
				if(!is_true(level.finalgameend))
				{
					if(game.defenders == team)
					{
						outcometext = game.strings[#"round_win"];
					}
					else
					{
						outcometext = game.strings[#"round_loss"];
					}
				}
			}
		}
		if(!isdefined(winningtime))
		{
			winningtime = 0;
		}
		if(!isdefined(losingtime))
		{
			losingtime = 0;
		}
		if(winningtime == 0 && losingtime == 0)
		{
			winnerenum = 0;
		}
		if(team == #"spectator" && outcome.var_7d5c2c5f)
		{
			outcometext = game.strings[#"cod_caster_team_wins"];
			var_277c7d47 = 0;
		}
		self luinotifyevent(#"show_outcome", 7, var_14f94126, outcometext, int(matchbonus), winnerenum, var_277c7d47, int(float(winningtime) / 1000), int(float(losingtime) / 1000));
	}
	else
	{
		if(level.gametype == "ball" && !outcome::get_flag(outcome, "tie") && game.roundsplayed < level.roundlimit && isdefined(game.round_time_to_beat) && !overtime::is_overtime_round())
		{
			winningtime = game.round_time_to_beat;
			if(!isdefined(losingtime))
			{
				losingtime = 0;
			}
			if(team == #"spectator" && outcome.var_7d5c2c5f)
			{
				var_14f94126 = game.strings[#"cod_caster_team_wins"];
				var_277c7d47 = 0;
			}
			self luinotifyevent(#"show_outcome", 7, var_14f94126, outcometext, int(matchbonus), winnerenum, var_277c7d47, int(float(winningtime) / 1000), int(float(losingtime) / 1000));
		}
		else
		{
			if(team == #"spectator" && outcome.var_7d5c2c5f)
			{
				if(outcome.var_c1e98979 == 6)
				{
					var_14f94126 = game.strings[#"cod_caster_team_eliminated"];
				}
				var_14f94126 = game.strings[#"cod_caster_team_wins"];
				var_277c7d47 = 0;
			}
			self luinotifyevent(#"show_outcome", 5, var_14f94126, outcometext, int(matchbonus), winnerenum, var_277c7d47);
			if(var_277c7d47 && game.roundsplayed < level.roundlimit)
			{
				self luinotifyevent(#"hash_84895967cf4425c");
				wait(1);
			}
		}
	}
}

/*
	Name: outcomenotify
	Namespace: hud_message
	Checksum: 0x556EF10
	Offset: 0x1498
	Size: 0x1A4
	Parameters: 1
	Flags: Linked
*/
function outcomenotify(outcome)
{
	self endon(#"disconnect");
	self notify(#"reset_outcome");
	self endon(#"reset_outcome");
	players = level.placement[#"all"];
	numclients = players.size;
	matchbonus = function_555e3f9f();
	outcometext = function_5b0c08ec(self, outcome);
	team = self.pers[#"team"];
	if(isdefined(team) && team == #"spectator" && outcome.var_7d5c2c5f)
	{
		outcometext = game.strings[#"cod_caster_team_wins"];
		self luinotifyevent(#"show_outcome", 5, outcome.var_14f94126, outcometext, matchbonus, outcome::get_winner(outcome), 0);
	}
	else
	{
		self luinotifyevent(#"show_outcome", 4, outcome.var_14f94126, outcometext, matchbonus, numclients);
	}
}

/*
	Name: function_6be746c2
	Namespace: hud_message
	Checksum: 0x12F828A2
	Offset: 0x1648
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_6be746c2()
{
	self luinotifyevent(#"pre_killcam_transition", 1, 0);
}

/*
	Name: function_d756b48a
	Namespace: hud_message
	Checksum: 0x4062B02D
	Offset: 0x1680
	Size: 0x94
	Parameters: 5
	Flags: Linked, Private
*/
function private function_d756b48a(var_c1e98979, winner_text, loser_text, var_94d579fc, var_1e8a2bef)
{
	level.var_c3abe983[var_c1e98979] = {#hash_aa3dbaf1:var_1e8a2bef, #hash_3818f815:var_94d579fc, #loser_text:loser_text, #winner_text:winner_text, #type:var_c1e98979};
}

/*
	Name: function_2b2308c6
	Namespace: hud_message
	Checksum: 0x737E28C3
	Offset: 0x1720
	Size: 0x3C
	Parameters: 3
	Flags: Linked
*/
function function_2b2308c6(var_c1e98979, var_76f0c6e5, var_767536e4)
{
	function_d756b48a(var_c1e98979, var_76f0c6e5, var_76f0c6e5, var_767536e4, var_767536e4);
}

/*
	Name: function_5d9d54a9
	Namespace: hud_message
	Checksum: 0x1DD277AF
	Offset: 0x1768
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function function_5d9d54a9(var_c1e98979, var_76f0c6e5)
{
	function_d756b48a(var_c1e98979, var_76f0c6e5, var_76f0c6e5, #"", #"");
}

/*
	Name: function_36419c2
	Namespace: hud_message
	Checksum: 0x8C430184
	Offset: 0x17C0
	Size: 0x54
	Parameters: 3
	Flags: Linked
*/
function function_36419c2(var_c1e98979, winner_text, loser_text)
{
	function_d756b48a(var_c1e98979, winner_text, loser_text, #"", #"");
}

/*
	Name: function_5b0c08ec
	Namespace: hud_message
	Checksum: 0xD801354E
	Offset: 0x1820
	Size: 0xEA
	Parameters: 2
	Flags: Linked
*/
function function_5b0c08ec(player, outcome)
{
	/#
		assert(isdefined(level.var_c3abe983[outcome.var_c1e98979]));
	#/
	if(outcome::get_flag(outcome, "tie") && !function_82f36142(outcome.var_c1e98979))
	{
		return game.strings[#"tie"];
	}
	if(outcome::is_winner(outcome, player))
	{
		return level.var_c3abe983[outcome.var_c1e98979].winner_text;
	}
	return level.var_c3abe983[outcome.var_c1e98979].loser_text;
}

/*
	Name: can_bg_draw
	Namespace: hud_message
	Checksum: 0x10298586
	Offset: 0x1918
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function can_bg_draw(outcome)
{
	if(!outcome::is_winner(outcome, self))
	{
		if(level.rankedmatch || level.leaguematch && self.pers[#"latejoin"] === 1)
		{
			self luinotifyevent(#"hash_728ce4656acc985a");
		}
	}
}

