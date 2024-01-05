#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace namespace_ce472ff1;

/*
	Name: function_ee05fc40
	Namespace: namespace_ce472ff1
	Checksum: 0xD613C897
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ee05fc40()
{
	level notify(-1766499865);
}

/*
	Name: __init__system__
	Namespace: namespace_ce472ff1
	Checksum: 0x25415E24
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_788b2cd49344cd51", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ce472ff1
	Checksum: 0xD779E2A8
	Offset: 0xE0
	Size: 0x30
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(level.var_f2814a96 !== 1 && level.var_f2814a96 !== 2)
	{
		return;
	}
}

/*
	Name: on_spawn_player
	Namespace: namespace_ce472ff1
	Checksum: 0x7389FBC1
	Offset: 0x118
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function on_spawn_player(predictedspawn)
{
	if(isdefined(level.on_spawn_player))
	{
		[[level.on_spawn_player]](predictedspawn);
	}
	else
	{
		spawning::onspawnplayer(undefined);
	}
}

