#namespace overtime;

/*
	Name: function_4147aee6
	Namespace: overtime
	Checksum: 0x3B945BF7
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4147aee6()
{
	level notify(962561481);
}

/*
	Name: main
	Namespace: overtime
	Checksum: 0x4544EE2E
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	if(!isdefined(game.overtime_round))
	{
		game.overtime_round = 0;
	}
	if(!isdefined(level.nextroundisovertime))
	{
		level.nextroundisovertime = 0;
	}
}

/*
	Name: is_overtime_round
	Namespace: overtime
	Checksum: 0x99F5F9CE
	Offset: 0xD8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function is_overtime_round()
{
	if(game.overtime_round > 0)
	{
		return true;
	}
	return false;
}

/*
	Name: round_stats_init
	Namespace: overtime
	Checksum: 0x6F007A77
	Offset: 0x100
	Size: 0x19A
	Parameters: 0
	Flags: Linked
*/
function round_stats_init()
{
	if(is_overtime_round())
	{
		setmatchflag("overtime", 1);
	}
	else
	{
		setmatchflag("overtime", 0);
	}
	if(!isdefined(game.stat[#"overtimeroundswon"]))
	{
		game.stat[#"overtimeroundswon"] = [];
	}
	if(!isdefined(game.stat[#"overtimeroundswon"][#"tie"]))
	{
		game.stat[#"overtimeroundswon"][#"tie"] = 0;
	}
	foreach(team, _ in level.teams)
	{
		if(!isdefined(game.stat[#"overtimeroundswon"][team]))
		{
			game.stat[#"overtimeroundswon"][team] = 0;
		}
	}
}

/*
	Name: get_rounds_played
	Namespace: overtime
	Checksum: 0x9D21F1C
	Offset: 0x2A8
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function get_rounds_played()
{
	if(game.overtime_round == 0)
	{
		return game.overtime_round;
	}
	return game.overtime_round - 1;
}

/*
	Name: function_f435f4dd
	Namespace: overtime
	Checksum: 0xFC6CF6D9
	Offset: 0x2E0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_f435f4dd()
{
	if(isdefined(level.shouldplayovertimeround))
	{
		if([[level.shouldplayovertimeround]]())
		{
			level.nextroundisovertime = 1;
			return;
		}
	}
	level.nextroundisovertime = 0;
}

