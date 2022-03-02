#using script_2efbf80b6e18c0ab;
#using scripts\core_common\system_shared.gsc;

#namespace teamset_axis;

/*
	Name: function_89f2df9
	Namespace: teamset_axis
	Checksum: 0x51D19753
	Offset: 0xD0
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
	Checksum: 0x92F0A185
	Offset: 0x118
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
	Checksum: 0x35907732
	Offset: 0x170
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

