#using script_3d703ef87a841fe4;
#using scripts\core_common\flag_shared.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;

#namespace outcome;

/*
	Name: main
	Namespace: outcome
	Checksum: 0xCF3956E5
	Offset: 0xA8
	Size: 0x94
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	level.var_9b671c3c[#"tie"] = {#hash_6cab3b8e:1, #flag:"tie"};
	level.var_9b671c3c[#"overtime"] = {#hash_6cab3b8e:2, #flag:"overtime"};
}

/*
	Name: function_a1a81955
	Namespace: outcome
	Checksum: 0xCFCCBE34
	Offset: 0x148
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
	Checksum: 0x6B5FC8B4
	Offset: 0x1B8
	Size: 0xCE
	Parameters: 2
	Flags: Linked
*/
function is_winner(outcome, var_512330f1)
{
	if(isplayer(var_512330f1))
	{
		if(isdefined(outcome.players) && outcome.players.size && outcome.players[0] == var_512330f1)
		{
			return true;
		}
		if(isdefined(outcome.team) && outcome.team == var_512330f1.team)
		{
			return true;
		}
	}
	else if(isdefined(outcome.team) && outcome.team == var_512330f1)
	{
		return true;
	}
	return false;
}

/*
	Name: set_flag
	Namespace: outcome
	Checksum: 0x4E752E21
	Offset: 0x290
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function set_flag(outcome, flag)
{
	outcome flag::set(flag);
}

/*
	Name: function_5f24faac
	Namespace: outcome
	Checksum: 0xD46E9B6
	Offset: 0x2C8
	Size: 0x2A
	Parameters: 2
	Flags: Linked
*/
function function_5f24faac(outcome, flag)
{
	return outcome flag::get(flag);
}

/*
	Name: function_46cb766c
	Namespace: outcome
	Checksum: 0x9FB4D380
	Offset: 0x300
	Size: 0x2A
	Parameters: 2
	Flags: Linked
*/
function function_46cb766c(outcome, flag)
{
	return outcome flag::clear(flag);
}

/*
	Name: function_2e00fa44
	Namespace: outcome
	Checksum: 0x9BE2EC5A
	Offset: 0x338
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
			flags = flags | var_b4a9554f.var_6cab3b8e;
		}
	}
	return flags;
}

/*
	Name: function_897438f4
	Namespace: outcome
	Checksum: 0xA0C28E61
	Offset: 0x400
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
	Checksum: 0x2E0BD283
	Offset: 0x430
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
	Checksum: 0xFA95DFC6
	Offset: 0x450
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
	Checksum: 0x6FBBEE3A
	Offset: 0x4B8
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
	Name: function_9b24638f
	Namespace: outcome
	Checksum: 0x1F8D85C6
	Offset: 0x4F0
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function function_9b24638f(outcome)
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
	Name: function_d1e740f6
	Namespace: outcome
	Checksum: 0xAB9B6DD9
	Offset: 0x540
	Size: 0x72
	Parameters: 2
	Flags: Linked
*/
function function_d1e740f6(outcome, var_512330f1)
{
	if(!isdefined(var_512330f1))
	{
		return;
	}
	if(isplayer(var_512330f1))
	{
		outcome.players[outcome.players.size] = var_512330f1;
		outcome.team = var_512330f1.team;
	}
	else
	{
		outcome.team = var_512330f1;
	}
}

/*
	Name: function_af2e264f
	Namespace: outcome
	Checksum: 0xBDA7EED
	Offset: 0x5C0
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_af2e264f(outcome, winner)
{
	if(isdefined(winner))
	{
		function_d1e740f6(outcome, winner);
	}
	else
	{
		set_flag(outcome, "tie");
	}
}

/*
	Name: function_6d0354e3
	Namespace: outcome
	Checksum: 0x259BFC27
	Offset: 0x620
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
	Checksum: 0xBA5CBE8D
	Offset: 0x680
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_870759fb(outcome)
{
	winner = function_6d0354e3();
	function_af2e264f(outcome, winner);
}

