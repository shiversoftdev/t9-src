#using script_2efbf80b6e18c0ab;
#using scripts\core_common\system_shared.gsc;

#namespace teamset_axis;

/*
	Name: function_196d3d43
	Namespace: teamset_axis
	Checksum: 0x792856AB
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_196d3d43()
{
	level notify(742364257);
}

/*
	Name: function_89f2df9
	Namespace: teamset_axis
	Checksum: 0xFEFE3027
	Offset: 0xF0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"teamset_axis", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: teamset_axis
	Checksum: 0x6DC4BFAC
	Offset: 0x138
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.teams[#"axis"]))
	{
		return;
	}
	init(level.teams[#"axis"]);
}

/*
	Name: init
	Namespace: teamset_axis
	Checksum: 0x784B1160
	Offset: 0x190
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function init(team)
{
	teamset::init();
	game.music["spawn_" + team] = "SPAWN_PMC";
	game.music["spawn_short" + team] = "SPAWN_SHORT_PMC";
	game.music["victory_" + team] = "VICTORY_PMC";
	game.voice[team] = "vox_pmc_";
}

