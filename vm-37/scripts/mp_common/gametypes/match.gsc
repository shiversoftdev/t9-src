#using script_3d703ef87a841fe4;
#using scripts\core_common\system_shared.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\outcome.gsc;
#using scripts\mp_common\gametypes\overtime.gsc;
#using scripts\mp_common\gametypes\round.gsc;

#namespace match;

/*
	Name: function_89f2df9
	Namespace: match
	Checksum: 0x5139B9E6
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"match", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: match
	Checksum: 0x301B0F74
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	function_94003d29();
}

/*
	Name: function_37f04b09
	Namespace: match
	Checksum: 0x2FFB9AFA
	Offset: 0x130
	Size: 0x3E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_37f04b09()
{
	if(!isdefined(game.outcome))
	{
		game.outcome = outcome::function_a1a81955();
		game.outcome.var_3c5fdf73 = [];
	}
}

/*
	Name: function_94003d29
	Namespace: match
	Checksum: 0xD4869F57
	Offset: 0x178
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_94003d29()
{
	function_37f04b09();
	round::function_37f04b09();
	if(overtime::is_overtime_round())
	{
		function_1362c7e0();
	}
}

/*
	Name: function_f37f02fc
	Namespace: match
	Checksum: 0x82CA54E8
	Offset: 0x1D0
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function function_f37f02fc()
{
	return game.outcome;
}

/*
	Name: function_b6b94df8
	Namespace: match
	Checksum: 0x681EF4A
	Offset: 0x1E8
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_b6b94df8()
{
	if(overtime::is_overtime_round())
	{
		function_1362c7e0();
	}
}

/*
	Name: function_1362c7e0
	Namespace: match
	Checksum: 0x442B82E7
	Offset: 0x220
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_1362c7e0()
{
	round::set_flag("overtime");
	set_flag("overtime");
}

/*
	Name: set_flag
	Namespace: match
	Checksum: 0x85B92A43
	Offset: 0x260
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function set_flag(flag)
{
	outcome::set_flag(game.outcome, flag);
}

/*
	Name: function_5f24faac
	Namespace: match
	Checksum: 0x8A8A6E23
	Offset: 0x298
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_5f24faac(flag)
{
	return outcome::function_5f24faac(game.outcome, flag);
}

/*
	Name: function_46cb766c
	Namespace: match
	Checksum: 0x1ACB39C8
	Offset: 0x2D0
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function function_46cb766c(flag)
{
	return outcome::function_46cb766c(game.outcome, flag);
}

/*
	Name: function_897438f4
	Namespace: match
	Checksum: 0xA272C04D
	Offset: 0x308
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_897438f4(var_c1e98979)
{
	outcome::function_897438f4(game.outcome, var_c1e98979);
}

/*
	Name: function_3624d032
	Namespace: match
	Checksum: 0xC260A330
	Offset: 0x340
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function function_3624d032()
{
	return outcome::function_3624d032(game.outcome);
}

/*
	Name: function_c10174e7
	Namespace: match
	Checksum: 0xB6185F33
	Offset: 0x368
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_c10174e7()
{
	if(isdefined(game.outcome.team) && isdefined(level.teams[game.outcome.team]))
	{
		return true;
	}
	if(game.outcome.players.size)
	{
		return true;
	}
	return false;
}

/*
	Name: get_winning_team
	Namespace: match
	Checksum: 0xEF01AF9B
	Offset: 0x3D8
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function get_winning_team()
{
	return outcome::get_winning_team(game.outcome);
}

/*
	Name: function_ebd67076
	Namespace: match
	Checksum: 0xDB58679B
	Offset: 0x400
	Size: 0x4A
	Parameters: 1
	Flags: None
*/
function function_ebd67076(team)
{
	if(isdefined(game.outcome.team) && team == game.outcome.team)
	{
		return true;
	}
	return false;
}

/*
	Name: function_a2b53e17
	Namespace: match
	Checksum: 0x6C6307AA
	Offset: 0x458
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_a2b53e17(player)
{
	if(game.outcome.team !== #"none" && player.pers[#"team"] === game.outcome.team)
	{
		return true;
	}
	if(game.outcome.players.size)
	{
		if(player == game.outcome.players[0])
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_75f97ac7
	Namespace: match
	Checksum: 0x76BF7084
	Offset: 0x508
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_75f97ac7()
{
	if(game.outcome.players.size)
	{
		return true;
	}
	return false;
}

/*
	Name: function_517c0ce0
	Namespace: match
	Checksum: 0xB4AE6F70
	Offset: 0x538
	Size: 0x46
	Parameters: 0
	Flags: Linked
*/
function function_517c0ce0()
{
	if(game.outcome.players.size)
	{
		return game.outcome.players[0] ishost();
	}
	return 0;
}

/*
	Name: function_b5f4c9d8
	Namespace: match
	Checksum: 0x63A19904
	Offset: 0x588
	Size: 0x1A
	Parameters: 0
	Flags: None
*/
function function_b5f4c9d8()
{
	return outcome::function_b5f4c9d8(game.outcome);
}

/*
	Name: function_9b24638f
	Namespace: match
	Checksum: 0x2D55EDF4
	Offset: 0x5B0
	Size: 0x52
	Parameters: 0
	Flags: Linked
*/
function function_9b24638f()
{
	if(is_true(level.teambased))
	{
		return outcome::get_winning_team(game.outcome);
	}
	return outcome::function_b5f4c9d8(game.outcome);
}

/*
	Name: function_d1e740f6
	Namespace: match
	Checksum: 0x3B828B8E
	Offset: 0x610
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_d1e740f6(var_512330f1)
{
	outcome::function_d1e740f6(game.outcome, var_512330f1);
}

/*
	Name: function_af2e264f
	Namespace: match
	Checksum: 0x6F9FC10D
	Offset: 0x648
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_af2e264f(winner)
{
	outcome::function_af2e264f(game.outcome, winner);
}

/*
	Name: function_870759fb
	Namespace: match
	Checksum: 0x37D775AC
	Offset: 0x680
	Size: 0x3C
	Parameters: 0
	Flags: None
*/
function function_870759fb()
{
	winner = function_6d0354e3();
	outcome::function_af2e264f(game.outcome, winner);
}

/*
	Name: function_6d0354e3
	Namespace: match
	Checksum: 0x7507B889
	Offset: 0x6C8
	Size: 0x10A
	Parameters: 0
	Flags: Linked
*/
function function_6d0354e3()
{
	winner = round::function_9b24638f();
	if(game.outcome.var_aefc8b8d.var_c1e98979 != 7)
	{
		if(level.teambased && function_5f24faac("overtime"))
		{
			if(!is_true(level.doubleovertime) || round::function_5f24faac("tie"))
			{
				winner = teams::function_d85770f0("overtimeroundswon");
			}
		}
		else
		{
			if(level.scoreroundwinbased)
			{
				winner = teams::function_d85770f0("roundswon");
			}
			else
			{
				winner = teams::function_ef80de99();
			}
		}
	}
	return winner;
}

