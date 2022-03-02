#using script_2efbf80b6e18c0ab;

#namespace namespace_6f4abfc0;

/*
	Name: main
	Namespace: namespace_6f4abfc0
	Checksum: 0x3277F973
	Offset: 0x108
	Size: 0xD4
	Parameters: 0
	Flags: None
*/
function main()
{
	teamset::init();
	toggle = 0;
	foreach(team in level.teams)
	{
		if(toggle % 2)
		{
			init_axis(team);
		}
		else
		{
			init_allies(team);
		}
		toggle++;
	}
}

/*
	Name: init_allies
	Namespace: namespace_6f4abfc0
	Checksum: 0xE0089A91
	Offset: 0x1E8
	Size: 0x80
	Parameters: 1
	Flags: None
*/
function init_allies(team)
{
	game.music["spawn_" + team] = "SPAWN_ST6";
	game.music["spawn_short" + team] = "SPAWN_SHORT_ST6";
	game.music["victory_" + team] = "VICTORY_ST6";
	game.voice[team] = "vox_st6_";
}

/*
	Name: init_axis
	Namespace: namespace_6f4abfc0
	Checksum: 0x4E2B683B
	Offset: 0x270
	Size: 0x80
	Parameters: 1
	Flags: None
*/
function init_axis(team)
{
	game.music["spawn_" + team] = "SPAWN_PMC";
	game.music["spawn_short" + team] = "SPAWN_SHORT_PMC";
	game.music["victory_" + team] = "VICTORY_PMC";
	game.voice[team] = "vox_pmc_";
}

