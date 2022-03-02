#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_ce472ff1;

/*
	Name: function_89f2df9
	Namespace: namespace_ce472ff1
	Checksum: 0x8A6EF950
	Offset: 0x78
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_788b2cd49344cd51", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ce472ff1
	Checksum: 0x58AD3987
	Offset: 0xC0
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
	Checksum: 0xB88F7C18
	Offset: 0xF8
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

