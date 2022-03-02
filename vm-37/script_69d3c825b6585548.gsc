#using script_7a8059ca02b7b09e;
#using scripts\core_common\system_shared.gsc;

#namespace telemetry;

/*
	Name: function_89f2df9
	Namespace: telemetry
	Checksum: 0xBB0C7ADA
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_53528dbbf6cd15c4", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: telemetry
	Checksum: 0xF23D3BD1
	Offset: 0xB8
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(isdefined(game))
	{
		if(!isdefined(game.telemetry))
		{
			game.telemetry = {};
		}
		if(!isdefined(game.telemetry.player_count))
		{
			game.telemetry.player_count = 0;
		}
		if(!isdefined(game.telemetry.life_count))
		{
			game.telemetry.life_count = 0;
		}
	}
	else
	{
		/#
			println("");
		#/
	}
}

