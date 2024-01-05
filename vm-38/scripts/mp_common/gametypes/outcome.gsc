#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using script_3d703ef87a841fe4;
#using scripts\core_common\flag_shared.gsc;

#namespace outcome;

/*
	Name: function_3c0351d1
	Namespace: outcome
	Checksum: 0xE2839C4A
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3c0351d1()
{
	level notify(-1078055393);
}

/*
	Name: main
	Namespace: outcome
	Checksum: 0x46DD2DA3
	Offset: 0xC8
	Size: 0x94
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	level.var_9b671c3c[#"tie"] = {#code_flag:1, #flag:"tie"};
	level.var_9b671c3c[#"overtime"] = {#code_flag:2, #flag:"overtime"};
}

/*
	Name: function_a1a81955
	Namespace: outcome
	Checksum: 0x46D484EA
	Offset: 0x168
	Size: 0x66
	Parameters: 0
	Flags: Linked
*/
function function_a1a81955()
{
	outcome = spawnstruct();
	outcome.flags = 0;
	outcome.var_c1e98979 = 0;
	outcome.team = #"none";
	outcome.players = [];
	outcome.var_f79c6bfc = [];
	return outcome;
}

/*
	Name: is_winner
	Namespace: outcome
	Checksum: 0xE23D3592
	Offset: 0x1D8
	Size: 0xCE
	Parameters: 2
	Flags: Linked
*/
function is_winner(outcome, team_or_player)
{
	if(isplayer(team_or_player))
	{
		if(isdefined(outcome.players) && outcome.players.size && outcome.players[0] == team_or_player)
		{
			return true;
		}
		if(isdefined(outcome.team) && outcome.team == team_or_player.team)
		{
			return true;
		}
	}
	else if(isdefined(outcome.team) && outcome.team == team_or_player)
	{
		return true;
	}
	return false;
}

/*
	Name: set_flag
	Namespace: outcome
	Checksum: 0x252418F0
	Offset: 0x2B0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function set_flag(outcome, flag)
{
	outcome flag::set(flag);
}

/*
	Name: get_flag
	Namespace: outcome
	Checksum: 0xDA95C11A
	Offset: 0x2E8
	Size: 0x2A
	Parameters: 2
	Flags: Linked
*/
function get_flag(outcome, flag)
{
	return outcome flag::get(flag);
}

/*
	Name: clear_flag
	Namespace: outcome
	Checksum: 0xAC7B3F01
	Offset: 0x320
	Size: 0x2A
	Parameters: 2
	Flags: Linked
*/
function clear_flag(outcome, flag)
{
	return outcome flag::clear(flag);
}

/*
	Name: function_2e00fa44
	Namespace: outcome
	Checksum: 0x8DF45B48
	Offset: 0x358
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_2e00fa44(outcome)
{
	flags = 0;
	foreach(var_b4a9554f in level.var_9b671c3c)
	{
		if(outcome flag::get(var_b4a9554f.flag))
		{
			flags = flags | var_b4a9554f.code_flag;
		}
	}
	return flags;
}

/*
	Name: function_897438f4
	Namespace: outcome
	Checksum: 0x33261F99
	Offset: 0x420
	Size: 0x22
	Parameters: 2
	Flags: Linked
*/
function function_897438f4(outcome, var_c1e98979)
{
	outcome.var_c1e98979 = var_c1e98979;
}

/*
	Name: function_3624d032
	Namespace: outcome
	Checksum: 0x3743CB77
	Offset: 0x450
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_3624d032(outcome)
{
	return outcome.var_c1e98979;
}

/*
	Name: get_winning_team
	Namespace: outcome
	Checksum: 0xAD260DBE
	Offset: 0x470
	Size: 0x5A
	Parameters: 1
	Flags: Linked
*/
function get_winning_team(outcome)
{
	if(isdefined(outcome.team))
	{
		return outcome.team;
	}
	if(outcome.players.size)
	{
		return outcome.players[0].team;
	}
	return #"none";
}

/*
	Name: function_b5f4c9d8
	Namespace: outcome
	Checksum: 0x93D928D0
	Offset: 0x4D8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_b5f4c9d8(outcome)
{
	if(outcome.players.size)
	{
		return outcome.players[0];
	}
	return undefined;
}

/*
	Name: get_winner
	Namespace: outcome
	Checksum: 0xC085E7F8
	Offset: 0x510
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function get_winner(outcome)
{
	if(isdefined(outcome.team))
	{
		return outcome.team;
	}
	if(outcome.players.size)
	{
		return outcome.players[0];
	}
	return undefined;
}

/*
	Name: set_winner
	Namespace: outcome
	Checksum: 0x19F5371F
	Offset: 0x560
	Size: 0x72
	Parameters: 2
	Flags: Linked
*/
function set_winner(outcome, team_or_player)
{
	if(!isdefined(team_or_player))
	{
		return;
	}
	if(isplayer(team_or_player))
	{
		outcome.players[outcome.players.size] = team_or_player;
		outcome.team = team_or_player.team;
	}
	else
	{
		outcome.team = team_or_player;
	}
}

/*
	Name: function_af2e264f
	Namespace: outcome
	Checksum: 0x9700283C
	Offset: 0x5E0
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_af2e264f(outcome, winner)
{
	if(isdefined(winner))
	{
		set_winner(outcome, winner);
	}
	else
	{
		set_flag(outcome, "tie");
	}
}

/*
	Name: function_6d0354e3
	Namespace: outcome
	Checksum: 0x5726F6E8
	Offset: 0x640
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function function_6d0354e3()
{
	if(level.teambased)
	{
		winner = teams::function_d85770f0("teamScores");
	}
	else
	{
		winner = globallogic_score::gethighestscoringplayer();
	}
	return winner;
}

/*
	Name: function_870759fb
	Namespace: outcome
	Checksum: 0x45675AC2
	Offset: 0x6A0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_870759fb(outcome)
{
	winner = function_6d0354e3();
	function_af2e264f(outcome, winner);
}

