#using scripts\mp_common\gametypes\outcome.gsc;
#using scripts\mp_common\gametypes\overtime.gsc;

#namespace round;

/*
	Name: function_35ba17c8
	Namespace: round
	Checksum: 0x4AA4187C
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_35ba17c8()
{
	level notify(153113338);
}

/*
	Name: function_37f04b09
	Namespace: round
	Checksum: 0x72153536
	Offset: 0x90
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
	Checksum: 0xD164DEF8
	Offset: 0xF8
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
	Checksum: 0x7A978351
	Offset: 0x118
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
	Checksum: 0xB4C294EA
	Offset: 0x310
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
	Checksum: 0x1C3C614C
	Offset: 0x350
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
	Checksum: 0xD1E3781C
	Offset: 0x390
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
	Checksum: 0xAC134927
	Offset: 0x3D0
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
	Checksum: 0xB70DA2BE
	Offset: 0x410
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
	Checksum: 0xBD31F8DF
	Offset: 0x440
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
	Checksum: 0x3C71ADF9
	Offset: 0x470
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
	Checksum: 0xAD96D853
	Offset: 0x4A0
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
	Checksum: 0xE248173A
	Offset: 0x4D0
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
	Checksum: 0xDA6FC3EB
	Offset: 0x510
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
	Checksum: 0x81F96B28
	Offset: 0x550
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
	Checksum: 0x6DCE0579
	Offset: 0x590
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
	Checksum: 0xBA9A8C4F
	Offset: 0x5C0
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

