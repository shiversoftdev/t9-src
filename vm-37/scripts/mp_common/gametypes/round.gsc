#using scripts\mp_common\gametypes\outcome.gsc;
#using scripts\mp_common\gametypes\overtime.gsc;

#namespace round;

/*
	Name: function_37f04b09
	Namespace: round
	Checksum: 0x28C22C3F
	Offset: 0x70
	Size: 0x5E
	Parameters: 0
	Flags: Linked
*/
function function_37f04b09()
{
	outcome = outcome::function_a1a81955();
	game.outcome.var_3c5fdf73[game.outcome.var_3c5fdf73.size] = outcome;
	game.outcome.var_aefc8b8d = outcome;
}

/*
	Name: function_f37f02fc
	Namespace: round
	Checksum: 0xED3E920
	Offset: 0xD8
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function function_f37f02fc()
{
	return game.outcome.var_aefc8b8d;
}

/*
	Name: function_6343685
	Namespace: round
	Checksum: 0x772F24D9
	Offset: 0xF8
	Size: 0x1EC
	Parameters: 0
	Flags: Linked
*/
function function_6343685()
{
	if(!isdefined(game.roundsplayed))
	{
		game.roundsplayed = 0;
	}
	setroundsplayed(game.roundsplayed + overtime::get_rounds_played());
	overtime::function_6343685();
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
		level.spawn_point_team_class_names[team] = [];
	}
}

/*
	Name: set_flag
	Namespace: round
	Checksum: 0xAAEC6962
	Offset: 0x2F0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function set_flag(flag)
{
	outcome::set_flag(game.outcome.var_aefc8b8d, flag);
}

/*
	Name: function_5f24faac
	Namespace: round
	Checksum: 0x2E4A7DF9
	Offset: 0x330
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_5f24faac(flag)
{
	return outcome::function_5f24faac(game.outcome.var_aefc8b8d, flag);
}

/*
	Name: function_46cb766c
	Namespace: round
	Checksum: 0xF4ED33AF
	Offset: 0x370
	Size: 0x32
	Parameters: 1
	Flags: None
*/
function function_46cb766c(flag)
{
	return outcome::function_46cb766c(game.outcome.var_aefc8b8d, flag);
}

/*
	Name: function_897438f4
	Namespace: round
	Checksum: 0xA6103143
	Offset: 0x3B0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_897438f4(var_c1e98979)
{
	outcome::function_897438f4(game.outcome.var_aefc8b8d, var_c1e98979);
}

/*
	Name: function_3624d032
	Namespace: round
	Checksum: 0x4B3A9807
	Offset: 0x3F0
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_3624d032()
{
	return outcome::function_3624d032(game.outcome.var_aefc8b8d);
}

/*
	Name: get_winning_team
	Namespace: round
	Checksum: 0x9408374
	Offset: 0x420
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function get_winning_team()
{
	return outcome::get_winning_team(game.outcome.var_aefc8b8d);
}

/*
	Name: function_b5f4c9d8
	Namespace: round
	Checksum: 0x538ECA7E
	Offset: 0x450
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function function_b5f4c9d8()
{
	return outcome::function_b5f4c9d8(game.outcome.var_aefc8b8d);
}

/*
	Name: function_9b24638f
	Namespace: round
	Checksum: 0x6E677176
	Offset: 0x480
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_9b24638f()
{
	return outcome::function_9b24638f(game.outcome.var_aefc8b8d);
}

/*
	Name: is_winner
	Namespace: round
	Checksum: 0x1FE68EBF
	Offset: 0x4B0
	Size: 0x32
	Parameters: 1
	Flags: None
*/
function is_winner(var_512330f1)
{
	return outcome::is_winner(game.outcome.var_aefc8b8d, var_512330f1);
}

/*
	Name: function_d1e740f6
	Namespace: round
	Checksum: 0xFA290962
	Offset: 0x4F0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_d1e740f6(var_512330f1)
{
	outcome::function_d1e740f6(game.outcome.var_aefc8b8d, var_512330f1);
}

/*
	Name: function_af2e264f
	Namespace: round
	Checksum: 0xB7A53608
	Offset: 0x530
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_af2e264f(winner)
{
	outcome::function_af2e264f(game.outcome.var_aefc8b8d, winner);
}

/*
	Name: function_870759fb
	Namespace: round
	Checksum: 0x87F61A89
	Offset: 0x570
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_870759fb()
{
	outcome::function_870759fb(game.outcome.var_aefc8b8d);
}

/*
	Name: is_overtime_round
	Namespace: round
	Checksum: 0x775DEAA5
	Offset: 0x5A0
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function is_overtime_round()
{
	if(game.overtime_round > 0)
	{
		return true;
	}
	return false;
}

