#using scripts\mp_common\teams\teamset.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace teamset_allies;

/*
	Name: __init__system__
	Namespace: teamset_allies
	Checksum: 0x1D4C76D9
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"teamset_allies", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: teamset_allies
	Checksum: 0x8D5DA45B
	Offset: 0x118
	Size: 0xC8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init(#"none");
	foreach(team in level.teams)
	{
		if(team == #"axis")
		{
			continue;
		}
		init(team);
	}
}

/*
	Name: init
	Namespace: teamset_allies
	Checksum: 0x46B46E04
	Offset: 0x1E8
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function init(team)
{
	teamset::init();
	game.music["spawn_" + team] = "SPAWN_ST6";
	game.music["spawn_short" + team] = "SPAWN_SHORT_ST6";
	game.music["victory_" + team] = "VICTORY_ST6";
	game.voice[team] = "vox_st6_";
}

