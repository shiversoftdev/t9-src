#using scripts\mp_common\teams\teamset.gsc;

#namespace namespace_6f4abfc0;

/*
	Name: function_d412c3ff
	Namespace: namespace_6f4abfc0
	Checksum: 0x1D6A147C
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d412c3ff()
{
	level notify(-1242063117);
}

/*
	Name: main
	Namespace: namespace_6f4abfc0
	Checksum: 0x4C1AB4DF
	Offset: 0x128
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
	Checksum: 0xFA6813C2
	Offset: 0x208
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
	Checksum: 0xCF45DCF9
	Offset: 0x290
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

