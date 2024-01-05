#using scripts\mp_common\teams\teamset.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace teamset_allies;

/*
	Name: function_b4440a3c
	Namespace: teamset_allies
	Checksum: 0xFCE3996C
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b4440a3c()
{
	level notify(-483555930);
}

/*
	Name: __init__system__
	Namespace: teamset_allies
	Checksum: 0xB263D1AD
	Offset: 0xF0
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
	Checksum: 0xD67D8F20
	Offset: 0x138
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
	Checksum: 0xB040502C
	Offset: 0x208
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

