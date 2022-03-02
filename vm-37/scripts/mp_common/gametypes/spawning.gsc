#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\util.gsc;

#namespace spawning;

/*
	Name: getteamstartspawnname
	Namespace: spawning
	Checksum: 0xE310F71B
	Offset: 0xB0
	Size: 0x138
	Parameters: 2
	Flags: Linked
*/
function getteamstartspawnname(team, spawnpointnamebase)
{
	spawn_point_team_name = team;
	spawn_point_team_name = util::function_6f4ff113(team);
	if(level.multiteam)
	{
		if(team == #"axis")
		{
			spawn_point_team_name = "team1";
		}
		else if(team == #"allies")
		{
			spawn_point_team_name = "team2";
		}
		if(!util::isoneround())
		{
			number = int(getsubstr(spawn_point_team_name, 4, 5)) - 1;
			number = ((number + game.roundsplayed) % level.teams.size) + 1;
			spawn_point_team_name = "team" + number;
		}
	}
	return ((spawnpointnamebase + "_") + spawn_point_team_name) + "_start";
}

/*
	Name: gettdmstartspawnname
	Namespace: spawning
	Checksum: 0x98BC4EC6
	Offset: 0x1F0
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function gettdmstartspawnname(team)
{
	return getteamstartspawnname(team, "mp_tdm_spawn");
}

